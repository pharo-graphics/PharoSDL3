"
I represent system settings for OSWindow-SDL3 package.

Environment variables overrides my settings, if defined:
- `OSSDL3_FORM_RENDERER` overrides my `formRendererClass` setting
- `OSSDL3_DEBUG` overrides my `debugEnabled` setting
"
Class {
	#name : 'OSSDL3SystemSettings',
	#superclass : 'Object',
	#classInstVars : [
		'formRendererClass',
		'debugEnabled'
	],
	#category : 'SDL3-OSWindow-Core',
	#package : 'SDL3-OSWindow',
	#tag : 'Core'
}

{ #category : 'accessing' }
OSSDL3SystemSettings class >> availableFormRendererClasses [

	^ { OSSDL3FormRenderer. OSSDL3GPUFormRenderer }
]

{ #category : 'accessing' }
OSSDL3SystemSettings class >> debugEnabled [

	"If defined, the environment variable overrides the class variable."
	OSEnvironment current
		at: 'OSSDL3_DEBUG'
		ifPresent: [ :aString | ^ true ].

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
			(aSettingTreeBuilder pickOne: #formRendererClass)
				target: self;
				label: 'Form renderer';
				domainValues: self availableFormRendererClasses;
				description: 'Preferred OSWindowFormRenderer subclass to be used to create instances when the SDL3 driver is activated. This is the renderer used for the Morphic World. OSSDL3_FORM_RENDERER overrides environment variable overrides this setting at startup.'.

			(aSettingTreeBuilder setting: #debugEnabled)
				target: self;
				label: 'Debug';
				description: 'Enable debug capabilities for OSWindow SDL3 driver. Warning: It can reduce performance. OSSDL3_DEBUG overrides environment variable overrides this setting at startup.'
			]
]

{ #category : 'accessing' }
OSSDL3SystemSettings class >> formRendererClass [

	"If defined, the environment variable overrides the class variable."
	OSEnvironment current
		at: 'OSSDL3_FORM_RENDERER'
		ifPresent: [ :aString | ^ self environment at: aString ].

	^ formRendererClass ifNil: [ OSSDL3FormRenderer ]
]

{ #category : 'accessing' }
OSSDL3SystemSettings class >> formRendererClass: aClass [

	formRendererClass := aClass
]
