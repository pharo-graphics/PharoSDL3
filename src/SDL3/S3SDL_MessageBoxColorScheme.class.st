Class {
	#name : 'S3SDL_MessageBoxColorScheme',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_COLORS'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_MessageBoxColorScheme class >> fieldsDesc [

	^ #(
	SDL_MessageBoxColor_5 colors
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_MessageBoxColorScheme >> colors [
	"This method was automatically generated"
	^(FFITypeArray ofType: #FFIExternalStructureType size: 5) fromHandle: (handle copyFrom: OFFSET_COLORS to: OFFSET_COLORS + 59)
]

{ #category : 'accessing - structure variables' }
S3SDL_MessageBoxColorScheme >> colors: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_COLORS to: OFFSET_COLORS + 59 with: anObject getHandle startingAt: 1
]
