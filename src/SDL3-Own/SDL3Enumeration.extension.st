Extension { #name : 'SDL3Enumeration' }

{ #category : '*SDL3-Own' }
SDL3Enumeration class >> allValues [

	^ Array streamContents: [ :stream |
		self allValuesDo: [ :each | stream nextPut: each ] ]
]

{ #category : '*SDL3-Own' }
SDL3Enumeration class >> allValuesDo: aBlock [

	self withAllSuperclassesDo: [ :eachClass |
		eachClass = SDL3Enumeration
			ifFalse: [
				eachClass classPool valuesDo: [ :eachValue |
					aBlock value: eachValue ] ]
			ifTrue: [ ^ self "done!" ] ]
]

{ #category : '*SDL3-Own' }
SDL3Enumeration >> asInteger [

	^ value asInteger
]

{ #category : '*SDL3-Own' }
SDL3Enumeration class >> enumDeclCommonPrefix [

	| shortestName names |
	names := self enumDecl
		pairsCollect: [ :eachName :eachValue | eachName ].

	shortestName := names detectMin: [ :each | each size ].

	shortestName withIndexDo: [ :char :i |
		(names allSatisfy: [ :each | (each at: i) = char ])
			ifFalse: [ ^ shortestName first: i - 1 ] ].

	^ shortestName
]

{ #category : '*SDL3-Own' }
SDL3Enumeration class >> enumDeclToCamelCaseAt: aName prefix: prefix [

	| newName |
	newName := aName withoutPrefix: prefix.
	newName := String streamContents: [ :stringStream |
		($_ split: newName) do: [ :each |
			stringStream << each asLowercase asCamelCase ] ].
	newName := newName uncapitalized.

	newName isValidSelector ifFalse: [
		newName :=
			self
				enumDeclToCamelCaseAt: aName
				prefix: prefix
				givenInvalidName: newName ].
	
	^ newName
]

{ #category : '*SDL3-Own' }
SDL3Enumeration class >> enumDeclToCamelCaseAt: aName prefix: prefix givenInvalidName: invalidName [

	invalidName first isDigit ifFalse: [ self error ].

	^ 'at', invalidName
]

{ #category : '*SDL3-Own' }
SDL3Enumeration class >> enumDeclToCamelCaseDictionary [

	| prefix result |
	"Must take another approach if there is only one pair"
	self assert: [ self enumDecl size > 2 ].

	prefix := self enumDeclCommonPrefix.
	result := OrderedDictionary new.

	self enumDecl pairsDo: [ :aName :aValue |
		result
			at: aName
			put: (self enumDeclToCamelCaseAt: aName prefix: prefix) ].

	^ result
]

{ #category : '*SDL3-Own' }
SDL3Enumeration class >> initialize [
	"We take the responsibility of initializing the whole hierarchy.
	Why? To avoid duplication of initialize on each subclass.
	However, we have to only initialize subclasses that define #enumDecl on classSide."

	self allSubclassesDo: [ :each |
		(each classSide includesSelector: #enumDecl) ifTrue: [
			each initializeEnumeration ] ]
]
