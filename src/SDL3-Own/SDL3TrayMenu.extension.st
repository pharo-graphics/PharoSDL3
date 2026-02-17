Extension { #name : 'SDL3TrayMenu' }

{ #category : '*SDL3-Own' }
SDL3TrayMenu >> entries [
	"Answer an array of entries in the menu, in order."

	| countBuffer first count array |
	countBuffer := FFIInt32 newBuffer.
	first := (self getEntriesIntoCount: countBuffer) getHandle.
	count := countBuffer int32AtOffset: 0.
	array := first readStructArrayFromPointers: SDL3TrayEntry size: count.
	"Note: We do not free the returned array because we aren't the owners"
	^ array
]
