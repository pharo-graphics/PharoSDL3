"
I contain unit tests for SDL3Process.
"
Class {
	#name : 'SDL3ProcessTest',
	#superclass : 'SDL3Test',
	#category : 'SDL3-Tests-Library',
	#package : 'SDL3-Tests',
	#tag : 'Library'
}

{ #category : 'tests' }
SDL3ProcessTest >> test01ExecuteWhoami [

	| process blockExecuted |
	DiScope own: (process := SDL3Process unownedSpawn: #( 'whoami' )).
	self assert: process pid > 0.
	self assert: process propertiesID > 0.
	self assert: process isRunning.
	self should: [ process stderr ] raise: Error.

	blockExecuted := false.
	process waitExitAndStdoutStringDo: [ :exitCode :stdoutString |
			blockExecuted := true.
			self assert: exitCode equals: 0.
			self assert: stdoutString notEmpty ].
	self assert: blockExecuted.
	self assert: process hasExited.
	self deny: process isRunning
]

{ #category : 'tests' }
SDL3ProcessTest >> test02BidirectionalSort [

	| process inputStream outputStream exitCode output expectedOutput |
	DiScope own: (process := SDL3Process unownedSpawn: #( 'sort' ) pipeStdio: true).
	self assert: process pid > 0.

	inputStream := process stdin.
	outputStream := process stdout.
	inputStream writeString: 'banana' , String lf , 'apple' , String lf.
	inputStream close.
	exitCode := process waitExit.
	self assert: exitCode equals: 0.

	output := outputStream readStringUpToSize: 64.
	expectedOutput := 'apple' , String lf , 'banana' , String lf.
	"Windows sort.exe emits CRLF line endings, whereas POSIX sort emits LF.
	Strip CR characters to ensure cross-platform parity."
	self assert: (output copyWithout: Character cr) equals: expectedOutput
]

{ #category : 'tests' }
SDL3ProcessTest >> test03ExitCode [

	| process commandArguments exitCode |
	commandArguments := OSPlatform current isWindows
		                    ifTrue: [ #( 'cmd.exe' '/c' 'exit 7' ) ]
		                    ifFalse: [ #( 'sh' '-c' 'exit 7' ) ].
	DiScope own: (process := SDL3Process unownedSpawn: commandArguments).
	exitCode := process waitExit.
	self assert: exitCode equals: 7
]

{ #category : 'tests' }
SDL3ProcessTest >> test04KillProcess [

	| process commandArguments exitCode |
	commandArguments := OSPlatform current isWindows
		                    ifTrue: [ #( 'timeout' '10' ) ]
		                    ifFalse: [ #( 'sleep' '10' ) ].
	DiScope own: (process := SDL3Process unownedSpawn: commandArguments).
	self assert: process isRunning.
	self deny: process hasExited.
	self should: [ process exitCode ] raise: Error.
	self assert: (process ifExited: [ :code | false ] ifRunning: [ true ]).

	process kill.
	exitCode := process waitExit.
	self assert: process exitCode equals: exitCode.
	self assert: (process ifExited: [ :code | code = exitCode ] ifRunning: [ false ]).
	self assert: process hasExited.
	self deny: process isRunning
]

{ #category : 'tests' }
SDL3ProcessTest >> test05TerminateProcess [

	| process commandArguments exitCode |
	commandArguments := OSPlatform current isWindows
		                    ifTrue: [ #( 'timeout' '10' ) ]
		                    ifFalse: [ #( 'sleep' '10' ) ].
	DiScope own: (process := SDL3Process unownedSpawn: commandArguments).
	self assert: process isRunning.
	self deny: process hasExited.
	self should: [ process exitCode ] raise: Error.
	self assert: (process ifExited: [ :code | false ] ifRunning: [ true ]).

	process terminate.
	exitCode := process waitExit.
	self assert: process exitCode equals: exitCode.
	self assert: (process ifExited: [ :code | code = exitCode ] ifRunning: [ false ]).
	self assert: process hasExited.
	self deny: process isRunning
]

{ #category : 'tests' }
SDL3ProcessTest >> test06ExecuteAndReadStdoutByteArray [

	| process blockExecuted |
	DiScope own: (process := SDL3Process unownedSpawn: #('whoami')).
	self assert: process pid > 0.

	blockExecuted := false.
	process waitExitAndStdoutByteArrayDo: [ :exitCode :stdoutByteArray |
		blockExecuted := true.
		self assert: exitCode equals: 0.
		self assert: stdoutByteArray notEmpty.
		self assert: stdoutByteArray class equals: ByteArray ].

	self assert: blockExecuted
]

{ #category : 'tests' }
SDL3ProcessTest >> test07WaitStdoutAccessors [

	| process outputString outputBytes |
	DiScope own: (process := SDL3Process unownedSpawn: #( 'whoami' )).
	outputString := process waitStdoutString.
	self assert: outputString notEmpty.
	self assert: process hasExited.

	DiScope own: (process := SDL3Process unownedSpawn: #( 'whoami' )).
	outputBytes := process waitStdoutByteArray.
	self assert: outputBytes notEmpty.
	self assert: (outputBytes isKindOf: ByteArray).
	self assert: process hasExited
]

{ #category : 'tests' }
SDL3ProcessTest >> test08Stderr [

	| argsArray properties process stderr exitCode |
	DiScope own: (argsArray := SDL3NullTerminatedStringArray unownedFromStrings: #( 'whoami' )).
	DiScope own: (properties := SDL3PropertyGroup unownedNew).
	properties pointerAt: SDL_PROP_PROCESS_CREATE_ARGS_POINTER put: argsArray getHandle.
	properties numberAt: SDL_PROP_PROCESS_CREATE_STDERR_NUMBER put: SDL3ProcessIO app value.

	DiScope own: (process := SDL3Process unownedSpawnWithProperties: properties).
	stderr := process stderr.
	self assert: stderr isNotNil.
	self assert: (stderr isKindOf: SDL3IOStream).

	exitCode := process waitExit.
	self assert: exitCode equals: 0.
	self assert: process hasExited
]

{ #category : 'tests' }
SDL3ProcessTest >> test09PollUntilExit [

	| process commandArguments |
	commandArguments := OSPlatform current isWindows
		                    ifTrue: [ #( 'cmd.exe' '/c' 'exit 17' ) ]
		                    ifFalse: [ #( 'sh' '-c' 'exit 17' ) ].
	DiScope own: (process := SDL3Process unownedSpawn: commandArguments).

	[ process hasExited ] whileFalse: [ (Delay forMilliseconds: 5) wait ].
	self assert: process hasExited.
	self deny: process isRunning.
	self assert: process exitCode equals: 17
]
