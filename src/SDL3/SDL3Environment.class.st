"
I am a SDL3 FFI binding for `SDL_Environment`.

A thread-safe set of environment variables

See: https://wiki.libsdl.org/SDL3/SDL_Environment
"
Class {
	#name : 'SDL3Environment',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalization' }
SDL3Environment >> destroy [

	self ffiLibrary destroyEnvironment: self
]

{ #category : 'accessing' }
SDL3Environment >> getVariableEnvIntoName: name [

	^ self ffiLibrary getEnvironmentVariableEnv: self name: name
]

{ #category : 'accessing' }
SDL3Environment >> unsetVariableEnvName: name [

	self ffiLibrary assertSuccess:
		(self ffiLibrary unsetEnvironmentVariableEnv: self name: name)
]

{ #category : 'accessing' }
SDL3Environment >> variableEnvName: name value: value overwrite: overwrite [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setEnvironmentVariableEnv: self
			name: name
			value: value
			overwrite: overwrite)
]

{ #category : 'accessing' }
SDL3Environment >> variables [

	^ self ffiLibrary getEnvironmentVariables: self
]
