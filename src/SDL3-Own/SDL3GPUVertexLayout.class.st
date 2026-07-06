"
I represent a high-level vertex layout, mapping a Smalltalk structure to GPU vertex attributes.
"
Class {
	#name : 'SDL3GPUVertexLayout',
	#superclass : 'Object',
	#instVars : [
		'vertexClass',
		'attributes',
		'bindings'
	],
	#category : 'SDL3-Own-Support',
	#package : 'SDL3-Own',
	#tag : 'Support'
}

{ #category : 'instance creation' }
SDL3GPUVertexLayout class >> for: aVertexClass [
	^ self new
		vertexClass: aVertexClass;
		yourself
]

{ #category : 'accessing' }
SDL3GPUVertexLayout >> attributes [
	^ attributes
]

{ #category : 'initialization' }
SDL3GPUVertexLayout >> initialize [
	super initialize.
	attributes := OrderedCollection new.
	bindings := OrderedCollection new.
]

{ #category : 'validation' }
SDL3GPUVertexLayout >> validateAgainst: aVertexMetadata [
	"Verify that the layout provides what the shader expects"
	
	"For now, just a placeholder for future validation logic"
	aVertexMetadata ifNil: [ ^ self ].
	
	"TODO: Implement actual attribute matching"
]

{ #category : 'accessing' }
SDL3GPUVertexLayout >> vertexClass [
	^ vertexClass
]

{ #category : 'accessing' }
SDL3GPUVertexLayout >> vertexClass: anObject [
	vertexClass := anObject
]
