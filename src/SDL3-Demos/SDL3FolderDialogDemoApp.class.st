"
I demonstrate how to use the system open folder dialog.
Click anywhere in the window to open the dialog.
"
Class {
	#name : 'SDL3FolderDialogDemoApp',
	#superclass : 'SDL3ConsoleDemoApp',
	#instVars : [
		'dialogFileCallback'
	],
	#category : 'SDL3-Demos-API',
	#package : 'SDL3-Demos',
	#tag : 'API'
}

{ #category : 'accessing' }
SDL3FolderDialogDemoApp >> initialExtent [

	^ 400 @ 300
]

{ #category : 'initialization' }
SDL3FolderDialogDemoApp >> initialize [

	super initialize.
	console addLine: 'CLICK TO OPEN DIALOG'
]

{ #category : 'utilities' }
SDL3FolderDialogDemoApp >> showOpenFolderIfSuccess: acceptOrCancelBlock ifError: errorBlock [

	dialogFileCallback ifNotNil: [ ^ errorBlock value ].

	dialogFileCallback :=
		FFICallback
			signature: #(void (void *userdata, char **filelist, int filter))
			block: [ :userdata :filelist :filter |
				filelist isNull
					ifTrue: [ errorBlock value ]
					ifFalse: [ acceptOrCancelBlock value: filelist nullTerminatedArrayOfCStrings ].
				dialogFileCallback := nil ].

	sdl
		showOpenFolderDialogCallback: dialogFileCallback
		userdata: nil
		window: window
		defaultLocation: OSPlatform current currentWorkingDirectoryPath
		allowMany: true
]

{ #category : 'hooks' }
SDL3FolderDialogDemoApp >> step [

	self clearColor: Color blue muchDarker.
	self present
]

{ #category : 'visiting - concrete' }
SDL3FolderDialogDemoApp >> visitMouseButtonDownEvent: aMouseButtonDownEvent [

	super visitMouseButtonDownEvent: aMouseButtonDownEvent.
	
	self showOpenFolderIfSuccess: [ :paths |
		paths do: [ :path | console addLine: 'Path selected: ', path ] ]
	ifError: [ console addLine: 'Error or cancelled!!!' ]
]
