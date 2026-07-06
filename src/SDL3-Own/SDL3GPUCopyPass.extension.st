Extension { #name : 'SDL3GPUCopyPass' }

{ #category : '*SDL3-Own' }
SDL3GPUCopyPass >> copyBuffer: source destination: destination size: size cycle: cycle [

	self ffiLibrary
		copyGPUBufferToBufferCopyPass: self
		source: source
		destination: destination
		size: size
		cycle: cycle
]

{ #category : '*SDL3-Own' }
SDL3GPUCopyPass >> copyTexture: source destination: destination w: w h: h d: d cycle: cycle [

	self ffiLibrary
		copyGPUTextureToTextureCopyPass: self
		source: source
		destination: destination
		w: w
		h: h
		d: d
		cycle: cycle
]

{ #category : '*SDL3-Own' }
SDL3GPUCopyPass >> downloadBuffer: source destination: destination [

	self ffiLibrary downloadFromGPUBufferCopyPass: self source: source destination: destination
]

{ #category : '*SDL3-Own' }
SDL3GPUCopyPass >> downloadTexture: source destination: destination [

	self ffiLibrary downloadFromGPUTextureCopyPass: self source: source destination: destination
]

{ #category : '*SDL3-Own' }
SDL3GPUCopyPass >> end [

	self ffiLibrary endGPUCopyPass: self
]

{ #category : '*SDL3-Own' }
SDL3GPUCopyPass >> releaseFromGPUDevice [
	"Passes are released when they are ended."

	self end
]

{ #category : '*SDL3-Own' }
SDL3GPUCopyPass >> uploadBuffer: source destination: destination cycle: cycle [

	self ffiLibrary
		uploadToGPUBufferCopyPass: self
		source: source
		destination: destination
		cycle: cycle
]

{ #category : '*SDL3-Own' }
SDL3GPUCopyPass >> uploadTexture: source destination: destination cycle: cycle [

	self ffiLibrary
		uploadToGPUTextureCopyPass: self
		source: source
		destination: destination
		cycle: cycle
]
