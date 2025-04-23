Class {
	#name : 'SDL3GPUSamplerCreateInfo',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_ADDRESS_MODE_U',
		'OFFSET_ADDRESS_MODE_V',
		'OFFSET_ADDRESS_MODE_W',
		'OFFSET_COMPARE_OP',
		'OFFSET_ENABLE_ANISOTROPY',
		'OFFSET_ENABLE_COMPARE',
		'OFFSET_MAG_FILTER',
		'OFFSET_MAX_ANISOTROPY',
		'OFFSET_MAX_LOD',
		'OFFSET_MIN_FILTER',
		'OFFSET_MIN_LOD',
		'OFFSET_MIPMAP_MODE',
		'OFFSET_MIP_LOD_BIAS',
		'OFFSET_PADDING1',
		'OFFSET_PADDING2',
		'OFFSET_PROPS'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3GPUSamplerCreateInfo class >> fieldsDesc [

	^ #(
	SDL_GPUFilter min_filter;
	SDL_GPUFilter mag_filter;
	SDL_GPUSamplerMipmapMode mipmap_mode;
	SDL_GPUSamplerAddressMode address_mode_u;
	SDL_GPUSamplerAddressMode address_mode_v;
	SDL_GPUSamplerAddressMode address_mode_w;
	float mip_lod_bias;
	float max_anisotropy;
	SDL_GPUCompareOp compare_op;
	float min_lod;
	float max_lod;
	bool enable_anisotropy;
	bool enable_compare;
	Uint8 padding1;
	Uint8 padding2;
	SDL_PropertiesID props
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUSamplerCreateInfo >> address_mode_u [
	"This method was automatically generated"
	^SDL3GPUSamplerAddressMode fromInteger: (handle unsignedLongAt: OFFSET_ADDRESS_MODE_U)
]

{ #category : 'accessing - structure variables' }
SDL3GPUSamplerCreateInfo >> address_mode_u: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_ADDRESS_MODE_U put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3GPUSamplerCreateInfo >> address_mode_v [
	"This method was automatically generated"
	^SDL3GPUSamplerAddressMode fromInteger: (handle unsignedLongAt: OFFSET_ADDRESS_MODE_V)
]

{ #category : 'accessing - structure variables' }
SDL3GPUSamplerCreateInfo >> address_mode_v: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_ADDRESS_MODE_V put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3GPUSamplerCreateInfo >> address_mode_w [
	"This method was automatically generated"
	^SDL3GPUSamplerAddressMode fromInteger: (handle unsignedLongAt: OFFSET_ADDRESS_MODE_W)
]

{ #category : 'accessing - structure variables' }
SDL3GPUSamplerCreateInfo >> address_mode_w: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_ADDRESS_MODE_W put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3GPUSamplerCreateInfo >> compare_op [
	"This method was automatically generated"
	^SDL3GPUCompareOp fromInteger: (handle unsignedLongAt: OFFSET_COMPARE_OP)
]

{ #category : 'accessing - structure variables' }
SDL3GPUSamplerCreateInfo >> compare_op: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_COMPARE_OP put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3GPUSamplerCreateInfo >> enable_anisotropy [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_ENABLE_ANISOTROPY
]

{ #category : 'accessing - structure variables' }
SDL3GPUSamplerCreateInfo >> enable_anisotropy: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_ENABLE_ANISOTROPY put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUSamplerCreateInfo >> enable_compare [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_ENABLE_COMPARE
]

{ #category : 'accessing - structure variables' }
SDL3GPUSamplerCreateInfo >> enable_compare: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_ENABLE_COMPARE put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUSamplerCreateInfo >> mag_filter [
	"This method was automatically generated"
	^SDL3GPUFilter fromInteger: (handle unsignedLongAt: OFFSET_MAG_FILTER)
]

{ #category : 'accessing - structure variables' }
SDL3GPUSamplerCreateInfo >> mag_filter: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_MAG_FILTER put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3GPUSamplerCreateInfo >> max_anisotropy [
	"This method was automatically generated"
	^handle floatAt: OFFSET_MAX_ANISOTROPY
]

{ #category : 'accessing - structure variables' }
SDL3GPUSamplerCreateInfo >> max_anisotropy: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_MAX_ANISOTROPY put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUSamplerCreateInfo >> max_lod [
	"This method was automatically generated"
	^handle floatAt: OFFSET_MAX_LOD
]

{ #category : 'accessing - structure variables' }
SDL3GPUSamplerCreateInfo >> max_lod: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_MAX_LOD put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUSamplerCreateInfo >> min_filter [
	"This method was automatically generated"
	^SDL3GPUFilter fromInteger: (handle unsignedLongAt: OFFSET_MIN_FILTER)
]

{ #category : 'accessing - structure variables' }
SDL3GPUSamplerCreateInfo >> min_filter: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_MIN_FILTER put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3GPUSamplerCreateInfo >> min_lod [
	"This method was automatically generated"
	^handle floatAt: OFFSET_MIN_LOD
]

{ #category : 'accessing - structure variables' }
SDL3GPUSamplerCreateInfo >> min_lod: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_MIN_LOD put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUSamplerCreateInfo >> mip_lod_bias [
	"This method was automatically generated"
	^handle floatAt: OFFSET_MIP_LOD_BIAS
]

{ #category : 'accessing - structure variables' }
SDL3GPUSamplerCreateInfo >> mip_lod_bias: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_MIP_LOD_BIAS put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUSamplerCreateInfo >> mipmap_mode [
	"This method was automatically generated"
	^SDL3GPUSamplerMipmapMode fromInteger: (handle unsignedLongAt: OFFSET_MIPMAP_MODE)
]

{ #category : 'accessing - structure variables' }
SDL3GPUSamplerCreateInfo >> mipmap_mode: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_MIPMAP_MODE put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3GPUSamplerCreateInfo >> padding1 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING1
]

{ #category : 'accessing - structure variables' }
SDL3GPUSamplerCreateInfo >> padding1: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING1 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUSamplerCreateInfo >> padding2 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING2
]

{ #category : 'accessing - structure variables' }
SDL3GPUSamplerCreateInfo >> padding2: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING2 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUSamplerCreateInfo >> props [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_PROPS
]

{ #category : 'accessing - structure variables' }
SDL3GPUSamplerCreateInfo >> props: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_PROPS put: anObject
]
