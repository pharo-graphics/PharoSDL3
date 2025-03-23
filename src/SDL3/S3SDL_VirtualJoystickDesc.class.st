Class {
	#name : 'S3SDL_VirtualJoystickDesc',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_AXIS_MASK',
		'OFFSET_BUTTON_MASK',
		'OFFSET_CLEANUP',
		'OFFSET_NAME',
		'OFFSET_NAXES',
		'OFFSET_NBALLS',
		'OFFSET_NBUTTONS',
		'OFFSET_NHATS',
		'OFFSET_NSENSORS',
		'OFFSET_NTOUCHPADS',
		'OFFSET_PADDING',
		'OFFSET_PADDING2',
		'OFFSET_PRODUCT_ID',
		'OFFSET_RUMBLE',
		'OFFSET_RUMBLETRIGGERS',
		'OFFSET_SENDEFFECT',
		'OFFSET_SENSORS',
		'OFFSET_SETLED',
		'OFFSET_SETPLAYERINDEX',
		'OFFSET_SETSENSORSENABLED',
		'OFFSET_TOUCHPADS',
		'OFFSET_TYPE',
		'OFFSET_UPDATE',
		'OFFSET_USERDATA',
		'OFFSET_VENDOR_ID',
		'OFFSET_VERSION'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_VirtualJoystickDesc class >> fieldsDesc [

	^ #(
	Uint32 version;
	Uint16 type;
	Uint16 padding;
	Uint16 vendor_id;
	Uint16 product_id;
	Uint16 naxes;
	Uint16 nbuttons;
	Uint16 nballs;
	Uint16 nhats;
	Uint16 ntouchpads;
	Uint16 nsensors;
	Uint16_2 padding2;
	Uint32 button_mask;
	Uint32 axis_mask;
	char* name;
	SDL_VirtualJoystickTouchpadDesc* touchpads;
	SDL_VirtualJoystickSensorDesc* sensors;
	void* userdata;
	FFICallback Update;
	FFICallback SetPlayerIndex;
	FFICallback Rumble;
	FFICallback RumbleTriggers;
	FFICallback SetLED;
	FFICallback SendEffect;
	FFICallback SetSensorsEnabled;
	FFICallback Cleanup
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> Cleanup [
	"This method was automatically generated"
	^FFICallback forAddress: ((handle pointerAt: OFFSET_CLEANUP) asInteger)
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> Cleanup: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_CLEANUP
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> Rumble [
	"This method was automatically generated"
	^FFICallback forAddress: ((handle pointerAt: OFFSET_RUMBLE) asInteger)
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> Rumble: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_RUMBLE
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> RumbleTriggers [
	"This method was automatically generated"
	^FFICallback forAddress: ((handle pointerAt: OFFSET_RUMBLETRIGGERS) asInteger)
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> RumbleTriggers: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_RUMBLETRIGGERS
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> SendEffect [
	"This method was automatically generated"
	^FFICallback forAddress: ((handle pointerAt: OFFSET_SENDEFFECT) asInteger)
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> SendEffect: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_SENDEFFECT
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> SetLED [
	"This method was automatically generated"
	^FFICallback forAddress: ((handle pointerAt: OFFSET_SETLED) asInteger)
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> SetLED: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_SETLED
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> SetPlayerIndex [
	"This method was automatically generated"
	^FFICallback forAddress: ((handle pointerAt: OFFSET_SETPLAYERINDEX) asInteger)
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> SetPlayerIndex: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_SETPLAYERINDEX
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> SetSensorsEnabled [
	"This method was automatically generated"
	^FFICallback forAddress: ((handle pointerAt: OFFSET_SETSENSORSENABLED) asInteger)
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> SetSensorsEnabled: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_SETSENSORSENABLED
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> Update [
	"This method was automatically generated"
	^FFICallback forAddress: ((handle pointerAt: OFFSET_UPDATE) asInteger)
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> Update: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_UPDATE
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> axis_mask [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_AXIS_MASK
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> axis_mask: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_AXIS_MASK put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> button_mask [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_BUTTON_MASK
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> button_mask: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_BUTTON_MASK put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> name [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_NAME) type: ExternalType char asPointerType
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> name: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_NAME put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> naxes [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_NAXES
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> naxes: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_NAXES put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> nballs [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_NBALLS
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> nballs: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_NBALLS put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> nbuttons [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_NBUTTONS
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> nbuttons: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_NBUTTONS put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> nhats [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_NHATS
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> nhats: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_NHATS put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> nsensors [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_NSENSORS
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> nsensors: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_NSENSORS put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> ntouchpads [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_NTOUCHPADS
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> ntouchpads: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_NTOUCHPADS put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> padding [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_PADDING
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> padding2 [
	"This method was automatically generated"
	^(FFITypeArray ofType: #FFIUInt16 size: 2) fromHandle: (handle copyFrom: OFFSET_PADDING2 to: OFFSET_PADDING2 + 3)
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> padding2: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_PADDING2 to: OFFSET_PADDING2 + 3 with: anObject getHandle startingAt: 1
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> padding: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_PADDING put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> product_id [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_PRODUCT_ID
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> product_id: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_PRODUCT_ID put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> sensors [
	"This method was automatically generated"
	^S3SDL_VirtualJoystickSensorDesc fromHandle: (handle pointerAt: OFFSET_SENSORS)
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> sensors: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_SENSORS put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> touchpads [
	"This method was automatically generated"
	^S3SDL_VirtualJoystickTouchpadDesc fromHandle: (handle pointerAt: OFFSET_TOUCHPADS)
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> touchpads: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_TOUCHPADS put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> type [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_TYPE
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> type: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_TYPE put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> userdata [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_USERDATA) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> userdata: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_USERDATA put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> vendor_id [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_VENDOR_ID
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> vendor_id: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_VENDOR_ID put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> version [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_VERSION
]

{ #category : 'accessing - structure variables' }
S3SDL_VirtualJoystickDesc >> version: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_VERSION put: anObject
]
