Class {
	#name : 'SDL3XEvent',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3XEvent >> dispose [

	self ffiCall: #(void _XEvent_dispose(_XEvent* self))
]
