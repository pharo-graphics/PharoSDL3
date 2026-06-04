"
My instances implement OSWindowFormRenderer interface using SDL2 library
"
Class {
	#name : 'OSSDL3FormRenderer',
	#superclass : 'OSWindowFormRenderer',
	#instVars : [
		'extent',
		'deferUpdates',
		'mutex',
		'sdlRenderer',
		'sdlTexture',
		'recycledSDLRect',
		'recycledSDLFRect',
		'pitchHolder',
		'recycledExternalForm',
		'recycledPixelsPointer'
	],
	#category : 'SDL3-OSWindow-Renderers',
	#package : 'SDL3-OSWindow',
	#tag : 'Renderers'
}

{ #category : 'updating screen' }
OSSDL3FormRenderer >> copyAndPresentTextureRectangle: rectangle [

	deferUpdates ifTrue: [ ^ self ].

	recycledSDLFRect updateFrom: rectangle.
	sdlRenderer
		renderTexture: sdlTexture
		srcrect: recycledSDLFRect
		dstrect: recycledSDLFRect.
	sdlRenderer renderPresent
]

{ #category : 'private' }
OSSDL3FormRenderer >> createRenderer [

	sdlRenderer := backendWindow sdl3Window newRenderer.
	sdlRenderer renderVsync: 1
]

{ #category : 'private' }
OSSDL3FormRenderer >> createTexture [
	"Existing texture released explicitly to avoid memory leak on resize"

	| pixelExtent |
	sdlTexture ifNotNil: [ sdlTexture destroy ].

	"Improvement 3: Ensure texture matches pixel extent for crisp rendering"
	pixelExtent := backendWindow sdl3Window pixelExtent.

	sdlTexture := sdlRenderer
					 newTextureFormat: SDL3PixelFormat xrgb8888
					 access: SDL3TextureAccess streaming
					 w: pixelExtent x
					 h: pixelExtent y.

	extent := form extent.

	"Enable logical presentation to handle logical coordinates automatically"
	sdlRenderer
		logicalPresentationLogicalW: extent x
		logicalH: extent y
		mode: SDL_LOGICAL_PRESENTATION_STRETCH
]

{ #category : 'updating screen' }
OSSDL3FormRenderer >> deferUpdatesWhile: aBlock [

	deferUpdates := true.
	aBlock ensure: [ deferUpdates := false ].
	self useDeferredUpdates
]

{ #category : 'deleting' }
OSSDL3FormRenderer >> destroy [
	"Destroy my SDL3 resources. You can send #validate to reinitialize the resources. Super-send is avoided since it looses the backendWindow, and we want to keep the reference."

	mutex critical: [
		(sdlTexture isNil or: [ sdlRenderer isNil ]) ifTrue: [ ^ self ].
		sdlTexture destroy.
		sdlRenderer destroy.
		sdlTexture := nil.
		sdlRenderer := nil ]
]

{ #category : 'accessing' }
OSSDL3FormRenderer >> flush [
	"Process any pending presentation to the screen."
]

{ #category : 'initialization' }
OSSDL3FormRenderer >> initialize [

	super initialize.
	deferUpdates := false.
	mutex := Mutex new.
	recycledSDLRect := SDL3Rect new.
	recycledSDLFRect := SDL3FRect new.
	pitchHolder := FFIInt32 newValueHolder.
	recycledPixelsPointer := ExternalAddress new
]

{ #category : 'private' }
OSSDL3FormRenderer >> logicalToPixelRect: aRectangle [

	| window logicalExtent pixelExtent scaleX scaleY |
	window := backendWindow sdl3Window.
	logicalExtent := window extent.
	pixelExtent := window pixelExtent.
	
	scaleX := pixelExtent x asFloat / (logicalExtent x max: 1).
	scaleY := pixelExtent y asFloat / (logicalExtent y max: 1).
	
	^ (aRectangle origin x * scaleX) rounded @ (aRectangle origin y * scaleY) rounded 
		extent: (aRectangle width * scaleX) rounded @ (aRectangle height * scaleY) rounded
]

{ #category : 'private' }
OSSDL3FormRenderer >> outputExtent [

	^ sdlRenderer outputExtent
]

{ #category : 'private' }
OSSDL3FormRenderer >> primitiveUpdateRectangle: rectangle to: targetPoint externalForm: externalForm [
	"We need to do this ugly hack because the Mutex that is used in the renderer is not correctly liberated when there is an exception. Issue #10156. Once it is fixed, we can signal the exception as normal people."

	[ externalForm copy: rectangle from: form to: targetPoint rule: Form over ]
		on: Exception do: [ :e |
			Stdio stdout
				<< 'There was an error during copy, we should not throw an exception here: ';
				<< e printString;
				crlf; flush ]
]

{ #category : 'updating screen' }
OSSDL3FormRenderer >> updateAll [

	mutex critical: [
		self validate ifFalse: [ ^ self ].

		recycledSDLRect updateFrom: (0 @ 0 extent: form extent).
		sdlTexture
			updateRect: recycledSDLRect
			pixels: form bits
			pitch: form width * FFIUInt32 externalTypeSize.

		deferUpdates ifTrue: [ ^ self ].
		sdlRenderer
			renderTexture: sdlTexture
			srcrect: recycledSDLRect
			dstrect: nil.
		sdlRenderer renderPresent ]
]

{ #category : 'updating screen' }
OSSDL3FormRenderer >> updateAreas: allDamage immediate: forceToScreen [

	| updateBoundingBox pitch pixelBoundingBox |
	mutex critical: [
		self validate ifFalse: [ ^ self ].
		allDamage ifEmpty: [ ^ self ].

		"1. Compute bounding box of all damage in logical units"
		updateBoundingBox := nil.
		allDamage do: [ :rect |
			| intersection |
			intersection := rect
								intersect: (0 @ 0 extent: extent)
								ifNone: [ nil ].
			intersection ifNotNil: [
				updateBoundingBox := updateBoundingBox
										ifNil: [ intersection ]
										ifNotNil: [
											updateBoundingBox merge: intersection ] ] ].

		updateBoundingBox ifNil: [ ^ self ].

		"2. Map logical bounding box to pixel units for texture locking"
		pixelBoundingBox := self logicalToPixelRect: updateBoundingBox.
		recycledSDLRect updateFrom: pixelBoundingBox.

		sdlTexture
			lockRect: recycledSDLRect
			pixels: recycledPixelsPointer
			pitch: pitchHolder getHandle.
		pitch := pitchHolder signedLongAt: 1.

		[
		"3. Update damage areas within the locked region"
		recycledExternalForm ifNil: [
			recycledExternalForm := OSSDL3ExternalForm new ].

		allDamage do: [ :rect |
			| intersection pixelRect |
			intersection := rect
								intersect: updateBoundingBox
								ifNone: [ nil ].
			intersection ifNotNil: [
				pixelRect := self logicalToPixelRect: intersection.
				recycledExternalForm
					resetExtent: pixelRect extent
					depth: 32
					pitch: pitch
					bits: recycledPixelsPointer
						+ (pixelRect top - pixelBoundingBox top * pitch)
						+ (pixelRect left - pixelBoundingBox left * 4).
				self
					primitiveUpdateRectangle: pixelRect
					to: 0 @ 0
					externalForm: recycledExternalForm ] ] ] ensure: [
			sdlTexture unlock.
			recycledExternalForm ifNotNil: [
				recycledExternalForm
					resetExtent: 0 @ 0
					depth: 32
					pitch: 0
					bits: ExternalAddress null ] ].

		(forceToScreen and: [ updateBoundingBox isNotNil ]) ifTrue: [
			self copyAndPresentTextureRectangle: updateBoundingBox ] ]
]

{ #category : 'updating screen' }
OSSDL3FormRenderer >> updateRectangle: rectangle [

	| intersection pitch pixelRect |
	mutex critical: [
		intersection := rectangle
							intersect: (0 @ 0 extent: extent)
							ifNone: [ ^ self ].
		self validate ifFalse: [ ^ self ].

		pixelRect := self logicalToPixelRect: intersection.
		recycledSDLRect updateFrom: pixelRect.
		sdlTexture
			lockRect: recycledSDLRect
			pixels: recycledPixelsPointer
			pitch: pitchHolder getHandle.
		pitch := pitchHolder signedLongAt: 1.

		[
		recycledExternalForm ifNil: [
			recycledExternalForm := OSSDL3ExternalForm new ].
		recycledExternalForm
			resetExtent: pixelRect extent
			depth: 32
			pitch: pitch
			bits: recycledPixelsPointer.
		self
			primitiveUpdateRectangle: pixelRect
			to: 0 @ 0
			externalForm: recycledExternalForm ] ensure: [
			sdlTexture unlock.
			recycledExternalForm ifNotNil: [
				recycledExternalForm
					resetExtent: 0 @ 0
					depth: 32
					pitch: 0
					bits: ExternalAddress null ] ].

		self copyAndPresentTextureRectangle: intersection ]
]

{ #category : 'events' }
OSSDL3FormRenderer >> updateToNewResolution [

	self validate
]

{ #category : 'private' }
OSSDL3FormRenderer >> useDeferredUpdates [

	mutex critical: [
		sdlRenderer
			renderTexture: sdlTexture
				srcrect: nil
				dstrect: nil;
			renderPresent ]
]

{ #category : 'private' }
OSSDL3FormRenderer >> validate [

	form ifNil: [ ^ false ].
	(sdlRenderer isNil or: [ sdlRenderer isNull ]) ifTrue: [ self createRenderer ].
	(sdlTexture isNil or: [ sdlTexture isNull or: [ form extent ~= extent ] ]) ifTrue: [ self createTexture ].
	^ true
]
