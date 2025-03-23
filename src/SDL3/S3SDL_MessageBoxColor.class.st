Class {
	#name : 'S3SDL_MessageBoxColor',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_B',
		'OFFSET_G',
		'OFFSET_R'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_MessageBoxColor class >> fieldsDesc [

	^ #(
	Uint8 r;
	Uint8 g;
	Uint8 b
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_MessageBoxColor >> b [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_B
]

{ #category : 'accessing - structure variables' }
S3SDL_MessageBoxColor >> b: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_B put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_MessageBoxColor >> g [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_G
]

{ #category : 'accessing - structure variables' }
S3SDL_MessageBoxColor >> g: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_G put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_MessageBoxColor >> r [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_R
]

{ #category : 'accessing - structure variables' }
S3SDL_MessageBoxColor >> r: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_R put: anObject
]
