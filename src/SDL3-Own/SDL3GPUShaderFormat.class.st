"
Bindings for `SDL_GPUShaderFormat` constants in `SDL_gpu.h`, in SDL3 3.2.10.

This class isn't generated automatically, it's manual. Why? SDL3 doesn't define these flags as an enumeration but as `#define` macros.


```
/**
 * Specifies the format of shader code.
 *
 * Each format corresponds to a specific backend that accepts it.
 *
 * \since This datatype is available since SDL 3.2.0.
 *
 * \sa SDL_CreateGPUShader
 */
typedef Uint32 SDL_GPUShaderFormat;

#define SDL_GPU_SHADERFORMAT_INVALID  0
#define SDL_GPU_SHADERFORMAT_PRIVATE  (1u << 0) /**< Shaders for NDA'd platforms. */
#define SDL_GPU_SHADERFORMAT_SPIRV    (1u << 1) /**< SPIR-V shaders for Vulkan. */
#define SDL_GPU_SHADERFORMAT_DXBC     (1u << 2) /**< DXBC SM5_1 shaders for D3D12. */
#define SDL_GPU_SHADERFORMAT_DXIL     (1u << 3) /**< DXIL SM6_0 shaders for D3D12. */
#define SDL_GPU_SHADERFORMAT_MSL      (1u << 4) /**< MSL shaders for Metal. */
#define SDL_GPU_SHADERFORMAT_METALLIB (1u << 5) /**< Precompiled metallib shaders for Metal. */
```
"
Class {
	#name : 'SDL3GPUShaderFormat',
	#superclass : 'SDL3MacroDefinedFlag',
	#classVars : [
		'SDL_GPU_SHADERFORMAT_DXBC',
		'SDL_GPU_SHADERFORMAT_DXIL',
		'SDL_GPU_SHADERFORMAT_INVALID',
		'SDL_GPU_SHADERFORMAT_METALLIB',
		'SDL_GPU_SHADERFORMAT_MSL',
		'SDL_GPU_SHADERFORMAT_PRIVATE',
		'SDL_GPU_SHADERFORMAT_SPIRV'
	],
	#category : 'SDL3-Own',
	#package : 'SDL3-Own'
}

{ #category : 'accessing enum' }
SDL3GPUShaderFormat class >> dxbc [
	"This method was automatically generated"
	^ SDL_GPU_SHADERFORMAT_DXBC
]

{ #category : 'accessing enum' }
SDL3GPUShaderFormat class >> dxil [
	"This method was automatically generated"
	^ SDL_GPU_SHADERFORMAT_DXIL
]

{ #category : 'enum declaration' }
SDL3GPUShaderFormat class >> enumDecl [
	"self initializeEnumeration; rebuildEnumAccessors"
	
	^ #(
		SDL_GPU_SHADERFORMAT_INVALID  0
		SDL_GPU_SHADERFORMAT_PRIVATE  1
		SDL_GPU_SHADERFORMAT_SPIRV    2
		SDL_GPU_SHADERFORMAT_DXBC     4
		SDL_GPU_SHADERFORMAT_DXIL     8
		SDL_GPU_SHADERFORMAT_MSL      16
		SDL_GPU_SHADERFORMAT_METALLIB 32
		)
]

{ #category : 'accessing enum' }
SDL3GPUShaderFormat class >> invalid [
	"This method was automatically generated"
	^ SDL_GPU_SHADERFORMAT_INVALID
]

{ #category : 'accessing enum' }
SDL3GPUShaderFormat class >> metallib [
	"This method was automatically generated"
	^ SDL_GPU_SHADERFORMAT_METALLIB
]

{ #category : 'accessing enum' }
SDL3GPUShaderFormat class >> msl [
	"This method was automatically generated"
	^ SDL_GPU_SHADERFORMAT_MSL
]

{ #category : 'accessing enum' }
SDL3GPUShaderFormat class >> private [
	"This method was automatically generated"
	^ SDL_GPU_SHADERFORMAT_PRIVATE
]

{ #category : 'accessing enum' }
SDL3GPUShaderFormat class >> spirv [
	"This method was automatically generated"
	^ SDL_GPU_SHADERFORMAT_SPIRV
]
