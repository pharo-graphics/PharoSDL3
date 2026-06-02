Extension { #name : 'SDL3Environment' }

{ #category : '*SDL3-API' }
SDL3Environment >> destroy [

	self ffiLibrary destroyEnvironment: self
]

{ #category : '*SDL3-API' }
SDL3Environment >> getVariableEnvIntoName: name [

	^ self ffiLibrary getEnvironmentVariableEnv: self name: name
]

{ #category : '*SDL3-API' }
SDL3Environment >> unsetVariableEnvName: name [

	self ffiLibrary assertSuccess:
		(self ffiLibrary unsetEnvironmentVariableEnv: self name: name)
]

{ #category : '*SDL3-API' }
SDL3Environment >> variableEnvName: name value: value overwrite: overwrite [

	self ffiLibrary assertSuccess:
		(self ffiLibrary
			setEnvironmentVariableEnv: self
			name: name
			value: value
			overwrite: overwrite)
]

{ #category : '*SDL3-API' }
SDL3Environment >> variables [

	^ self ffiLibrary getEnvironmentVariables: self
]
