"
I represent a property group that is identified by its `SDL_DisplayID`.
"
Class {
	#name : 'SDL3Display',
	#superclass : 'SDL3BaseIDObject',
	#category : 'SDL3-Own-IDObjects',
	#package : 'SDL3-Own',
	#tag : 'IDObjects'
}

{ #category : 'accessing' }
SDL3Display class >> primary [

	| id |
	id := self ffiLibrary getPrimaryDisplay.
	self ffiLibrary assertSuccess: id > 0.
	^ self id: id 
]

{ #category : 'accessing' }
SDL3Display class >> primaryDisplayID [

	^ self ffiLibrary getPrimaryDisplay
]

{ #category : 'accessing' }
SDL3Display >> bounds [

	| sdlRect |
	sdlRect := SDL_Rect new.

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getDisplayBoundsDisplayID: id
			rect: sdlRect).

	^ sdlRect
]

{ #category : 'accessing' }
SDL3Display >> contentScale [

	^ self ffiLibrary getDisplayContentScale: id
]

{ #category : 'accessing' }
SDL3Display >> currentDisplayMode [

	^ self ffiLibrary getCurrentDisplayMode: id
]

{ #category : 'accessing' }
SDL3Display >> currentDisplayOrientation [

	^ self ffiLibrary getCurrentDisplayOrientation: id
]

{ #category : 'accessing' }
SDL3Display >> desktopDisplayMode [

	^ self ffiLibrary getDesktopDisplayMode: id
]

{ #category : 'accessing' }
SDL3Display >> direct3D9AdapterIndex [

	^ self ffiLibrary getDirect3D9AdapterIndex: id
]

{ #category : 'accessing' }
SDL3Display >> fullscreenDisplayModes [
	"Answer an array of fullscreen display modes available on a display."

	| countValueHolder first count array |
	countValueHolder := FFIInt32 newValueHolder.

	first := self ffiLibrary
		getFullscreenDisplayModesDisplayID: id
		count: countValueHolder.
	count := countValueHolder value.

	array := first
		readStructArrayFromPointers: SDL_DisplayMode
		size: count.

	self ffiLibrary free: first.

	^ array
]

{ #category : 'accessing' }
SDL3Display >> getClosestFullscreenDisplayModeIntoW: w h: h refreshRate: refreshRate includeHighDensityModes: includeHighDensityModes closest: closest [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getClosestFullscreenDisplayModeDisplayID: id
			w: w
			h: h
			refreshRate: refreshRate
			includeHighDensityModes: includeHighDensityModes
			closest: closest)
]

{ #category : 'accessing' }
SDL3Display >> getDXGIOutputInfoIntoAdapterIndex: adapterIndex outputIndex: outputIndex [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getDXGIOutputInfoDisplayID: id
			adapterIndex: adapterIndex
			outputIndex: outputIndex)
]

{ #category : 'testing' }
SDL3Display >> isPrimary [

	^ id = self class primaryDisplayID
]

{ #category : 'accessing' }
SDL3Display >> name [

	^ self ffiLibrary getDisplayName: id
]

{ #category : 'accessing' }
SDL3Display >> naturalDisplayOrientation [

	^ self ffiLibrary getNaturalDisplayOrientation: id
]

{ #category : 'printing' }
SDL3Display >> printPropertiesOn: aStream [

	aStream
		nextPutAll: ' name: ';
		print: self name.
	aStream
		nextPutAll: ' isPrimary: ';
		print: self isPrimary.
	aStream
		nextPutAll: ' bounds: ';
		print: self bounds
]

{ #category : 'accessing' }
SDL3Display >> propertiesID [

	^ self ffiLibrary getDisplayProperties: id
]

{ #category : 'accessing' }
SDL3Display >> propertyGroup [

	^ SDL3PropertyGroup id: self propertiesID
]

{ #category : 'accessing' }
SDL3Display >> usableBounds [

	| sdlRect |
	sdlRect := SDL_Rect new.

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			getDisplayUsableBoundsDisplayID: id
			rect: sdlRect).

	^ sdlRect
]
