Class {
	#name : 'S3SDL_GPUViewport',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_H',
		'OFFSET_MAX_DEPTH',
		'OFFSET_MIN_DEPTH',
		'OFFSET_W',
		'OFFSET_X',
		'OFFSET_Y'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_GPUViewport class >> fieldsDesc [

	^ #(
	float x;
	float y;
	float w;
	float h;
	float min_depth;
	float max_depth
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUViewport >> h [
	"This method was automatically generated"
	^handle floatAt: OFFSET_H
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUViewport >> h: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_H put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUViewport >> max_depth [
	"This method was automatically generated"
	^handle floatAt: OFFSET_MAX_DEPTH
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUViewport >> max_depth: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_MAX_DEPTH put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUViewport >> min_depth [
	"This method was automatically generated"
	^handle floatAt: OFFSET_MIN_DEPTH
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUViewport >> min_depth: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_MIN_DEPTH put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUViewport >> w [
	"This method was automatically generated"
	^handle floatAt: OFFSET_W
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUViewport >> w: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_W put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUViewport >> x [
	"This method was automatically generated"
	^handle floatAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUViewport >> x: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_X put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUViewport >> y [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Y
]

{ #category : 'accessing - structure variables' }
S3SDL_GPUViewport >> y: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_Y put: anObject
]
