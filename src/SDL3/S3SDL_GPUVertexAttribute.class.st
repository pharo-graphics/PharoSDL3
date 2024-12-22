Class {
	#name : 'S3SDL_GPUVertexAttribute',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_BUFFER_SLOT',
		'OFFSET_FORMAT',
		'OFFSET_LOCATION',
		'OFFSET_OFFSET'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_GPUVertexAttribute class >> fieldsDesc [

	^ #(
	int location;
	int buffer_slot;
	SDL_GPUVertexElementFormat format;
	int offset
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUVertexAttribute >> buffer_slot [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_BUFFER_SLOT
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUVertexAttribute >> buffer_slot: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_BUFFER_SLOT put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUVertexAttribute >> format [
	"This method was automatically generated"
	^S3SDL_GPUVertexElementFormat fromInteger: (handle unsignedLongAt: OFFSET_FORMAT)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUVertexAttribute >> format: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_FORMAT put: anObject value
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUVertexAttribute >> location [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_LOCATION
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUVertexAttribute >> location: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_LOCATION put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUVertexAttribute >> offset [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_OFFSET
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUVertexAttribute >> offset: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_OFFSET put: anObject
]
