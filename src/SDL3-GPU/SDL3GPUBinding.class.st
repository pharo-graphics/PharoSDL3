"
I represent a resource binding in HLSL (register type, index, and space).
I am an abstract class for specialized binding types.
"
Class {
	#name : 'SDL3GPUBinding',
	#superclass : 'Object',
	#instVars : [
		'index',
		'space',
		'linkedClass'
	],
	#category : 'SDL3-GPU-ShaderScanner',
	#package : 'SDL3-GPU',
	#tag : 'ShaderScanner'
}

{ #category : 'instance creation' }
SDL3GPUBinding class >> index: anIndex space: aSpace [

	^ self new
		  index: anIndex;
		  space: aSpace;
		  yourself
]

{ #category : 'instance creation' }
SDL3GPUBinding class >> index: anIndex space: aSpace linkedClass: aFFIStructureClass [

	^ (self index: anIndex space: aSpace)
		  linkedClass: aFFIStructureClass;
		  yourself
]

{ #category : 'accessing' }
SDL3GPUBinding >> index [
	^ index
]

{ #category : 'accessing' }
SDL3GPUBinding >> index: anInteger [
	index := anInteger
]

{ #category : 'testing' }
SDL3GPUBinding >> isReadOnly [
	^ self isReadWrite not
]

{ #category : 'testing' }
SDL3GPUBinding >> isReadWrite [
	^ false
]

{ #category : 'accessing' }
SDL3GPUBinding >> linkedClass [

	^ linkedClass
]

{ #category : 'accessing' }
SDL3GPUBinding >> linkedClass: aFFIStructureClass [

	linkedClass := aFFIStructureClass
]

{ #category : 'accessing' }
SDL3GPUBinding >> registerType [
	^ self subclassResponsibility
]

{ #category : 'accessing' }
SDL3GPUBinding >> space [
	^ space
]

{ #category : 'accessing' }
SDL3GPUBinding >> space: anInteger [
	space := anInteger
]

{ #category : 'validation' }
SDL3GPUBinding >> validateGroundTruth [
	self subclassResponsibility
]
