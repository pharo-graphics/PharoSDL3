"
I represent system settings for OSWindow-SDL3 package.

Environment variables overrides my settings, if defined:
- `OSSDL3_DEBUG` overrides my `debugEnabled` setting
"
Class {
	#name : 'OSSDL3SystemSettings',
	#superclass : 'Object',
	#classInstVars : [
		'debugEnabled',
		'eventLoopPeriodMS',
		'rendererVsync',
		'gpuPresentMode'
	],
	#category : 'SDL3-OSWindow-Core',
	#package : 'SDL3-OSWindow',
	#tag : 'Core'
}

{ #category : 'accessing' }
OSSDL3SystemSettings class >> debugEnabled [

	"If defined, the environment variable overrides the class variable."
	"Any value other than 'false' means enabling debug"
	OSEnvironment current
		at: 'OSSDL3_DEBUG'
		ifPresent: [ :aString | ^ aString ~= 'false' ].

	^ debugEnabled ifNil: [ false ]
]

{ #category : 'accessing' }
OSSDL3SystemSettings class >> debugEnabled: aBoolean [

	debugEnabled := aBoolean
]

{ #category : 'system settings' }
OSSDL3SystemSettings class >> declareOn: aSettingTreeBuilder [
	<systemsettings>

	(aSettingTreeBuilder group: #osSDL3)
		parent: #oswindow;
		label: 'OSWindow-SDL3';
		description: 'Settings for the OSWindow driver for SDL3.';
		with: [
			(aSettingTreeBuilder setting: #debugEnabled)
				target: self;
				label: 'Debug';
				description: 'Enable debug capabilities for OSWindow SDL3 driver. Warning: It can reduce performance. OSSDL3_DEBUG overrides environment variable overrides this setting at startup.'.

			(aSettingTreeBuilder range: #eventLoopPeriodMS)
				target: self;
				label: 'Event poll period (ms)';
				description: 'Period in milliseconds between poll event loop iterations.';
				range: (3 to: 50).

			(aSettingTreeBuilder pickOne: #rendererVsync)
				target: self;
				label: 'Renderer VSync Mode';
				description: 'Configure vertical synchronization for standard SDL3 renderer. Requires window re-creation / image reload to take effect.';
				domainValues: { 
					'Disabled' -> 0.
					'Enabled' -> 1.
					'Adaptive' -> -1 }.

			(aSettingTreeBuilder pickOne: #gpuPresentMode)
				target: self;
				label: 'GPU Swapchain Present Mode';
				description: 'Configure swapchain present mode for SDL3 GPU driver. Requires window re-creation / image reload to take effect.';
				domainValues: { 
					'VSync' -> 0.
					'Immediate' -> 1.
					'Mailbox' -> 2 }
			]
]

{ #category : 'accessing' }
OSSDL3SystemSettings class >> eventLoopPeriodMS [

	^ eventLoopPeriodMS ifNil: [ 5 ]
]

{ #category : 'accessing' }
OSSDL3SystemSettings class >> eventLoopPeriodMS: anInteger [

	eventLoopPeriodMS := anInteger
]

{ #category : 'accessing' }
OSSDL3SystemSettings class >> gpuPresentMode [

	^ gpuPresentMode ifNil: [ 0 ]
]

{ #category : 'accessing' }
OSSDL3SystemSettings class >> gpuPresentMode: anInteger [

	gpuPresentMode := anInteger
]

{ #category : 'accessing' }
OSSDL3SystemSettings class >> rendererVsync [

	^ rendererVsync ifNil: [ 1 ]
]

{ #category : 'accessing' }
OSSDL3SystemSettings class >> rendererVsync: anInteger [

	rendererVsync := anInteger
]
