"
I demonstrate how to read images from the system clipboard and render/display them. I also support copying the Pharo logo back to the system clipboard on a mouse click inside the Pharo overlay icon.
"
Class {
	#name : 'SDL3ImageClipboardDemoApp',
	#superclass : 'SDL3ConsoleDemoApp',
	#instVars : [
		'texture',
		'stepCount',
		'lastImageBytes',
		'textureRectangle',
		'clipboardDataCallback',
		'clipboardCleanupCallback',
		'pharoIconTexture',
		'iconRectangle'
	],
	#category : 'SDL3-Demos-API',
	#package : 'SDL3-Demos',
	#tag : 'API'
}

{ #category : 'visiting - concrete' }
SDL3ImageClipboardDemoApp >> checkClipboard [

	| imageMimes |
	imageMimes := #( 'image/png' 'image/bmp' 'image/tiff' ).

	(imageMimes anySatisfy: [ :each | sdl hasClipboardData: each ])
		ifTrue: [ self checkImageClipboardWithMimeTypes: imageMimes ]
		ifFalse: [ self clearClipboardImage ]
]

{ #category : 'visiting - concrete' }
SDL3ImageClipboardDemoApp >> checkImageClipboardWithMimeTypes: imageMimes [

	self
		clipboardMimeTypeAnyOf: imageMimes
		ifPresent: [ :mimeType :bytes | 
			bytes = lastImageBytes ifFalse: [ 
				| form |
				lastImageBytes := bytes.
				form := ImageReadWriter formFromStream: bytes readStream.
				texture ifNotNil: [ texture destroy ].
				texture := renderer newTextureFromForm: form.
				console addLine: 'Loaded new image from clipboard' ] ]
		ifAbsent: [  ]
]

{ #category : 'visiting - concrete' }
SDL3ImageClipboardDemoApp >> clearClipboardImage [

	lastImageBytes := nil.
	texture ifNotNil: [ 
		texture destroy.
		texture := nil ]
]

{ #category : 'utilities' }
SDL3ImageClipboardDemoApp >> clipboardMimeTypeAnyOf: mimeTypes ifPresent: presentBlock ifAbsent: absentBlock [

	| mimeType |
	mimeType :=
		mimeTypes
			detect: [ :each | sdl hasClipboardData: each ]
			ifNone: [ ^ absentBlock value ].

	^ presentBlock
		value: mimeType
		value:
			(ExternalAddress
				allocate: FFIUInt64 pointerSize
				bytesDuring: [ :dataSizePointer | 
					| dataPointer dataSize |
					dataPointer := sdl
						               getClipboardDataMimeType: mimeType
						               size: dataSizePointer.
					dataSize := dataSizePointer signedLongLongAt: 1.
					dataPointer bytesFromNext: dataSize ])
]

{ #category : 'lifecycle' }
SDL3ImageClipboardDemoApp >> close [

	texture ifNotNil: [ 
		texture destroy. 
		texture := nil ].
	pharoIconTexture ifNotNil: [ 
		pharoIconTexture destroy.
		pharoIconTexture := nil ].
	super close
]

{ #category : 'visiting - concrete' }
SDL3ImageClipboardDemoApp >> copyPharoLogoToClipboard [

	| form pngBytes |
	form := self iconNamed: #pharoBig.
	pngBytes := ByteArray streamContents: [ :stream | 
		            PNGReadWriter putForm: form onStream: stream ].
	self setClipboardPNGData: pngBytes
]

{ #category : 'hooks' }
SDL3ImageClipboardDemoApp >> drawClipboardTexture [

	| windowExtent textureExtent scale newExtent origin |
	windowExtent := window extent.
	textureExtent := texture w @ texture h.
	scale := (windowExtent x / textureExtent x) min: (windowExtent y / textureExtent y).
	newExtent := textureExtent * scale.
	origin := (windowExtent - newExtent) / 2.
	textureRectangle updateFrom: (origin extent: newExtent).
	renderer renderTexture: texture srcrect: nil dstrect: textureRectangle
]

{ #category : 'hooks' }
SDL3ImageClipboardDemoApp >> drawPharoIconOverlay [

	| windowExtent iconExtent iconOrigin |
	pharoIconTexture ifNil: [ 
		pharoIconTexture := renderer newTextureFromForm: (self iconNamed: #pharoBig) ].

	windowExtent := window extent.
	iconExtent := 64 @ 64.
	iconOrigin := (windowExtent x - iconExtent x - 10) @ 10.
	iconRectangle updateFrom: (iconOrigin extent: iconExtent).
	renderer renderTexture: pharoIconTexture srcrect: nil dstrect: iconRectangle
]

{ #category : 'accessing' }
SDL3ImageClipboardDemoApp >> initialExtent [

	^ 500 @ 500
]

{ #category : 'accessing' }
SDL3ImageClipboardDemoApp >> initialWindowFlags [

	^ super initialWindowFlags | SDL_WINDOW_ALWAYS_ON_TOP
]

{ #category : 'initialization' }
SDL3ImageClipboardDemoApp >> initialize [

	super initialize.
	stepCount := 0.
	lastImageBytes := ByteArray new.
	textureRectangle := SDL3FRect new.
	iconRectangle := SDL3FRect new
]

{ #category : 'lifecycle' }
SDL3ImageClipboardDemoApp >> open [

	super open.
	console addLine: 'Clipboard Demo started.'.
	console addLine: 'Actions:'.
	console addLine: ' - Copy any image externally -> shows it here.'.
	console addLine: ' - Click the Pharo icon in the top-right -> copies it to clipboard.'
]

{ #category : 'visiting - concrete' }
SDL3ImageClipboardDemoApp >> setClipboardPNGData: pngBytes [

	| pngSize pngPointer cMimeType mimeTypesPtr userdataArray pointerSize |
	pngSize := pngBytes size.
	pointerSize := FFIExternalType pointerSize.

	pngPointer := ExternalAddress allocate: pngSize.
	sdl memcpyDst: pngPointer src: pngBytes len: pngSize.

	cMimeType := ExternalAddress allocate: 'image/png' size + 1.
	sdl memcpyDst: cMimeType src: 'image/png' len: 'image/png' size.
	cMimeType byteAt: 'image/png' size + 1 put: 0.

	mimeTypesPtr := ExternalAddress allocate: pointerSize * 2.
	mimeTypesPtr unsignedLongLongAt: 1 put: cMimeType asInteger.
	mimeTypesPtr unsignedLongLongAt: 1 + pointerSize put: 0.

	userdataArray := ExternalAddress allocate: pointerSize * 3.
	userdataArray unsignedLongLongAt: 1 put: pngPointer asInteger.
	userdataArray unsignedLongLongAt: 1 + pointerSize put: mimeTypesPtr asInteger.
	userdataArray unsignedLongLongAt: 1 + (pointerSize * 2) put: cMimeType asInteger.

	self setupClipboardCallbacksForSize: pngSize.

	(sdl
		 setClipboardDataCallback: clipboardDataCallback
		 cleanup: clipboardCleanupCallback
		 userdata: userdataArray
		 mimeTypes: mimeTypesPtr
		 numMimeTypes: 1)
		ifTrue: [ console addLine: 'Pharo logo copied to clipboard!' ]
		ifFalse: [ console addLine: 'Failed to set clipboard data' ]
]

{ #category : 'visiting - concrete' }
SDL3ImageClipboardDemoApp >> setupClipboardCallbacksForSize: pngSize [

	| pointerSize |
	pointerSize := FFIExternalType pointerSize.

	clipboardDataCallback := FFICallback
		                         signature: #(const void *(void *userdata, const char *mimeType, size_t *size))
		                         block: [ :userdata :mimeType :sizePtr | 
			                         | ptr |
			                         ptr := userdata pointerAtOffset: 0.
			                         sizePtr signedLongLongAt: 1 put: pngSize.
			                         ptr ].

	clipboardCleanupCallback := FFICallback
		                            signature: #(void (void *userdata))
		                            block: [ :userdata | 
			                            | p1 p2 p3 |
			                            p1 := userdata pointerAtOffset: 0.
			                            p2 := userdata pointerAtOffset: pointerSize.
			                            p3 := userdata pointerAtOffset: pointerSize * 2.
			                            p1 free.
			                            p2 free.
			                            p3 free.
			                            userdata free.
			                            console addLine: 'Clipboard data cleaned up' ]
]

{ #category : 'hooks' }
SDL3ImageClipboardDemoApp >> step [

	stepCount := stepCount + 1.
	(stepCount \\ 30 = 0) ifTrue: [ self checkClipboard ].

	self clearColor: Color blue muchDarker.
	texture ifNotNil: [ self drawClipboardTexture ].
	self drawPharoIconOverlay.
	self present
]

{ #category : 'accessing' }
SDL3ImageClipboardDemoApp >> updatedTitle [

	^ super updatedTitle , ' - Copy an image to clipboard'
]

{ #category : 'visiting - concrete' }
SDL3ImageClipboardDemoApp >> visitClipboardEvent: anEvent [

	self checkClipboard
]

{ #category : 'visiting - concrete' }
SDL3ImageClipboardDemoApp >> visitMouseButtonDownEvent: aMouseButtonDownEvent [

	| clickPoint iconBounds |
	super visitMouseButtonDownEvent: aMouseButtonDownEvent.

	clickPoint := aMouseButtonDownEvent x @ aMouseButtonDownEvent y.
	iconBounds := iconRectangle origin extent: iconRectangle extent.
	(iconBounds containsPoint: clickPoint) ifTrue: [ 
		self copyPharoLogoToClipboard ]
]
