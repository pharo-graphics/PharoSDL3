"
I represent an in-flight or completed asynchronous I/O task managed by an SDL3AsyncIOScheduler.

I encapsulate task identification, synchronization via #wait (backed by a Semaphore), callbacks, and outcome dispatch.
"
Class {
	#name : 'SDL3AsyncTask',
	#superclass : 'Object',
	#instVars : [
		'id',
		'userdataAddress',
		'result',
		'error',
		'isCompleted',
		'isFailed',
		'onCompleteBlock',
		'onFailureBlock',
		'resultBlock',
		'completionSemaphore'
	],
	#category : 'SDL3-AsyncIOScheduler',
	#package : 'SDL3-AsyncIOScheduler'
}

{ #category : 'operations' }
SDL3AsyncTask >> completeWith: aValue [

	result := aValue.
	isCompleted := true.
	onCompleteBlock ifNotNil: [ onCompleteBlock cull: aValue ].
	completionSemaphore signal
]

{ #category : 'dispatching' }
SDL3AsyncTask >> completeWithOutcome: anOutcome [

	| value |
	value := resultBlock
		ifNil: [
			anOutcome isClose
				ifTrue: [ true ]
				ifFalse: [ anOutcome bytesTransferred ] ]
		ifNotNil: [ resultBlock cull: anOutcome ].
	self completeWith: value
]

{ #category : 'accessing' }
SDL3AsyncTask >> error [

	^ error
]

{ #category : 'operations' }
SDL3AsyncTask >> failWith: anError [

	error := anError.
	isFailed := true.
	onFailureBlock ifNotNil: [ onFailureBlock cull: anError ].
	completionSemaphore signal
]

{ #category : 'accessing' }
SDL3AsyncTask >> id [

	^ id
]

{ #category : 'accessing' }
SDL3AsyncTask >> id: anInteger [

	id := anInteger.
	userdataAddress := ExternalAddress fromAddress: anInteger
]

{ #category : 'initialization' }
SDL3AsyncTask >> initialize [

	super initialize.
	isCompleted := false.
	isFailed := false.
	completionSemaphore := Semaphore new
]

{ #category : 'testing' }
SDL3AsyncTask >> isCompleted [

	^ isCompleted
]

{ #category : 'testing' }
SDL3AsyncTask >> isFailed [

	^ isFailed
]

{ #category : 'callbacks' }
SDL3AsyncTask >> onComplete: aBlock [

	onCompleteBlock := aBlock.
	isCompleted ifTrue: [ aBlock cull: result ].
	^ self
]

{ #category : 'callbacks' }
SDL3AsyncTask >> onFailure: aBlock [

	onFailureBlock := aBlock.
	isFailed ifTrue: [ aBlock cull: error ].
	^ self
]

{ #category : 'printing' }
SDL3AsyncTask >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: 'task #';
		print: id;
		nextPutAll: (isCompleted ifTrue: [ ' completed' ] ifFalse: [ isFailed ifTrue: [ ' failed' ] ifFalse: [ ' pending' ] ]);
		nextPut: $)
]

{ #category : 'accessing' }
SDL3AsyncTask >> result [

	^ result
]

{ #category : 'accessing' }
SDL3AsyncTask >> resultBlock: aBlock [

	resultBlock := aBlock
]

{ #category : 'accessing' }
SDL3AsyncTask >> userdataAddress [

	^ userdataAddress
]

{ #category : 'synchronization' }
SDL3AsyncTask >> wait [
	"Suspend the active Smalltalk Process on a Semaphore until this task finishes and answer the result.
	If the task failed, signal an error.
	Requires the scheduler owner (e.g., SDL3App or a worker process) to be driving #step."

	isCompleted ifTrue: [ ^ result ].
	isFailed ifTrue: [ error signal ].
	completionSemaphore wait.
	isFailed ifTrue: [ error signal ].
	^ result
]

{ #category : 'synchronization' }
SDL3AsyncTask >> waitTimeoutMilliseconds: aNumber [
	"Suspend the active Smalltalk Process on a Semaphore for at most aNumber milliseconds or until this task finishes.
	Answer the result or signal an error if the wait timed out or failed.
	Requires the scheduler owner (e.g., SDL3App or a worker process) to be driving #step."

	isCompleted ifTrue: [ ^ result ].
	isFailed ifTrue: [ error signal ].
	(completionSemaphore waitTimeoutMilliseconds: aNumber)
		ifTrue: [ SDL3Error signal: 'Async I/O task timed out' ].
	isFailed ifTrue: [ error signal ].
	^ result
]
