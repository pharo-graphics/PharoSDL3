Class {
	#name : 'SDL3MockDisposable',
	#superclass : 'Object',
	#instVars : [
		'disposeCount'
	],
	#category : 'SDL3-Tests-OwnSlot',
	#package : 'SDL3-Tests',
	#tag : 'OwnSlot'
}

{ #category : 'actions' }
SDL3MockDisposable >> dispose [

	disposeCount := disposeCount + 1
]

{ #category : 'accessing' }
SDL3MockDisposable >> disposeCount [

	^ disposeCount
]

{ #category : 'initialization' }
SDL3MockDisposable >> initialize [

	super initialize.
	disposeCount := 0
]

{ #category : 'testing' }
SDL3MockDisposable >> isDisposed [

	^ disposeCount > 0
]
