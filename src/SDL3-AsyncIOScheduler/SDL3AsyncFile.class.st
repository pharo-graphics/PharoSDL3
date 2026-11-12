"
I represent an open file handle for asynchronous read and write operations managed by an SDL3AsyncIOScheduler.

I operate on off-heap memory buffers (ExternalAddress), eliminating VM memory pinning and garbage collection overhead.
"
Class {
	#name : 'SDL3AsyncFile',
	#superclass : 'Object',
	#instVars : [
		'asyncIO',
		'path',
		'mode',
		'scheduler',
		'isClosed'
	],
	#category : 'SDL3-AsyncIOScheduler',
	#package : 'SDL3-AsyncIOScheduler'
}

{ #category : 'instance creation' }
SDL3AsyncFile class >> onPath: aPath mode: aModeString scheduler: aScheduler [

	^ self basicNew
		initializeOnPath: aPath
		mode: aModeString
		scheduler: aScheduler;
		yourself
]

{ #category : 'closing' }
SDL3AsyncFile >> close [
	"Enqueue an asynchronous close task without flushing."

	^ self closeFlush: false
]

{ #category : 'closing' }
SDL3AsyncFile >> closeFlush: aBoolean [
	"Enqueue an asynchronous close task, optionally flushing to physical storage before completing."

	^ self
		closeFlush: aBoolean
		onComplete: nil
		onFailure: nil
]

{ #category : 'closing' }
SDL3AsyncFile >> closeFlush: aBoolean onComplete: aSuccessBlock onFailure: aFailureBlock [
	"Enqueue an asynchronous close task, optionally flushing to physical storage before completing."

	| task |
	isClosed ifTrue: [
		task := scheduler newTask.
		task completeWith: true.
		aSuccessBlock ifNotNil: [ aSuccessBlock cull: true ].
		^ task ].
	isClosed := true.
	scheduler ifNotNil: [ scheduler fileClosed: self ].
	task := scheduler newTask.
	task
		onComplete: aSuccessBlock;
		onFailure: aFailureBlock.
	scheduler queueTask: task during: [
		asyncIO
			closeOnQueue: scheduler queue
			flush: aBoolean
			userdata: task userdataAddress ].
	^ task
]

{ #category : 'finalization' }
SDL3AsyncFile >> dispose [
	"Synchronously dispose of the underlying asyncIO handle if not already closed."

	isClosed ifTrue: [ ^ self ].
	isClosed := true.
	scheduler ifNotNil: [ scheduler fileClosed: self ].
	asyncIO ifNotNil: [
		asyncIO isNull ifFalse: [ asyncIO dispose ] ]
]

{ #category : 'initialization' }
SDL3AsyncFile >> initialize [

	super initialize.
	isClosed := false
]

{ #category : 'initialization' }
SDL3AsyncFile >> initializeOnPath: aPath mode: aModeString scheduler: aScheduler [

	self initialize.
	path := aPath.
	mode := aModeString.
	scheduler := aScheduler.
	asyncIO := SDL3AsyncIO unownedFromFile: aPath mode: aModeString
]

{ #category : 'testing' }
SDL3AsyncFile >> isClosed [

	^ isClosed
]

{ #category : 'accessing' }
SDL3AsyncFile >> mode [

	^ mode
]

{ #category : 'accessing' }
SDL3AsyncFile >> path [

	^ path
]

{ #category : 'printing' }
SDL3AsyncFile >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: (path ifNil: [ 'unknown' ]);
		nextPutAll: ', mode: ';
		nextPutAll: (mode ifNil: [ '?' ]);
		nextPutAll: (isClosed ifTrue: [ ', closed' ] ifFalse: [ ', open' ]);
		nextPut: $)
]

{ #category : 'reading' }
SDL3AsyncFile >> readInto: anExternalAddress size: aByteSize at: anOffset [
	"Asynchronously read up to aByteSize bytes starting at anOffset into anExternalAddress. Answer an SDL3AsyncTask."

	^ self
		readInto: anExternalAddress
		size: aByteSize
		at: anOffset
		onComplete: nil
		onFailure: nil
]

{ #category : 'reading' }
SDL3AsyncFile >> readInto: anExternalAddress size: aByteSize at: anOffset onComplete: aSuccessBlock onFailure: aFailureBlock [
	"Asynchronously read up to aByteSize bytes starting at anOffset into anExternalAddress, evaluating aSuccessBlock with the number of bytes transferred."

	| task |
	task := scheduler newTask.
	task
		onComplete: aSuccessBlock;
		onFailure: aFailureBlock.
	scheduler queueTask: task during: [
		asyncIO
			readInto: anExternalAddress
			offset: anOffset
			size: aByteSize
			queue: scheduler queue
			userdata: task userdataAddress ].
	^ task
]

{ #category : 'accessing' }
SDL3AsyncFile >> scheduler [

	^ scheduler
]

{ #category : 'accessing' }
SDL3AsyncFile >> size [
	"Answer the size of the underlying file in bytes."

	^ asyncIO size
]

{ #category : 'writing' }
SDL3AsyncFile >> write: anExternalAddress size: aByteSize at: anOffset [
	"Asynchronously write aByteSize bytes from anExternalAddress starting at anOffset. Answer an SDL3AsyncTask."

	^ self
		write: anExternalAddress
		size: aByteSize
		at: anOffset
		onComplete: nil
		onFailure: nil
]

{ #category : 'writing' }
SDL3AsyncFile >> write: anExternalAddress size: aByteSize at: anOffset onComplete: aSuccessBlock onFailure: aFailureBlock [
	"Asynchronously write aByteSize bytes from anExternalAddress starting at anOffset, evaluating aSuccessBlock with the number of bytes transferred."

	| task |
	task := scheduler newTask.
	task
		onComplete: aSuccessBlock;
		onFailure: aFailureBlock.
	scheduler queueTask: task during: [
		asyncIO
			write: anExternalAddress
			offset: anOffset
			size: aByteSize
			queue: scheduler queue
			userdata: task userdataAddress ].
	^ task
]
