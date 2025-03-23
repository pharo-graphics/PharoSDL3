Class {
	#name : 'S3SDL_GPUTextureCreateInfo',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_FORMAT',
		'OFFSET_HEIGHT',
		'OFFSET_LAYER_COUNT_OR_DEPTH',
		'OFFSET_NUM_LEVELS',
		'OFFSET_PROPS',
		'OFFSET_SAMPLE_COUNT',
		'OFFSET_TYPE',
		'OFFSET_USAGE',
		'OFFSET_WIDTH'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_GPUTextureCreateInfo class >> fieldsDesc [

	^ #(
	SDL_GPUTextureType type;
	SDL_GPUTextureFormat format;
	SDL_GPUTextureUsageFlags usage;
	Uint32 width;
	Uint32 height;
	Uint32 layer_count_or_depth;
	Uint32 num_levels;
	SDL_GPUSampleCount sample_count;
	SDL_PropertiesID props
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureCreateInfo >> format [
	"This method was automatically generated"
	^S3SDL_GPUTextureFormat fromInteger: (handle unsignedLongAt: OFFSET_FORMAT)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureCreateInfo >> format: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_FORMAT put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureCreateInfo >> height [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_HEIGHT
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureCreateInfo >> height: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_HEIGHT put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureCreateInfo >> layer_count_or_depth [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_LAYER_COUNT_OR_DEPTH
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureCreateInfo >> layer_count_or_depth: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_LAYER_COUNT_OR_DEPTH put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureCreateInfo >> num_levels [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_NUM_LEVELS
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureCreateInfo >> num_levels: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_NUM_LEVELS put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureCreateInfo >> props [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_PROPS
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureCreateInfo >> props: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_PROPS put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureCreateInfo >> sample_count [
	"This method was automatically generated"
	^S3SDL_GPUSampleCount fromInteger: (handle unsignedLongAt: OFFSET_SAMPLE_COUNT)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureCreateInfo >> sample_count: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_SAMPLE_COUNT put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureCreateInfo >> type [
	"This method was automatically generated"
	^S3SDL_GPUTextureType fromInteger: (handle unsignedLongAt: OFFSET_TYPE)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureCreateInfo >> type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureCreateInfo >> usage [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_USAGE
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureCreateInfo >> usage: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_USAGE put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureCreateInfo >> width [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WIDTH
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUTextureCreateInfo >> width: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_WIDTH put: anObject
]
