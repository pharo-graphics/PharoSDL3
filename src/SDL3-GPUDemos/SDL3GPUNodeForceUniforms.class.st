Class {
	#name : 'SDL3GPUNodeForceUniforms',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_ASPECTRATIO',
		'OFFSET_CENTERGRAVITYWEIGHT',
		'OFFSET_DAMPING',
		'OFFSET_DELTATIME',
		'OFFSET_HOVERX',
		'OFFSET_HOVERY',
		'OFFSET_ISDRAGGING',
		'OFFSET_MAXVELOCITY',
		'OFFSET_NUMEDGES',
		'OFFSET_NUMNODES',
		'OFFSET_PADDING4',
		'OFFSET_REPULSIONRADIUS',
		'OFFSET_REPULSIONWEIGHT',
		'OFFSET_SELECTEDNODEINDEX',
		'OFFSET_SPRINGSTIFFNESS',
		'OFFSET_TIME'
	],
	#category : 'SDL3-GPUDemos-NodeGraph',
	#package : 'SDL3-GPUDemos',
	#tag : 'NodeGraph'
}

{ #category : 'field definition' }
SDL3GPUNodeForceUniforms class >> fieldsDesc [
	<script: 'self rebuildFieldAccessors'>

	^ #(
	uint numNodes;
	uint numEdges;
	float deltaTime;
	float time;
	float springStiffness;
	float repulsionWeight;
	float repulsionRadius;
	float centerGravityWeight;
	float damping;
	float maxVelocity;
	int selectedNodeIndex;
	float aspectRatio;
	float hoverX;
	float hoverY;
	uint isDragging;
	float padding4;
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUNodeForceUniforms >> aspectRatio [
	"This method was automatically generated"
	^handle floatAt: OFFSET_ASPECTRATIO
]

{ #category : 'accessing - structure variables' }
SDL3GPUNodeForceUniforms >> aspectRatio: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_ASPECTRATIO put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUNodeForceUniforms >> centerGravityWeight [
	"This method was automatically generated"
	^handle floatAt: OFFSET_CENTERGRAVITYWEIGHT
]

{ #category : 'accessing - structure variables' }
SDL3GPUNodeForceUniforms >> centerGravityWeight: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_CENTERGRAVITYWEIGHT put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUNodeForceUniforms >> damping [
	"This method was automatically generated"
	^handle floatAt: OFFSET_DAMPING
]

{ #category : 'accessing - structure variables' }
SDL3GPUNodeForceUniforms >> damping: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_DAMPING put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUNodeForceUniforms >> deltaTime [
	"This method was automatically generated"
	^handle floatAt: OFFSET_DELTATIME
]

{ #category : 'accessing - structure variables' }
SDL3GPUNodeForceUniforms >> deltaTime: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_DELTATIME put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUNodeForceUniforms >> hoverX [
	"This method was automatically generated"
	^handle floatAt: OFFSET_HOVERX
]

{ #category : 'accessing - structure variables' }
SDL3GPUNodeForceUniforms >> hoverX: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_HOVERX put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUNodeForceUniforms >> hoverY [
	"This method was automatically generated"
	^handle floatAt: OFFSET_HOVERY
]

{ #category : 'accessing - structure variables' }
SDL3GPUNodeForceUniforms >> hoverY: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_HOVERY put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUNodeForceUniforms >> isDragging [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_ISDRAGGING
]

{ #category : 'accessing - structure variables' }
SDL3GPUNodeForceUniforms >> isDragging: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_ISDRAGGING put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUNodeForceUniforms >> maxVelocity [
	"This method was automatically generated"
	^handle floatAt: OFFSET_MAXVELOCITY
]

{ #category : 'accessing - structure variables' }
SDL3GPUNodeForceUniforms >> maxVelocity: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_MAXVELOCITY put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUNodeForceUniforms >> numEdges [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_NUMEDGES
]

{ #category : 'accessing - structure variables' }
SDL3GPUNodeForceUniforms >> numEdges: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_NUMEDGES put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUNodeForceUniforms >> numNodes [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_NUMNODES
]

{ #category : 'accessing - structure variables' }
SDL3GPUNodeForceUniforms >> numNodes: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_NUMNODES put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUNodeForceUniforms >> padding4 [
	"This method was automatically generated"
	^handle floatAt: OFFSET_PADDING4
]

{ #category : 'accessing - structure variables' }
SDL3GPUNodeForceUniforms >> padding4: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_PADDING4 put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUNodeForceUniforms >> repulsionRadius [
	"This method was automatically generated"
	^handle floatAt: OFFSET_REPULSIONRADIUS
]

{ #category : 'accessing - structure variables' }
SDL3GPUNodeForceUniforms >> repulsionRadius: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_REPULSIONRADIUS put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUNodeForceUniforms >> repulsionWeight [
	"This method was automatically generated"
	^handle floatAt: OFFSET_REPULSIONWEIGHT
]

{ #category : 'accessing - structure variables' }
SDL3GPUNodeForceUniforms >> repulsionWeight: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_REPULSIONWEIGHT put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUNodeForceUniforms >> selectedNodeIndex [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_SELECTEDNODEINDEX
]

{ #category : 'accessing - structure variables' }
SDL3GPUNodeForceUniforms >> selectedNodeIndex: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_SELECTEDNODEINDEX put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUNodeForceUniforms >> springStiffness [
	"This method was automatically generated"
	^handle floatAt: OFFSET_SPRINGSTIFFNESS
]

{ #category : 'accessing - structure variables' }
SDL3GPUNodeForceUniforms >> springStiffness: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_SPRINGSTIFFNESS put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUNodeForceUniforms >> time [
	"This method was automatically generated"
	^handle floatAt: OFFSET_TIME
]

{ #category : 'accessing - structure variables' }
SDL3GPUNodeForceUniforms >> time: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_TIME put: anObject
]
