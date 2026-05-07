"
I represent a property group. SDL3 doesn't provide an equivalent to me, just my id (a `SDL_PropertiesID`).
"
Class {
	#name : 'SDL3PropertyGroup',
	#superclass : 'SDL3BaseIDObject',
	#category : 'SDL3-Own-IDObjects',
	#package : 'SDL3-Own',
	#tag : 'IDObjects'
}

{ #category : 'converting' }
SDL3PropertyGroup >> asInteger [

	^ id
]

{ #category : 'accessing' }
SDL3PropertyGroup >> booleanAt: name ifAbsent: default_value [

	^ self ffiLibrary getBooleanPropertyProps: id name: name defaultValue: default_value
]

{ #category : 'accessing' }
SDL3PropertyGroup >> booleanAt: name put: value [

	^ self ffiLibrary setBooleanPropertyProps: id name: name value: value
]

{ #category : 'accessing' }
SDL3PropertyGroup >> copyTo: dst [

	^ self ffiLibrary copyPropertiesSrc: id dst: dst
]

{ #category : 'accessing' }
SDL3PropertyGroup >> destroy [

	^ self ffiLibrary destroyProperties: id
]

{ #category : 'accessing' }
SDL3PropertyGroup >> doesGPUSupportProperties [

	^ self ffiLibrary gpuSupportsProperties: id
]

{ #category : 'accessing' }
SDL3PropertyGroup >> enumerateCallback: callback userdata: userdata [

	^ self ffiLibrary enumeratePropertiesProps: id callback: callback userdata: userdata
]

{ #category : 'accessing' }
SDL3PropertyGroup >> floatAt: name ifAbsent: default_value [

	^ self ffiLibrary getFloatPropertyProps: id name: name defaultValue: default_value
]

{ #category : 'accessing' }
SDL3PropertyGroup >> floatAt: name put: value [

	^ self ffiLibrary setFloatPropertyProps: id name: name value: value
]

{ #category : 'accessing' }
SDL3PropertyGroup >> includesKey: name [

	^ self ffiLibrary hasPropertyProps: id name: name
]

{ #category : 'accessing' }
SDL3PropertyGroup >> lock [

	^ self ffiLibrary lockProperties: id
]

{ #category : 'accessing' }
SDL3PropertyGroup >> newGPUDevice [

	^ self ffiLibrary newGPUDeviceWithProperties: id
]

{ #category : 'accessing' }
SDL3PropertyGroup >> newProcess [

	^ self ffiLibrary newProcessWithProperties: id
]

{ #category : 'accessing' }
SDL3PropertyGroup >> newRenderer [

	^ self ffiLibrary newRendererWithProperties: id
]

{ #category : 'accessing' }
SDL3PropertyGroup >> newThread [

	^ self ffiLibrary newThreadWithProperties: id
]

{ #category : 'accessing' }
SDL3PropertyGroup >> newWindow [

	^ self ffiLibrary newWindowWithProperties: id
]

{ #category : 'accessing' }
SDL3PropertyGroup >> numberAt: name ifAbsent: default_value [

	^ self ffiLibrary getNumberPropertyProps: id name: name defaultValue: default_value
]

{ #category : 'accessing' }
SDL3PropertyGroup >> numberAt: name put: value [

	^ self ffiLibrary setNumberPropertyProps: id name: name value: value
]

{ #category : 'accessing' }
SDL3PropertyGroup >> pointerAt: name ifAbsent: default_value [

	^ self ffiLibrary getPointerPropertyProps: id name: name defaultValue: default_value
]

{ #category : 'accessing' }
SDL3PropertyGroup >> pointerAt: name put: value [

	^ self ffiLibrary setPointerPropertyProps: id name: name value: value
]

{ #category : 'accessing' }
SDL3PropertyGroup >> pointerWithCleanupAt: name put: value cleanup: cleanup userdata: userdata [

	^ self ffiLibrary
		  setPointerPropertyWithCleanupProps: id
		  name: name
		  value: value
		  cleanup: cleanup
		  userdata: userdata
]

{ #category : 'accessing' }
SDL3PropertyGroup >> removeKey: name [

	^ self ffiLibrary clearPropertyProps: id name: name
]

{ #category : 'accessing' }
SDL3PropertyGroup >> stringAt: name ifAbsent: default_value [

	^ self ffiLibrary getStringPropertyProps: id name: name defaultValue: default_value
]

{ #category : 'accessing' }
SDL3PropertyGroup >> stringAt: name put: value [

	^ self ffiLibrary setStringPropertyProps: id name: name value: value
]

{ #category : 'accessing' }
SDL3PropertyGroup >> typeAt: name [

	^ self ffiLibrary getPropertyTypeProps: id name: name
]

{ #category : 'accessing' }
SDL3PropertyGroup >> unlock [

	^ self ffiLibrary unlockProperties: id
]
