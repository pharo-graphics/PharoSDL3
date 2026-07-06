Extension { #name : 'SDL3TrayMenu' }

{ #category : '*SDL3-Own' }
SDL3TrayMenu >> entries [
	"Answer an array of entries in the menu, in order."

	| valueHolder first count array |
	valueHolder := FFIInt32 newValueHolder.
	first := (self getEntriesIntoCount: valueHolder) getHandle.
	count := valueHolder value.
	array := first readPointerArrayOf: SDL3TrayEntry size: count.
	"Note: We do not free the returned array because we aren't the owners"
	^ array
]

{ #category : '*SDL3-Own' }
SDL3TrayMenu >> getEntriesIntoCount: count [

	^ self ffiLibrary getTrayEntriesMenu: self count: count
]

{ #category : '*SDL3-Own' }
SDL3TrayMenu >> insertEntryAt: pos label: label flags: flags [

	^ (self ffiLibrary
		   insertTrayEntryAtMenu: self
		   pos: pos
		   label: label
		   flags: flags)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-Own' }
SDL3TrayMenu >> parentEntryIfPresent: presentBlock ifAbsent: absentBlock [

	| result |
	result := self ffiLibrary getTrayMenuParentEntry: self.
	^ result isNull
		ifTrue: [ absentBlock value ]
		ifFalse: [ presentBlock value: result ]
]

{ #category : '*SDL3-Own' }
SDL3TrayMenu >> parentEntryOrNil [

	^ self parentEntryIfPresent: [ :e | e ] ifAbsent: [ nil ]
]

{ #category : '*SDL3-Own' }
SDL3TrayMenu >> parentTrayIfPresent: presentBlock ifAbsent: absentBlock [

	| result |
	result := self ffiLibrary getTrayMenuParentTray: self.
	^ result isNull
		ifTrue: [ absentBlock value ]
		ifFalse: [ presentBlock value: result ]
]

{ #category : '*SDL3-Own' }
SDL3TrayMenu >> parentTrayOrNil [

	^ self parentTrayIfPresent: [ :e | e ] ifAbsent: [ nil ]
]
