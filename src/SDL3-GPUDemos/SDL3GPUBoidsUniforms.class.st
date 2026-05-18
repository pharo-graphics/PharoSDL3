"
I hold the parameters for the boids compute pass.
"
Class {
	#name : 'SDL3GPUBoidsUniforms',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_ALIGNMENTWEIGHT',
		'OFFSET_BOUNDX',
		'OFFSET_BOUNDY',
		'OFFSET_COHESIONWEIGHT',
		'OFFSET_DAMPING',
		'OFFSET_DELTATIME',
		'OFFSET_MAXVELOCITY',
		'OFFSET_MINVELOCITY',
		'OFFSET_NEIGHBORRADIUS',
		'OFFSET_NUMBOIDS',
		'OFFSET_SEPARATIONRADIUS',
		'OFFSET_SEPARATIONWEIGHT',
		'OFFSET_TIME'
	],
	#category : 'SDL3-GPUDemos-Boids',
	#package : 'SDL3-GPUDemos',
	#tag : 'Boids'
}

{ #category : 'field definition' }
SDL3GPUBoidsUniforms class >> fieldsDesc [
	<script: 'self rebuildFieldAccessors'>

	^ #(
	uint numBoids;
	float separationRadius;
	float neighborRadius;
	float separationWeight;
	float alignmentWeight;
	float cohesionWeight;
	float time;
	float deltaTime;
	float damping;
	float maxVelocity;
	float minVelocity;
	float boundX;
	float boundY;
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsUniforms >> alignmentWeight [
	"This method was automatically generated"
	^handle floatAt: OFFSET_ALIGNMENTWEIGHT
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsUniforms >> alignmentWeight: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_ALIGNMENTWEIGHT put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsUniforms >> boundX [
	"This method was automatically generated"
	^handle floatAt: OFFSET_BOUNDX
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsUniforms >> boundX: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_BOUNDX put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsUniforms >> boundY [
	"This method was automatically generated"
	^handle floatAt: OFFSET_BOUNDY
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsUniforms >> boundY: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_BOUNDY put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsUniforms >> cohesionWeight [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COHESIONWEIGHT
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsUniforms >> cohesionWeight: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COHESIONWEIGHT put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsUniforms >> damping [
	"This method was automatically generated"
	^handle floatAt: OFFSET_DAMPING
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsUniforms >> damping: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_DAMPING put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsUniforms >> deltaTime [
	"This method was automatically generated"
	^handle floatAt: OFFSET_DELTATIME
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsUniforms >> deltaTime: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_DELTATIME put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsUniforms >> maxVelocity [
	"This method was automatically generated"
	^handle floatAt: OFFSET_MAXVELOCITY
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsUniforms >> maxVelocity: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_MAXVELOCITY put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsUniforms >> minVelocity [
	"This method was automatically generated"
	^handle floatAt: OFFSET_MINVELOCITY
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsUniforms >> minVelocity: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_MINVELOCITY put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsUniforms >> neighborRadius [
	"This method was automatically generated"
	^handle floatAt: OFFSET_NEIGHBORRADIUS
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsUniforms >> neighborRadius: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_NEIGHBORRADIUS put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsUniforms >> numBoids [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_NUMBOIDS
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsUniforms >> numBoids: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_NUMBOIDS put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsUniforms >> separationRadius [
	"This method was automatically generated"
	^handle floatAt: OFFSET_SEPARATIONRADIUS
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsUniforms >> separationRadius: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_SEPARATIONRADIUS put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsUniforms >> separationWeight [
	"This method was automatically generated"
	^handle floatAt: OFFSET_SEPARATIONWEIGHT
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsUniforms >> separationWeight: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_SEPARATIONWEIGHT put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsUniforms >> time [
	"This method was automatically generated"
	^handle floatAt: OFFSET_TIME
]

{ #category : 'accessing - structure variables' }
SDL3GPUBoidsUniforms >> time: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_TIME put: anObject
]
