Class {
	#name : 'SDL3GamepadBindingUnion1Struct1',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_AXIS',
		'OFFSET_AXIS_MAX',
		'OFFSET_AXIS_MIN'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3GamepadBindingUnion1Struct1 class >> fieldsDesc [

	^ #(
	int axis;
	int axis_min;
	int axis_max
	)
]

{ #category : 'accessing - structure variables' }
SDL3GamepadBindingUnion1Struct1 >> axis [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_AXIS
]

{ #category : 'accessing - structure variables' }
SDL3GamepadBindingUnion1Struct1 >> axis: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_AXIS put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GamepadBindingUnion1Struct1 >> axisMax [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_AXIS_MAX
]

{ #category : 'accessing - structure variables' }
SDL3GamepadBindingUnion1Struct1 >> axisMax: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_AXIS_MAX put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GamepadBindingUnion1Struct1 >> axisMin [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_AXIS_MIN
]

{ #category : 'accessing - structure variables' }
SDL3GamepadBindingUnion1Struct1 >> axisMin: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_AXIS_MIN put: anObject
]
