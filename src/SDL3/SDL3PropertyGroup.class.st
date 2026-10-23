"
I represent a property group. SDL3 doesn't provide an equivalent to me, just my id (a `SDL_PropertiesID`).
"
Class {
	#name : 'SDL3PropertyGroup',
	#superclass : 'SDL3BaseIDObject',
	#category : 'SDL3-IDObjects',
	#package : 'SDL3',
	#tag : 'IDObjects'
}

{ #category : 'instance creation' }
SDL3PropertyGroup class >> unownedNew [

	^ self ffiLibrary createPropertyGroup
]

{ #category : 'converting' }
SDL3PropertyGroup >> asDictionary [
	"Answer a Dictionary mapping all defined property names to their typed values."

	| dictionary |
	dictionary := Dictionary new.
	self keys do: [ :key |
		dictionary at: key put: (self at: key) ].
	^ dictionary
]

{ #category : 'accessing' }
SDL3PropertyGroup >> at: name [
	"Answer the typed value of the property named name, or signal KeyNotFound if absent."

	^ self at: name ifAbsent: [ KeyNotFound signalFor: name ]
]

{ #category : 'accessing' }
SDL3PropertyGroup >> at: name ifAbsent: aBlock [
	"Answer the typed value of the property named name, or evaluate aBlock if absent."

	| type |
	(self includesKey: name) ifFalse: [ ^ aBlock value ].

	type := self typeAt: name.
	type = SDL3PropertyType number ifTrue: [ ^ self numberAt: name ifAbsent: 0 ].
	type = SDL3PropertyType string ifTrue: [ ^ self stringAt: name ifAbsent: '' ].
	type = SDL3PropertyType boolean ifTrue: [ ^ self booleanAt: name ifAbsent: false ].
	type = SDL3PropertyType float ifTrue: [ ^ self floatAt: name ifAbsent: 0.0 ].
	type = SDL3PropertyType pointer ifTrue: [ ^ self pointerAt: name ifAbsent: ExternalAddress null ].
	^ aBlock value
]

{ #category : 'accessing' }
SDL3PropertyGroup >> booleanAt: name ifAbsent: defaultValue [

	^ self ffiLibrary getBooleanPropertyProps: id name: name defaultValue: defaultValue
]

{ #category : 'accessing' }
SDL3PropertyGroup >> booleanAt: name put: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setBooleanPropertyProps: id
			name: name
			value: value)
]

{ #category : 'operations' }
SDL3PropertyGroup >> copyTo: dst [

	self ffiLibrary assertSuccess:
		(self ffiLibrary copyPropertiesSrc: id dst: dst)
]

{ #category : 'finalization' }
SDL3PropertyGroup >> destroy [

	^ self ffiLibrary destroyProperties: id
]

{ #category : 'finalization' }
SDL3PropertyGroup >> dispose [

	id ifNil: [ ^ self ].
	self destroy.
	id := nil
]

{ #category : 'testing' }
SDL3PropertyGroup >> doesGPUSupportProperties [

	^ self ffiLibrary gpuSupportsProperties: id
]

{ #category : 'enumerating' }
SDL3PropertyGroup >> enumerateCallback: callback userdata: userdata [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			enumeratePropertiesProps: id
			callback: callback
			userdata: userdata)
]

{ #category : 'accessing' }
SDL3PropertyGroup >> floatAt: name ifAbsent: defaultValue [

	^ self ffiLibrary getFloatPropertyProps: id name: name defaultValue: defaultValue
]

{ #category : 'accessing' }
SDL3PropertyGroup >> floatAt: name put: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setFloatPropertyProps: id
			name: name
			value: value)
]

{ #category : 'testing' }
SDL3PropertyGroup >> includesKey: name [

	^ self ffiLibrary hasPropertyProps: id name: name
]

{ #category : 'inspecting' }
SDL3PropertyGroup >> inspectionProperties: aBuilder [
	<inspectorPresentationOrder: 0 title: 'Properties'>

	^ aBuilder newTable
		addStyle: 'stList';
		addColumn: (SpStringTableColumn new
			title: 'Key';
			evaluated: [ :each | each key ];
			formatted: [ :key | StObjectPrinter asTruncatedTextFrom: key ];
			beSortable);
		addColumn: (SpStringTableColumn new
			title: 'Value';
			evaluated: [ :each | each value ];
			formatted: [ :value | StObjectPrinter asTruncatedTextFrom: value ];
			beSortable);
		items: (self asDictionary associations collect: [ :each |
			StInspectorAssociationNode hostObject: each ]);
		yourself
]

{ #category : 'testing' }
SDL3PropertyGroup >> isEmpty [
	"Answer true if this property group contains no defined properties."

	^ self keys isEmpty
]

{ #category : 'accessing' }
SDL3PropertyGroup >> keys [
	"Answer an Array of all defined property names in this group."

	| propertyNames callback |
	propertyNames := OrderedCollection new.
	callback :=
		FFICallback
			signature: #(void (void *userdata, uint32 props, String name))
			block: [ :userdata :props :name |
				propertyNames add: name ].
	self enumerateCallback: callback userdata: ExternalAddress null.
	^ propertyNames asArray
]

{ #category : 'enumerating' }
SDL3PropertyGroup >> keysAndValuesDo: aBlock [
	"Evaluate aBlock with each property key and its corresponding typed value."

	self keys do: [ :key |
		aBlock value: key value: (self at: key) ]
]

{ #category : 'enumerating' }
SDL3PropertyGroup >> keysDo: aBlock [
	"Evaluate aBlock with each defined property name."

	self keys do: aBlock
]

{ #category : 'operations' }
SDL3PropertyGroup >> lock [

	self ffiLibrary assertSuccess: (self ffiLibrary lockProperties: id)
]

{ #category : 'accessing' }
SDL3PropertyGroup >> numberAt: name ifAbsent: defaultValue [

	^ self ffiLibrary getNumberPropertyProps: id name: name defaultValue: defaultValue
]

{ #category : 'accessing' }
SDL3PropertyGroup >> numberAt: name put: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setNumberPropertyProps: id
			name: name
			value: value)
]

{ #category : 'accessing' }
SDL3PropertyGroup >> pointerAt: name ifAbsent: defaultValue [

	^ self ffiLibrary getPointerPropertyProps: id name: name defaultValue: defaultValue
]

{ #category : 'accessing' }
SDL3PropertyGroup >> pointerAt: name put: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setPointerPropertyProps: id
			name: name
			value: value)
]

{ #category : 'accessing' }
SDL3PropertyGroup >> pointerWithCleanupAt: name put: value cleanup: cleanup userdata: userdata [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setPointerPropertyWithCleanupProps: id
			name: name
			value: value
			cleanup: cleanup
			userdata: userdata)
]

{ #category : 'removing' }
SDL3PropertyGroup >> removeKey: name [

	self ffiLibrary assertSuccess:
		(self ffiLibrary clearPropertyProps: id name: name)
]

{ #category : 'accessing' }
SDL3PropertyGroup >> size [
	"Answer the number of defined properties in this group."

	^ self keys size
]

{ #category : 'accessing' }
SDL3PropertyGroup >> stringAt: name ifAbsent: defaultValue [

	^ self ffiLibrary getStringPropertyProps: id name: name defaultValue: defaultValue
]

{ #category : 'accessing' }
SDL3PropertyGroup >> stringAt: name put: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setStringPropertyProps: id
			name: name
			value: value)
]

{ #category : 'accessing' }
SDL3PropertyGroup >> typeAt: name [

	^ self ffiLibrary getPropertyTypeProps: id name: name
]

{ #category : 'operations' }
SDL3PropertyGroup >> unlock [

	^ self ffiLibrary unlockProperties: id
]

{ #category : 'instance creation' }
SDL3PropertyGroup >> unownedNewGPUDevice [

	^ (self ffiLibrary createGPUDeviceWithProperties: id)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'instance creation' }
SDL3PropertyGroup >> unownedNewProcess [

	^ (self ffiLibrary createProcessWithProperties: id)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'instance creation' }
SDL3PropertyGroup >> unownedNewRenderer [

	^ (self ffiLibrary createRendererWithProperties: id)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'instance creation' }
SDL3PropertyGroup >> unownedNewThread [

	^ (self ffiLibrary createThreadWithProperties: id)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'instance creation' }
SDL3PropertyGroup >> unownedNewWindow [

	^ (self ffiLibrary createWindowWithProperties: id)
		  assertNotNullReturn;
		  yourself
]
