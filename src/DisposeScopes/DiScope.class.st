"
I am a lexical and ambient resource scope for deterministic unmanaged resource disposal.

I maintain an ordered collection of owned disposable objects and tear them down in reverse LIFO order upon scope exit or disposal.

I provide #during: to establish a process-local ambient scope, as well as #own:, #ownAll:, #dispose:andOwn:, #disposeAndDisown:, #disown:, and #disposeAll.
"
Class {
	#name : 'DiScope',
	#superclass : 'Object',
	#instVars : [
		'disposables'
	],
	#category : 'DisposeScopes-Base',
	#package : 'DisposeScopes',
	#tag : 'Base'
}

{ #category : 'accessing' }
DiScope class >> current [

	^ DiCurrentScope value
]

{ #category : 'adding' }
DiScope class >> disown: aDisposable [

	^ self current disown: aDisposable
]

{ #category : 'adding' }
DiScope class >> dispose: aDisposable andOwn: aNewDisposable [

	^ self current dispose: aDisposable andOwn: aNewDisposable
]

{ #category : 'resource management' }
DiScope class >> disposeAndDisown: aDisposable [

	^ self current disposeAndDisown: aDisposable
]

{ #category : 'controlling' }
DiScope class >> during: aBlock [

	| scope |
	scope := self new.
	^ DiCurrentScope value: scope during: [ aBlock ensure: [ scope disposeAll ] ]
]

{ #category : 'adding' }
DiScope class >> own: aDisposable [

	^ self current own: aDisposable
]

{ #category : 'adding' }
DiScope class >> ownAll: aCollection [

	^ self current ownAll: aCollection
]

{ #category : 'adding' }
DiScope >> disown: aDisposable [

	disposables remove: aDisposable ifAbsent: [ ].
	^ aDisposable
]

{ #category : 'accessing' }
DiScope >> disposables [

	^ disposables
]

{ #category : 'adding' }
DiScope >> dispose: aDisposable andOwn: aNewDisposable [

	| index |
	aDisposable ifNil: [ ^ self own: aNewDisposable ].

	aDisposable dispose.

	index := disposables indexOf: aDisposable.
	index = 0
		ifTrue: [ self own: aNewDisposable ]
		ifFalse: [ disposables at: index put: aNewDisposable ].

	^ aNewDisposable
]

{ #category : 'resource management' }
DiScope >> disposeAll [

	disposables reverseDo: [ :each | each dispose ].
	disposables removeAll
]

{ #category : 'resource management' }
DiScope >> disposeAndDisown: aDisposable [

	aDisposable ifNil: [ ^ nil ].
	aDisposable dispose.
	self disown: aDisposable.
	^ nil
]

{ #category : 'initialization' }
DiScope >> initialize [

	super initialize.
	disposables := OrderedCollection new
]

{ #category : 'adding' }
DiScope >> own: aDisposable [

	disposables addLast: aDisposable.
	^ aDisposable
]

{ #category : 'adding' }
DiScope >> ownAll: aCollection [

	disposables addAll: aCollection.
	^ aCollection
]
