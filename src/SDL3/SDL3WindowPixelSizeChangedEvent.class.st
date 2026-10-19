"
I represent the `SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED` SDL3 event type. My FFI structure fields and their corresponding accessing protocol are defined on my superclass.
"
Class {
	#name : 'SDL3WindowPixelSizeChangedEvent',
	#superclass : 'SDL3WindowEvent',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'accessing' }
SDL3WindowPixelSizeChangedEvent class >> eventType [

	^ SDL3EventType windowPixelSizeChanged
]

{ #category : 'visitor' }
SDL3WindowPixelSizeChangedEvent >> accept: aVisitor [

	^ aVisitor visitWindowPixelSizeChangedEvent: self
]

{ #category : 'accessing' }
SDL3WindowPixelSizeChangedEvent >> extent [
	"Answer the new extent"

	^ self width @ self height
]

{ #category : 'accessing' }
SDL3WindowPixelSizeChangedEvent >> height [
	"Answer the new height"

	^ self data2
]

{ #category : 'accessing' }
SDL3WindowPixelSizeChangedEvent >> width [
	"Answer the new width"

	^ self data1
]
