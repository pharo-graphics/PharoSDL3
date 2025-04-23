Class {
	#name : 'SDL3GLAttr',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_GL_ACCELERATED_VISUAL',
		'SDL_GL_ACCUM_ALPHA_SIZE',
		'SDL_GL_ACCUM_BLUE_SIZE',
		'SDL_GL_ACCUM_GREEN_SIZE',
		'SDL_GL_ACCUM_RED_SIZE',
		'SDL_GL_ALPHA_SIZE',
		'SDL_GL_BLUE_SIZE',
		'SDL_GL_BUFFER_SIZE',
		'SDL_GL_CONTEXT_FLAGS',
		'SDL_GL_CONTEXT_MAJOR_VERSION',
		'SDL_GL_CONTEXT_MINOR_VERSION',
		'SDL_GL_CONTEXT_NO_ERROR',
		'SDL_GL_CONTEXT_PROFILE_MASK',
		'SDL_GL_CONTEXT_RELEASE_BEHAVIOR',
		'SDL_GL_CONTEXT_RESET_NOTIFICATION',
		'SDL_GL_DEPTH_SIZE',
		'SDL_GL_DOUBLEBUFFER',
		'SDL_GL_EGL_PLATFORM',
		'SDL_GL_FLOATBUFFERS',
		'SDL_GL_FRAMEBUFFER_SRGB_CAPABLE',
		'SDL_GL_GREEN_SIZE',
		'SDL_GL_MULTISAMPLEBUFFERS',
		'SDL_GL_MULTISAMPLESAMPLES',
		'SDL_GL_RED_SIZE',
		'SDL_GL_RETAINED_BACKING',
		'SDL_GL_SHARE_WITH_CURRENT_CONTEXT',
		'SDL_GL_STENCIL_SIZE',
		'SDL_GL_STEREO'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
SDL3GLAttr class >> acceleratedVisual [
	"This method was automatically generated"
	^ SDL_GL_ACCELERATED_VISUAL
]

{ #category : 'accessing enum' }
SDL3GLAttr class >> accumAlphaSize [
	"This method was automatically generated"
	^ SDL_GL_ACCUM_ALPHA_SIZE
]

{ #category : 'accessing enum' }
SDL3GLAttr class >> accumBlueSize [
	"This method was automatically generated"
	^ SDL_GL_ACCUM_BLUE_SIZE
]

{ #category : 'accessing enum' }
SDL3GLAttr class >> accumGreenSize [
	"This method was automatically generated"
	^ SDL_GL_ACCUM_GREEN_SIZE
]

{ #category : 'accessing enum' }
SDL3GLAttr class >> accumRedSize [
	"This method was automatically generated"
	^ SDL_GL_ACCUM_RED_SIZE
]

{ #category : 'accessing enum' }
SDL3GLAttr class >> alphaSize [
	"This method was automatically generated"
	^ SDL_GL_ALPHA_SIZE
]

{ #category : 'accessing enum' }
SDL3GLAttr class >> blueSize [
	"This method was automatically generated"
	^ SDL_GL_BLUE_SIZE
]

{ #category : 'accessing enum' }
SDL3GLAttr class >> bufferSize [
	"This method was automatically generated"
	^ SDL_GL_BUFFER_SIZE
]

{ #category : 'accessing enum' }
SDL3GLAttr class >> contextFlags [
	"This method was automatically generated"
	^ SDL_GL_CONTEXT_FLAGS
]

{ #category : 'accessing enum' }
SDL3GLAttr class >> contextMajorVersion [
	"This method was automatically generated"
	^ SDL_GL_CONTEXT_MAJOR_VERSION
]

{ #category : 'accessing enum' }
SDL3GLAttr class >> contextMinorVersion [
	"This method was automatically generated"
	^ SDL_GL_CONTEXT_MINOR_VERSION
]

{ #category : 'accessing enum' }
SDL3GLAttr class >> contextNoError [
	"This method was automatically generated"
	^ SDL_GL_CONTEXT_NO_ERROR
]

{ #category : 'accessing enum' }
SDL3GLAttr class >> contextProfileMask [
	"This method was automatically generated"
	^ SDL_GL_CONTEXT_PROFILE_MASK
]

{ #category : 'accessing enum' }
SDL3GLAttr class >> contextReleaseBehavior [
	"This method was automatically generated"
	^ SDL_GL_CONTEXT_RELEASE_BEHAVIOR
]

{ #category : 'accessing enum' }
SDL3GLAttr class >> contextResetNotification [
	"This method was automatically generated"
	^ SDL_GL_CONTEXT_RESET_NOTIFICATION
]

{ #category : 'accessing enum' }
SDL3GLAttr class >> depthSize [
	"This method was automatically generated"
	^ SDL_GL_DEPTH_SIZE
]

{ #category : 'accessing enum' }
SDL3GLAttr class >> doublebuffer [
	"This method was automatically generated"
	^ SDL_GL_DOUBLEBUFFER
]

{ #category : 'accessing enum' }
SDL3GLAttr class >> eglPlatform [
	"This method was automatically generated"
	^ SDL_GL_EGL_PLATFORM
]

{ #category : 'enum declaration' }
SDL3GLAttr class >> enumDecl [

	^ #(
	SDL_GL_RED_SIZE 0
	SDL_GL_GREEN_SIZE 1
	SDL_GL_BLUE_SIZE 2
	SDL_GL_ALPHA_SIZE 3
	SDL_GL_BUFFER_SIZE 4
	SDL_GL_DOUBLEBUFFER 5
	SDL_GL_DEPTH_SIZE 6
	SDL_GL_STENCIL_SIZE 7
	SDL_GL_ACCUM_RED_SIZE 8
	SDL_GL_ACCUM_GREEN_SIZE 9
	SDL_GL_ACCUM_BLUE_SIZE 10
	SDL_GL_ACCUM_ALPHA_SIZE 11
	SDL_GL_STEREO 12
	SDL_GL_MULTISAMPLEBUFFERS 13
	SDL_GL_MULTISAMPLESAMPLES 14
	SDL_GL_ACCELERATED_VISUAL 15
	SDL_GL_RETAINED_BACKING 16
	SDL_GL_CONTEXT_MAJOR_VERSION 17
	SDL_GL_CONTEXT_MINOR_VERSION 18
	SDL_GL_CONTEXT_FLAGS 19
	SDL_GL_CONTEXT_PROFILE_MASK 20
	SDL_GL_SHARE_WITH_CURRENT_CONTEXT 21
	SDL_GL_FRAMEBUFFER_SRGB_CAPABLE 22
	SDL_GL_CONTEXT_RELEASE_BEHAVIOR 23
	SDL_GL_CONTEXT_RESET_NOTIFICATION 24
	SDL_GL_CONTEXT_NO_ERROR 25
	SDL_GL_FLOATBUFFERS 26
	SDL_GL_EGL_PLATFORM 27 )
]

{ #category : 'accessing enum' }
SDL3GLAttr class >> floatbuffers [
	"This method was automatically generated"
	^ SDL_GL_FLOATBUFFERS
]

{ #category : 'accessing enum' }
SDL3GLAttr class >> framebufferSrgbCapable [
	"This method was automatically generated"
	^ SDL_GL_FRAMEBUFFER_SRGB_CAPABLE
]

{ #category : 'accessing enum' }
SDL3GLAttr class >> greenSize [
	"This method was automatically generated"
	^ SDL_GL_GREEN_SIZE
]

{ #category : 'accessing enum' }
SDL3GLAttr class >> multisamplebuffers [
	"This method was automatically generated"
	^ SDL_GL_MULTISAMPLEBUFFERS
]

{ #category : 'accessing enum' }
SDL3GLAttr class >> multisamplesamples [
	"This method was automatically generated"
	^ SDL_GL_MULTISAMPLESAMPLES
]

{ #category : 'accessing enum' }
SDL3GLAttr class >> redSize [
	"This method was automatically generated"
	^ SDL_GL_RED_SIZE
]

{ #category : 'accessing enum' }
SDL3GLAttr class >> retainedBacking [
	"This method was automatically generated"
	^ SDL_GL_RETAINED_BACKING
]

{ #category : 'accessing enum' }
SDL3GLAttr class >> shareWithCurrentContext [
	"This method was automatically generated"
	^ SDL_GL_SHARE_WITH_CURRENT_CONTEXT
]

{ #category : 'accessing enum' }
SDL3GLAttr class >> stencilSize [
	"This method was automatically generated"
	^ SDL_GL_STENCIL_SIZE
]

{ #category : 'accessing enum' }
SDL3GLAttr class >> stereo [
	"This method was automatically generated"
	^ SDL_GL_STEREO
]
