"
I execute specific operations on SDL for Linux 64 (Unix term is used to keep OSPlatform convention)

"
Class {
	#name : 'OSSDL3UnixPlatform',
	#superclass : 'OSSDL3Platform',
	#category : 'SDL3-OSWindow-Platforms',
	#package : 'SDL3-OSWindow',
	#tag : 'Platforms'
}

{ #category : 'initialization' }
OSSDL3UnixPlatform >> initPlatformSpecific [

	"Set SDL to not disable WM compositing"
	LibSDL3 uniqueInstance setHintName: SDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR value: '0'
]

{ #category : 'public' }
OSSDL3UnixPlatform >> platformSpecificHandleOf: aOSSDL3BackendWindow [

	| properties waylandSurface x11Window |
	properties := aOSSDL3BackendWindow sdlWindow propertyGroup.

	waylandSurface := properties
		                  pointerAt: SDL_PROP_WINDOW_WAYLAND_SURFACE_POINTER
		                  ifAbsent: nil.
	(waylandSurface isNotNil and: [ waylandSurface isNull not ]) ifTrue: [ 
		^ waylandSurface ].

	x11Window := properties
		             numberAt: SDL_PROP_WINDOW_X11_WINDOW_NUMBER
		             ifAbsent: 0.
	x11Window isZero ifFalse: [ ^ x11Window ].

	^ nil
]
