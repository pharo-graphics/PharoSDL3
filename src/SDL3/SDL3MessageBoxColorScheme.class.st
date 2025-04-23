Class {
	#name : 'SDL3MessageBoxColorScheme',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_COLORS'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3MessageBoxColorScheme class >> fieldsDesc [

	^ #(
	SDL_MessageBoxColor_5 colors
	)
]

{ #category : 'accessing - structure variables' }
SDL3MessageBoxColorScheme >> colors [
	"This method was automatically generated"
	^(FFITypeArray ofType: #FFIExternalStructureType size: 5) fromHandle: (handle copyFrom: OFFSET_COLORS to: OFFSET_COLORS + 14)
]

{ #category : 'accessing - structure variables' }
SDL3MessageBoxColorScheme >> colors: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_COLORS to: OFFSET_COLORS + 14 with: anObject getHandle startingAt: 1
]
