"
I am a SDL3 FFI binding for `SDL_TrayMenu`.

An opaque handle representing a menu/submenu on a system tray object.

See: https://wiki.libsdl.org/SDL3/SDL_TrayMenu
"
Class {
	#name : 'SDL3TrayMenu',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing' }
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

{ #category : 'accessing' }
SDL3TrayMenu >> getEntriesIntoCount: count [

	^ self ffiLibrary getTrayEntriesMenu: self count: count
]

{ #category : 'accessing' }
SDL3TrayMenu >> insertEntryAt: pos label: label flags: flags [

	^ (self ffiLibrary
		   insertTrayEntryAtMenu: self
		   pos: pos
		   label: label
		   flags: flags)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'accessing' }
SDL3TrayMenu >> parentEntryIfPresent: presentBlock ifAbsent: absentBlock [

	| result |
	result := self ffiLibrary getTrayMenuParentEntry: self.
	^ result isNull
		ifTrue: [ absentBlock value ]
		ifFalse: [ presentBlock value: result ]
]

{ #category : 'accessing' }
SDL3TrayMenu >> parentEntryOrNil [

	^ self parentEntryIfPresent: [ :e | e ] ifAbsent: [ nil ]
]

{ #category : 'accessing' }
SDL3TrayMenu >> parentTrayIfPresent: presentBlock ifAbsent: absentBlock [

	| result |
	result := self ffiLibrary getTrayMenuParentTray: self.
	^ result isNull
		ifTrue: [ absentBlock value ]
		ifFalse: [ presentBlock value: result ]
]

{ #category : 'accessing' }
SDL3TrayMenu >> parentTrayOrNil [

	^ self parentTrayIfPresent: [ :e | e ] ifAbsent: [ nil ]
]
