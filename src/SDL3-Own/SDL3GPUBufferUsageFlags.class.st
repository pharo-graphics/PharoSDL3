"
Bindings for `SDL_GPUBufferUsageFlags` constants in `SDL_gpu.h`, in SDL3 3.2.10.

This class isn't generated automatically, it's manual. Why? SDL3 doesn't define these flags as an enumeration but as `#define` macros.


```
/**
 * Specifies how a buffer is intended to be used by the client.
 *
 * A buffer must have at least one usage flag. Note that some usage flag
 * combinations are invalid.
 *
 * Unlike textures, READ | WRITE can be used for simultaneous read-write
 * usage. The same data synchronization concerns as textures apply.
 *
 * If you use a STORAGE flag, the data in the buffer must respect std140
 * layout conventions. In practical terms this means you must ensure that vec3
 * and vec4 fields are 16-byte aligned.
 *
 * \since This datatype is available since SDL 3.2.0.
 *
 * \sa SDL_CreateGPUBuffer
 */
typedef Uint32 SDL_GPUBufferUsageFlags;

#define SDL_GPU_BUFFERUSAGE_VERTEX                                  (1u << 0) /**< Buffer is a vertex buffer. */
#define SDL_GPU_BUFFERUSAGE_INDEX                                   (1u << 1) /**< Buffer is an index buffer. */
#define SDL_GPU_BUFFERUSAGE_INDIRECT                                (1u << 2) /**< Buffer is an indirect buffer. */
#define SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ                   (1u << 3) /**< Buffer supports storage reads in graphics stages. */
#define SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ                    (1u << 4) /**< Buffer supports storage reads in the compute stage. */
#define SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE                   (1u << 5) /**< Buffer supports storage writes in the compute stage. */
```
"
Class {
	#name : 'SDL3GPUBufferUsageFlags',
	#superclass : 'SDL3MacroDefinedFlag',
	#classVars : [
		'SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ',
		'SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE',
		'SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ',
		'SDL_GPU_BUFFERUSAGE_INDEX',
		'SDL_GPU_BUFFERUSAGE_INDIRECT',
		'SDL_GPU_BUFFERUSAGE_VERTEX'
	],
	#category : 'SDL3-Own',
	#package : 'SDL3-Own'
}

{ #category : 'accessing enum' }
SDL3GPUBufferUsageFlags class >> computeStorageRead [
	"This method was automatically generated"
	^ SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ
]

{ #category : 'accessing enum' }
SDL3GPUBufferUsageFlags class >> computeStorageWrite [
	"This method was automatically generated"
	^ SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE
]

{ #category : 'enum declaration' }
SDL3GPUBufferUsageFlags class >> enumDecl [
	"self initializeEnumeration; rebuildEnumAccessors"
	
	^ #(
		SDL_GPU_BUFFERUSAGE_VERTEX 1
		SDL_GPU_BUFFERUSAGE_INDEX 2
		SDL_GPU_BUFFERUSAGE_INDIRECT 4
		SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ 8
		SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ 16
		SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE 32
		)
]

{ #category : 'accessing enum' }
SDL3GPUBufferUsageFlags class >> graphicsStorageRead [
	"This method was automatically generated"
	^ SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ
]

{ #category : 'accessing enum' }
SDL3GPUBufferUsageFlags class >> index [
	"This method was automatically generated"
	^ SDL_GPU_BUFFERUSAGE_INDEX
]

{ #category : 'accessing enum' }
SDL3GPUBufferUsageFlags class >> indirect [
	"This method was automatically generated"
	^ SDL_GPU_BUFFERUSAGE_INDIRECT
]

{ #category : 'accessing enum' }
SDL3GPUBufferUsageFlags class >> vertex [
	"This method was automatically generated"
	^ SDL_GPU_BUFFERUSAGE_VERTEX
]
