Extension { #name : 'S3Enumeration' }

{ #category : '*SDL3-Own' }
S3Enumeration >> asInteger [

	^ value
]

{ #category : '*SDL3-Own' }
S3Enumeration >> bitOr: anInteger [

	^ self asInteger bitOr: anInteger
]

{ #category : '*SDL3-Own' }
S3Enumeration class >> enumDeclCommonPrefix [

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
S3Enumeration class >> enumDeclToCamelCaseAt: aName prefix: prefix [

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
S3Enumeration class >> enumDeclToCamelCaseAt: aName prefix: prefix givenInvalidName: invalidName [

	invalidName first isDigit ifFalse: [ self error ].

	^ 'at', invalidName
]

{ #category : '*SDL3-Own' }
S3Enumeration class >> enumDeclToCamelCaseDictionary [

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
S3Enumeration class >> initialize [

	self allSubclassesDo: [ :each |
		each
			initializeEnumeration;
			rebuildEnumAccessors ]
]

{ #category : '*SDL3-Own' }
S3Enumeration >> | another [

	^ self asInteger | another asInteger
]
