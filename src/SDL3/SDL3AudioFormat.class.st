Class {
	#name : 'SDL3AudioFormat',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_AUDIO_F32',
		'SDL_AUDIO_F32BE',
		'SDL_AUDIO_F32LE',
		'SDL_AUDIO_S16',
		'SDL_AUDIO_S16BE',
		'SDL_AUDIO_S16LE',
		'SDL_AUDIO_S32',
		'SDL_AUDIO_S32BE',
		'SDL_AUDIO_S32LE',
		'SDL_AUDIO_S8',
		'SDL_AUDIO_U8',
		'SDL_AUDIO_UNKNOWN'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'enum declaration' }
SDL3AudioFormat class >> enumDecl [

	^ #(
	SDL_AUDIO_UNKNOWN 0
	SDL_AUDIO_U8 8
	SDL_AUDIO_S8 32776
	SDL_AUDIO_S16LE 32784
	SDL_AUDIO_S16BE 36880
	SDL_AUDIO_S32LE 32800
	SDL_AUDIO_S32BE 36896
	SDL_AUDIO_F32LE 33056
	SDL_AUDIO_F32BE 37152
	SDL_AUDIO_S16 32784
	SDL_AUDIO_S32 32800
	SDL_AUDIO_F32 33056 )
]

{ #category : 'accessing enum' }
SDL3AudioFormat class >> f32 [
	"This method was automatically generated"
	^ SDL_AUDIO_F32
]

{ #category : 'accessing enum' }
SDL3AudioFormat class >> f32be [
	"This method was automatically generated"
	^ SDL_AUDIO_F32BE
]

{ #category : 'accessing enum' }
SDL3AudioFormat class >> f32le [
	"This method was automatically generated"
	^ SDL_AUDIO_F32LE
]

{ #category : 'accessing enum' }
SDL3AudioFormat class >> s16 [
	"This method was automatically generated"
	^ SDL_AUDIO_S16
]

{ #category : 'accessing enum' }
SDL3AudioFormat class >> s16be [
	"This method was automatically generated"
	^ SDL_AUDIO_S16BE
]

{ #category : 'accessing enum' }
SDL3AudioFormat class >> s16le [
	"This method was automatically generated"
	^ SDL_AUDIO_S16LE
]

{ #category : 'accessing enum' }
SDL3AudioFormat class >> s32 [
	"This method was automatically generated"
	^ SDL_AUDIO_S32
]

{ #category : 'accessing enum' }
SDL3AudioFormat class >> s32be [
	"This method was automatically generated"
	^ SDL_AUDIO_S32BE
]

{ #category : 'accessing enum' }
SDL3AudioFormat class >> s32le [
	"This method was automatically generated"
	^ SDL_AUDIO_S32LE
]

{ #category : 'accessing enum' }
SDL3AudioFormat class >> s8 [
	"This method was automatically generated"
	^ SDL_AUDIO_S8
]

{ #category : 'accessing enum' }
SDL3AudioFormat class >> u8 [
	"This method was automatically generated"
	^ SDL_AUDIO_U8
]

{ #category : 'accessing enum' }
SDL3AudioFormat class >> unknown [
	"This method was automatically generated"
	^ SDL_AUDIO_UNKNOWN
]
