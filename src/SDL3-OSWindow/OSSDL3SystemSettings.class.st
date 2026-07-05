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
		'eventLoopPeriodMS'
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
				range: (3 to: 50)
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
