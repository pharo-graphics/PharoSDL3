Class {
	#name : 'S3_XEvent',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
S3_XEvent >> dispose [

	self ffiCall: #(void _XEvent_dispose(_XEvent* self))
]
