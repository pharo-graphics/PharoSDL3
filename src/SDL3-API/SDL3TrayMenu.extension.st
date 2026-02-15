Extension { #name : 'SDL3TrayMenu' }

{ #category : '*SDL3-API' }
SDL3TrayMenu >> getEntriesIntoCount: count [

	^ self ffiLibrary getTrayEntriesMenu: self count: count
]

{ #category : '*SDL3-API' }
SDL3TrayMenu >> insertEntryAt: pos label: label flags: flags [

	^ self ffiLibrary
		  insertTrayEntryAtMenu: self
		  pos: pos
		  label: label
		  flags: flags
]

{ #category : '*SDL3-API' }
SDL3TrayMenu >> parentEntry [

	^ self ffiLibrary getTrayMenuParentEntry: self
]

{ #category : '*SDL3-API' }
SDL3TrayMenu >> parentTray [

	^ self ffiLibrary getTrayMenuParentTray: self
]
