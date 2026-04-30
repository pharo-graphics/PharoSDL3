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
		'sdlTexture'
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
	sdlRenderer renderTexture: sdlTexture srcrect: sdlRectangle dstrect: sdlRectangle.
	sdlRenderer renderPresent
]

{ #category : 'private' }
OSSDL3FormRenderer >> createRenderer [

	sdlRenderer := backendWindow sdl3Window newRendererFor: nil.
	sdlRenderer renderVsync: 1
]

{ #category : 'private' }
OSSDL3FormRenderer >> createTexture [
	"Existing texture released explicitly to avoid memory leak on resize"

	sdlTexture ifNotNil: [ sdlTexture destroy ].
	sdlTexture := sdlRenderer
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
	mutex := Mutex new
]

{ #category : 'accessing' }
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

		sdlTexture updateRect: nil pixels: form bits pitch: form width * 4.
		deferUpdates ifTrue: [ ^ self ].
		sdlRenderer renderTexture: sdlTexture srcrect: nil dstrect: nil.
		sdlRenderer renderPresent ]
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
					sdlTexture lockRect: sdlRect pixels: pixels pitch: pitchHolder.
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
						sdlTexture unlock.
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
			sdlTexture lockRect: sdlRect pixels: pixels pitch: pitchHolder.
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
			sdlTexture unlock.
			externalForm destroySurface ].

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
