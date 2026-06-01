"
I demonstrate how to read images from the system clipboard and render them.
"
Class {
	#name : 'SDL3ImageClipboardDemo',
	#superclass : 'SDL3ConsoleDemoApp',
	#instVars : [
		'texture'
	],
	#category : 'SDL3-Demos-API',
	#package : 'SDL3-Demos',
	#tag : 'API'
}

{ #category : 'utilities' }
SDL3ImageClipboardDemo >> clipboardMimeTypeAnyOf: mimeTypes ifPresent: presentBlock ifAbsent: absentBlock [

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
SDL3ImageClipboardDemo >> close [

	texture ifNotNil: [ 
		texture destroy. 
		texture := nil ].
	super close
]

{ #category : 'accessing' }
SDL3ImageClipboardDemo >> initialExtent [

	^ 500 @ 500
]

{ #category : 'accessing' }
SDL3ImageClipboardDemo >> initialWindowFlags [

	^ super initialWindowFlags | SDL_WINDOW_ALWAYS_ON_TOP
]

{ #category : 'hooks' }
SDL3ImageClipboardDemo >> step [

	self clearColor: Color blue muchDarker.
	texture ifNotNil: [ renderer renderTexture: texture srcrect: nil dstrect: nil ].
	self present
]

{ #category : 'accessing' }
SDL3ImageClipboardDemo >> updatedTitle [

	^ super updatedTitle, ' - Copy an image to clipboard and select this window'
]

{ #category : 'visiting - concrete' }
SDL3ImageClipboardDemo >> visitClipboardEvent: anEvent [

	self
		clipboardMimeTypeAnyOf: #('image/png' 'image/bmp' 'image/tiff')
		ifPresent: [ :mimeType :bytes |
			| form |
			form := ImageReadWriter formFromStream: bytes readStream.
			texture ifNotNil: [ texture destroy ].
			texture := renderer newTextureFromForm: form ]
		ifAbsent: [ self log: 'No image found in clipboard' ]
]
