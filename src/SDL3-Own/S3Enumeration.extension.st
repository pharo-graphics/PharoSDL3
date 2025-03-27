Extension { #name : 'S3Enumeration' }

{ #category : '*SDL3-Own' }
S3Enumeration class >> initialize [

	self allSubclassesDo: [ :each |
		each
			initializeEnumeration;
			rebuildEnumAccessors ]
]
