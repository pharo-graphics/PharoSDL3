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
SDL3Process class >> unownedSpawn: aCollectionOfStrings pipeStdio: pipeStdioBoolean pipeStderr: pipeStderrBoolean [
	"Create and run a new process with configurable piping for stdio (stdin/stdout) and stderr.
	The sender is responsible for freeing the returned process using #destroy."

	| argumentsArray properties |
	pipeStderrBoolean ifFalse: [ ^ self unownedSpawn: aCollectionOfStrings pipeStdio: pipeStdioBoolean ].

	argumentsArray := SDL3NullTerminatedStringArray unownedFromStrings: aCollectionOfStrings.
	properties := SDL3PropertyGroup unownedNew.
	^ [
		  properties pointerAt: SDL_PROP_PROCESS_CREATE_ARGS_POINTER put: argumentsArray getHandle.
		  pipeStdioBoolean ifTrue: [
				  properties numberAt: SDL_PROP_PROCESS_CREATE_STDIN_NUMBER put: SDL3ProcessIO app value.
				  properties numberAt: SDL_PROP_PROCESS_CREATE_STDOUT_NUMBER put: SDL3ProcessIO app value ].
		  properties numberAt: SDL_PROP_PROCESS_CREATE_STDERR_NUMBER put: SDL3ProcessIO app value.
		  self unownedSpawnWithProperties: properties ] ensure: [
			  properties dispose.
			  argumentsArray dispose ]
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

{ #category : 'accessing' }
SDL3Process >> stderr [
	"Answer the standard error stream. I own this stream and will close it automatically upon destruction."

	| pointer |
	pointer := self propertyGroup pointerAt: SDL_PROP_PROCESS_STDERR_POINTER ifAbsent: ExternalAddress null.
	pointer isNull ifTrue: [ SDL3Error signal: 'Standard error stream is not piped' ].
	^ SDL3IOStream fromHandle: pointer
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
	"Block the Pharo VM thread until the process terminates, and answer its exit code.

	Warning: If stdout or stderr were piped, ensure you have drained them to EOF before calling this method; otherwise, if the child process writes more data than the OS pipe buffer capacity (typically 4-64 KB), calling #waitExit first will deadlock the child and the VM thread."

	| exitCodeValueHolder hasExited |
	exitCodeValueHolder := FFIInt32 newValueHolder.
	hasExited := self ffiLibrary waitProcess: self block: true exitcode: exitCodeValueHolder.
	self ffiLibrary assertSuccess: hasExited.
	^ exitCodeValueHolder value
]
