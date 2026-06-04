Extension { #name : 'SDL3Tray' }

{ #category : '*SDL3-Own' }
SDL3Tray class >> unsafeNewIcon: icon tooltip: tooltip [

	^ (self ffiLibrary newTrayIcon: icon tooltip: tooltip)
		  assertNotNullReturn;
		  yourself
]
