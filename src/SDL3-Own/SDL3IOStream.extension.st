Extension { #name : 'SDL3IOStream' }

{ #category : '*SDL3-Own' }
SDL3IOStream >> addGamepadMappingsFromCloseio: closeio [

	^ self ffiLibrary addGamepadMappingsFromIOSrc: self closeio: closeio
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> closeIO [

	self ffiLibrary assertSuccess: (self ffiLibrary closeIO: self)
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> flushIO [

	self ffiLibrary assertSuccess: (self ffiLibrary flushIO: self)
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> ioProperties [

	^ self ffiLibrary getIOProperties: self
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> ioSize [

	^ self ffiLibrary getIOSize: self
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> ioStatus [

	^ self ffiLibrary getIOStatus: self
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> loadBMPCloseio: closeio [

	^ (self ffiLibrary loadBMPIOSrc: self closeio: closeio)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> loadFileDatasize: datasize closeio: closeio [

	^ self ffiLibrary loadFileIOSrc: self datasize: datasize closeio: closeio
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> loadPNGCloseio: closeio [

	^ (self ffiLibrary loadPNGIOSrc: self closeio: closeio)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> loadSurfaceCloseio: closeIO [

	^ (self ffiLibrary loadSurfaceIOSrc: self closeio: closeIO)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> loadWAVCloseio: closeIO spec: spec audioBuf: audioBuf audioLen: audioLen [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			loadWAVIOSrc: self
			closeio: closeIO
			spec: spec
			audioBuf: audioBuf
			audioLen: audioLen)
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> readPtr: ptr size: size [

	^ self ffiLibrary readIOContext: self ptr: ptr size: size
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> readS16BEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary readS16BESrc: self value: value)
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> readS16LEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary readS16LESrc: self value: value)
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> readS32BEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary readS32BESrc: self value: value)
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> readS32LEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary readS32LESrc: self value: value)
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> readS64BEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary readS64BESrc: self value: value)
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> readS64LEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary readS64LESrc: self value: value)
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> readS8Value: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary readS8Src: self value: value)
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> readU16BEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary readU16BESrc: self value: value)
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> readU16LEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary readU16LESrc: self value: value)
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> readU32BEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary readU32BESrc: self value: value)
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> readU32LEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary readU32LESrc: self value: value)
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> readU64BEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary readU64BESrc: self value: value)
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> readU64LEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary readU64LESrc: self value: value)
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> readU8Value: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary readU8Src: self value: value)
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> saveFileData: data datasize: datasize closeio: closeIO [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			saveFileIOSrc: self
			data: data
			datasize: datasize
			closeio: closeIO)
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> seekOffset: offset whence: whence [

	^ self ffiLibrary seekIOContext: self offset: offset whence: whence
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> tellIO [

	^ self ffiLibrary tellIO: self
]

{ #category : '*SDL3-Own' }
SDL3IOStream class >> unsafeOpenIface: iface userdata: userdata [

	^ (self ffiLibrary openIOIface: iface userdata: userdata)
		  assertNotNullReturn;
		  yourself
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> writePtr: ptr size: size [

	^ self ffiLibrary writeIOContext: self ptr: ptr size: size
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> writeS16BEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary writeS16BEDst: self value: value)
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> writeS16LEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary writeS16LEDst: self value: value)
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> writeS32BEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary writeS32BEDst: self value: value)
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> writeS32LEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary writeS32LEDst: self value: value)
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> writeS64BEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary writeS64BEDst: self value: value)
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> writeS64LEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary writeS64LEDst: self value: value)
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> writeS8Value: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary writeS8Dst: self value: value)
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> writeU16BEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary writeU16BEDst: self value: value)
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> writeU16LEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary writeU16LEDst: self value: value)
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> writeU32BEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary writeU32BEDst: self value: value)
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> writeU32LEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary writeU32LEDst: self value: value)
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> writeU64BEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary writeU64BEDst: self value: value)
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> writeU64LEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary writeU64LEDst: self value: value)
]

{ #category : '*SDL3-Own' }
SDL3IOStream >> writeU8Value: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary writeU8Dst: self value: value)
]
