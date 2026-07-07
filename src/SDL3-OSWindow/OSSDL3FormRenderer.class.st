"
My instances implement OSWindowFormRenderer interface using SDL3 library
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
		'deferPresent'
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

	sdlRenderer := backendWindow sdlWindow newRenderer.
	self initializeVsync
]

{ #category : 'private' }
OSSDL3FormRenderer >> createTexture [

	"Release existing texture if any"
	sdlTexture ifNotNil: [ sdlTexture destroy ].

	formRectangle := form boundingBox.
	formExtent := formRectangle extent.

	sdlTexture :=
		sdlRenderer
			newTextureFormat: SDL_PIXELFORMAT_XRGB8888
			access: SDL_TEXTUREACCESS_STREAMING
			width: formExtent x
			height: formExtent y
]

{ #category : 'morphic integration' }
OSSDL3FormRenderer >> deferUpdatesWhile: aBlock [

	deferPresent := true.
	aBlock ensure: [ deferPresent := false ].

	mutex critical: [
		sdlRenderer
			renderTexture: sdlTexture
				srcrect: nil
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
	sdlLockRectangle := SDL3Rect new
]

{ #category : 'private' }
OSSDL3FormRenderer >> initializeVsync [

	| targetVsync |
	targetVsync := OSSDL3SystemSettings rendererVsync.
	[ sdlRenderer renderVsync: targetVsync ]
		on: SDL3Error
		do: [ :err | 
			self traceCr: ('{1}: Failed to set VSync mode {2}. Falling back to enabled VSync (1). Error: {3}'
				format: { self class name . targetVsync . err messageText }).
			[ sdlRenderer renderVsync: 1 ]
				on: SDL3Error
				do: [ :fallbackErr | "Ignore" ] ]
]

{ #category : 'accessing' }
OSSDL3FormRenderer >> outputExtent [

	^ sdlRenderer outputExtent
]

{ #category : 'updating screen' }
OSSDL3FormRenderer >> presentTexture [

	sdlRenderer
		renderTexture: sdlTexture srcrect: nil dstrect: nil;
		renderPresent
]

{ #category : 'updating screen' }
OSSDL3FormRenderer >> updateAll [

	mutex critical: [
		self validate ifFalse: [ ^ self ].

		sdlTexture updateRect: nil pixels: form bits pitch: form width * 4. "32 bits"
		deferPresent ifTrue: [ ^ self ].
		sdlRenderer renderTexture: sdlTexture srcrect: nil dstrect: nil.
		sdlRenderer renderPresent ]
]

{ #category : 'morphic integration' }
OSSDL3FormRenderer >> updateAreas: allDamage immediate: immediate [

	mutex critical: [
		| damageUnion externalForm |
		self validate ifFalse: [ ^ self ].

		damageUnion := nil.
		allDamage do: [ :eachRectangle |
			eachRectangle intersect: formRectangle ifPresent: [ :visibleDamage |
				sdlLockRectangle updateFrom: visibleDamage.
				sdlTexture 
					lockRect: sdlLockRectangle
					pixels: bitsAddress
					pitch: pitchHolder.
				externalForm := OSSDL3ExternalForm new.
				damageUnion := [
					externalForm
						setExtent: visibleDamage extent
						depth: 32
						pitch: pitchHolder value
						bits: bitsAddress.
					self
						copySourceRectangle: visibleDamage
						targetOrigin: 0@0
						externalForm: externalForm.
					damageUnion
						ifNil: [ visibleDamage ]
						ifNotNil: [ damageUnion merge: visibleDamage ]
				] ensure: [
					sdlTexture unlock.
					externalForm destroySurface ] ] ].

		(deferPresent or: [ damageUnion isNil ]) ifFalse: [ self presentTexture ] ]
]

{ #category : 'updating' }
OSSDL3FormRenderer >> updateGPUDevice: aGPUDevice [
	"No-op. Regular form renderer does not use a GPU device."
]

{ #category : 'updating screen' }
OSSDL3FormRenderer >> updateRectangle: rectangle [

	mutex critical: [
		rectangle intersect: formRectangle ifPresent: [ :visibleRectangle |
			| externalForm |
			self validate ifFalse: [ ^ self ].

			sdlLockRectangle updateFrom: visibleRectangle.
			sdlTexture
				lockRect: sdlLockRectangle
				pixels: bitsAddress
				pitch: pitchHolder.
			externalForm := OSSDL3ExternalForm new.
			[	externalForm
					setExtent: visibleRectangle extent
					depth: 32
					pitch: pitchHolder value
					bits: bitsAddress.
				self
					copySourceRectangle: visibleRectangle
					targetOrigin: 0@0
					externalForm: externalForm
			] ensure: [
				sdlTexture unlock.
				externalForm destroySurface ].

			deferPresent ifFalse: [ self presentTexture ] ] ]
]

{ #category : 'events' }
OSSDL3FormRenderer >> updateToNewResolution [

	mutex critical: [ self validate ]
]

{ #category : 'private' }
OSSDL3FormRenderer >> validate [

	form ifNil: [ ^ false ].

	(sdlRenderer isNil or: [ sdlRenderer isNull ])
		ifTrue: [ self createRenderer ].

	(sdlTexture isNil or: [ sdlTexture isNull or: [ form extent ~= formExtent ] ])
		ifTrue: [ self createTexture ].

	^ true
]
