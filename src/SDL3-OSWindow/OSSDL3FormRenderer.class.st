"
My instances implement OSWindowFormRenderer interface using SDL2 library
"
Class {
	#name : 'OSSDL3FormRenderer',
	#superclass : 'OSWindowFormRenderer',
	#instVars : [
		'mutex',
		'sdlRenderer',
		'sdlTexture',
		'pitchHolder',
		'sdlLockRectangle',
		'bitsAddress',
		'formRectangle',
		'formExtent',
		'deferPresent',
		'formSDLRect',
		'textureExtent',
		'formSDLFRect'
	],
	#pools : [
		'SDL3AllEnumerations'
	],
	#category : 'SDL3-OSWindow-Renderers',
	#package : 'SDL3-OSWindow',
	#tag : 'Renderers'
}

{ #category : 'private' }
OSSDL3FormRenderer >> copySourceRectangle: rectangle targetOrigin: targetPoint externalForm: externalForm [
	"We need to do this ugly hack because the Mutex that is used in the renderer is not correctly liberated when there is an exception. Issue #10156. Once it is fixed, we can signal the exception as normal people."

	[ externalForm copy: rectangle from: form to: targetPoint rule: Form over ]
		on: Exception do: [ :e |
			Stdio stdout
				<< 'There was an error during copy, we should not signal it here: ';
				<< e printString; crlf; flush ]
]

{ #category : 'private' }
OSSDL3FormRenderer >> createRenderer [

	sdlRenderer := backendWindow sdlWindow newRenderer
]

{ #category : 'private' }
OSSDL3FormRenderer >> createTextureForExtent: newExtent [

	"Release existing texture if any"
	sdlTexture ifNotNil: [ sdlTexture destroy ].

	textureExtent := newExtent.

	sdlTexture :=
		sdlRenderer
			newTextureFormat: SDL_PIXELFORMAT_XRGB8888
			access: SDL_TEXTUREACCESS_STREAMING
			width: textureExtent x
			height: textureExtent y
]

{ #category : 'morphic integration' }
OSSDL3FormRenderer >> deferUpdatesWhile: aBlock [

	deferPresent := true.
	aBlock ensure: [ deferPresent := false ].

	mutex critical: [
		sdlRenderer
			renderTexture: sdlTexture
				srcrect: formSDLFRect
				dstrect: nil;
			renderPresent ]
]

{ #category : 'deleting' }
OSSDL3FormRenderer >> destroy [
	"Destroy my SDL3 resources. You can send #validate to reinitialize the resources. Super-send is avoided since it looses the backendWindow, and we want to keep the reference."

	mutex critical: [
		(sdlTexture isNil or: [ sdlRenderer isNil ]) ifTrue: [ ^ self ].

		sdlTexture destroy.
		sdlTexture := nil.
		textureExtent := nil.

		sdlRenderer destroy.
		sdlRenderer := nil ]
]

{ #category : 'accessing' }
OSSDL3FormRenderer >> flush [
	"Process any pending presentation to the screen."
]

{ #category : 'initialization' }
OSSDL3FormRenderer >> initialize [

	super initialize.
	deferPresent := false.
	mutex := Mutex new.
	
	"FFI objects that are reused across the updates"
	pitchHolder := FFIInt32 newValueHolder.
	bitsAddress := ExternalAddress new.
	sdlLockRectangle := SDL3Rect new.
	formSDLRect := SDL3Rect new.
	formSDLFRect := SDL3FRect new
]

{ #category : 'accessing' }
OSSDL3FormRenderer >> outputExtent [

	^ sdlRenderer outputExtent
]

{ #category : 'updating screen' }
OSSDL3FormRenderer >> presentTexture [

	sdlRenderer
		renderTexture: sdlTexture srcrect: formSDLFRect dstrect: nil;
		renderPresent
]

{ #category : 'private' }
OSSDL3FormRenderer >> textureExtentFor: anExtent [

	^ (((anExtent x + 511) // 512 * 512) max: 512) @ (((anExtent y + 511) // 512 * 512) max: 512)
]

{ #category : 'updating screen' }
OSSDL3FormRenderer >> updateAll [

	mutex critical: [
		self validate ifFalse: [ ^ self ].

		sdlTexture updateRect: formSDLRect pixels: form bits pitch: form width * 4. "32 bits"
		deferPresent ifTrue: [ ^ self ].
		sdlRenderer renderTexture: sdlTexture srcrect: formSDLFRect dstrect: nil.
		sdlRenderer renderPresent ]
]

{ #category : 'morphic integration' }
OSSDL3FormRenderer >> updateAreas: allDamage immediate: immediate [

	mutex critical: [
		| externalForm pitch |
		self validate ifFalse: [ ^ self ].
		allDamage ifEmpty: [ ^ self ].

		sdlLockRectangle updateFrom: (0@0 extent: textureExtent).
		sdlTexture 
			lockRect: sdlLockRectangle
			pixels: bitsAddress
			pitch: pitchHolder.
		
		pitch := pitchHolder value.
		externalForm := OSSDL3ExternalForm new.
		
		[
			allDamage do: [ :eachRectangle |
				eachRectangle intersect: formRectangle ifPresent: [ :visibleDamage |
					| offset |
					offset := (visibleDamage top * pitch) + (visibleDamage left * 4).
					externalForm
						resetExtent: visibleDamage extent
						depth: 32
						pitch: pitch
						bits: bitsAddress + offset.
					self
						copySourceRectangle: visibleDamage
						targetOrigin: 0@0
						externalForm: externalForm ] ]
		] ensure: [
			sdlTexture unlock.
			externalForm destroySurface ].

		(deferPresent or: [ immediate not ]) ifFalse: [ self presentTexture ] ]
]

{ #category : 'updating screen' }
OSSDL3FormRenderer >> updateRectangle: rectangle [

	self updateAreas: { rectangle } immediate: true
]

{ #category : 'events' }
OSSDL3FormRenderer >> updateToNewResolution [

	mutex critical: [ self validate ]
]

{ #category : 'private' }
OSSDL3FormRenderer >> validate [

	| newTextureExtent |
	form ifNil: [ ^ false ].

	(sdlRenderer isNil or: [ sdlRenderer isNull ])
		ifTrue: [ self createRenderer ].

	newTextureExtent := self textureExtentFor: form extent.

	(sdlTexture isNil or: [ 
		sdlTexture isNull or: [ 
			textureExtent isNil or: [
				(newTextureExtent x > textureExtent x) or: [ 
					newTextureExtent y > textureExtent y ] ] ] ])
		ifTrue: [ self createTextureForExtent: newTextureExtent ].

	formRectangle := form boundingBox.
	formExtent := formRectangle extent.
	formSDLRect updateFrom: (0@0 extent: formExtent).
	formSDLFRect updateFrom: (0@0 extent: formExtent).

	^ true
]
