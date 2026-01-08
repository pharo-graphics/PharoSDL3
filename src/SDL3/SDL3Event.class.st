Class {
	#name : 'SDL3Event',
	#superclass : 'SDL3Union',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3Event class >> fieldsDesc [

	^ #(
	Uint32 type;
	SDL_CommonEvent common;
	SDL_DisplayEvent display;
	SDL_WindowEvent window;
	SDL_KeyboardDeviceEvent kdevice;
	SDL_KeyboardEvent key;
	SDL_TextEditingEvent edit;
	SDL_TextEditingCandidatesEvent edit_candidates;
	SDL_TextInputEvent text;
	SDL_MouseDeviceEvent mdevice;
	SDL_MouseMotionEvent motion;
	SDL_MouseButtonEvent button;
	SDL_MouseWheelEvent wheel;
	SDL_JoyDeviceEvent jdevice;
	SDL_JoyAxisEvent jaxis;
	SDL_JoyBallEvent jball;
	SDL_JoyHatEvent jhat;
	SDL_JoyButtonEvent jbutton;
	SDL_JoyBatteryEvent jbattery;
	SDL_GamepadDeviceEvent gdevice;
	SDL_GamepadAxisEvent gaxis;
	SDL_GamepadButtonEvent gbutton;
	SDL_GamepadTouchpadEvent gtouchpad;
	SDL_GamepadSensorEvent gsensor;
	SDL_AudioDeviceEvent adevice;
	SDL_CameraDeviceEvent cdevice;
	SDL_SensorEvent sensor;
	SDL_QuitEvent quit;
	SDL_UserEvent user;
	SDL_TouchFingerEvent tfinger;
	SDL_PinchFingerEvent pinch;
	SDL_PenProximityEvent pproximity;
	SDL_PenTouchEvent ptouch;
	SDL_PenMotionEvent pmotion;
	SDL_PenButtonEvent pbutton;
	SDL_PenAxisEvent paxis;
	SDL_RenderEvent render;
	SDL_DropEvent drop;
	SDL_ClipboardEvent clipboard;
	Uint8_128 padding
	)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> adevice [
	"This method was automatically generated"
	^ SDL3AudioDeviceEvent fromHandle: (handle referenceStructAt: 1 length: SDL3AudioDeviceEvent byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> adevice: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 24.
]

{ #category : 'accessing - structure variables' }
SDL3Event >> button [
	"This method was automatically generated"
	^ SDL3MouseButtonEvent fromHandle: (handle referenceStructAt: 1 length: SDL3MouseButtonEvent byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> button: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 40.
]

{ #category : 'accessing - structure variables' }
SDL3Event >> cdevice [
	"This method was automatically generated"
	^ SDL3CameraDeviceEvent fromHandle: (handle referenceStructAt: 1 length: SDL3CameraDeviceEvent byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> cdevice: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 24.
]

{ #category : 'accessing - structure variables' }
SDL3Event >> clipboard [
	"This method was automatically generated"
	^ SDL3ClipboardEvent fromHandle: (handle referenceStructAt: 1 length: SDL3ClipboardEvent byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> clipboard: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 32.
]

{ #category : 'accessing - structure variables' }
SDL3Event >> common [
	"This method was automatically generated"
	^ SDL3CommonEvent fromHandle: (handle referenceStructAt: 1 length: SDL3CommonEvent byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> common: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 16.
]

{ #category : 'accessing - structure variables' }
SDL3Event >> display [
	"This method was automatically generated"
	^ SDL3DisplayEvent fromHandle: (handle referenceStructAt: 1 length: SDL3DisplayEvent byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> display: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 32.
]

{ #category : 'accessing - structure variables' }
SDL3Event >> drop [
	"This method was automatically generated"
	^ SDL3DropEvent fromHandle: (handle referenceStructAt: 1 length: SDL3DropEvent byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> drop: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 48.
]

{ #category : 'accessing - structure variables' }
SDL3Event >> edit [
	"This method was automatically generated"
	^ SDL3TextEditingEvent fromHandle: (handle referenceStructAt: 1 length: SDL3TextEditingEvent byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> edit: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 40.
]

{ #category : 'accessing - structure variables' }
SDL3Event >> edit_candidates [
	"This method was automatically generated"
	^ SDL3TextEditingCandidatesEvent fromHandle: (handle referenceStructAt: 1 length: SDL3TextEditingCandidatesEvent byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> edit_candidates: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 48.
]

{ #category : 'accessing - structure variables' }
SDL3Event >> gaxis [
	"This method was automatically generated"
	^ SDL3GamepadAxisEvent fromHandle: (handle referenceStructAt: 1 length: SDL3GamepadAxisEvent byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> gaxis: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 32.
]

{ #category : 'accessing - structure variables' }
SDL3Event >> gbutton [
	"This method was automatically generated"
	^ SDL3GamepadButtonEvent fromHandle: (handle referenceStructAt: 1 length: SDL3GamepadButtonEvent byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> gbutton: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 24.
]

{ #category : 'accessing - structure variables' }
SDL3Event >> gdevice [
	"This method was automatically generated"
	^ SDL3GamepadDeviceEvent fromHandle: (handle referenceStructAt: 1 length: SDL3GamepadDeviceEvent byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> gdevice: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 24.
]

{ #category : 'accessing - structure variables' }
SDL3Event >> gsensor [
	"This method was automatically generated"
	^ SDL3GamepadSensorEvent fromHandle: (handle referenceStructAt: 1 length: SDL3GamepadSensorEvent byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> gsensor: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 48.
]

{ #category : 'accessing - structure variables' }
SDL3Event >> gtouchpad [
	"This method was automatically generated"
	^ SDL3GamepadTouchpadEvent fromHandle: (handle referenceStructAt: 1 length: SDL3GamepadTouchpadEvent byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> gtouchpad: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 40.
]

{ #category : 'accessing - structure variables' }
SDL3Event >> jaxis [
	"This method was automatically generated"
	^ SDL3JoyAxisEvent fromHandle: (handle referenceStructAt: 1 length: SDL3JoyAxisEvent byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> jaxis: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 32.
]

{ #category : 'accessing - structure variables' }
SDL3Event >> jball [
	"This method was automatically generated"
	^ SDL3JoyBallEvent fromHandle: (handle referenceStructAt: 1 length: SDL3JoyBallEvent byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> jball: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 32.
]

{ #category : 'accessing - structure variables' }
SDL3Event >> jbattery [
	"This method was automatically generated"
	^ SDL3JoyBatteryEvent fromHandle: (handle referenceStructAt: 1 length: SDL3JoyBatteryEvent byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> jbattery: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 32.
]

{ #category : 'accessing - structure variables' }
SDL3Event >> jbutton [
	"This method was automatically generated"
	^ SDL3JoyButtonEvent fromHandle: (handle referenceStructAt: 1 length: SDL3JoyButtonEvent byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> jbutton: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 24.
]

{ #category : 'accessing - structure variables' }
SDL3Event >> jdevice [
	"This method was automatically generated"
	^ SDL3JoyDeviceEvent fromHandle: (handle referenceStructAt: 1 length: SDL3JoyDeviceEvent byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> jdevice: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 24.
]

{ #category : 'accessing - structure variables' }
SDL3Event >> jhat [
	"This method was automatically generated"
	^ SDL3JoyHatEvent fromHandle: (handle referenceStructAt: 1 length: SDL3JoyHatEvent byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> jhat: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 24.
]

{ #category : 'accessing - structure variables' }
SDL3Event >> kdevice [
	"This method was automatically generated"
	^ SDL3KeyboardDeviceEvent fromHandle: (handle referenceStructAt: 1 length: SDL3KeyboardDeviceEvent byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> kdevice: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 24.
]

{ #category : 'accessing - structure variables' }
SDL3Event >> key [
	"This method was automatically generated"
	^ SDL3KeyboardEvent fromHandle: (handle referenceStructAt: 1 length: SDL3KeyboardEvent byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> key: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 40.
]

{ #category : 'accessing - structure variables' }
SDL3Event >> mdevice [
	"This method was automatically generated"
	^ SDL3MouseDeviceEvent fromHandle: (handle referenceStructAt: 1 length: SDL3MouseDeviceEvent byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> mdevice: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 24.
]

{ #category : 'accessing - structure variables' }
SDL3Event >> motion [
	"This method was automatically generated"
	^ SDL3MouseMotionEvent fromHandle: (handle referenceStructAt: 1 length: SDL3MouseMotionEvent byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> motion: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 48.
]

{ #category : 'accessing - structure variables' }
SDL3Event >> padding [
	"This method was automatically generated"
	^(FFITypeArray ofType: #FFIUInt8 size: 128) fromHandle: (handle copyFrom: 1 to: 128)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> padding: anObject [
	"This method was automatically generated"
	handle replaceFrom: 1 to: 128 with: anObject getHandle startingAt: 1
]

{ #category : 'accessing - structure variables' }
SDL3Event >> paxis [
	"This method was automatically generated"
	^ SDL3PenAxisEvent fromHandle: (handle referenceStructAt: 1 length: SDL3PenAxisEvent byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> paxis: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 48.
]

{ #category : 'accessing - structure variables' }
SDL3Event >> pbutton [
	"This method was automatically generated"
	^ SDL3PenButtonEvent fromHandle: (handle referenceStructAt: 1 length: SDL3PenButtonEvent byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> pbutton: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 40.
]

{ #category : 'accessing - structure variables' }
SDL3Event >> pinch [
	"This method was automatically generated"
	^ SDL3PinchFingerEvent fromHandle: (handle referenceStructAt: 1 length: SDL3PinchFingerEvent byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> pinch: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 24.
]

{ #category : 'accessing - structure variables' }
SDL3Event >> pmotion [
	"This method was automatically generated"
	^ SDL3PenMotionEvent fromHandle: (handle referenceStructAt: 1 length: SDL3PenMotionEvent byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> pmotion: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 40.
]

{ #category : 'accessing - structure variables' }
SDL3Event >> pproximity [
	"This method was automatically generated"
	^ SDL3PenProximityEvent fromHandle: (handle referenceStructAt: 1 length: SDL3PenProximityEvent byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> pproximity: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 24.
]

{ #category : 'accessing - structure variables' }
SDL3Event >> ptouch [
	"This method was automatically generated"
	^ SDL3PenTouchEvent fromHandle: (handle referenceStructAt: 1 length: SDL3PenTouchEvent byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> ptouch: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 40.
]

{ #category : 'accessing - structure variables' }
SDL3Event >> quit [
	"This method was automatically generated"
	^ SDL3QuitEvent fromHandle: (handle referenceStructAt: 1 length: SDL3QuitEvent byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> quit: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 16.
]

{ #category : 'accessing - structure variables' }
SDL3Event >> render [
	"This method was automatically generated"
	^ SDL3RenderEvent fromHandle: (handle referenceStructAt: 1 length: SDL3RenderEvent byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> render: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 24.
]

{ #category : 'accessing - structure variables' }
SDL3Event >> sensor [
	"This method was automatically generated"
	^ SDL3SensorEvent fromHandle: (handle referenceStructAt: 1 length: SDL3SensorEvent byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> sensor: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 56.
]

{ #category : 'accessing - structure variables' }
SDL3Event >> text [
	"This method was automatically generated"
	^ SDL3TextInputEvent fromHandle: (handle referenceStructAt: 1 length: SDL3TextInputEvent byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> text: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 32.
]

{ #category : 'accessing - structure variables' }
SDL3Event >> tfinger [
	"This method was automatically generated"
	^ SDL3TouchFingerEvent fromHandle: (handle referenceStructAt: 1 length: SDL3TouchFingerEvent byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> tfinger: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 56.
]

{ #category : 'accessing - structure variables' }
SDL3Event >> type [
	"This method was automatically generated"
	^handle unsignedLongAt: 1
]

{ #category : 'accessing - structure variables' }
SDL3Event >> type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: 1 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3Event >> user [
	"This method was automatically generated"
	^ SDL3UserEvent fromHandle: (handle referenceStructAt: 1 length: SDL3UserEvent byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> user: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 40.
]

{ #category : 'accessing - structure variables' }
SDL3Event >> wheel [
	"This method was automatically generated"
	^ SDL3MouseWheelEvent fromHandle: (handle referenceStructAt: 1 length: SDL3MouseWheelEvent byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> wheel: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 56.
]

{ #category : 'accessing - structure variables' }
SDL3Event >> window [
	"This method was automatically generated"
	^ SDL3WindowEvent fromHandle: (handle referenceStructAt: 1 length: SDL3WindowEvent byteSize)
]

{ #category : 'accessing - structure variables' }
SDL3Event >> window: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 32.
]
