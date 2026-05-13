Extension { #name : 'SDL3Texture' }

{ #category : '*SDL3-Own' }
SDL3Texture >> extent [
	^ self w @ self h
]

{ #category : '*SDL3-Own' }
SDL3Texture >> floatExtent [
	"Use API to answer my (float) extent"

	| widthValueHolder heightValueHolder |
	widthValueHolder := FFIFloat32 newValueHolder.
	heightValueHolder := FFIFloat32 newValueHolder.

	self getSizeIntoW: widthValueHolder h: heightValueHolder.

	^ widthValueHolder value @ heightValueHolder value
]

{ #category : '*SDL3-Own' }
SDL3Texture >> propertyGroup [

	^ SDL3PropertyGroup id: self propertiesID
]
