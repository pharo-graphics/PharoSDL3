Class {
	#name : 'OSSDL3GPUDriverTest',
	#superclass : 'TestCase',
	#category : 'SDL3-OSWindow-Tests',
	#package : 'SDL3-OSWindow',
	#tag : 'Tests'
}

{ #category : 'tests' }
OSSDL3GPUDriverTest >> testCatchUpClampWhenLagging [
	"Verify that when the event loop is delayed far beyond its period, the deadline is clamped to prevent a spin loop."

	| driver periodUS |
	driver := OSSDL3GPUDriver basicNew initialize.
	periodUS := OSSDL3SystemSettings eventLoopPeriodMS * 1000.
	driver waitSpareTime.

	"Simulate a 1-second lag by artificially setting the deadline in the past"
	driver instVarNamed: #nextDeadlineUS put: Time microsecondClockValue - 1000000.
	driver waitSpareTime.
	self assert: driver nextDeadlineUS - Time microsecondClockValue <= (periodUS + 5000).
	self assert: driver nextDeadlineUS - Time microsecondClockValue >= (periodUS - 5000)
]

{ #category : 'tests' }
OSSDL3GPUDriverTest >> testWaitSpareTimeAdvancesDeadline [
	"Verify that each call to #waitSpareTime advances nextDeadlineUS by one eventLoopPeriodMS."

	| driver initialDeadline periodUS |
	driver := OSSDL3GPUDriver basicNew initialize.
	periodUS := OSSDL3SystemSettings eventLoopPeriodMS * 1000.
	driver waitSpareTime.
	initialDeadline := driver nextDeadlineUS.
	self assert: initialDeadline isNotNil.

	driver waitSpareTime.
	self assert: driver nextDeadlineUS equals: initialDeadline + periodUS
]
