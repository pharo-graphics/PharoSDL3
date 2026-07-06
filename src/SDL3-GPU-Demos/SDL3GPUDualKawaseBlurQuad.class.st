"
I represent a moving quad in the Dual Kawase Blur demo.
"
Class {
	#name : 'SDL3GPUDualKawaseBlurQuad',
	#superclass : 'Object',
	#instVars : [
		'position',
		'velocity',
		'rotation',
		'rotationSpeed',
		'scale'
	],
	#category : 'SDL3-GPU-Demos-KawaseBlur',
	#package : 'SDL3-GPU-Demos',
	#tag : 'KawaseBlur'
}

{ #category : 'accessing' }
SDL3GPUDualKawaseBlurQuad >> position [
	^ position
]

{ #category : 'accessing' }
SDL3GPUDualKawaseBlurQuad >> position: aPoint [
	position := aPoint
]

{ #category : 'accessing' }
SDL3GPUDualKawaseBlurQuad >> rotation [
	^ rotation
]

{ #category : 'accessing' }
SDL3GPUDualKawaseBlurQuad >> rotation: aFloat [
	rotation := aFloat
]

{ #category : 'accessing' }
SDL3GPUDualKawaseBlurQuad >> rotationSpeed [
	^ rotationSpeed
]

{ #category : 'accessing' }
SDL3GPUDualKawaseBlurQuad >> rotationSpeed: aFloat [
	rotationSpeed := aFloat
]

{ #category : 'accessing' }
SDL3GPUDualKawaseBlurQuad >> scale [
	^ scale
]

{ #category : 'accessing' }
SDL3GPUDualKawaseBlurQuad >> scale: aPoint [
	scale := aPoint
]

{ #category : 'stepping' }
SDL3GPUDualKawaseBlurQuad >> stepIn: anExtent [

	position := position + velocity.
	rotation := rotation + rotationSpeed.

	"Bounce"
	(position x < 0 or: [ position x > anExtent x ]) ifTrue: [
		velocity := (velocity x negated) @ velocity y.
		position := (position x min: anExtent x max: 0) @ position y ].

	(position y < 0 or: [ position y > anExtent y ]) ifTrue: [
		velocity := velocity x @ (velocity y negated).
		position := position x @ (position y min: anExtent y max: 0) ].
]

{ #category : 'accessing' }
SDL3GPUDualKawaseBlurQuad >> velocity [
	^ velocity
]

{ #category : 'accessing' }
SDL3GPUDualKawaseBlurQuad >> velocity: aPoint [
	velocity := aPoint
]
