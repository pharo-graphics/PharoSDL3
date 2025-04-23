Class {
	#name : 'SDL3GPUTextureFormat',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_GPU_TEXTUREFORMAT_A8_UNORM',
		'SDL_GPU_TEXTUREFORMAT_ASTC_10x10_FLOAT',
		'SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM',
		'SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM_SRGB',
		'SDL_GPU_TEXTUREFORMAT_ASTC_10x5_FLOAT',
		'SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM',
		'SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM_SRGB',
		'SDL_GPU_TEXTUREFORMAT_ASTC_10x6_FLOAT',
		'SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM',
		'SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM_SRGB',
		'SDL_GPU_TEXTUREFORMAT_ASTC_10x8_FLOAT',
		'SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM',
		'SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM_SRGB',
		'SDL_GPU_TEXTUREFORMAT_ASTC_12x10_FLOAT',
		'SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM',
		'SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM_SRGB',
		'SDL_GPU_TEXTUREFORMAT_ASTC_12x12_FLOAT',
		'SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM',
		'SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM_SRGB',
		'SDL_GPU_TEXTUREFORMAT_ASTC_4x4_FLOAT',
		'SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM',
		'SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM_SRGB',
		'SDL_GPU_TEXTUREFORMAT_ASTC_5x4_FLOAT',
		'SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM',
		'SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM_SRGB',
		'SDL_GPU_TEXTUREFORMAT_ASTC_5x5_FLOAT',
		'SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM',
		'SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM_SRGB',
		'SDL_GPU_TEXTUREFORMAT_ASTC_6x5_FLOAT',
		'SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM',
		'SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM_SRGB',
		'SDL_GPU_TEXTUREFORMAT_ASTC_6x6_FLOAT',
		'SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM',
		'SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM_SRGB',
		'SDL_GPU_TEXTUREFORMAT_ASTC_8x5_FLOAT',
		'SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM',
		'SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM_SRGB',
		'SDL_GPU_TEXTUREFORMAT_ASTC_8x6_FLOAT',
		'SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM',
		'SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM_SRGB',
		'SDL_GPU_TEXTUREFORMAT_ASTC_8x8_FLOAT',
		'SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM',
		'SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM_SRGB',
		'SDL_GPU_TEXTUREFORMAT_B4G4R4A4_UNORM',
		'SDL_GPU_TEXTUREFORMAT_B5G5R5A1_UNORM',
		'SDL_GPU_TEXTUREFORMAT_B5G6R5_UNORM',
		'SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM',
		'SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM_SRGB',
		'SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM',
		'SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM_SRGB',
		'SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM',
		'SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM_SRGB',
		'SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM',
		'SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM_SRGB',
		'SDL_GPU_TEXTUREFORMAT_BC4_R_UNORM',
		'SDL_GPU_TEXTUREFORMAT_BC5_RG_UNORM',
		'SDL_GPU_TEXTUREFORMAT_BC6H_RGB_FLOAT',
		'SDL_GPU_TEXTUREFORMAT_BC6H_RGB_UFLOAT',
		'SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM',
		'SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM_SRGB',
		'SDL_GPU_TEXTUREFORMAT_D16_UNORM',
		'SDL_GPU_TEXTUREFORMAT_D24_UNORM',
		'SDL_GPU_TEXTUREFORMAT_D24_UNORM_S8_UINT',
		'SDL_GPU_TEXTUREFORMAT_D32_FLOAT',
		'SDL_GPU_TEXTUREFORMAT_D32_FLOAT_S8_UINT',
		'SDL_GPU_TEXTUREFORMAT_INVALID',
		'SDL_GPU_TEXTUREFORMAT_R10G10B10A2_UNORM',
		'SDL_GPU_TEXTUREFORMAT_R11G11B10_UFLOAT',
		'SDL_GPU_TEXTUREFORMAT_R16G16B16A16_FLOAT',
		'SDL_GPU_TEXTUREFORMAT_R16G16B16A16_INT',
		'SDL_GPU_TEXTUREFORMAT_R16G16B16A16_SNORM',
		'SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UINT',
		'SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UNORM',
		'SDL_GPU_TEXTUREFORMAT_R16G16_FLOAT',
		'SDL_GPU_TEXTUREFORMAT_R16G16_INT',
		'SDL_GPU_TEXTUREFORMAT_R16G16_SNORM',
		'SDL_GPU_TEXTUREFORMAT_R16G16_UINT',
		'SDL_GPU_TEXTUREFORMAT_R16G16_UNORM',
		'SDL_GPU_TEXTUREFORMAT_R16_FLOAT',
		'SDL_GPU_TEXTUREFORMAT_R16_INT',
		'SDL_GPU_TEXTUREFORMAT_R16_SNORM',
		'SDL_GPU_TEXTUREFORMAT_R16_UINT',
		'SDL_GPU_TEXTUREFORMAT_R16_UNORM',
		'SDL_GPU_TEXTUREFORMAT_R32G32B32A32_FLOAT',
		'SDL_GPU_TEXTUREFORMAT_R32G32B32A32_INT',
		'SDL_GPU_TEXTUREFORMAT_R32G32B32A32_UINT',
		'SDL_GPU_TEXTUREFORMAT_R32G32_FLOAT',
		'SDL_GPU_TEXTUREFORMAT_R32G32_INT',
		'SDL_GPU_TEXTUREFORMAT_R32G32_UINT',
		'SDL_GPU_TEXTUREFORMAT_R32_FLOAT',
		'SDL_GPU_TEXTUREFORMAT_R32_INT',
		'SDL_GPU_TEXTUREFORMAT_R32_UINT',
		'SDL_GPU_TEXTUREFORMAT_R8G8B8A8_INT',
		'SDL_GPU_TEXTUREFORMAT_R8G8B8A8_SNORM',
		'SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UINT',
		'SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM',
		'SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM_SRGB',
		'SDL_GPU_TEXTUREFORMAT_R8G8_INT',
		'SDL_GPU_TEXTUREFORMAT_R8G8_SNORM',
		'SDL_GPU_TEXTUREFORMAT_R8G8_UINT',
		'SDL_GPU_TEXTUREFORMAT_R8G8_UNORM',
		'SDL_GPU_TEXTUREFORMAT_R8_INT',
		'SDL_GPU_TEXTUREFORMAT_R8_SNORM',
		'SDL_GPU_TEXTUREFORMAT_R8_UINT',
		'SDL_GPU_TEXTUREFORMAT_R8_UNORM'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> a8Unorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_A8_UNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc10x10Float [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_10x10_FLOAT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc10x10Unorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc10x10UnormSrgb [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM_SRGB
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc10x5Float [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_10x5_FLOAT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc10x5Unorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc10x5UnormSrgb [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM_SRGB
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc10x6Float [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_10x6_FLOAT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc10x6Unorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc10x6UnormSrgb [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM_SRGB
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc10x8Float [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_10x8_FLOAT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc10x8Unorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc10x8UnormSrgb [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM_SRGB
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc12x10Float [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_12x10_FLOAT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc12x10Unorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc12x10UnormSrgb [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM_SRGB
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc12x12Float [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_12x12_FLOAT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc12x12Unorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc12x12UnormSrgb [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM_SRGB
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc4x4Float [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_4x4_FLOAT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc4x4Unorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc4x4UnormSrgb [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM_SRGB
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc5x4Float [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_5x4_FLOAT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc5x4Unorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc5x4UnormSrgb [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM_SRGB
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc5x5Float [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_5x5_FLOAT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc5x5Unorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc5x5UnormSrgb [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM_SRGB
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc6x5Float [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_6x5_FLOAT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc6x5Unorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc6x5UnormSrgb [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM_SRGB
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc6x6Float [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_6x6_FLOAT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc6x6Unorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc6x6UnormSrgb [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM_SRGB
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc8x5Float [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_8x5_FLOAT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc8x5Unorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc8x5UnormSrgb [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM_SRGB
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc8x6Float [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_8x6_FLOAT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc8x6Unorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc8x6UnormSrgb [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM_SRGB
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc8x8Float [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_8x8_FLOAT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc8x8Unorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> astc8x8UnormSrgb [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM_SRGB
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> b4g4r4a4Unorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_B4G4R4A4_UNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> b5g5r5a1Unorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_B5G5R5A1_UNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> b5g6r5Unorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_B5G6R5_UNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> b8g8r8a8Unorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> b8g8r8a8UnormSrgb [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM_SRGB
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> bc1RgbaUnorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> bc1RgbaUnormSrgb [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM_SRGB
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> bc2RgbaUnorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> bc2RgbaUnormSrgb [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM_SRGB
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> bc3RgbaUnorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> bc3RgbaUnormSrgb [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM_SRGB
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> bc4RUnorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_BC4_R_UNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> bc5RgUnorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_BC5_RG_UNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> bc6hRgbFloat [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_BC6H_RGB_FLOAT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> bc6hRgbUfloat [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_BC6H_RGB_UFLOAT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> bc7RgbaUnorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> bc7RgbaUnormSrgb [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM_SRGB
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> d16Unorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_D16_UNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> d24Unorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_D24_UNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> d24UnormS8Uint [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_D24_UNORM_S8_UINT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> d32Float [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_D32_FLOAT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> d32FloatS8Uint [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_D32_FLOAT_S8_UINT
]

{ #category : 'enum declaration' }
SDL3GPUTextureFormat class >> enumDecl [

	^ #(
	SDL_GPU_TEXTUREFORMAT_INVALID 0
	SDL_GPU_TEXTUREFORMAT_A8_UNORM 1
	SDL_GPU_TEXTUREFORMAT_R8_UNORM 2
	SDL_GPU_TEXTUREFORMAT_R8G8_UNORM 3
	SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM 4
	SDL_GPU_TEXTUREFORMAT_R16_UNORM 5
	SDL_GPU_TEXTUREFORMAT_R16G16_UNORM 6
	SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UNORM 7
	SDL_GPU_TEXTUREFORMAT_R10G10B10A2_UNORM 8
	SDL_GPU_TEXTUREFORMAT_B5G6R5_UNORM 9
	SDL_GPU_TEXTUREFORMAT_B5G5R5A1_UNORM 10
	SDL_GPU_TEXTUREFORMAT_B4G4R4A4_UNORM 11
	SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM 12
	SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM 13
	SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM 14
	SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM 15
	SDL_GPU_TEXTUREFORMAT_BC4_R_UNORM 16
	SDL_GPU_TEXTUREFORMAT_BC5_RG_UNORM 17
	SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM 18
	SDL_GPU_TEXTUREFORMAT_BC6H_RGB_FLOAT 19
	SDL_GPU_TEXTUREFORMAT_BC6H_RGB_UFLOAT 20
	SDL_GPU_TEXTUREFORMAT_R8_SNORM 21
	SDL_GPU_TEXTUREFORMAT_R8G8_SNORM 22
	SDL_GPU_TEXTUREFORMAT_R8G8B8A8_SNORM 23
	SDL_GPU_TEXTUREFORMAT_R16_SNORM 24
	SDL_GPU_TEXTUREFORMAT_R16G16_SNORM 25
	SDL_GPU_TEXTUREFORMAT_R16G16B16A16_SNORM 26
	SDL_GPU_TEXTUREFORMAT_R16_FLOAT 27
	SDL_GPU_TEXTUREFORMAT_R16G16_FLOAT 28
	SDL_GPU_TEXTUREFORMAT_R16G16B16A16_FLOAT 29
	SDL_GPU_TEXTUREFORMAT_R32_FLOAT 30
	SDL_GPU_TEXTUREFORMAT_R32G32_FLOAT 31
	SDL_GPU_TEXTUREFORMAT_R32G32B32A32_FLOAT 32
	SDL_GPU_TEXTUREFORMAT_R11G11B10_UFLOAT 33
	SDL_GPU_TEXTUREFORMAT_R8_UINT 34
	SDL_GPU_TEXTUREFORMAT_R8G8_UINT 35
	SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UINT 36
	SDL_GPU_TEXTUREFORMAT_R16_UINT 37
	SDL_GPU_TEXTUREFORMAT_R16G16_UINT 38
	SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UINT 39
	SDL_GPU_TEXTUREFORMAT_R32_UINT 40
	SDL_GPU_TEXTUREFORMAT_R32G32_UINT 41
	SDL_GPU_TEXTUREFORMAT_R32G32B32A32_UINT 42
	SDL_GPU_TEXTUREFORMAT_R8_INT 43
	SDL_GPU_TEXTUREFORMAT_R8G8_INT 44
	SDL_GPU_TEXTUREFORMAT_R8G8B8A8_INT 45
	SDL_GPU_TEXTUREFORMAT_R16_INT 46
	SDL_GPU_TEXTUREFORMAT_R16G16_INT 47
	SDL_GPU_TEXTUREFORMAT_R16G16B16A16_INT 48
	SDL_GPU_TEXTUREFORMAT_R32_INT 49
	SDL_GPU_TEXTUREFORMAT_R32G32_INT 50
	SDL_GPU_TEXTUREFORMAT_R32G32B32A32_INT 51
	SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM_SRGB 52
	SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM_SRGB 53
	SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM_SRGB 54
	SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM_SRGB 55
	SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM_SRGB 56
	SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM_SRGB 57
	SDL_GPU_TEXTUREFORMAT_D16_UNORM 58
	SDL_GPU_TEXTUREFORMAT_D24_UNORM 59
	SDL_GPU_TEXTUREFORMAT_D32_FLOAT 60
	SDL_GPU_TEXTUREFORMAT_D24_UNORM_S8_UINT 61
	SDL_GPU_TEXTUREFORMAT_D32_FLOAT_S8_UINT 62
	SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM 63
	SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM 64
	SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM 65
	SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM 66
	SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM 67
	SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM 68
	SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM 69
	SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM 70
	SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM 71
	SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM 72
	SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM 73
	SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM 74
	SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM 75
	SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM 76
	SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM_SRGB 77
	SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM_SRGB 78
	SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM_SRGB 79
	SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM_SRGB 80
	SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM_SRGB 81
	SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM_SRGB 82
	SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM_SRGB 83
	SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM_SRGB 84
	SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM_SRGB 85
	SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM_SRGB 86
	SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM_SRGB 87
	SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM_SRGB 88
	SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM_SRGB 89
	SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM_SRGB 90
	SDL_GPU_TEXTUREFORMAT_ASTC_4x4_FLOAT 91
	SDL_GPU_TEXTUREFORMAT_ASTC_5x4_FLOAT 92
	SDL_GPU_TEXTUREFORMAT_ASTC_5x5_FLOAT 93
	SDL_GPU_TEXTUREFORMAT_ASTC_6x5_FLOAT 94
	SDL_GPU_TEXTUREFORMAT_ASTC_6x6_FLOAT 95
	SDL_GPU_TEXTUREFORMAT_ASTC_8x5_FLOAT 96
	SDL_GPU_TEXTUREFORMAT_ASTC_8x6_FLOAT 97
	SDL_GPU_TEXTUREFORMAT_ASTC_8x8_FLOAT 98
	SDL_GPU_TEXTUREFORMAT_ASTC_10x5_FLOAT 99
	SDL_GPU_TEXTUREFORMAT_ASTC_10x6_FLOAT 100
	SDL_GPU_TEXTUREFORMAT_ASTC_10x8_FLOAT 101
	SDL_GPU_TEXTUREFORMAT_ASTC_10x10_FLOAT 102
	SDL_GPU_TEXTUREFORMAT_ASTC_12x10_FLOAT 103
	SDL_GPU_TEXTUREFORMAT_ASTC_12x12_FLOAT 104 )
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> invalid [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_INVALID
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> r10g10b10a2Unorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_R10G10B10A2_UNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> r11g11b10Ufloat [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_R11G11B10_UFLOAT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> r16Float [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_R16_FLOAT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> r16Int [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_R16_INT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> r16Snorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_R16_SNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> r16Uint [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_R16_UINT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> r16Unorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_R16_UNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> r16g16Float [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_R16G16_FLOAT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> r16g16Int [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_R16G16_INT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> r16g16Snorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_R16G16_SNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> r16g16Uint [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_R16G16_UINT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> r16g16Unorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_R16G16_UNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> r16g16b16a16Float [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_R16G16B16A16_FLOAT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> r16g16b16a16Int [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_R16G16B16A16_INT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> r16g16b16a16Snorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_R16G16B16A16_SNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> r16g16b16a16Uint [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UINT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> r16g16b16a16Unorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> r32Float [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_R32_FLOAT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> r32Int [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_R32_INT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> r32Uint [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_R32_UINT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> r32g32Float [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_R32G32_FLOAT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> r32g32Int [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_R32G32_INT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> r32g32Uint [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_R32G32_UINT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> r32g32b32a32Float [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_R32G32B32A32_FLOAT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> r32g32b32a32Int [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_R32G32B32A32_INT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> r32g32b32a32Uint [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_R32G32B32A32_UINT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> r8Int [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_R8_INT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> r8Snorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_R8_SNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> r8Uint [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_R8_UINT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> r8Unorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_R8_UNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> r8g8Int [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_R8G8_INT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> r8g8Snorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_R8G8_SNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> r8g8Uint [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_R8G8_UINT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> r8g8Unorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_R8G8_UNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> r8g8b8a8Int [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_R8G8B8A8_INT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> r8g8b8a8Snorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_R8G8B8A8_SNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> r8g8b8a8Uint [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UINT
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> r8g8b8a8Unorm [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM
]

{ #category : 'accessing enum' }
SDL3GPUTextureFormat class >> r8g8b8a8UnormSrgb [
	"This method was automatically generated"
	^ SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM_SRGB
]
