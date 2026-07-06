Class {
	#name : 'SDL3TextScrollInstance',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_COLORINDICES',
		'OFFSET_EXTENTX',
		'OFFSET_EXTENTY',
		'OFFSET_POSX',
		'OFFSET_POSY',
		'OFFSET_UVHEIGHT',
		'OFFSET_UVWIDTH',
		'OFFSET_UVX',
		'OFFSET_UVY'
	],
	#category : 'SDL3-GPU-Demos-TextScroll',
	#package : 'SDL3-GPU-Demos',
	#tag : 'TextScroll'
}

{ #category : 'field definition' }
SDL3TextScrollInstance class >> fieldsDesc [
	<script: 'self rebuildFieldAccessors'>

	^ #(
	float posX;
	float posY;
	float extentX;
	float extentY;
	float uvX;
	float uvY;
	float uvWidth;
	float uvHeight;
	uint32 colorIndices; "Packed: low 16 bits = FG index, high 16 bits = BG index"
	)
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollInstance >> colorIndices [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_COLORINDICES
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollInstance >> colorIndices: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_COLORINDICES put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollInstance >> extentX [
	"This method was automatically generated"
	^handle floatAt: OFFSET_EXTENTX
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollInstance >> extentX: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_EXTENTX put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollInstance >> extentY [
	"This method was automatically generated"
	^handle floatAt: OFFSET_EXTENTY
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollInstance >> extentY: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_EXTENTY put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollInstance >> posX [
	"This method was automatically generated"
	^handle floatAt: OFFSET_POSX
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollInstance >> posX: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_POSX put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollInstance >> posY [
	"This method was automatically generated"
	^handle floatAt: OFFSET_POSY
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollInstance >> posY: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_POSY put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollInstance >> uvHeight [
	"This method was automatically generated"
	^handle floatAt: OFFSET_UVHEIGHT
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollInstance >> uvHeight: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_UVHEIGHT put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollInstance >> uvWidth [
	"This method was automatically generated"
	^handle floatAt: OFFSET_UVWIDTH
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollInstance >> uvWidth: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_UVWIDTH put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollInstance >> uvX [
	"This method was automatically generated"
	^handle floatAt: OFFSET_UVX
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollInstance >> uvX: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_UVX put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollInstance >> uvY [
	"This method was automatically generated"
	^handle floatAt: OFFSET_UVY
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollInstance >> uvY: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_UVY put: anObject
]
