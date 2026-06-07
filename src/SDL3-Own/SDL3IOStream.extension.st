Extension { #name : 'SDL3IOStream' }

{ #category : '*SDL3-Own' }
SDL3IOStream class >> unsafeOpenIface: iface userdata: userdata [

	^ (self ffiLibrary openIOIface: iface userdata: userdata)
		  assertNotNullReturn;
		  yourself
]
