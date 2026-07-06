"
I represent vertex uniforms for position offset.
"
Class {
	#name : 'SDL3TestGraphicsVertUniform',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_W',
		'OFFSET_X',
		'OFFSET_Y',
		'OFFSET_Z'
	],
	#category : 'SDL3-GPU-Tests-GraphicsPipeline',
	#package : 'SDL3-GPU-Tests',
	#tag : 'GraphicsPipeline'
}

{ #category : 'field definition' }
SDL3TestGraphicsVertUniform class >> fieldsDesc [

	^ #(
	float x;
	float y;
	float z;
	float w
	)
]

{ #category : 'accessing - structure variables' }
SDL3TestGraphicsVertUniform >> w [
	"This method was automatically generated"
	^handle floatAt: OFFSET_W
]

{ #category : 'accessing - structure variables' }
SDL3TestGraphicsVertUniform >> w: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_W put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TestGraphicsVertUniform >> x [
	"This method was automatically generated"
	^handle floatAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
SDL3TestGraphicsVertUniform >> x: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_X put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TestGraphicsVertUniform >> y [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Y
]

{ #category : 'accessing - structure variables' }
SDL3TestGraphicsVertUniform >> y: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_Y put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TestGraphicsVertUniform >> z [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Z
]

{ #category : 'accessing - structure variables' }
SDL3TestGraphicsVertUniform >> z: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_Z put: anObject
]
