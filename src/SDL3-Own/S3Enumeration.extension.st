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
S3Enumeration class >> initialize [

	self allSubclassesDo: [ :each |
		each
			initializeEnumeration;
			rebuildEnumAccessors ]
]

{ #category : '*SDL3-Own' }
S3Enumeration class >> underscoreToCamelCaseDictionary [

	| prefix renames |
	"must take another approach if there is only one pair!"
	Halt if: [ self enumDecl size <= 2 ].

	prefix := self enumDeclCommonPrefix.
	renames := OrderedDictionary new.

	self enumDecl pairsDo: [ :eachName :eachValue |
		| newName |
		newName := eachName withoutPrefix: prefix.
		newName := String streamContents: [ :stringStream |
			($_ split: newName) do: [ :each |
				stringStream << each asLowercase asCamelCase ] ].
		newName := newName uncapitalized.

		newName first isDigit ifTrue: [
			newName := '_', newName ].
		Halt if: [newName isValidSelector not].

		renames at: eachName put: newName ].

	^ renames
]

{ #category : '*SDL3-Own' }
S3Enumeration >> | another [

	^ self asInteger | another asInteger
]
