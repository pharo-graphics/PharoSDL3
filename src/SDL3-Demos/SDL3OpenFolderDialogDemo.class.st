"
I demonstrate how to use the system open folder dialog.
Click anywhere in the window to open the dialog.
"
Class {
	#name : 'SDL3OpenFolderDialogDemo',
	#superclass : 'SDL3ConsoleDemoApp',
	#instVars : [
		'dialogFileCallback'
	],
	#category : 'SDL3-Demos-API',
	#package : 'SDL3-Demos',
	#tag : 'API'
}

{ #category : 'accessing' }
SDL3OpenFolderDialogDemo >> initialExtent [

	^ 400 @ 300
]

{ #category : 'initialization' }
SDL3OpenFolderDialogDemo >> initialize [

	super initialize.
	self log: 'CLICK TO OPEN DIALOG'
]

{ #category : 'utilities' }
SDL3OpenFolderDialogDemo >> showOpenFolderIfSuccess: acceptOrCancelBlock ifError: errorBlock [

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
SDL3OpenFolderDialogDemo >> step [

	self clearColor: Color blue muchDarker.
	self present
]
