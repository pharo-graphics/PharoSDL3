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
