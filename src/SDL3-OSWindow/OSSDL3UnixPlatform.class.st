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
