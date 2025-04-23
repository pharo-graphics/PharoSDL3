Class {
	#name : 'SDL3MessageBoxData',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_BUTTONS',
		'OFFSET_COLORSCHEME',
		'OFFSET_FLAGS',
		'OFFSET_MESSAGE',
		'OFFSET_NUMBUTTONS',
		'OFFSET_TITLE',
		'OFFSET_WINDOW'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3MessageBoxData class >> fieldsDesc [

	^ #(
	SDL_MessageBoxFlags flags;
	SDL_Window* window;
	char* title;
	char* message;
	int numbuttons;
	SDL_MessageBoxButtonData* buttons;
	SDL_MessageBoxColorScheme* colorScheme
	)
]

{ #category : 'accessing - structure variables' }
SDL3MessageBoxData >> buttons [
	"This method was automatically generated"
	^SDL3MessageBoxButtonData fromHandle: (handle pointerAt: OFFSET_BUTTONS)
]

{ #category : 'accessing - structure variables' }
SDL3MessageBoxData >> buttons: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_BUTTONS put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3MessageBoxData >> colorScheme [
	"This method was automatically generated"
	^SDL3MessageBoxColorScheme fromHandle: (handle pointerAt: OFFSET_COLORSCHEME)
]

{ #category : 'accessing - structure variables' }
SDL3MessageBoxData >> colorScheme: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_COLORSCHEME put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3MessageBoxData >> flags [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_FLAGS
]

{ #category : 'accessing - structure variables' }
SDL3MessageBoxData >> flags: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_FLAGS put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3MessageBoxData >> message [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_MESSAGE) type: ExternalType char asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3MessageBoxData >> message: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_MESSAGE put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3MessageBoxData >> numbuttons [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NUMBUTTONS
]

{ #category : 'accessing - structure variables' }
SDL3MessageBoxData >> numbuttons: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NUMBUTTONS put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3MessageBoxData >> title [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_TITLE) type: ExternalType char asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3MessageBoxData >> title: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_TITLE put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3MessageBoxData >> window [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_WINDOW) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3MessageBoxData >> window: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_WINDOW put: anObject getHandle.
]
