Extension { #name : 'SDL3TrayEntry' }

{ #category : '*SDL3-API' }
SDL3TrayEntry >> callback: callback userdata: userdata [

	^ self ffiLibrary
		  setTrayEntryCallbackEntry: self
		  callback: callback
		  userdata: userdata
]

{ #category : '*SDL3-API' }
SDL3TrayEntry >> checked [

	^ self ffiLibrary getTrayEntryChecked: self
]

{ #category : '*SDL3-API' }
SDL3TrayEntry >> checked: checked [

	^ self ffiLibrary setTrayEntryCheckedEntry: self checked: checked
]

{ #category : '*SDL3-API' }
SDL3TrayEntry >> click [

	^ self ffiLibrary clickTrayEntry: self
]

{ #category : '*SDL3-API' }
SDL3TrayEntry >> enabled [

	^ self ffiLibrary getTrayEntryEnabled: self
]

{ #category : '*SDL3-API' }
SDL3TrayEntry >> enabled: enabled [

	^ self ffiLibrary setTrayEntryEnabledEntry: self enabled: enabled
]

{ #category : '*SDL3-API' }
SDL3TrayEntry >> label [

	^ self ffiLibrary getTrayEntryLabel: self
]

{ #category : '*SDL3-API' }
SDL3TrayEntry >> label: label [

	^ self ffiLibrary setTrayEntryLabelEntry: self label: label
]

{ #category : '*SDL3-API' }
SDL3TrayEntry >> newSubmenu [

	^ self ffiLibrary newTraySubmenu: self
]

{ #category : '*SDL3-API' }
SDL3TrayEntry >> parent [

	^ self ffiLibrary getTrayEntryParent: self
]

{ #category : '*SDL3-API' }
SDL3TrayEntry >> remove [

	^ self ffiLibrary removeTrayEntry: self
]

{ #category : '*SDL3-API' }
SDL3TrayEntry >> submenu [

	^ self ffiLibrary getTraySubmenu: self
]
