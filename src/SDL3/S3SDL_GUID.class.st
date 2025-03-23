Class {
	#name : 'S3SDL_GUID',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_DATA'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_GUID class >> fieldsDesc [

	^ #(
	Uint8_16 data
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_GUID >> data [
	"This method was automatically generated"
	^(FFITypeArray ofType: #FFIUInt8 size: 16) fromHandle: (handle copyFrom: OFFSET_DATA to: OFFSET_DATA + 15)
]

{ #category : 'accessing - structure variables' }
S3SDL_GUID >> data: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_DATA to: OFFSET_DATA + 15 with: anObject getHandle startingAt: 1
]
