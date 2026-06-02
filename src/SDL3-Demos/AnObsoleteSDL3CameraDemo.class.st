"
I demonstrate how to use the SDL3 Camera API in Pharo.

I capture frames from a connected camera and render them to a texture. I'm a simplified adaptation of SDL3's `test/testcamera.c`.
"
Class {
	#name : 'AnObsoleteSDL3CameraDemo',
	#superclass : 'AnObsoleteSDL3Demo',
	#instVars : [
		'camera',
		'texture',
		'currentFrameSurface'
	],
	#category : 'SDL3-Tests-Camera',
	#package : 'SDL3-Tests',
	#tag : 'Camera'
}
