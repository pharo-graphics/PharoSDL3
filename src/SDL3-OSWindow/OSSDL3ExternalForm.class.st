"
An ExternalForm is a specialized Form whose pixel-data is stored in memory that the user provides a pointer to.

I wrap the SurfacePlugin primitives to allow Pharo's rendering engine to draw directly into external memory (like an SDL texture).
"
Class {
	#name : 'OSSDL3ExternalForm',
	#superclass : 'Form',
	#instVars : [
		'pointer'
	],
	#category : 'SDL3-OSWindow-Renderers',
	#package : 'SDL3-OSWindow',
	#tag : 'Renderers'
}

{ #category : 'initialization' }
OSSDL3ExternalForm >> allocateSpace [
	"Allocate external memory for the form pixels. This uses auto-garbage collected external memory."

	| address |
	pointer ifNotNil: [ self error: 'Space is already allocated' ].
	address := ExternalAddress gcallocate: (width * height * depth / 8).
	self setManualSurfacePointer: address
]

{ #category : 'initialization' }
OSSDL3ExternalForm >> destroySurface [
	"Destroy the manual surface and release the bits ID. The external pointer itself is managed separately (or by GC if gcallocate was used)."

	bits ifNotNil: [ :surfaceID |
		bits := nil.
		self primDestroyManualSurface: surfaceID ]
]

{ #category : 'scaling, rotation' }
OSSDL3ExternalForm >> magnifyBy: aScale smoothing: cellSize [
	"Answer a new Form that is a magnified version of the receiver."

	| form |
	form := Form extent: self extent depth: self depth.
	form getCanvas
		image: self
		at: 0 @ 0
		sourceRect: self boundingBox
		rule: Form blendAlphaScaled.

	^ form magnifyBy: aScale smoothing: cellSize
]

{ #category : 'accessing' }
OSSDL3ExternalForm >> pointer [
	"Answer the external address pointing to the pixel data."

	^ pointer
]

{ #category : 'primitives' }
OSSDL3ExternalForm >> primCreateManualSurfaceWidth: aWidth height: aHeight rowPitch: rowPitch depth: aDepth isMSB: isMSB [
	"Create a manual surface in the VM's surface plugin."

	<primitive: 'primitiveCreateManualSurface' module: 'SurfacePlugin'>
	^ self primitiveFailed
]

{ #category : 'primitives' }
OSSDL3ExternalForm >> primDestroyManualSurface: surfaceID [
	"Destroy a manual surface in the VM's surface plugin."

	<primitive: 'primitiveDestroyManualSurface' module: 'SurfacePlugin'>
	^ self primitiveFailed
]

{ #category : 'primitives' }
OSSDL3ExternalForm >> primManualSurface: surfaceID setPointer: aPointer [
	"Set the memory pointer for a manual surface in the VM's surface plugin."

	<primitive: 'primitiveSetManualSurfacePointer' module: 'SurfacePlugin'>
	^ self primitiveFailed
]

{ #category : 'initialization' }
OSSDL3ExternalForm >> resetExtent: anExtent depth: bitsPerPixel pitch: rowPitch bits: aPointer [
	"Reset the form with new extent and bits. This avoids allocating a new OSSDL3ExternalForm object."

	self destroySurface.
	self setExtent: anExtent depth: bitsPerPixel pitch: rowPitch bits: aPointer
]

{ #category : 'initialization' }
OSSDL3ExternalForm >> setExtent: anExtent depth: bitsPerPixel [
	"Set the extent and depth of the form, and create the manual surface."

	bits ifNotNil: [ self error: 'Bits are already set' ].
	bitsPerPixel = 32 ifFalse: [ self error: 'Only 32-bit depth is supported for now' ].
	
	width := anExtent x asInteger max: 0.
	height := anExtent y asInteger max: 0.
	depth := bitsPerPixel.
	
	bits := self
		primCreateManualSurfaceWidth: width
		height: height
		rowPitch: width * FFIUInt32 externalTypeSize
		depth: bitsPerPixel
		isMSB: true
]

{ #category : 'initialization' }
OSSDL3ExternalForm >> setExtent: anExtent depth: bitsPerPixel bits: aPointer [
	"Set the extent, depth, and the external memory pointer."

	self setExtent: anExtent depth: bitsPerPixel.
	self setManualSurfacePointer: aPointer
]

{ #category : 'initialization' }
OSSDL3ExternalForm >> setExtent: anExtent depth: bitsPerPixel pitch: rowPitch bits: aPointer [
	"Set the extent, depth, row pitch and the external memory pointer."

	bits ifNotNil: [ self error: 'Bits are already set' ].
	bitsPerPixel = 32 ifFalse: [ self error: 'Only 32-bit depth is supported for now' ].
	
	width := anExtent x asInteger max: 0.
	height := anExtent y asInteger max: 0.
	depth := bitsPerPixel.
	
	bits := self
		primCreateManualSurfaceWidth: width
		height: height
		rowPitch: rowPitch
		depth: bitsPerPixel
		isMSB: true.
		
	self setManualSurfacePointer: aPointer
]

{ #category : 'initialization' }
OSSDL3ExternalForm >> setManualSurfacePointer: aPointer [
	"Set the external memory pointer for the pixel data. Handles both ExternalAddress and objects responding to #getHandle."

	pointer := aPointer.
	pointer ifNil: [ ^ self primManualSurface: bits setPointer: 0 ].
	
	pointer isExternalAddress
		ifFalse: [ "Must already be ExternalStructure, so nothing to do" ]
		ifTrue: [
			pointer :=
				ExternalData
					fromHandle: aPointer
					type: ExternalType void asPointerType ].

	"The primitive expects an unsigned integer arg, not an ExternalAddress."
	"NOTE: it used to be acceptable for 'newPointer' to be an Integer...
	if you get a MNU for #getHandle here, you should update your code
	to pass in either an ExternalStructure or an ExternalAddress."
	self primManualSurface: bits setPointer: pointer getHandle asInteger
]
