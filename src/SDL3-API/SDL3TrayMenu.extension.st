Extension { #name : 'SDL3TrayMenu' }

{ #category : '*SDL3-API' }
SDL3TrayMenu >> getEntriesIntoCount: count [

	^ self ffiLibrary getTrayEntriesMenu: self count: count
]

{ #category : '*SDL3-API' }
SDL3TrayMenu >> insertEntryAt: pos label: label flags: flags [

	^ (self ffiLibrary
		   insertTrayEntryAtMenu: self
		   pos: pos
		   label: label
		   flags: flags)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-API' }
SDL3TrayMenu >> parentEntryIfPresent: presentBlock ifAbsent: absentBlock [

	| result |
	result := self ffiLibrary getTrayMenuParentEntry: self.
	^ result isNull
		ifTrue: [ absentBlock value ]
		ifFalse: [ presentBlock value: result ]
]

{ #category : '*SDL3-API' }
SDL3TrayMenu >> parentEntryOrNil [

	^ self parentEntryIfPresent: [ :e | e ] ifAbsent: [ nil ]
]

{ #category : '*SDL3-API' }
SDL3TrayMenu >> parentTrayIfPresent: presentBlock ifAbsent: absentBlock [

	| result |
	result := self ffiLibrary getTrayMenuParentTray: self.
	^ result isNull
		ifTrue: [ absentBlock value ]
		ifFalse: [ presentBlock value: result ]
]

{ #category : '*SDL3-API' }
SDL3TrayMenu >> parentTrayOrNil [

	^ self parentTrayIfPresent: [ :e | e ] ifAbsent: [ nil ]
]
