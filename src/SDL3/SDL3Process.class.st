"
I am a SDL3 FFI binding for `SDL_Process`.

An opaque handle representing a system process.

See: https://wiki.libsdl.org/SDL3/SDL_Process
"
Class {
	#name : 'SDL3Process',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'instance creation' }
SDL3Process class >> unownedSpawn: aCollectionOfStrings [

	^ self unownedSpawn: aCollectionOfStrings pipeStdio: true
]

{ #category : 'instance creation' }
SDL3Process class >> unownedSpawn: aCollectionOfStrings pipeStdio: aBoolean [

	| nullTerminatedArguments |
	nullTerminatedArguments := SDL3NullTerminatedStringArray unownedFromStrings: aCollectionOfStrings.

	^ [
		  (self ffiLibrary createProcessArgs: nullTerminatedArguments pipeStdio: aBoolean)
			  assertNotNullReturn;
			  yourself ] ensure: [ nullTerminatedArguments dispose ]
]

{ #category : 'instance creation' }
SDL3Process class >> unownedSpawnWithProperties: properties [
	"Create and run a new process with the specified properties.
	The sender is responsible for freeing the returned process using #destroy.

	See: https://wiki.libsdl.org/SDL3/SDL_CreateProcessWithProperties"

	^ (self ffiLibrary createProcessWithProperties: properties asInteger)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'finalization' }
SDL3Process >> destroy [

	self ffiLibrary destroyProcess: self
]

{ #category : 'accessing' }
SDL3Process >> exitCode [
	"Answer the process exit code, or signal an error if the process has not exited yet."

	^ self
		ifExited: [ :exitCode | exitCode ]
		ifRunning: [ self error: 'Process has not exited' ]
]

{ #category : 'testing' }
SDL3Process >> hasExited [

	^ self ffiLibrary
		waitProcess: self
		block: false
		exitcode: ExternalAddress null
]

{ #category : 'operations' }
SDL3Process >> ifExited: aBlock ifRunning: anotherBlock [

	| exitCodeValueHolder hasExited |
	exitCodeValueHolder := FFIInt32 newValueHolder.
	hasExited :=
		self ffiLibrary
			waitProcess: self
			block: false
			exitcode: exitCodeValueHolder.
	^ hasExited
		ifTrue: [ aBlock value: exitCodeValueHolder value ]
		ifFalse: [ anotherBlock value ]
]

{ #category : 'testing' }
SDL3Process >> isRunning [

	^ self hasExited not
]

{ #category : 'operations' }
SDL3Process >> kill [

	self killForced: true
]

{ #category : 'operations' }
SDL3Process >> killForced: aBoolean [

	self ffiLibrary assertSuccess:
		(self ffiLibrary killProcess: self force: aBoolean)
]

{ #category : 'accessing' }
SDL3Process >> pid [

	^ self propertyGroup
		numberAt: SDL_PROP_PROCESS_PID_NUMBER
		ifAbsent: -1
]

{ #category : 'accessing' }
SDL3Process >> propertiesID [

	^ self ffiLibrary getProcessProperties: self
]

{ #category : 'accessing' }
SDL3Process >> propertyGroup [

	^ SDL3PropertyGroup id: self propertiesID
]

{ #category : 'operations' }
SDL3Process >> readBufferAndSizeDo: aBlock [
	"Block the Pharo VM thread until the process terminates, capturing all standard output up to end. Evaluate aBlock with the temporary buffer address, its byte size, and the process exit code. Ensure the buffer is freed afterwards. Answer the result of the block."

	| dataSizeValueHolder exitCodeValueHolder dataAddress |
	dataSizeValueHolder := FFISizeT newValueHolder.
	exitCodeValueHolder := FFIInt32 newValueHolder.
	dataAddress :=
		self ffiLibrary
			readProcess: self
			datasize: dataSizeValueHolder
			exitcode: exitCodeValueHolder.
	dataAddress isNull ifTrue: [
		SDL3Error signalFromLibraryErrorMessage ].

	^ [ aBlock value: dataAddress value: dataSizeValueHolder value value: exitCodeValueHolder value ]
		ensure: [ self ffiLibrary free: dataAddress ]
]

{ #category : 'accessing' }
SDL3Process >> stderr [
	"Answer the standard error stream. I own this stream and will close it automatically upon destruction."

	| pointer |
	pointer := self propertyGroup
		           pointerAt: SDL_PROP_PROCESS_STDERR_POINTER
		           ifAbsent: ExternalAddress null.
	pointer isNull ifTrue: [
		self error: 'Standard error stream is not piped' ].
	^ (SDL3IOStream fromHandle: pointer)
		  assertNotNullReturn;
		  yourself
]

{ #category : 'accessing' }
SDL3Process >> stdin [
	"Answer the standard input stream. I own this stream and will close it automatically upon destruction, though the sender may close it early to signal EOF to the child process."

	^ (self ffiLibrary getProcessInput: self)
		assertNotNullReturn;
		yourself
]

{ #category : 'accessing' }
SDL3Process >> stdout [
	"Answer the standard output stream. I own this stream and will close it automatically upon destruction."

	^ (self ffiLibrary getProcessOutput: self)
		assertNotNullReturn;
		yourself
]

{ #category : 'operations' }
SDL3Process >> terminate [

	self killForced: false
]

{ #category : 'operations' }
SDL3Process >> waitExit [
	"Block the Pharo VM thread until the process terminates, and answer its exit code."

	| exitCodeValueHolder hasExited |
	exitCodeValueHolder := FFIInt32 newValueHolder.
	hasExited := self ffiLibrary waitProcess: self block: true exitcode: exitCodeValueHolder.
	self ffiLibrary assertSuccess: hasExited.
	^ exitCodeValueHolder value
]

{ #category : 'operations' }
SDL3Process >> waitExitAndStdoutByteArrayDo: aBlock [
	"Block the Pharo VM thread until the process terminates, capturing all standard output as a ByteArray. Evaluate aBlock with the process exit code and the stdout ByteArray. Answer the result of the block."

	^ self readBufferAndSizeDo: [ :address :size :exitCode |
		| bytes |
		bytes := ByteArray new: size.
		self ffiLibrary memcpyDst: bytes src: address len: size.
		aBlock value: exitCode value: bytes ]
]

{ #category : 'operations' }
SDL3Process >> waitExitAndStdoutStringDo: aBlock [
	"Block the Pharo VM thread until the process terminates, capturing all standard output as a String. Evaluate aBlock with the process exit code and the stdout String. Answer the result of the block."

	^ self readBufferAndSizeDo: [ :address :size :exitCode |
		aBlock value: exitCode value: address utf8StringFromCString ]
]

{ #category : 'accessing' }
SDL3Process >> waitStdoutByteArray [
	"Block the Pharo VM thread until the process terminates, and answer its standard output as a ByteArray."

	^ self waitExitAndStdoutByteArrayDo: [ :exitCode :bytes | bytes ]
]

{ #category : 'accessing' }
SDL3Process >> waitStdoutString [
	"Block the Pharo VM thread until the process terminates, and answer its standard output as a String."

	^ self waitExitAndStdoutStringDo: [ :exitCode :string | string ]
]
