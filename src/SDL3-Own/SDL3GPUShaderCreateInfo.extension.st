Extension { #name : 'SDL3GPUShaderCreateInfo' }

{ #category : '*SDL3-Own' }
SDL3GPUShaderCreateInfo >> base64Source: aBase64String [

	| decoder source |
	decoder := ZnBase64Encoder new.

	source :=
		FFIExternalArray
			externalNewType: FFICharacterType
			size: (decoder byteCountFor: aBase64String).

	source autoRelease.

	decoder decode: aBase64String readStream to: source writeStream.

	self
		code: source;
		codeSize: source size
]
