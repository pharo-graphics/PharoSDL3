Class {
	#name : 'S3Enumeration',
	#superclass : 'FFIEnumeration',
	#traits : 'LibTSDL3',
	#classTraits : 'LibTSDL3 classTrait',
	#pools : [
		'S3SDL3Typedef'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'bit manipulation' }
S3Enumeration >> bitOr: anInteger [

	^ self asInteger bitOr: anInteger
]

{ #category : 'logical operations' }
S3Enumeration >> | another [

	^ self asInteger | another asInteger
]
