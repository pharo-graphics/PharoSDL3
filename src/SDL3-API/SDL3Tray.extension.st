Extension { #name : 'SDL3Tray' }

{ #category : '*SDL3-API' }
SDL3Tray >> destroy [

	^ self ffiLibrary destroyTray: self
]

{ #category : '*SDL3-API' }
SDL3Tray >> icon: icon [

	^ self ffiLibrary setTrayIconTray: self icon: icon
]

{ #category : '*SDL3-API' }
SDL3Tray >> menu [

	^ self ffiLibrary getTrayMenu: self
]

{ #category : '*SDL3-API' }
SDL3Tray >> newMenu [

	^ self ffiLibrary newTrayMenu: self
]

{ #category : '*SDL3-API' }
SDL3Tray >> tooltip: tooltip [

	^ self ffiLibrary setTrayTooltipTray: self tooltip: tooltip
]
