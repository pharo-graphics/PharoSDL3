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
SDL3ProcessTest >> test01SpawnWithoutPipedStdio [
	"Verify spawning a fire-and-forget process with unpiped standard streams.
	Attempting to access stdout, stdin, or stderr signals SDL3Error."

	| process commandArguments exitCode |
	commandArguments := OSPlatform current isWindows
		                    ifTrue: [ #('cmd.exe' '/c' 'exit 0') ]
		                    ifFalse: [ #('sh' '-c' 'exit 0') ].
	DiScope own: (process := SDL3Process unownedSpawn: commandArguments pipeStdio: false).
	self assert: process pid > 0.
	self should: [ process stdout ] raise: SDL3Error.
	self should: [ process stdin ] raise: SDL3Error.
	self should: [ process stderr ] raise: SDL3Error.

	exitCode := process waitExit.
	self assert: exitCode equals: 0.
	self assert: process hasExited
]

{ #category : 'tests' }
SDL3ProcessTest >> test02ExitCode [
	"Verify that a terminated child process reports its exit code accurately via #waitExit."

	| process commandArguments exitCode |
	commandArguments := OSPlatform current isWindows
		                    ifTrue: [ #('cmd.exe' '/c' 'exit 7') ]
		                    ifFalse: [ #('sh' '-c' 'exit 7') ].
	DiScope own: (process := SDL3Process unownedSpawn: commandArguments).
	exitCode := process waitExit.
	self assert: exitCode equals: 7
]

{ #category : 'tests' }
SDL3ProcessTest >> test03PollUntilExit [
	"Verify non-blocking process polling using #hasExited with cooperative Smalltalk delay loops."

	| process commandArguments |
	commandArguments := OSPlatform current isWindows
		                    ifTrue: [ #('cmd.exe' '/c' 'exit 17') ]
		                    ifFalse: [ #('sh' '-c' 'exit 17') ].
	DiScope own: (process := SDL3Process unownedSpawn: commandArguments).

	[ process hasExited ] whileFalse: [ (Delay forMilliseconds: 5) wait ].
	self assert: process hasExited.
	self deny: process isRunning.
	self assert: process exitCode equals: 17
]

{ #category : 'tests' }
SDL3ProcessTest >> test04TerminateProcess [
	"Verify graceful process termination using #terminate (SIGTERM on POSIX)."

	| process commandArguments exitCode |
	commandArguments := OSPlatform current isWindows
		                    ifTrue: [ #('timeout' '10') ]
		                    ifFalse: [ #('sleep' '10') ].
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
SDL3ProcessTest >> test05KillProcess [
	"Verify immediate forceful process termination using #kill (SIGKILL on POSIX)."

	| process commandArguments exitCode |
	commandArguments := OSPlatform current isWindows
		                    ifTrue: [ #('timeout' '10') ]
		                    ifFalse: [ #('sleep' '10') ].
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
SDL3ProcessTest >> test06ReadStdoutString [
	"Verify reading standard output up to EOF as a UTF-8 String.
	Draining stdout before #waitExit prevents pipe buffer exhaustion deadlocks."

	| process stdoutString exitCode |
	DiScope own: (process := SDL3Process unownedSpawn: #('whoami')).
	self assert: process pid > 0.
	self assert: process propertiesID > 0.
	self should: [ process stderr ] raise: SDL3Error.

	stdoutString := process stdout readStringUpToEnd.
	exitCode := process waitExit.
	self assert: exitCode equals: 0.
	self assert: stdoutString notEmpty.
	self assert: process hasExited.
	self deny: process isRunning
]

{ #category : 'tests' }
SDL3ProcessTest >> test07ReadStdoutByteArray [
	"Verify reading standard output up to EOF as a raw ByteArray."

	| process stdoutByteArray exitCode |
	DiScope own: (process := SDL3Process unownedSpawn: #('whoami')).
	self assert: process pid > 0.

	stdoutByteArray := process stdout readByteArrayUpToEnd.
	exitCode := process waitExit.
	self assert: exitCode equals: 0.
	self assert: stdoutByteArray notEmpty.
	self assert: stdoutByteArray class equals: ByteArray.
	self assert: process hasExited.
	self deny: process isRunning
]

{ #category : 'tests' }
SDL3ProcessTest >> test08Stderr [
	"Verify spawning with piped standard error and capturing diagnostic text emitted to stderr."

	| commandArguments process stderrString exitCode |
	commandArguments := OSPlatform current isWindows
		                    ifTrue: [ #('cmd.exe' '/c' 'echo Diagnostic error message 1>&2') ]
		                    ifFalse: [ #('sh' '-c' 'echo "Diagnostic error message" >&2') ].
	DiScope own: (process := SDL3Process unownedSpawn: commandArguments pipeStdio: true pipeStderr: true).
	self assert: process pid > 0.

	stderrString := process stderr readStringUpToEnd.
	exitCode := process waitExit.
	self assert: exitCode equals: 0.
	"Windows cmd.exe echo includes the space before 1>&2 in its output.
	Trim trailing whitespace to ensure cross-platform parity."
	self assert: stderrString lines first trimRight equals: 'Diagnostic error message'.
	self assert: process hasExited
]

{ #category : 'tests' }
SDL3ProcessTest >> test09BidirectionalSort [
	"Verify full-duplex communication: writing input to stdin, closing stdin to signal EOF,
	and reading processed output from stdout."

	| process inputStream outputStream exitCode output expectedOutput |
	DiScope own: (process := SDL3Process unownedSpawn: #('sort') pipeStdio: true).
	self assert: process pid > 0.

	inputStream := process stdin.
	outputStream := process stdout.
	inputStream writeString: 'banana', String lf, 'apple', String lf.
	inputStream close.
	exitCode := process waitExit.
	self assert: exitCode equals: 0.

	output := outputStream readStringUpToSize: 64.
	expectedOutput := 'apple', String lf, 'banana', String lf.
	"Windows sort.exe emits CRLF line endings, whereas POSIX sort emits LF.
	Strip CR characters to ensure cross-platform parity."
	self assert: (output copyWithout: Character cr) equals: expectedOutput
]

{ #category : 'tests' }
SDL3ProcessTest >> test10SpawnWithProperties [
	"Verify low-level process creation using an SDL3PropertyGroup to configure custom creation properties."

	| argumentsArray properties process stderr exitCode |
	DiScope own: (argumentsArray := SDL3NullTerminatedStringArray unownedFromStrings: #('whoami')).
	DiScope own: (properties := SDL3PropertyGroup unownedNew).
	properties pointerAt: SDL_PROP_PROCESS_CREATE_ARGS_POINTER put: argumentsArray getHandle.
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
SDL3ProcessTest >> test11SpawnWithWorkingDirectory [
	"Verify configuring the child process working directory using SDL_PROP_PROCESS_CREATE_WORKING_DIRECTORY_STRING."

	| tempDirectory argumentsArray properties process stdoutString exitCode expectedPath |
	tempDirectory := FileLocator temp asFileReference ensureCreateDirectory.
	expectedPath := tempDirectory fullName.

	argumentsArray := SDL3NullTerminatedStringArray unownedFromStrings:
		                  (OSPlatform current isWindows
			                   ifTrue: [ #('cmd.exe' '/c' 'cd') ]
			                   ifFalse: [ #('pwd') ]).
	DiScope own: argumentsArray.
	DiScope own: (properties := SDL3PropertyGroup unownedNew).
	properties pointerAt: SDL_PROP_PROCESS_CREATE_ARGS_POINTER put: argumentsArray getHandle.
	properties stringAt: SDL_PROP_PROCESS_CREATE_WORKING_DIRECTORY_STRING put: expectedPath.
	properties numberAt: SDL_PROP_PROCESS_CREATE_STDOUT_NUMBER put: SDL3ProcessIO app value.

	DiScope own: (process := SDL3Process unownedSpawnWithProperties: properties).
	stdoutString := process stdout readStringUpToEnd.
	exitCode := process waitExit.
	self assert: exitCode equals: 0.
	self assert: stdoutString lines first equals: expectedPath.
	self assert: process hasExited
]

{ #category : 'tests' }
SDL3ProcessTest >> test12SpawnWithEnvironment [
	"Verify configuring child process environment variables using SDL_PROP_PROCESS_CREATE_ENVIRONMENT_POINTER."

	| environment argumentsArray properties process stdoutString exitCode |
	environment := SDL3Library uniqueInstance createEnvironment: true.
	DiScope own: environment.
	environment variableEnvName: 'PHARO_TEST_VAR' value: 'SDL3Rocks' overwrite: true.

	argumentsArray := SDL3NullTerminatedStringArray unownedFromStrings:
		                  (OSPlatform current isWindows
			                   ifTrue: [ #('cmd.exe' '/c' 'echo %PHARO_TEST_VAR%') ]
			                   ifFalse: [ #('sh' '-c' 'echo "$PHARO_TEST_VAR"') ]).
	DiScope own: argumentsArray.
	DiScope own: (properties := SDL3PropertyGroup unownedNew).
	properties pointerAt: SDL_PROP_PROCESS_CREATE_ARGS_POINTER put: argumentsArray getHandle.
	properties pointerAt: SDL_PROP_PROCESS_CREATE_ENVIRONMENT_POINTER put: environment getHandle.
	properties numberAt: SDL_PROP_PROCESS_CREATE_STDOUT_NUMBER put: SDL3ProcessIO app value.

	DiScope own: (process := SDL3Process unownedSpawnWithProperties: properties).
	stdoutString := process stdout readStringUpToEnd.
	exitCode := process waitExit.
	self assert: exitCode equals: 0.
	self assert: stdoutString lines first equals: 'SDL3Rocks'.
	self assert: process hasExited
]

{ #category : 'tests' }
SDL3ProcessTest >> test13SpawnWithStderrRedirectedToStdout [
	"Verify redirecting standard error into standard output (2>&1) using
	SDL_PROP_PROCESS_CREATE_STDERR_TO_STDOUT_BOOLEAN."

	| argumentsArray properties process stdoutString exitCode |
	argumentsArray := SDL3NullTerminatedStringArray unownedFromStrings:
		                  (OSPlatform current isWindows
			                   ifTrue: [ #('cmd.exe' '/c' 'echo Redirected error message 1>&2') ]
			                   ifFalse: [ #('sh' '-c' 'echo "Redirected error message" >&2') ]).
	DiScope own: argumentsArray.
	DiScope own: (properties := SDL3PropertyGroup unownedNew).
	properties pointerAt: SDL_PROP_PROCESS_CREATE_ARGS_POINTER put: argumentsArray getHandle.
	properties booleanAt: SDL_PROP_PROCESS_CREATE_STDERR_TO_STDOUT_BOOLEAN put: true.
	properties numberAt: SDL_PROP_PROCESS_CREATE_STDOUT_NUMBER put: SDL3ProcessIO app value.

	DiScope own: (process := SDL3Process unownedSpawnWithProperties: properties).
	self assert: process pid > 0.
	self should: [ process stderr ] raise: SDL3Error.

	stdoutString := process stdout readStringUpToEnd.
	exitCode := process waitExit.
	self assert: exitCode equals: 0.
	"Windows cmd.exe echo includes the space before 1>&2 in its output.
	Trim trailing whitespace to ensure cross-platform parity."
	self assert: stdoutString lines first trimRight equals: 'Redirected error message'.
	self assert: process hasExited
]
