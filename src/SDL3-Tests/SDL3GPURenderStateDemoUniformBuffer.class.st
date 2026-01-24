"
I am the uniform buffer that holds input parameters for the fragment shaders used by `SDL3GPURenderStateDemo`.

The HLSL code of such shaders declare something like:

```
cbuffer Context : register(b0, space3)
{
    float time; // Elapsed time in seconds
    float2 resolution; // Viewport width/height in pixels
}
```
those 3 floats will have my 3 fields. Note the order in the declaration is essential, not the names.
"
Class {
	#name : 'SDL3GPURenderStateDemoUniformBuffer',
	#superclass : 'FFIStructure',
	#classVars : [
		'OFFSET_RESOLUTIONX',
		'OFFSET_RESOLUTIONY',
		'OFFSET_TIME'
	],
	#category : 'SDL3-Tests-Shaders',
	#package : 'SDL3-Tests',
	#tag : 'Shaders'
}

{ #category : 'field definition' }
SDL3GPURenderStateDemoUniformBuffer class >> fieldsDesc [
	"self rebuildFieldAccessors"

	^ #(
		float time;
		float resolutionX;
		float resolutionY;
		)
]

{ #category : 'accessing' }
SDL3GPURenderStateDemoUniformBuffer >> byteSize [

	^ self class byteSize
]

{ #category : 'accessing - structure variables' }
SDL3GPURenderStateDemoUniformBuffer >> resolutionX [
	"This method was automatically generated"
	^handle floatAt: OFFSET_RESOLUTIONX
]

{ #category : 'accessing - structure variables' }
SDL3GPURenderStateDemoUniformBuffer >> resolutionX: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_RESOLUTIONX put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPURenderStateDemoUniformBuffer >> resolutionY [
	"This method was automatically generated"
	^handle floatAt: OFFSET_RESOLUTIONY
]

{ #category : 'accessing - structure variables' }
SDL3GPURenderStateDemoUniformBuffer >> resolutionY: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_RESOLUTIONY put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPURenderStateDemoUniformBuffer >> time [
	"This method was automatically generated"
	^handle floatAt: OFFSET_TIME
]

{ #category : 'accessing - structure variables' }
SDL3GPURenderStateDemoUniformBuffer >> time: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_TIME put: anObject
]
