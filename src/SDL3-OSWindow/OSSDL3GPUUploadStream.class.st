"
I am a specialized write stream for batching texture uploads to the SDL3 GPU.

I encapsulate the complex dance of mapping Smalltalk Form bits into GPU transfer buffers and issuing asynchronous copy commands. My primary goal is to provide a simple API for renderers while ensuring that low-level hardware constraints (like memory alignment and buffer capacity) are handled correctly and transparently.

### Key Concepts:

1. **Mapping and Unmapping**: GPU memory is not directly accessible by the CPU. To write data, we must 'map' a 'Transfer Buffer' into the CPU's address space. I handle this via `LibSDL3 >> #mapGPUTransferBuffer:cycle:`.

2. **Cycling (Buffer Renaming)**: When mapping with `cycle: true`, SDL3 provides a fresh slice of memory if the previous one is still being read by the GPU. This avoids CPU stalls (waiting for the GPU) and data corruption (overwriting data the GPU is currently reading).

3. **Batching**: Uploading many small textures is inefficient. I group multiple upload commands into a single 'Copy Pass' and a single 'Command Buffer' submission wherever possible.

4. **Surgical Updates**: Instead of uploading full textures or full rows, I upload the minimal bounding box of the damage. This minimizes CPU->GPU bandwidth.

### Usage:

```smalltalk
stream := OSSDL3GPUUploadStream on: renderer.
[
    stream uploadForm: aForm region: aRectangle to: aTexture.
    stream uploadForm: anotherForm region: anotherRect to: anotherTexture.
] ensure: [ stream finish ].
```
"
Class {
	#name : 'OSSDL3GPUUploadStream',
	#superclass : 'Object',
	#traits : 'LibTSDL3',
	#classTraits : 'LibTSDL3 classTrait',
	#instVars : [
		'renderer',
		'gpuDevice',
		'transferBuffer',
		'mappedAddress',
		'commandBuffer',
		'copyPass',
		'currentOffset',
		'externalForm',
		'transferInfo',
		'textureRegion',
		'gpuTransferBufferSize'
	],
	#classVars : [
		'MaxBufferSize',
		'MinBufferSize'
	],
	#category : 'SDL3-OSWindow-Support',
	#package : 'SDL3-OSWindow',
	#tag : 'Support'
}

