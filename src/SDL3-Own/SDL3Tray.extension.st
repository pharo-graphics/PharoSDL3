Extension { #name : 'SDL3Tray' }

{ #category : '*SDL3-Own' }
SDL3Tray >> destroy [

	self ffiLibrary destroyTray: self
]

{ #category : '*SDL3-Own' }
SDL3Tray >> icon: icon [

	self ffiLibrary setTrayIconTray: self icon: icon
]

{ #category : '*SDL3-Own' }
SDL3Tray >> menu [

	^ self ffiLibrary getTrayMenu: self
]

{ #category : '*SDL3-Own' }
SDL3Tray >> newMenu [

	^ self ffiLibrary newTrayMenu: self
]

{ #category : '*SDL3-Own' }
SDL3Tray >> tooltip: tooltip [

	self ffiLibrary setTrayTooltipTray: self tooltip: tooltip
]

{ #category : '*SDL3-Own' }
SDL3Tray class >> unsafeNewIcon: icon tooltip: tooltip [

	^ (self ffiLibrary newTrayIcon: icon tooltip: tooltip)
		  assertNotNullReturn;
		  yourself
]
