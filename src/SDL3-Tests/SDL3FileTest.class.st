Class {
	#name : 'SDL3FileTest',
	#superclass : 'SDL3Test',
	#category : 'SDL3-Tests-Library',
	#package : 'SDL3-Tests',
	#tag : 'Library'
}

{ #category : 'tests' }
SDL3FileTest >> test01FileInfo [

	| pathString fileReference pathInfo |
	pathString := Smalltalk vm vmFileName.
	fileReference := pathString asFileReference.

	pathInfo := sdl pathInfoAt: pathString.

	self assert: pathInfo size equals: fileReference size.

	"SDL3's path info has nanosecond precision"
	self assert: pathInfo createDateAndTime - fileReference creationTime < 1 second.
	self assert: pathInfo accessDateAndTime - fileReference accessTime < 1 second.
	self assert: pathInfo modifyDateAndTime - fileReference modificationTime < 1 second
]

{ #category : 'tests' }
SDL3FileTest >> test02EnumerateDirectory [

	| data fileCallback |
	data := OrderedCollection new.
	fileCallback :=
		FFICallback
			signature: #(SDL3EnumerationResult (void *userdata, char *dirname, char *fname))
			block: [ :userdata :dirname :fname |
				data add: { dirname. fname }.
				SDL3EnumerationResult continue ].	
	sdl assertSuccess: (sdl enumerateDirectoryPath: '.' callback: fileCallback userdata: nil).
	self assert: data size equals: '.' asFileReference entries size
]

{ #category : 'tests' }
SDL3FileTest >> test03UserFolders [

	self
		assert: (sdl getUserFolder: SDL3Folder home) asFileReference
		equals: FileLocator home asFileReference.

	self
		assert: (sdl getUserFolder: SDL3Folder downloads) asFileReference
		equals: FileLocator downloads asFileReference.

	self
		assert: (sdl getUserFolder: SDL3Folder desktop) asFileReference
		equals: FileLocator desktop asFileReference.

	self
		assert: (sdl getUserFolder: SDL3Folder documents) asFileReference
		equals: FileLocator documents asFileReference
]

{ #category : 'tests' }
SDL3FileTest >> test04CurrentDirectory [

	self flag: #todo. "Memory leak in #getCurrentDirectory: https://github.com/pharo-graphics/PharoSDL3/issues/29"

	self
		assert: sdl getCurrentDirectory asFileReference 
		equals: '.' asFileReference
]

{ #category : 'tests' }
SDL3FileTest >> test05BasePath [
	
	self assert:
		(FileLocator vmDirectory asPath <=
			sdl getBasePath asFileReference asPath)
]

{ #category : 'tests' }
SDL3FileTest >> test06CreateRenameRemoveDirectory [
	
	| randomString directoryA directoryB |
	randomString := UUID new asString36.
	directoryA := FileSystem workingDirectory / ('test' , randomString, 'A').
	directoryB := FileSystem workingDirectory / ('test' , randomString, 'B').
	self deny: directoryA exists.
	self deny: directoryB exists.

	"Create a directory"
	sdl assertSuccess: (sdl newDirectory: directoryA pathString).
	self assert: directoryA exists.

	"Rename it"
	sdl assertSuccess:
		(sdl
			renamePathOldpath: directoryA pathString
			newpath: directoryB pathString).
	self deny: directoryA exists.
	self assert: directoryB exists.

	"Remove it (with new path)"
	sdl assertSuccess: (sdl removePath: directoryB pathString).
	self deny: directoryA exists.

]
