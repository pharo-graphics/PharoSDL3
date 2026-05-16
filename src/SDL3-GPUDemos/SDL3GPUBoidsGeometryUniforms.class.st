"
I hold parameters for the boid geometry baking compute pass.
"
Class {
	#name : 'SDL3GPUBoidsGeometryUniforms',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_BOIDRADIUS',
		'OFFSET_BOUNDX',
		'OFFSET_BOUNDY',
		'OFFSET_NUMBOIDS'
	],
	#category : 'SDL3-GPUDemos-Boids',
	#package : 'SDL3-GPUDemos',
	#tag : 'Boids'
}

{ #category : 'field definition' }
SDL3GPUBoidsGeometryUniforms class >> fieldsDesc [
	<script: 'self rebuildFieldAccessors'>

	^ #(
	uint numBoids;
	float boidRadius;
	float boundX;
	float boundY;
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsGeometryUniforms >> boidRadius [
	"This method was automatically generated"
	^handle floatAt: OFFSET_BOIDRADIUS
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsGeometryUniforms >> boidRadius: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_BOIDRADIUS put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsGeometryUniforms >> boundX [
	"This method was automatically generated"
	^handle floatAt: OFFSET_BOUNDX
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsGeometryUniforms >> boundX: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_BOUNDX put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsGeometryUniforms >> boundY [
	"This method was automatically generated"
	^handle floatAt: OFFSET_BOUNDY
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsGeometryUniforms >> boundY: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_BOUNDY put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsGeometryUniforms >> numBoids [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_NUMBOIDS
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsGeometryUniforms >> numBoids: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_NUMBOIDS put: anObject
]
