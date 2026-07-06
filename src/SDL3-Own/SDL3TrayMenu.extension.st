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
