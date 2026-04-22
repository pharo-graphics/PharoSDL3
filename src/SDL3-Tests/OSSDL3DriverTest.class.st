"
I test the OSSDL3Driver.
"
Class {
	#name : 'OSSDL3DriverTest',
	#superclass : 'TestCase',
	#instVars : [
		'driver'
	],
	#category : 'SDL3-Tests-OSWindow',
	#package : 'SDL3-Tests',
	#tag : 'OSWindow'
}

{ #category : 'running' }
OSSDL3DriverTest >> setUp [
	super setUp.
	driver := OSSDL3Driver new.
]

{ #category : 'tests' }
OSSDL3DriverTest >> testGpuDeviceIsLazilyInitialized [
	| device |
	"Should be nil initially"
	self assert: driver gpuDevice isNil.
	
	device := driver ensureGpuDevice.
	self assert: device isNotNil.
	self assert: device isNull not.
	
	"Subsequent calls return the same device"
	self assert: driver ensureGpuDevice equals: device.
	self assert: driver gpuDevice equals: device.
]
