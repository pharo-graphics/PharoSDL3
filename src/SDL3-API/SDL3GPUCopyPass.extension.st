Extension { #name : 'SDL3GPUCopyPass' }

{ #category : '*SDL3-API' }
SDL3GPUCopyPass >> copyGPUBufferToBufferSource: source destination: destination size: size cycle: cycle [

	^ self ffiLibrary
		  copyGPUBufferToBufferCopyPass: self
		  source: source
		  destination: destination
		  size: size
		  cycle: cycle
]

{ #category : '*SDL3-API' }
SDL3GPUCopyPass >> copyGPUTextureToTextureSource: source destination: destination w: w h: h d: d cycle: cycle [

	^ self ffiLibrary
		  copyGPUTextureToTextureCopyPass: self
		  source: source
		  destination: destination
		  w: w
		  h: h
		  d: d
		  cycle: cycle
]

{ #category : '*SDL3-API' }
SDL3GPUCopyPass >> downloadFromGPUBufferSource: source destination: destination [

	^ self ffiLibrary
		  downloadFromGPUBufferCopyPass: self
		  source: source
		  destination: destination
]

{ #category : '*SDL3-API' }
SDL3GPUCopyPass >> downloadFromGPUTextureSource: source destination: destination [

	^ self ffiLibrary
		  downloadFromGPUTextureCopyPass: self
		  source: source
		  destination: destination
]

{ #category : '*SDL3-API' }
SDL3GPUCopyPass >> end [

	^ self ffiLibrary endGPUCopyPass: self
]

{ #category : '*SDL3-API' }
SDL3GPUCopyPass >> uploadToGPUBufferSource: source destination: destination cycle: cycle [

	^ self ffiLibrary
		  uploadToGPUBufferCopyPass: self
		  source: source
		  destination: destination
		  cycle: cycle
]

{ #category : '*SDL3-API' }
SDL3GPUCopyPass >> uploadToGPUTextureSource: source destination: destination cycle: cycle [

	^ self ffiLibrary
		  uploadToGPUTextureCopyPass: self
		  source: source
		  destination: destination
		  cycle: cycle
]
