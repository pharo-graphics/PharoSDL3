"
My instances implement OSWindowFormRenderer interface using SDL2 library
"
Class {
	#name : 'OSSDL3FormRenderer',
	#superclass : 'OSWindowFormRenderer',
	#instVars : [
		'texture',
		'renderer',
		'extent',
		'deferUpdates',
		'mutex'
	],
	#category : 'SDL3-OSWindow-Renderers',
	#package : 'SDL3-OSWindow',
	#tag : 'Renderers'
}

{ #category : 'updating screen' }
OSSDL3FormRenderer >> copyAndPresentTextureRectangle: rectangle [

	| sdlRectangle |
	deferUpdates ifTrue: [ ^ self ].

	sdlRectangle := SDL3FRect newFrom: rectangle.
	renderer renderTexture: texture srcrect: sdlRectangle dstrect: sdlRectangle.
	renderer renderPresent
]

{ #category : 'private' }
OSSDL3FormRenderer >> createRenderer [

	renderer := backendWindow sdl3Window newRendererFor: nil
]

{ #category : 'private' }
OSSDL3FormRenderer >> createTexture [
	"Existing texture released explicitly to avoid memory leak on resize"

	texture ifNotNil: [ texture destroy ].
	texture := renderer
		           newTextureFormat: SDL3PixelFormat xrgb8888
		           access: SDL3TextureAccess streaming
		           w: form width
		           h: form height.
	extent := form extent
]

{ #category : 'updating screen' }
OSSDL3FormRenderer >> deferUpdatesWhile: aBlock [

	deferUpdates := true.
	aBlock ensure: [ deferUpdates := false ].
	self useDeferredUpdates
]

{ #category : 'deleting' }
OSSDL3FormRenderer >> destroy [

	mutex critical: [
		(texture isNil or: [ renderer isNil ]) ifTrue: [ ^ self ].
		texture destroy.
		renderer destroy.
		texture := nil.
		renderer := nil ]
]

{ #category : 'initialization' }
OSSDL3FormRenderer >> initialize [

	super initialize.
	deferUpdates := false.
	mutex := Mutex new
]

{ #category : 'accessing' }
OSSDL3FormRenderer >> outputExtent [

	^ renderer outputExtent
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

		texture updateRect: nil pixels: form bits pitch: form width * 4.
		deferUpdates ifTrue: [ ^ self ].
		renderer renderTexture: texture srcrect: nil dstrect: nil.
		renderer renderPresent ]
]

{ #category : 'updating screen' }
OSSDL3FormRenderer >> updateAreas: allDamage immediate: forceToScreen [

	| pixels pitch intersection updateUnion externalForm sdlRect |
	mutex critical: [
		self validate ifFalse: [ ^ self ].

		updateUnion := nil.
		allDamage do: [ :rectangle |
			intersection := rectangle
				                intersect: (0 @ 0 extent: extent)
				                ifNone: [ nil ].

			intersection ifNotNil: [
				pixels := ExternalAddress new.
				sdlRect := SDL3Rect newFrom: intersection.
				ExternalAddress allocate: 4 bytesDuring: [ :pitchHolder |
					texture lockRect: sdlRect pixels: pixels pitch: pitchHolder.
					pitch := pitchHolder signedLongAt: 1 ].

				[
				externalForm := OSSDL3ExternalForm new
					                setExtent: intersection extent
					                depth: 32
					                pitch: pitch
					                bits: pixels;
					                yourself.
				self
					primitiveUpdateRectangle: intersection
					to: 0@0
					externalForm: externalForm.
				updateUnion
					ifNil: [ updateUnion := intersection ]
					ifNotNil: [ updateUnion := updateUnion merge: intersection ] ]
					ensure: [
						texture unlock.
						externalForm destroySurface ] ] ].

		(forceToScreen and: [ updateUnion isNotNil ]) ifTrue: [
			self copyAndPresentTextureRectangle: updateUnion ] ]
]

{ #category : 'updating screen' }
OSSDL3FormRenderer >> updateRectangle: rectangle [

	| intersection pixels pitch externalForm sdlRect |
	mutex critical: [
		intersection := rectangle
			                intersect: (0 @ 0 extent: extent)
			                ifNone: [ ^ self ].
		self validate ifFalse: [ ^ self ].

		pixels := ExternalAddress new.
		sdlRect := SDL3Rect newFrom: intersection.
		ExternalAddress allocate: 4 bytesDuring: [ :pitchHolder |
			texture lockRect: sdlRect pixels: pixels pitch: pitchHolder.
			pitch := pitchHolder signedLongAt: 1 ].

		[
		externalForm := OSSDL3ExternalForm new
			                setExtent: intersection extent
			                depth: 32
			                pitch: pitch
			                bits: pixels;
			                yourself.
		self
			primitiveUpdateRectangle: intersection
			to: 0@0
			externalForm: externalForm ] ensure: [
			texture unlock.
			externalForm destroySurface ].

		self copyAndPresentTextureRectangle: intersection ]
]

{ #category : 'private' }
OSSDL3FormRenderer >> useDeferredUpdates [

	mutex critical: [
		renderer
			renderTexture: texture
				srcrect: nil
				dstrect: nil;
			renderPresent ]
]

{ #category : 'private' }
OSSDL3FormRenderer >> validate [

	form ifNil: [ ^ false ].
	(renderer isNil or: [ renderer isNull ]) ifTrue: [ self createRenderer ].
	(texture isNil or: [ texture isNull or: [ form extent ~= extent ] ]) ifTrue: [ self createTexture ].
	^ true
]
