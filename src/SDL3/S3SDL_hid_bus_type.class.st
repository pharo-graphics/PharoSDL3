Class {
	#name : 'S3SDL_hid_bus_type',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_HID_API_BUS_BLUETOOTH',
		'SDL_HID_API_BUS_I2C',
		'SDL_HID_API_BUS_SPI',
		'SDL_HID_API_BUS_UNKNOWN',
		'SDL_HID_API_BUS_USB'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
S3SDL_hid_bus_type class >> bluetooth [
	"This method was automatically generated"
	^ SDL_HID_API_BUS_BLUETOOTH
]

{ #category : 'enum declaration' }
S3SDL_hid_bus_type class >> enumDecl [

	^ #(
	SDL_HID_API_BUS_UNKNOWN 0
	SDL_HID_API_BUS_USB 1
	SDL_HID_API_BUS_BLUETOOTH 2
	SDL_HID_API_BUS_I2C 3
	SDL_HID_API_BUS_SPI 4 )
]

{ #category : 'accessing enum' }
S3SDL_hid_bus_type class >> i2c [
	"This method was automatically generated"
	^ SDL_HID_API_BUS_I2C
]

{ #category : 'accessing enum' }
S3SDL_hid_bus_type class >> spi [
	"This method was automatically generated"
	^ SDL_HID_API_BUS_SPI
]

{ #category : 'accessing enum' }
S3SDL_hid_bus_type class >> unknown [
	"This method was automatically generated"
	^ SDL_HID_API_BUS_UNKNOWN
]

{ #category : 'accessing enum' }
S3SDL_hid_bus_type class >> usb [
	"This method was automatically generated"
	^ SDL_HID_API_BUS_USB
]
