"
Bindings for `SDL_GPUTextureUsageFlags` constants in `SDL_gpu.h`, in SDL3 3.2.10.

This class isn't generated automatically, it's manual. Why? SDL3 doesn't define these flags as an enumeration but as `#define` macros.


```
/**
 * Specifies how a texture is intended to be used by the client.
 *
 * A texture must have at least one usage flag. Note that some usage flag
 * combinations are invalid.
 *
 * With regards to compute storage usage, READ | WRITE means that you can have
 * shader A that only writes into the texture and shader B that only reads
 * from the texture and bind the same texture to either shader respectively.
 * SIMULTANEOUS means that you can do reads and writes within the same shader
 * or compute pass. It also implies that atomic ops can be used, since those
 * are read-modify-write operations. If you use SIMULTANEOUS, you are
 * responsible for avoiding data races, as there is no data synchronization
 * within a compute pass. Note that SIMULTANEOUS usage is only supported by a
 * limited number of texture formats.
 *
 * \since This datatype is available since SDL 3.2.0.
 *
 * \sa SDL_CreateGPUTexture
 */
typedef Uint32 SDL_GPUTextureUsageFlags;

#define SDL_GPU_TEXTUREUSAGE_SAMPLER                                 (1u << 0) /**< Texture supports sampling. */
#define SDL_GPU_TEXTUREUSAGE_COLOR_TARGET                            (1u << 1) /**< Texture is a color render target. */
#define SDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET                    (1u << 2) /**< Texture is a depth stencil target. */
#define SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ                   (1u << 3) /**< Texture supports storage reads in graphics stages. */
#define SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ                    (1u << 4) /**< Texture supports storage reads in the compute stage. */
#define SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_WRITE                   (1u << 5) /**< Texture supports storage writes in the compute stage. */
#define SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE (1u << 6) /**< Texture supports reads and writes in the same compute shader. This is NOT equivalent to READ | WRITE. */
```
"
Class {
	#name : 'SDL3GPUTextureUsageFlags',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_GPU_TEXTUREUSAGE_COLOR_TARGET',
		'SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ',
		'SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE',
		'SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_WRITE',
		'SDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET',
		'SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ',
		'SDL_GPU_TEXTUREUSAGE_SAMPLER'
	],
	#category : 'SDL3-Own',
	#package : 'SDL3-Own'
}

{ #category : 'accessing enum' }
SDL3GPUTextureUsageFlags class >> colorTarget [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREUSAGE_COLOR_TARGET
]

{ #category : 'accessing enum' }
SDL3GPUTextureUsageFlags class >> computeStorageRead [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ
]

{ #category : 'accessing enum' }
SDL3GPUTextureUsageFlags class >> computeStorageSimultaneousReadWrite [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE
]

{ #category : 'accessing enum' }
SDL3GPUTextureUsageFlags class >> computeStorageWrite [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_WRITE
]

{ #category : 'accessing enum' }
SDL3GPUTextureUsageFlags class >> depthStencilTarget [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET
]

{ #category : 'enum declaration' }
SDL3GPUTextureUsageFlags class >> enumDecl [
	"self initializeEnumeration; rebuildEnumAccessors"
	
	^ #(
		SDL_GPU_TEXTUREUSAGE_SAMPLER                                  1
		SDL_GPU_TEXTUREUSAGE_COLOR_TARGET                             2
		SDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET                     4
		SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ                    8
		SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ                    16
		SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_WRITE                   32
		SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE 64
		)
]

{ #category : 'accessing enum' }
SDL3GPUTextureUsageFlags class >> graphicsStorageRead [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ
]

{ #category : 'accessing enum' }
SDL3GPUTextureUsageFlags class >> sampler [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREUSAGE_SAMPLER
]
