"
I am a SDL3 FFI binding for `SDL_Thread`.

The SDL thread object.

See: https://wiki.libsdl.org/SDL3/SDL_Thread
"
Class {
	#name : 'SDL3Thread',
	#superclass : 'SDL3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'instance creation' }
SDL3Thread class >> unownedNewFn: fn name: aString data: data [

	^ (self ffiLibrary createThreadFn: fn name: aString data: data)
		  assertNotNullReturn;
		  yourself
]
