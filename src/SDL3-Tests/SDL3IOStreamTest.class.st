"
I contain unit tests for SDL3IOStream.
"
Class {
	#name : 'SDL3IOStreamTest',
	#superclass : 'SDL3Test',
	#category : 'SDL3-Tests-Library',
	#package : 'SDL3-Tests',
	#tag : 'Library'
}

{ #category : 'tests' }
SDL3IOStreamTest >> test01DynamicMemoryStream [

	| stream writtenCount readBack |
	DiScope own: (stream := SDL3IOStream unownedFromDynamicMem).
	self assert: stream size equals: 0.
	self assert: stream propertiesID > 0.

	writtenCount := stream writeString: 'Hello SDL3 IOStream!'.
	self assert: writtenCount equals: 20.
	self assert: stream size equals: 20.
	self assert: stream position equals: 20.

	stream flush.
	stream position: 0.
	self assert: stream position equals: 0.

	readBack := stream readStringUpToSize: 20.
	self assert: readBack equals: 'Hello SDL3 IOStream!'.

	stream position: 0.
	readBack := stream readStringUpToSize: 100.
	self assert: readBack equals: 'Hello SDL3 IOStream!'.
	self assert: readBack size equals: 20.

	stream position: 0.
	readBack := stream readStringUpToEnd.
	self assert: readBack equals: 'Hello SDL3 IOStream!'.

	stream position: 0.
	readBack := stream readByteArrayUpToEnd.
	self assert: readBack equals: 'Hello SDL3 IOStream!' utf8Encoded
]

{ #category : 'tests' }
SDL3IOStreamTest >> test02ConstMemoryStream [

	| bytes stream readBack pastEndRead |
	bytes := 'ReadOnlyData' utf8Encoded.
	DiScope own: (stream := SDL3IOStream unownedFromConstMem: bytes size: bytes size).
	self assert: stream size equals: bytes size.
	self deny: stream hasEOFStatus.

	readBack := stream readStringUpToSize: bytes size.
	self assert: readBack equals: 'ReadOnlyData'.
	self assert: stream position equals: bytes size.

	stream position: 0.
	readBack := stream readStringUpToSize: bytes size + 50.
	self assert: readBack equals: 'ReadOnlyData'.
	self assert: stream position equals: bytes size.

	pastEndRead := stream readStringUpToSize: 1.
	self assert: pastEndRead isEmpty.
	self assert: stream status equals: SDL3IOStatus eof.
	self assert: stream hasEOFStatus
]

{ #category : 'tests' }
SDL3IOStreamTest >> test03FileStream [

	| filePath writeStream readStream readBack |
	filePath := 'sdl3_stream_test.txt'.
	filePath asFileReference ensureDelete.
	DiScope own: (writeStream := SDL3IOStream unownedFromFile: filePath mode: 'w').
	writeStream writeString: 'FileContent'.
	writeStream dispose.
	self assert: filePath asFileReference exists.
	self assert: filePath asFileReference contents equals: 'FileContent'.

	DiScope own: (readStream := SDL3IOStream unownedFromFile: filePath mode: 'r').
	readBack := readStream readStringUpToSize: 11.
	self assert: readBack equals: 'FileContent'.

	self should: [ readStream writeString: 'Forbidden' ] raise: SDL3Error.

	filePath asFileReference ensureDelete
]

{ #category : 'tests' }
SDL3IOStreamTest >> test04SurfacePNGInMemoryRoundtrip [

	| extent color surface stream loadedSurface |
	extent := 40 @ 30.
	color := Color cyan.
	DiScope own: (surface := SDL3Surface unownedNewWidth: extent x height: extent y format: SDL3PixelFormat argb8888).
	surface clearColor: color.

	DiScope own: (stream := SDL3IOStream unownedFromDynamicMem).
	surface writePNGOnIOStream: stream.
	self assert: stream size > 0.

	stream position: 0.
	DiScope own: (loadedSurface := SDL3Surface unownedReadPNGFromIOStream: stream).
	self assert: loadedSurface extent equals: extent.
	self assert: (loadedSurface colorAtX: 5 y: 5) equals: color
]

{ #category : 'tests' }
SDL3IOStreamTest >> test05RawReadInto [

	| stream buffer readCount |
	DiScope own: (stream := SDL3IOStream unownedFromDynamicMem).
	stream writeString: 'Hello'.
	stream position: 0.
	buffer := ByteArray new: 5.
	readCount := stream readInto: buffer upToSize: 5.
	self assert: readCount equals: 5.
	self assert: buffer utf8Decoded equals: 'Hello'.

	stream position: 0.
	buffer := ByteArray new: 64.
	readCount := stream readInto: buffer upToSize: 64.
	self assert: readCount equals: 5.
	self assert: (buffer copyFrom: 1 to: readCount) utf8Decoded equals: 'Hello'.

	stream position: 0.
	buffer := stream readByteArrayUpToSize: 64.
	self assert: buffer size equals: 5.
	self assert: buffer utf8Decoded equals: 'Hello'
]

{ #category : 'tests' }
SDL3IOStreamTest >> test06ScalarReadAndWrite [

	| stream |
	DiScope own: (stream := SDL3IOStream unownedFromDynamicMem).
	stream writeU8: 42.
	stream writeS16BE: -1234.
	stream writeU32LE: 16rCAFEBABE.
	stream position: 0.
	self assert: stream readU8 equals: 42.
	self assert: stream readS16BE equals: -1234.
	self assert: stream readU32LE equals: 16rCAFEBABE
]

{ #category : 'tests' }
SDL3IOStreamTest >> test07ScratchBufferOptimalReading [

	| stream buffer |
	DiScope own: (stream := SDL3IOStream unownedFromDynamicMem).
	stream writeU8: 42.
	stream writeS16BE: -1234.
	stream writeU32LE: 16rCAFEBABE.
	stream writeU64LE: 16r1122334455667788.
	stream position: 0.

	"An 8-byte ByteArray can be reused across all scalar read types (up to 64-bit integers)"
	buffer := ByteArray new: 8.
	stream readU8Into: buffer.
	self assert: buffer first equals: 42.

	stream readS16BEInto: buffer.
	self assert: (buffer signedShortAt: 1) equals: -1234.

	stream readU32LEInto: buffer.
	self assert: (buffer unsignedLongAt: 1) equals: 16rCAFEBABE.

	stream readU64LEInto: buffer.
	self assert: (buffer unsignedLongLongAt: 1) equals: 16r1122334455667788
]

{ #category : 'tests' }
SDL3IOStreamTest >> test08WriteByteArrayAndPosition [

	| stream bytes |
	DiScope own: (stream := SDL3IOStream unownedFromDynamicMem).
	bytes := #[ 10 20 30 40 50 ].
	stream writeByteArray: bytes.
	self assert: stream size equals: 5.
	self assert: stream position equals: 5.
	self deny: stream hasEOFStatus.

	stream position: 0.
	self assert: stream position equals: 0.
	self deny: stream hasEOFStatus.

	self assert: stream readByteArrayUpToEnd equals: bytes.
	self assert: (stream readByteArrayUpToSize: 1) isEmpty.
	self assert: stream hasEOFStatus
]

{ #category : 'tests' }
SDL3IOStreamTest >> test09MutableMemoryStream [

	| buffer stream readBack |
	buffer := ByteArray new: 10.
	DiScope own: (stream := SDL3IOStream unownedFromMem: buffer size: buffer size).
	self assert: stream size equals: buffer size.
	self deny: stream hasEOFStatus.

	stream writeString: 'Hello'.
	self assert: stream position equals: 5.
	self assert: (buffer copyFrom: 1 to: 5) asString equals: 'Hello'.

	stream position: 0.
	readBack := stream readStringUpToSize: 5.
	self assert: readBack equals: 'Hello'.

	stream position: buffer size.
	self should: [ stream writeString: 'Overflow' ] raise: SDL3Error
]

{ #category : 'tests' }
SDL3IOStreamTest >> test10UnseekableStreamError [

	| process stream |
	DiScope own: (process := SDL3Process unownedSpawn: #( 'whoami' )).
	stream := process stdout.
	self should: [ stream seekOffset: 10 whence: SDL3IOWhence set ] raise: SDL3Error.
	self should: [ stream position: 5 ] raise: SDL3Error.
	self should: [ stream size ] raise: SDL3Error.
	process waitExit
]

{ #category : 'tests' }
SDL3IOStreamTest >> test11ReadFromWriteOnlyStreamError [

	| filePath stream |
	filePath := 'sdl3_stream_write_only_test.txt'.
	filePath asFileReference ensureDelete.
	[
		DiScope own: (stream := SDL3IOStream unownedFromFile: filePath mode: 'w').
		self should: [ stream readInto: (ByteArray new: 5) upToSize: 5 ] raise: SDL3Error.
		self should: [ stream readStringUpToSize: 5 ] raise: SDL3Error ] ensure: [
			stream ifNotNil: [ stream dispose ].
			filePath asFileReference ensureDelete ]
]

{ #category : 'tests' }
SDL3IOStreamTest >> test12SeekWhenceCurAndEnd [

	| stream |
	DiScope own: (stream := SDL3IOStream unownedFromDynamicMem).
	stream writeString: '0123456789'.

	"Seek relative to end"
	self assert: (stream seekOffset: -3 whence: SDL3IOWhence end) equals: 7.
	self assert: stream position equals: 7.
	self assert: (stream readStringUpToSize: 3) equals: '789'.

	"Seek relative to current cursor (backward and forward)"
	self assert: (stream seekOffset: -5 whence: SDL3IOWhence cur) equals: 5.
	self assert: stream position equals: 5.
	self assert: (stream seekOffset: 2 whence: SDL3IOWhence cur) equals: 7.
	self assert: stream position equals: 7
]

{ #category : 'tests' }
SDL3IOStreamTest >> test13StatusReady [

	| stream |
	DiScope own: (stream := SDL3IOStream unownedFromDynamicMem).
	self assert: stream status equals: SDL3IOStatus ready.

	stream writeString: 'Hello'.
	self assert: stream status equals: SDL3IOStatus ready.

	stream position: 0.
	stream readStringUpToSize: 2.
	self assert: stream status equals: SDL3IOStatus ready
]

{ #category : 'tests' }
SDL3IOStreamTest >> test14StatusEOF [

	| bytes stream |
	bytes := 'EOFData' utf8Encoded.
	DiScope own: (stream := SDL3IOStream unownedFromConstMem: bytes size: bytes size).
	self assert: stream status equals: SDL3IOStatus ready.
	self deny: stream hasEOFStatus.

	stream readStringUpToSize: bytes size.
	self assert: (stream readStringUpToSize: 1) isEmpty.
	self assert: stream status equals: SDL3IOStatus eof.
	self assert: stream hasEOFStatus
]

{ #category : 'tests' }
SDL3IOStreamTest >> test15StatusReadOnly [

	| bytes stream |
	bytes := 'ReadOnly' utf8Encoded.
	DiScope own: (stream := SDL3IOStream unownedFromConstMem: bytes size: bytes size).
	self assert: stream status equals: SDL3IOStatus ready.

	self should: [ stream writeString: 'WriteAttempt' ] raise: SDL3Error.
	self assert: stream status equals: SDL3IOStatus readonly
]

{ #category : 'tests' }
SDL3IOStreamTest >> test16StatusError [

	| buffer stream |
	buffer := ByteArray new: 4.
	DiScope own: (stream := SDL3IOStream unownedFromMem: buffer size: buffer size).
	self assert: stream status equals: SDL3IOStatus ready.

	stream position: buffer size.
	self should: [ stream writeString: 'Overflow' ] raise: SDL3Error.
	self assert: stream status equals: SDL3IOStatus error
]

{ #category : 'tests' }
SDL3IOStreamTest >> test17StatusNotReady [

	| commandArguments process stream buffer readCount |
	commandArguments := OSPlatform current isWindows
		                    ifTrue: [ #( 'timeout' '10' ) ]
		                    ifFalse: [ #( 'sleep' '10' ) ].
	DiScope own: (process := SDL3Process unownedSpawn: commandArguments).
	stream := process stdout.
	self assert: stream status equals: SDL3IOStatus ready.

	buffer := ByteArray new: 10.
	readCount := stream readInto: buffer upToSize: 10.
	self assert: readCount equals: 0.
	self assert: stream status equals: SDL3IOStatus notReady.

	process kill.
	process waitExit
]
