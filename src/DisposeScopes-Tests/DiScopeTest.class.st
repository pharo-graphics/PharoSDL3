"
I am the unit test suite for DiScope, verifying deterministic LIFO disposal, nested ambient scoping, exception resilience, and bulk registration.
"
Class {
	#name : 'DiScopeTest',
	#superclass : 'TestCase',
	#category : 'DisposeScopes-Tests-Tests',
	#package : 'DisposeScopes-Tests',
	#tag : 'Tests'
}

{ #category : 'tests' }
DiScopeTest >> test01InstanceScopeAddsAndDisposesInReverseLIFOOrder [

	| scope order d1 d2 d3 |
	order := OrderedCollection new.
	d1 := DiMockDisposable new onDisposeAddTo: order; yourself.
	d2 := DiMockDisposable new onDisposeAddTo: order; yourself.
	d3 := DiMockDisposable new onDisposeAddTo: order; yourself.
	scope := DiScope new.
	scope own: d1.
	scope own: d2.
	scope own: d3.
	self deny: d1 isDisposed.
	self deny: d2 isDisposed.
	self deny: d3 isDisposed.
	self assert: scope disposables size equals: 3.

	scope disposeAll.
	self assert: d1 isDisposed.
	self assert: d2 isDisposed.
	self assert: d3 isDisposed.
	self assert: scope disposables isEmpty.
	self assert: order asArray equals: { d3. d2. d1 }
]

{ #category : 'tests' }
DiScopeTest >> test02InstanceScopeAddAll [

	| scope d1 d2 result |
	d1 := DiMockDisposable new.
	d2 := DiMockDisposable new.
	scope := DiScope new.
	result := scope ownAll: { d1. d2 }.
	self assert: result size equals: 2.
	self assert: scope disposables size equals: 2.
	self deny: d1 isDisposed.
	self deny: d2 isDisposed.

	scope disposeAll.
	self assert: d1 isDisposed.
	self assert: d2 isDisposed.
	self assert: scope disposables isEmpty
]

{ #category : 'tests' }
DiScopeTest >> test03AmbientScopeDuringExecutesAndDisposesAutomatically [

	| order d1 d2 result |
	order := OrderedCollection new.
	d1 := DiMockDisposable new onDisposeAddTo: order; yourself.
	d2 := DiMockDisposable new onDisposeAddTo: order; yourself.
	result :=
		DiScope during: [
			DiScope own: d1.
			DiScope own: d2.
			self assert: DiScope current disposables size equals: 2.
			self deny: d1 isDisposed.
			self deny: d2 isDisposed.
			-1 ].
	self assert: result equals: -1.
	self assert: d1 isDisposed.
	self assert: d2 isDisposed.
	self assert: order asArray equals: { d2. d1 }.
	self assert: DiScope current isNil
]

{ #category : 'tests' }
DiScopeTest >> test04AmbientScopeDuringDisposesOnException [

	| order d1 d2 |
	order := OrderedCollection new.
	d1 := DiMockDisposable new onDisposeAddTo: order; yourself.
	d2 := DiMockDisposable new onDisposeAddTo: order; yourself.
	[
		DiScope during: [
			DiScope own: d1.
			DiScope own: d2.
			self error: 'Simulated failure' ] ]
		on: Error
		do: [ :ex | "Expected error caught" ].
	self assert: d1 isDisposed.
	self assert: d2 isDisposed.
	self assert: order asArray equals: { d2. d1 }.
	self assert: DiScope current isNil
]

{ #category : 'tests' }
DiScopeTest >> test05AmbientScopeNestedDuring [

	| d1 d2 |
	d1 := DiMockDisposable new.
	d2 := DiMockDisposable new.
	DiScope during: [
		DiScope own: d1.
		DiScope during: [
			DiScope own: d2.
			self deny: d2 isDisposed.
			self deny: d1 isDisposed ].
		self assert: d2 isDisposed.
		self deny: d1 isDisposed ].
	self assert: d1 isDisposed.
	self assert: DiScope current isNil
]

{ #category : 'tests' }
DiScopeTest >> test06InsideAssignmentIdiom [

	| d1 assigned |
	d1 := DiMockDisposable new.
	DiScope during: [
		DiScope own: (assigned := d1).
		self assert: assigned identicalTo: d1.
		self deny: assigned isDisposed ].
	self assert: assigned isDisposed
]

{ #category : 'tests' }
DiScopeTest >> test07DisposeAndOwnSubstitutesInLIFOOrder [

	| scope order d1 d2 d3 d4 replaced |
	order := OrderedCollection new.
	d1 := DiMockDisposable new onDisposeAddTo: order; yourself.
	d2 := DiMockDisposable new onDisposeAddTo: order; yourself.
	d3 := DiMockDisposable new onDisposeAddTo: order; yourself.
	d4 := DiMockDisposable new onDisposeAddTo: order; yourself.
	scope := DiScope new.
	scope own: d1.
	scope own: d2.
	scope own: d3.
	self assert: scope disposables asArray equals: { d1. d2. d3 }.

	replaced := scope dispose: d2 andOwn: d4.
	self assert: replaced identicalTo: d4.
	self assert: d2 isDisposed.
	self deny: d4 isDisposed.
	self assert: scope disposables asArray equals: { d1. d4. d3 }.

	scope disposeAll.
	self assert: d4 isDisposed.
	self assert: d1 isDisposed.
	self assert: d3 isDisposed.
	self assert: order asArray equals: { d2. d3. d4. d1 }
]

{ #category : 'tests' }
DiScopeTest >> test08DisposeAndDisownRemovesFromScope [

	| d1 |
	d1 := DiMockDisposable new.
	DiScope during: [
		DiScope own: d1.
		self assert: DiScope current disposables asArray equals: { d1 }.
		self deny: d1 isDisposed.

		DiScope disposeAndDisown: d1.
		self assert: d1 isDisposed.
		self assert: DiScope current disposables isEmpty.

		d1 initialize.
		self deny: d1 isDisposed ].
	self deny: d1 isDisposed
]

{ #category : 'tests' }
DiScopeTest >> test09DisownLeavesUndisposed [

	| d1 result scope |
	d1 := DiMockDisposable new.
	scope := DiScope new.
	scope own: d1.
	self assert: scope disposables asArray equals: { d1 }.

	result := scope disown: d1.
	self assert: result identicalTo: d1.
	self assert: scope disposables isEmpty.
	scope disposeAll.
	self deny: d1 isDisposed.

	DiScope during: [
		DiScope own: d1.
		self assert: DiScope current disposables asArray equals: { d1 }.

		result := DiScope disown: d1.
		self assert: result identicalTo: d1.
		self assert: DiScope current disposables isEmpty ].
	self deny: d1 isDisposed
]

{ #category : 'tests' }
DiScopeTest >> test10DisposeWithNilOldActsAsOwn [

	| d1 assigned |
	d1 := DiMockDisposable new.
	DiScope during: [
		assigned := DiScope dispose: nil andOwn: d1.
		self assert: assigned identicalTo: d1.
		self assert: DiScope current disposables asArray equals: { d1 }.
		self deny: assigned isDisposed ].
	self assert: assigned isDisposed
]
