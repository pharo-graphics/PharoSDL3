"
I am a SDL3 FFI binding for `SDL_TrayEntry`.

An opaque handle representing an entry on a system tray object.

See: https://wiki.libsdl.org/SDL3/SDL_TrayEntry
"
Class {
	#name : 'SDL3TrayEntry',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing' }
SDL3TrayEntry >> callback: callback userdata: userdata [

	self ffiLibrary
		setTrayEntryCallbackEntry: self
		callback: callback
		userdata: userdata
]

{ #category : 'accessing' }
SDL3TrayEntry >> checked [

	^ self ffiLibrary getTrayEntryChecked: self
]

{ #category : 'accessing' }
SDL3TrayEntry >> checked: checked [

	self ffiLibrary setTrayEntryCheckedEntry: self checked: checked
]

{ #category : 'operations' }
SDL3TrayEntry >> click [

	self ffiLibrary clickTrayEntry: self
]

{ #category : 'accessing' }
SDL3TrayEntry >> enabled [

	^ self ffiLibrary getTrayEntryEnabled: self
]

{ #category : 'accessing' }
SDL3TrayEntry >> enabled: enabled [

	self ffiLibrary setTrayEntryEnabledEntry: self enabled: enabled
]

{ #category : 'accessing' }
SDL3TrayEntry >> label [

	^ self ffiLibrary getTrayEntryLabel: self
]

{ #category : 'accessing' }
SDL3TrayEntry >> label: label [

	self ffiLibrary setTrayEntryLabelEntry: self label: label
]

{ #category : 'instance creation' }
SDL3TrayEntry >> newSubmenu [

	^ self ffiLibrary createTraySubmenu: self
]

{ #category : 'accessing' }
SDL3TrayEntry >> parent [

	^ self ffiLibrary getTrayEntryParent: self
]

{ #category : 'operations' }
SDL3TrayEntry >> remove [

	self ffiLibrary removeTrayEntry: self
]

{ #category : 'accessing' }
SDL3TrayEntry >> submenu [

	^ self ffiLibrary getTraySubmenu: self
]
