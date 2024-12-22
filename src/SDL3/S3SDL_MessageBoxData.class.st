Class {
	#name : 'S3SDL_MessageBoxData',
	#superclass : 'S3Structure',
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
S3SDL_MessageBoxData class >> fieldsDesc [

	^ #(
	SDL_MessageBoxFlags flags;
	int* window;
	char* title;
	char* message;
	int numbuttons;
	SDL_MessageBoxButtonData* buttons;
	SDL_MessageBoxColorScheme* colorScheme
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_MessageBoxData >> buttons [
	"This method was automatically generated"
	^S3SDL_MessageBoxButtonData fromHandle: (handle pointerAt: OFFSET_BUTTONS)
]

{ #category : 'accessing - structure variables' }
S3SDL_MessageBoxData >> buttons: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_BUTTONS put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
S3SDL_MessageBoxData >> colorScheme [
	"This method was automatically generated"
	^S3SDL_MessageBoxColorScheme fromHandle: (handle pointerAt: OFFSET_COLORSCHEME)
]

{ #category : 'accessing - structure variables' }
S3SDL_MessageBoxData >> colorScheme: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_COLORSCHEME put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
S3SDL_MessageBoxData >> flags [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_FLAGS
]

{ #category : 'accessing - structure variables' }
S3SDL_MessageBoxData >> flags: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_FLAGS put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_MessageBoxData >> message [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_MESSAGE) type: ExternalType char asPointerType
]

{ #category : 'accessing - structure variables' }
S3SDL_MessageBoxData >> message: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_MESSAGE put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
S3SDL_MessageBoxData >> numbuttons [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NUMBUTTONS
]

{ #category : 'accessing - structure variables' }
S3SDL_MessageBoxData >> numbuttons: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NUMBUTTONS put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_MessageBoxData >> title [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_TITLE) type: ExternalType char asPointerType
]

{ #category : 'accessing - structure variables' }
S3SDL_MessageBoxData >> title: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_TITLE put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
S3SDL_MessageBoxData >> window [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_WINDOW) type: ExternalType long asPointerType
]

{ #category : 'accessing - structure variables' }
S3SDL_MessageBoxData >> window: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_WINDOW put: anObject getHandle.
]
