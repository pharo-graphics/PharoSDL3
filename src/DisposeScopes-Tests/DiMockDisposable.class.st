"
I am a mock disposable object used for testing deterministic DiScope resource teardown.
"
Class {
	#name : 'DiMockDisposable',
	#superclass : 'Object',
	#instVars : [
		'disposeCount',
		'disposedCollection'
	],
	#category : 'DisposeScopes-Tests-Mocks',
	#package : 'DisposeScopes-Tests',
	#tag : 'Mocks'
}

{ #category : 'actions' }
DiMockDisposable >> dispose [

	disposeCount := disposeCount + 1.
	disposedCollection ifNotNil: [ disposedCollection add: self ]
]

{ #category : 'accessing' }
DiMockDisposable >> disposeCount [

	^ disposeCount
]

{ #category : 'initialization' }
DiMockDisposable >> initialize [

	super initialize.
	disposeCount := 0
]

{ #category : 'testing' }
DiMockDisposable >> isDisposed [

	^ disposeCount > 0
]

{ #category : 'initialization' }
DiMockDisposable >> onDisposeAddTo: aList [

	disposedCollection := aList
]

{ #category : 'printing' }
DiMockDisposable >> printOn: aStream [

	super printOn: aStream.

	aStream
		nextPutAll: '(';
		print: self identityHash;
		nextPutAll: ')'
]
