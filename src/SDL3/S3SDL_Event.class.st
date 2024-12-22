Class {
	#name : 'S3SDL_Event',
	#superclass : 'S3Union',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_Event class >> fieldsDesc [

	^ #(
	int type;
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
	SDL_PenProximityEvent pproximity;
	SDL_PenTouchEvent ptouch;
	SDL_PenMotionEvent pmotion;
	SDL_PenButtonEvent pbutton;
	SDL_PenAxisEvent paxis;
	SDL_DropEvent drop;
	SDL_ClipboardEvent clipboard;
	int_128 padding
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> adevice [
	"This method was automatically generated"
	^ S3SDL_AudioDeviceEvent fromHandle: (handle referenceStructAt: 1 length: S3SDL_AudioDeviceEvent byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> adevice: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 32.
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> button [
	"This method was automatically generated"
	^ S3SDL_MouseButtonEvent fromHandle: (handle referenceStructAt: 1 length: S3SDL_MouseButtonEvent byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> button: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 44.
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> cdevice [
	"This method was automatically generated"
	^ S3SDL_CameraDeviceEvent fromHandle: (handle referenceStructAt: 1 length: S3SDL_CameraDeviceEvent byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> cdevice: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 16.
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> clipboard [
	"This method was automatically generated"
	^ S3SDL_ClipboardEvent fromHandle: (handle referenceStructAt: 1 length: S3SDL_ClipboardEvent byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> clipboard: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 32.
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> common [
	"This method was automatically generated"
	^ S3SDL_CommonEvent fromHandle: (handle referenceStructAt: 1 length: S3SDL_CommonEvent byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> common: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 12.
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> display [
	"This method was automatically generated"
	^ S3SDL_DisplayEvent fromHandle: (handle referenceStructAt: 1 length: S3SDL_DisplayEvent byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> display: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 24.
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> drop [
	"This method was automatically generated"
	^ S3SDL_DropEvent fromHandle: (handle referenceStructAt: 1 length: S3SDL_DropEvent byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> drop: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 40.
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> edit [
	"This method was automatically generated"
	^ S3SDL_TextEditingEvent fromHandle: (handle referenceStructAt: 1 length: S3SDL_TextEditingEvent byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> edit: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 32.
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> edit_candidates [
	"This method was automatically generated"
	^ S3SDL_TextEditingCandidatesEvent fromHandle: (handle referenceStructAt: 1 length: S3SDL_TextEditingCandidatesEvent byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> edit_candidates: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 48.
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> gaxis [
	"This method was automatically generated"
	^ S3SDL_GamepadAxisEvent fromHandle: (handle referenceStructAt: 1 length: S3SDL_GamepadAxisEvent byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> gaxis: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 40.
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> gbutton [
	"This method was automatically generated"
	^ S3SDL_GamepadButtonEvent fromHandle: (handle referenceStructAt: 1 length: S3SDL_GamepadButtonEvent byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> gbutton: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 32.
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> gdevice [
	"This method was automatically generated"
	^ S3SDL_GamepadDeviceEvent fromHandle: (handle referenceStructAt: 1 length: S3SDL_GamepadDeviceEvent byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> gdevice: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 16.
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> gsensor [
	"This method was automatically generated"
	^ S3SDL_GamepadSensorEvent fromHandle: (handle referenceStructAt: 1 length: S3SDL_GamepadSensorEvent byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> gsensor: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 36.
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> gtouchpad [
	"This method was automatically generated"
	^ S3SDL_GamepadTouchpadEvent fromHandle: (handle referenceStructAt: 1 length: S3SDL_GamepadTouchpadEvent byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> gtouchpad: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 36.
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> jaxis [
	"This method was automatically generated"
	^ S3SDL_JoyAxisEvent fromHandle: (handle referenceStructAt: 1 length: S3SDL_JoyAxisEvent byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> jaxis: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 40.
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> jball [
	"This method was automatically generated"
	^ S3SDL_JoyBallEvent fromHandle: (handle referenceStructAt: 1 length: S3SDL_JoyBallEvent byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> jball: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 40.
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> jbattery [
	"This method was automatically generated"
	^ S3SDL_JoyBatteryEvent fromHandle: (handle referenceStructAt: 1 length: S3SDL_JoyBatteryEvent byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> jbattery: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 24.
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> jbutton [
	"This method was automatically generated"
	^ S3SDL_JoyButtonEvent fromHandle: (handle referenceStructAt: 1 length: S3SDL_JoyButtonEvent byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> jbutton: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 32.
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> jdevice [
	"This method was automatically generated"
	^ S3SDL_JoyDeviceEvent fromHandle: (handle referenceStructAt: 1 length: S3SDL_JoyDeviceEvent byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> jdevice: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 16.
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> jhat [
	"This method was automatically generated"
	^ S3SDL_JoyHatEvent fromHandle: (handle referenceStructAt: 1 length: S3SDL_JoyHatEvent byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> jhat: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 32.
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> kdevice [
	"This method was automatically generated"
	^ S3SDL_KeyboardDeviceEvent fromHandle: (handle referenceStructAt: 1 length: S3SDL_KeyboardDeviceEvent byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> kdevice: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 16.
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> key [
	"This method was automatically generated"
	^ S3SDL_KeyboardEvent fromHandle: (handle referenceStructAt: 1 length: S3SDL_KeyboardEvent byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> key: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 44.
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> mdevice [
	"This method was automatically generated"
	^ S3SDL_MouseDeviceEvent fromHandle: (handle referenceStructAt: 1 length: S3SDL_MouseDeviceEvent byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> mdevice: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 16.
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> motion [
	"This method was automatically generated"
	^ S3SDL_MouseMotionEvent fromHandle: (handle referenceStructAt: 1 length: S3SDL_MouseMotionEvent byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> motion: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 40.
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> padding [
	"This method was automatically generated"
	^(FFITypeArray ofType: #FFIInt32 size: 128) fromHandle: (handle copyFrom: 1 to: 512)
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> padding: anObject [
	"This method was automatically generated"
	handle replaceFrom: 1 to: 512 with: anObject getHandle startingAt: 1
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> paxis [
	"This method was automatically generated"
	^ S3SDL_PenAxisEvent fromHandle: (handle referenceStructAt: 1 length: S3SDL_PenAxisEvent byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> paxis: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 40.
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> pbutton [
	"This method was automatically generated"
	^ S3SDL_PenButtonEvent fromHandle: (handle referenceStructAt: 1 length: S3SDL_PenButtonEvent byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> pbutton: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 40.
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> pmotion [
	"This method was automatically generated"
	^ S3SDL_PenMotionEvent fromHandle: (handle referenceStructAt: 1 length: S3SDL_PenMotionEvent byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> pmotion: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 32.
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> pproximity [
	"This method was automatically generated"
	^ S3SDL_PenProximityEvent fromHandle: (handle referenceStructAt: 1 length: S3SDL_PenProximityEvent byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> pproximity: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 20.
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> ptouch [
	"This method was automatically generated"
	^ S3SDL_PenTouchEvent fromHandle: (handle referenceStructAt: 1 length: S3SDL_PenTouchEvent byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> ptouch: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 40.
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> quit [
	"This method was automatically generated"
	^ S3SDL_QuitEvent fromHandle: (handle referenceStructAt: 1 length: S3SDL_QuitEvent byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> quit: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 12.
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> sensor [
	"This method was automatically generated"
	^ S3SDL_SensorEvent fromHandle: (handle referenceStructAt: 1 length: S3SDL_SensorEvent byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> sensor: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 44.
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> text [
	"This method was automatically generated"
	^ S3SDL_TextInputEvent fromHandle: (handle referenceStructAt: 1 length: S3SDL_TextInputEvent byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> text: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 24.
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> tfinger [
	"This method was automatically generated"
	^ S3SDL_TouchFingerEvent fromHandle: (handle referenceStructAt: 1 length: S3SDL_TouchFingerEvent byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> tfinger: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 44.
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> type [
	"This method was automatically generated"
	^handle signedLongAt: 1
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> type: anObject [
	"This method was automatically generated"
	handle signedLongAt: 1 put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> user [
	"This method was automatically generated"
	^ S3SDL_UserEvent fromHandle: (handle referenceStructAt: 1 length: S3SDL_UserEvent byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> user: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 40.
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> wheel [
	"This method was automatically generated"
	^ S3SDL_MouseWheelEvent fromHandle: (handle referenceStructAt: 1 length: S3SDL_MouseWheelEvent byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> wheel: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 40.
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> window [
	"This method was automatically generated"
	^ S3SDL_WindowEvent fromHandle: (handle referenceStructAt: 1 length: S3SDL_WindowEvent byteSize)
]

{ #category : 'accessing - structure variables' }
S3SDL_Event >> window: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 24.
]
