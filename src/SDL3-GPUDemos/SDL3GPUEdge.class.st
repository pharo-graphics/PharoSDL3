Class {
	#name : 'SDL3GPUEdge',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_NODEA',
		'OFFSET_NODEB',
		'OFFSET_PADDING',
		'OFFSET_WEIGHT'
	],
	#category : 'SDL3-GPUDemos-NodeGraph',
	#package : 'SDL3-GPUDemos',
	#tag : 'NodeGraph'
}

{ #category : 'field definition' }
SDL3GPUEdge class >> fieldsDesc [
	<script: 'self rebuildFieldAccessors'>

	^ #(
	uint nodeA;
	uint nodeB;
	float weight;
	uint padding;
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUEdge >> nodeA [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_NODEA
]

{ #category : 'accessing - structure variables' }
SDL3GPUEdge >> nodeA: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_NODEA put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUEdge >> nodeB [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_NODEB
]

{ #category : 'accessing - structure variables' }
SDL3GPUEdge >> nodeB: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_NODEB put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUEdge >> padding [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_PADDING
]

{ #category : 'accessing - structure variables' }
SDL3GPUEdge >> padding: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_PADDING put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUEdge >> weight [
	"This method was automatically generated"
	^handle floatAt: OFFSET_WEIGHT
]

{ #category : 'accessing - structure variables' }
SDL3GPUEdge >> weight: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_WEIGHT put: anObject
]