{ #category : 'initialization' }
OSSDL3GPUUploadStream class >> initialize [

	MinBufferSize := 16 * 1024 * 1024.
	MaxBufferSize := 64 * 1024 * 1024
]

{ #category : 'accessing' }
OSSDL3GPUUploadStream class >> maxBufferSize [

	^ MaxBufferSize
]

{ #category : 'accessing' }
OSSDL3GPUUploadStream class >> maxBufferSize: anInteger [

	MaxBufferSize := anInteger
]

{ #category : 'accessing' }
OSSDL3GPUUploadStream class >> minBufferSize [

	^ MinBufferSize
]

{ #category : 'accessing' }
OSSDL3GPUUploadStream class >> minBufferSize: anInteger [

	MinBufferSize := anInteger
]

{ #category : 'deleting' }
OSSDL3GPUUploadStream >> destroy [
	"Release the GPU transfer buffer and the VM surface"

	transferBuffer ifNotNil: [ 
		gpuDevice releaseGPUTransferBuffer: transferBuffer.
		transferBuffer := nil ].
	
	externalForm ifNotNil: [ 
		externalForm destroySurface.
		externalForm := nil ]
]

{ #category : 'private' }
OSSDL3GPUUploadStream >> ensureBatchStarted [
	"Ensure we have a command buffer and a mapping ready for writing."

	commandBuffer ifNotNil: [ ^ self ].
	
	mappedAddress := gpuDevice mapGPUTransferBuffer: transferBuffer cycle: true.
	mappedAddress isNull ifTrue: [ SDL3Error signalFromLibraryErrorMessage ].

	commandBuffer := gpuDevice acquireGPUCommandBuffer.
	commandBuffer assertNotNullReturn.

	copyPass := commandBuffer beginGPUCopyPass.
	currentOffset := 0
]

{ #category : 'public' }
OSSDL3GPUUploadStream >> finish [
	"Finalize and submit any pending uploads recorded in this stream."

	commandBuffer ifNotNil: [ self internalFinishBatch ]
]

{ #category : 'initialization' }
OSSDL3GPUUploadStream >> gpuDevice: aDevice [

	gpuDevice := aDevice
]

{ #category : 'accessing' }
OSSDL3GPUUploadStream >> gpuTransferBufferSize [
	^ gpuTransferBufferSize
]

{ #category : 'initialization' }
OSSDL3GPUUploadStream >> initializeResources [
	"Allocate the heavy resources. These should persist across multiple frames."

	(gpuDevice isNil or: [ gpuDevice isNull ]) ifTrue: [ ^ self ].

	transferBuffer := gpuDevice newUploadTransferBuffer: gpuTransferBufferSize.
	transferBuffer assertNotNullReturn.
	
	externalForm := OSSDL3ExternalForm new.

	"Pre-allocate structures to avoid churn"
	transferInfo := SDL3GPUTextureTransferInfo new.
	transferInfo transferBuffer: transferBuffer.
	transferInfo rowsPerLayer: 0.

	textureRegion := SDL3GPUTextureRegion new.
	textureRegion z: 0; d: 1; mipLevel: 0; layer: 0
]

{ #category : 'private' }
OSSDL3GPUUploadStream >> internalFinishBatch [
	"Finish the current copy pass and submit to the GPU"

	copyPass end.
	gpuDevice unmapGPUTransferBuffer: transferBuffer.
	self ffiLibrary assertSuccess: commandBuffer submit.
	
	mappedAddress := nil.
	commandBuffer := nil.
	copyPass := nil
]

{ #category : 'initialization' }
OSSDL3GPUUploadStream >> preferredBufferSizeForExtent: anExtent [
	"Calculate dynamic buffer size based on renderer extent.
	 We want enough space for at least one full update of the backing store."

	^ anExtent x * anExtent y * 4 min: MaxBufferSize max: MinBufferSize
]

{ #category : 'initialization' }
OSSDL3GPUUploadStream >> resetForExtent: anExtent [
	"Re-initialize the stream resources for a new extent.
	 This may reallocate the transfer buffer if the preferred size changed."

	| newSize |
	newSize := self preferredBufferSizeForExtent: anExtent.

	(transferBuffer isNil or: [ gpuTransferBufferSize ~= newSize ]) ifFalse: [ ^ self ].

	self destroy.
	gpuTransferBufferSize := newSize.
	self initializeResources
]

{ #category : 'public' }
OSSDL3GPUUploadStream >> uploadForm: aForm region: aRectangle to: aTexture [
	"Upload a surgical region of a Smalltalk Form to a GPU Texture.
	 I handle the BitBlt into the mapped transfer buffer."

	| bytesPerRow bytesNeeded |
	
	aRectangle area <= 0 ifTrue: [ ^ self ].
	
	self ensureBatchStarted.

	"1. Calculate space needed for this surgical rectangle (tightly packed)"
	bytesPerRow := aRectangle width * 4.
	bytesNeeded := bytesPerRow * aRectangle height.

	"2. Capacity check. If we exceed the buffer, submit current batch and start over."
	(currentOffset + bytesNeeded) > gpuTransferBufferSize ifTrue: [ 
		self internalFinishBatch.
		self ensureBatchStarted ].

	"3. Surgical BitBlt into mapped memory."
	externalForm
		resetExtent: aRectangle extent
		depth: 32
		pitch: bytesPerRow
		bits: mappedAddress + currentOffset.
	[ 
		"Copy from global form coordinates to the start of this buffer slice"
		externalForm copy: aRectangle from: aForm to: 0 @ 0 rule: Form over 
	] ensure: [ externalForm destroySurface ].

	"4. Record the GPU upload command"
	transferInfo offset: currentOffset.
	transferInfo pixelsPerRow: aRectangle width. "Tightly packed"
	
	textureRegion 
		texture: aTexture;
		x: aRectangle left; y: aRectangle top;
		w: aRectangle width; h: aRectangle height.

	copyPass uploadToGPUTextureSource: transferInfo destination: textureRegion cycle: false.

	"5. Advance offset for next item in the stream"
	currentOffset := currentOffset + bytesNeeded
]
