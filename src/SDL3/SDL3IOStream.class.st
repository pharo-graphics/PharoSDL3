"
I am a SDL3 FFI binding for `SDL_IOStream`.

The read/write operation structure.

See: https://wiki.libsdl.org/SDL3/SDL_IOStream
"
Class {
	#name : 'SDL3IOStream',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'instance creation' }
SDL3IOStream class >> unownedOpenIface: iface userdata: userdata [

	^ (self ffiLibrary openIOIface: iface userdata: userdata)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'operations' }
SDL3IOStream >> addGamepadMappingsFromCloseio: closeio [

	^ self ffiLibrary addGamepadMappingsFromIOSrc: self closeio: closeio
]

{ #category : 'finalization' }
SDL3IOStream >> closeIO [

	self ffiLibrary assertSuccess: (self ffiLibrary closeIO: self)
]

{ #category : 'writing' }
SDL3IOStream >> flushIO [

	self ffiLibrary assertSuccess: (self ffiLibrary flushIO: self)
]

{ #category : 'accessing' }
SDL3IOStream >> ioProperties [

	^ self ffiLibrary getIOProperties: self
]

{ #category : 'accessing' }
SDL3IOStream >> ioSize [

	^ self ffiLibrary getIOSize: self
]

{ #category : 'accessing' }
SDL3IOStream >> ioStatus [

	^ self ffiLibrary getIOStatus: self
]

{ #category : 'reading' }
SDL3IOStream >> loadFileDatasize: datasize closeio: closeio [

	^ self ffiLibrary loadFileIOSrc: self datasize: datasize closeio: closeio
]

{ #category : 'reading' }
SDL3IOStream >> loadWAVCloseio: closeIO spec: spec audioBuf: audioBuf audioLen: audioLen [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			loadWAVIOSrc: self
			closeio: closeIO
			spec: spec
			audioBuf: audioBuf
			audioLen: audioLen)
]

{ #category : 'reading' }
SDL3IOStream >> readPtr: ptr size: size [

	^ self ffiLibrary readIOContext: self ptr: ptr size: size
]

{ #category : 'reading' }
SDL3IOStream >> readS16BEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary readS16BESrc: self value: value)
]

{ #category : 'reading' }
SDL3IOStream >> readS16LEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary readS16LESrc: self value: value)
]

{ #category : 'reading' }
SDL3IOStream >> readS32BEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary readS32BESrc: self value: value)
]

{ #category : 'reading' }
SDL3IOStream >> readS32LEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary readS32LESrc: self value: value)
]

{ #category : 'reading' }
SDL3IOStream >> readS64BEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary readS64BESrc: self value: value)
]

{ #category : 'reading' }
SDL3IOStream >> readS64LEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary readS64LESrc: self value: value)
]

{ #category : 'reading' }
SDL3IOStream >> readS8Value: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary readS8Src: self value: value)
]

{ #category : 'reading' }
SDL3IOStream >> readU16BEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary readU16BESrc: self value: value)
]

{ #category : 'reading' }
SDL3IOStream >> readU16LEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary readU16LESrc: self value: value)
]

{ #category : 'reading' }
SDL3IOStream >> readU32BEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary readU32BESrc: self value: value)
]

{ #category : 'reading' }
SDL3IOStream >> readU32LEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary readU32LESrc: self value: value)
]

{ #category : 'reading' }
SDL3IOStream >> readU64BEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary readU64BESrc: self value: value)
]

{ #category : 'reading' }
SDL3IOStream >> readU64LEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary readU64LESrc: self value: value)
]

{ #category : 'reading' }
SDL3IOStream >> readU8Value: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary readU8Src: self value: value)
]

{ #category : 'writing' }
SDL3IOStream >> saveFileData: data datasize: datasize closeio: closeIO [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			saveFileIOSrc: self
			data: data
			datasize: datasize
			closeio: closeIO)
]

{ #category : 'positioning' }
SDL3IOStream >> seekOffset: offset whence: whence [

	^ self ffiLibrary seekIOContext: self offset: offset whence: whence
]

{ #category : 'positioning' }
SDL3IOStream >> tellIO [

	^ self ffiLibrary tellIO: self
]

{ #category : 'instance creation' }
SDL3IOStream >> unownedLoadBMPCloseIO: closeio [

	^ (self ffiLibrary loadBMPIOSrc: self closeio: closeio)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'instance creation' }
SDL3IOStream >> unownedLoadPNGCloseIO: closeio [

	^ (self ffiLibrary loadPNGIOSrc: self closeio: closeio)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'instance creation' }
SDL3IOStream >> unownedLoadSurfaceCloseIO: closeIO [

	^ (self ffiLibrary loadSurfaceIOSrc: self closeio: closeIO)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'writing' }
SDL3IOStream >> writePtr: ptr size: size [

	^ self ffiLibrary writeIOContext: self ptr: ptr size: size
]

{ #category : 'writing' }
SDL3IOStream >> writeS16BEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary writeS16BEDst: self value: value)
]

{ #category : 'writing' }
SDL3IOStream >> writeS16LEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary writeS16LEDst: self value: value)
]

{ #category : 'writing' }
SDL3IOStream >> writeS32BEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary writeS32BEDst: self value: value)
]

{ #category : 'writing' }
SDL3IOStream >> writeS32LEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary writeS32LEDst: self value: value)
]

{ #category : 'writing' }
SDL3IOStream >> writeS64BEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary writeS64BEDst: self value: value)
]

{ #category : 'writing' }
SDL3IOStream >> writeS64LEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary writeS64LEDst: self value: value)
]

{ #category : 'writing' }
SDL3IOStream >> writeS8Value: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary writeS8Dst: self value: value)
]

{ #category : 'writing' }
SDL3IOStream >> writeU16BEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary writeU16BEDst: self value: value)
]

{ #category : 'writing' }
SDL3IOStream >> writeU16LEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary writeU16LEDst: self value: value)
]

{ #category : 'writing' }
SDL3IOStream >> writeU32BEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary writeU32BEDst: self value: value)
]

{ #category : 'writing' }
SDL3IOStream >> writeU32LEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary writeU32LEDst: self value: value)
]

{ #category : 'writing' }
SDL3IOStream >> writeU64BEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary writeU64BEDst: self value: value)
]

{ #category : 'writing' }
SDL3IOStream >> writeU64LEValue: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary writeU64LEDst: self value: value)
]

{ #category : 'writing' }
SDL3IOStream >> writeU8Value: value [

	self ffiLibrary assertSuccess:
		(self ffiLibrary writeU8Dst: self value: value)
]
