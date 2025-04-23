Class {
	#name : 'SDL3HidBusType',
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
SDL3HidBusType class >> bluetooth [
	"This method was automatically generated"
	^ SDL_HID_API_BUS_BLUETOOTH
]

{ #category : 'enum declaration' }
SDL3HidBusType class >> enumDecl [

	^ #(
	SDL_HID_API_BUS_UNKNOWN 0
	SDL_HID_API_BUS_USB 1
	SDL_HID_API_BUS_BLUETOOTH 2
	SDL_HID_API_BUS_I2C 3
	SDL_HID_API_BUS_SPI 4 )
]

{ #category : 'accessing enum' }
SDL3HidBusType class >> i2c [
	"This method was automatically generated"
	^ SDL_HID_API_BUS_I2C
]

{ #category : 'accessing enum' }
SDL3HidBusType class >> spi [
	"This method was automatically generated"
	^ SDL_HID_API_BUS_SPI
]

{ #category : 'accessing enum' }
SDL3HidBusType class >> unknown [
	"This method was automatically generated"
	^ SDL_HID_API_BUS_UNKNOWN
]

{ #category : 'accessing enum' }
SDL3HidBusType class >> usb [
	"This method was automatically generated"
	^ SDL_HID_API_BUS_USB
]
