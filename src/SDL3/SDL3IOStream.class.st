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
SDL3IOStream class >> unownedFromConstMem: aBuffer size: anInteger [
	"Answer an unowned read-only stream backed by a fixed memory buffer of anInteger bytes.
	The buffer is not copied; it must remain valid until the stream is closed.
	The sender is responsible for freeing the stream using #close or #destroy."

	^ (self ffiLibrary ioFromConstMem: aBuffer size: anInteger)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'instance creation' }
SDL3IOStream class >> unownedFromDynamicMem [
	"Answer an unowned stream backed by an automatically expanding in-memory buffer.
	The sender is responsible for freeing the stream using #close or #destroy."

	^ self ffiLibrary ioFromDynamicMem
		  assertNotNullReturn;
		  yourself
]

{ #category : 'instance creation' }
SDL3IOStream class >> unownedFromFile: aPath mode: aModeString [
	"Answer an unowned stream for reading, writing, or appending to the file at aPath, with fopen-style aModeString (e.g. ""r"", ""w"", ""r+b"").
	The sender is responsible for freeing the stream using #close or #destroy."

	^ (self ffiLibrary ioFromFile: aPath mode: aModeString)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'instance creation' }
SDL3IOStream class >> unownedFromMem: aBuffer size: anInteger [
	"Answer an unowned read-write stream backed by a fixed memory buffer of anInteger bytes.
	The buffer is not copied; it must remain valid until the stream is closed.
	The sender is responsible for freeing the stream using #close or #destroy."

	^ (self ffiLibrary ioFromMem: aBuffer size: anInteger)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'finalization' }
SDL3IOStream >> close [

	self ffiLibrary assertSuccess: (self ffiLibrary closeIO: self)
]

{ #category : 'finalization' }
SDL3IOStream >> destroy [

	self close
]

{ #category : 'writing' }
SDL3IOStream >> flush [

	self ffiLibrary assertSuccess: (self ffiLibrary flushIO: self)
]

{ #category : 'testing' }
SDL3IOStream >> hasEOFStatus [
	"Answer true if the stream reached EOF on a previous read operation."

	^ self status = SDL3IOStatus eof
]

{ #category : 'positioning' }
SDL3IOStream >> position [

	^ self ffiLibrary tellIO: self
]

{ #category : 'positioning' }
SDL3IOStream >> position: anInteger [

	^ self seekOffset: anInteger whence: SDL3IOWhence set
]

{ #category : 'accessing' }
SDL3IOStream >> propertiesID [

	^ self ffiLibrary getIOProperties: self
]

{ #category : 'accessing' }
SDL3IOStream >> propertyGroup [

	^ SDL3PropertyGroup id: self propertiesID
]

{ #category : 'reading' }
SDL3IOStream >> readBufferAndSizeDo: aBlock [
	"Read stream contents up to end and evaluate the received block with the temporary buffer and its size without closing me. Return the result of the block.

	Note: This operation blocks the Pharo VM thread until EOF is reached (or the underlying stream is closed)."

	| dataSizeValueHolder dataAddress |
	dataSizeValueHolder := FFISizeT newValueHolder.
	dataAddress := self ffiLibrary loadFileIOSrc: self datasize: dataSizeValueHolder closeio: false.

	dataAddress isNull ifTrue: [ SDL3Error signalFromLibraryErrorMessage ].

	^ [ aBlock value: dataAddress value: dataSizeValueHolder value ] ensure: [ self ffiLibrary free: dataAddress ]
]

{ #category : 'reading' }
SDL3IOStream >> readByteArrayUpToEnd [
	"Read stream contents up to end and answer them as a ByteArray without closing me.

	Note: This operation blocks the Pharo VM thread until EOF is reached (or the underlying stream is closed)."

	^ self readBufferAndSizeDo: [ :address :readCount |
			  | result |
			  result := ByteArray new: readCount.
			  self ffiLibrary memcpyDst: result src: address len: readCount.
			  result ]
]

{ #category : 'reading' }
SDL3IOStream >> readByteArrayUpToSize: anInteger [

	| buffer readCount |
	buffer := ByteArray new: anInteger.
	readCount := self readInto: buffer upToSize: anInteger.
	^ buffer copyFrom: 1 to: readCount
]

{ #category : 'reading' }
SDL3IOStream >> readInto: aBuffer upToSize: anInteger [

	| readCount |
	readCount := self ffiLibrary readIOContext: self ptr: aBuffer size: anInteger.
	(readCount = 0 and: [ anInteger > 0 and: [ self status = SDL3IOStatus error or: [ self status = SDL3IOStatus writeonly ] ] ])
		ifTrue: [ SDL3Error signalFromLibraryErrorMessage ].
	^ readCount
]

{ #category : 'reading' }
SDL3IOStream >> readS16BE [

	| valueHolder |
	valueHolder := FFIInt16 newValueHolder.
	self readS16BEInto: valueHolder.
	^ valueHolder value
]

{ #category : 'reading' }
SDL3IOStream >> readS16BEInto: aValueHolder [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			readS16BESrc: self
			value: aValueHolder)
]

{ #category : 'reading' }
SDL3IOStream >> readS16LE [

	| valueHolder |
	valueHolder := FFIInt16 newValueHolder.
	self readS16LEInto: valueHolder.
	^ valueHolder value
]

{ #category : 'reading' }
SDL3IOStream >> readS16LEInto: aValueHolder [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			readS16LESrc: self
			value: aValueHolder)
]

{ #category : 'reading' }
SDL3IOStream >> readS32BE [

	| valueHolder |
	valueHolder := FFIInt32 newValueHolder.
	self readS32BEInto: valueHolder.
	^ valueHolder value
]

{ #category : 'reading' }
SDL3IOStream >> readS32BEInto: aValueHolder [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			readS32BESrc: self
			value: aValueHolder)
]

{ #category : 'reading' }
SDL3IOStream >> readS32LE [

	| valueHolder |
	valueHolder := FFIInt32 newValueHolder.
	self readS32LEInto: valueHolder.
	^ valueHolder value
]

{ #category : 'reading' }
SDL3IOStream >> readS32LEInto: aValueHolder [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			readS32LESrc: self
			value: aValueHolder)
]

{ #category : 'reading' }
SDL3IOStream >> readS64BE [

	| valueHolder |
	valueHolder := FFIInt64 newValueHolder.
	self readS64BEInto: valueHolder.
	^ valueHolder value
]

{ #category : 'reading' }
SDL3IOStream >> readS64BEInto: aValueHolder [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			readS64BESrc: self
			value: aValueHolder)
]

{ #category : 'reading' }
SDL3IOStream >> readS64LE [

	| valueHolder |
	valueHolder := FFIInt64 newValueHolder.
	self readS64LEInto: valueHolder.
	^ valueHolder value
]

{ #category : 'reading' }
SDL3IOStream >> readS64LEInto: aValueHolder [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			readS64LESrc: self
			value: aValueHolder)
]

{ #category : 'reading' }
SDL3IOStream >> readS8 [

	| valueHolder |
	valueHolder := FFIInt8 newValueHolder.
	self readS8Into: valueHolder.
	^ valueHolder value
]

{ #category : 'reading' }
SDL3IOStream >> readS8Into: aValueHolder [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			readS8Src: self
			value: aValueHolder)
]

{ #category : 'reading' }
SDL3IOStream >> readStringUpToEnd [
	"Read stream contents up to end and answer them as a UTF-8 String without closing me.

	Note: This operation blocks the Pharo VM thread until EOF is reached (or the underlying stream is closed)."

	^ self readBufferAndSizeDo: [ :address :readCount | address utf8StringFromCString ]
]

{ #category : 'reading' }
SDL3IOStream >> readStringUpToSize: anInteger [

	| buffer readCount |
	buffer := ByteArray new: anInteger.
	readCount := self readInto: buffer upToSize: anInteger.
	^ (buffer copyFrom: 1 to: readCount) utf8Decoded
]

{ #category : 'reading' }
SDL3IOStream >> readU16BE [

	| valueHolder |
	valueHolder := FFIUInt16 newValueHolder.
	self readU16BEInto: valueHolder.
	^ valueHolder value
]

{ #category : 'reading' }
SDL3IOStream >> readU16BEInto: aValueHolder [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			readU16BESrc: self
			value: aValueHolder)
]

{ #category : 'reading' }
SDL3IOStream >> readU16LE [

	| valueHolder |
	valueHolder := FFIUInt16 newValueHolder.
	self readU16LEInto: valueHolder.
	^ valueHolder value
]

{ #category : 'reading' }
SDL3IOStream >> readU16LEInto: aValueHolder [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			readU16LESrc: self
			value: aValueHolder)
]

{ #category : 'reading' }
SDL3IOStream >> readU32BE [

	| valueHolder |
	valueHolder := FFIUInt32 newValueHolder.
	self readU32BEInto: valueHolder.
	^ valueHolder value
]

{ #category : 'reading' }
SDL3IOStream >> readU32BEInto: aValueHolder [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			readU32BESrc: self
			value: aValueHolder)
]

{ #category : 'reading' }
SDL3IOStream >> readU32LE [

	| valueHolder |
	valueHolder := FFIUInt32 newValueHolder.
	self readU32LEInto: valueHolder.
	^ valueHolder value
]

{ #category : 'reading' }
SDL3IOStream >> readU32LEInto: aValueHolder [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			readU32LESrc: self
			value: aValueHolder)
]

{ #category : 'reading' }
SDL3IOStream >> readU64BE [

	| valueHolder |
	valueHolder := FFIUInt64 newValueHolder.
	self readU64BEInto: valueHolder.
	^ valueHolder value
]

{ #category : 'reading' }
SDL3IOStream >> readU64BEInto: aValueHolder [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			readU64BESrc: self
			value: aValueHolder)
]

{ #category : 'reading' }
SDL3IOStream >> readU64LE [

	| valueHolder |
	valueHolder := FFIUInt64 newValueHolder.
	self readU64LEInto: valueHolder.
	^ valueHolder value
]

{ #category : 'reading' }
SDL3IOStream >> readU64LEInto: aValueHolder [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			readU64LESrc: self
			value: aValueHolder)
]

{ #category : 'reading' }
SDL3IOStream >> readU8 [

	| valueHolder |
	valueHolder := FFIUInt8 newValueHolder.
	self readU8Into: valueHolder.
	^ valueHolder value
]

{ #category : 'reading' }
SDL3IOStream >> readU8Into: aValueHolder [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			readU8Src: self
			value: aValueHolder)
]

{ #category : 'positioning' }
SDL3IOStream >> seekOffset: offset whence: whence [

	| finalOffset |
	finalOffset := self ffiLibrary seekIOContext: self offset: offset whence: whence.
	finalOffset < 0 ifTrue: [ SDL3Error signalFromLibraryErrorMessage ].
	^ finalOffset
]

{ #category : 'accessing' }
SDL3IOStream >> size [

	| streamSize |
	streamSize := self ffiLibrary getIOSize: self.
	streamSize < 0 ifTrue: [ SDL3Error signalFromLibraryErrorMessage ].
	^ streamSize
]

{ #category : 'accessing' }
SDL3IOStream >> status [

	^ self ffiLibrary getIOStatus: self
]

{ #category : 'writing' }
SDL3IOStream >> write: aBuffer size: anInteger [

	| writtenCount |
	writtenCount := self ffiLibrary writeIOContext: self ptr: aBuffer size: anInteger.
	writtenCount < anInteger ifTrue: [ SDL3Error signalFromLibraryErrorMessage ].
	^ writtenCount
]

{ #category : 'writing' }
SDL3IOStream >> writeByteArray: aByteArray [

	^ self write: aByteArray size: aByteArray size
]

{ #category : 'writing' }
SDL3IOStream >> writeS16BE: anInteger [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			writeS16BEDst: self
			value: anInteger)
]

{ #category : 'writing' }
SDL3IOStream >> writeS16LE: anInteger [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			writeS16LEDst: self
			value: anInteger)
]

{ #category : 'writing' }
SDL3IOStream >> writeS32BE: anInteger [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			writeS32BEDst: self
			value: anInteger)
]

{ #category : 'writing' }
SDL3IOStream >> writeS32LE: anInteger [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			writeS32LEDst: self
			value: anInteger)
]

{ #category : 'writing' }
SDL3IOStream >> writeS64BE: anInteger [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			writeS64BEDst: self
			value: anInteger)
]

{ #category : 'writing' }
SDL3IOStream >> writeS64LE: anInteger [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			writeS64LEDst: self
			value: anInteger)
]

{ #category : 'writing' }
SDL3IOStream >> writeS8: anInteger [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			writeS8Dst: self
			value: anInteger)
]

{ #category : 'writing' }
SDL3IOStream >> writeString: aString [

	| encodedBytes |
	encodedBytes := aString utf8Encoded.
	^ self write: encodedBytes size: encodedBytes size
]

{ #category : 'writing' }
SDL3IOStream >> writeU16BE: anInteger [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			writeU16BEDst: self
			value: anInteger)
]

{ #category : 'writing' }
SDL3IOStream >> writeU16LE: anInteger [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			writeU16LEDst: self
			value: anInteger)
]

{ #category : 'writing' }
SDL3IOStream >> writeU32BE: anInteger [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			writeU32BEDst: self
			value: anInteger)
]

{ #category : 'writing' }
SDL3IOStream >> writeU32LE: anInteger [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			writeU32LEDst: self
			value: anInteger)
]

{ #category : 'writing' }
SDL3IOStream >> writeU64BE: anInteger [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			writeU64BEDst: self
			value: anInteger)
]

{ #category : 'writing' }
SDL3IOStream >> writeU64LE: anInteger [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			writeU64LEDst: self
			value: anInteger)
]

{ #category : 'writing' }
SDL3IOStream >> writeU8: anInteger [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			writeU8Dst: self
			value: anInteger)
]
