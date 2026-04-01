Class {
	#name : 'SDL3HidDeviceInfo',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_BUS_TYPE',
		'OFFSET_INTERFACE_CLASS',
		'OFFSET_INTERFACE_NUMBER',
		'OFFSET_INTERFACE_PROTOCOL',
		'OFFSET_INTERFACE_SUBCLASS',
		'OFFSET_MANUFACTURER_STRING',
		'OFFSET_NEXT',
		'OFFSET_PATH',
		'OFFSET_PRODUCT_ID',
		'OFFSET_PRODUCT_STRING',
		'OFFSET_RELEASE_NUMBER',
		'OFFSET_SERIAL_NUMBER',
		'OFFSET_USAGE',
		'OFFSET_USAGE_PAGE',
		'OFFSET_VENDOR_ID'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3HidDeviceInfo class >> fieldsDesc [

	^ #(
	char* path;
	ushort vendor_id;
	ushort product_id;
	int* serial_number;
	ushort release_number;
	int* manufacturer_string;
	int* product_string;
	ushort usage_page;
	ushort usage;
	int interface_number;
	int interface_class;
	int interface_subclass;
	int interface_protocol;
	SDL_hid_bus_type bus_type;
	SDL_hid_device_info* next
	)
]

{ #category : 'accessing - structure variables' }
SDL3HidDeviceInfo >> busType [
	"This method was automatically generated"
	^SDL3HidBusType fromInteger: (handle unsignedLongAt: OFFSET_BUS_TYPE)
]

{ #category : 'accessing - structure variables' }
SDL3HidDeviceInfo >> busType: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_BUS_TYPE put: anObject value
]

{ #category : 'accessing - structure variables' }
SDL3HidDeviceInfo >> interfaceClass [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_INTERFACE_CLASS
]

{ #category : 'accessing - structure variables' }
SDL3HidDeviceInfo >> interfaceClass: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_INTERFACE_CLASS put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HidDeviceInfo >> interfaceNumber [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_INTERFACE_NUMBER
]

{ #category : 'accessing - structure variables' }
SDL3HidDeviceInfo >> interfaceNumber: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_INTERFACE_NUMBER put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HidDeviceInfo >> interfaceProtocol [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_INTERFACE_PROTOCOL
]

{ #category : 'accessing - structure variables' }
SDL3HidDeviceInfo >> interfaceProtocol: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_INTERFACE_PROTOCOL put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HidDeviceInfo >> interfaceSubclass [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_INTERFACE_SUBCLASS
]

{ #category : 'accessing - structure variables' }
SDL3HidDeviceInfo >> interfaceSubclass: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_INTERFACE_SUBCLASS put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HidDeviceInfo >> manufacturerString [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_MANUFACTURER_STRING) type: ExternalType long asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3HidDeviceInfo >> manufacturerString: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_MANUFACTURER_STRING put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3HidDeviceInfo >> next [
	"This method was automatically generated"
	^SDL3HidDeviceInfo fromHandle: (handle pointerAt: OFFSET_NEXT)
]

{ #category : 'accessing - structure variables' }
SDL3HidDeviceInfo >> next: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_NEXT put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3HidDeviceInfo >> path [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_PATH) type: ExternalType char asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3HidDeviceInfo >> path: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_PATH put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3HidDeviceInfo >> productId [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_PRODUCT_ID
]

{ #category : 'accessing - structure variables' }
SDL3HidDeviceInfo >> productId: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_PRODUCT_ID put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HidDeviceInfo >> productString [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_PRODUCT_STRING) type: ExternalType long asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3HidDeviceInfo >> productString: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_PRODUCT_STRING put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3HidDeviceInfo >> releaseNumber [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_RELEASE_NUMBER
]

{ #category : 'accessing - structure variables' }
SDL3HidDeviceInfo >> releaseNumber: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_RELEASE_NUMBER put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HidDeviceInfo >> serialNumber [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_SERIAL_NUMBER) type: ExternalType long asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3HidDeviceInfo >> serialNumber: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_SERIAL_NUMBER put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3HidDeviceInfo >> usage [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_USAGE
]

{ #category : 'accessing - structure variables' }
SDL3HidDeviceInfo >> usage: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_USAGE put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HidDeviceInfo >> usagePage [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_USAGE_PAGE
]

{ #category : 'accessing - structure variables' }
SDL3HidDeviceInfo >> usagePage: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_USAGE_PAGE put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3HidDeviceInfo >> vendorId [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_VENDOR_ID
]

{ #category : 'accessing - structure variables' }
SDL3HidDeviceInfo >> vendorId: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_VENDOR_ID put: anObject
]
