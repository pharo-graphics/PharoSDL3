Class {
	#name : 'S3SDL_imageTypedef',
	#superclass : 'SharedPool',
	#classVars : [
		'IMG_Animation'
	],
	#category : 'SDL3-Image-Library',
	#package : 'SDL3-Image',
	#tag : 'Library'
}

{ #category : 'class initialization' }
S3SDL_imageTypedef class >> initialize [

	IMG_Animation := S3IMG_Animation
]
