Class {
	#name : 'S3SDL_AudioFormat',
	#superclass : 'S3Enumeration',
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

{ #category : 'accessing enum' }
S3SDL_AudioFormat class >> SDL_AUDIO_F32 [
	"This method was automatically generated"
	^ SDL_AUDIO_F32
]

{ #category : 'accessing enum' }
S3SDL_AudioFormat class >> SDL_AUDIO_F32BE [
	"This method was automatically generated"
	^ SDL_AUDIO_F32BE
]

{ #category : 'accessing enum' }
S3SDL_AudioFormat class >> SDL_AUDIO_F32LE [
	"This method was automatically generated"
	^ SDL_AUDIO_F32LE
]

{ #category : 'accessing enum' }
S3SDL_AudioFormat class >> SDL_AUDIO_S16 [
	"This method was automatically generated"
	^ SDL_AUDIO_S16
]

{ #category : 'accessing enum' }
S3SDL_AudioFormat class >> SDL_AUDIO_S16BE [
	"This method was automatically generated"
	^ SDL_AUDIO_S16BE
]

{ #category : 'accessing enum' }
S3SDL_AudioFormat class >> SDL_AUDIO_S16LE [
	"This method was automatically generated"
	^ SDL_AUDIO_S16LE
]

{ #category : 'accessing enum' }
S3SDL_AudioFormat class >> SDL_AUDIO_S32 [
	"This method was automatically generated"
	^ SDL_AUDIO_S32
]

{ #category : 'accessing enum' }
S3SDL_AudioFormat class >> SDL_AUDIO_S32BE [
	"This method was automatically generated"
	^ SDL_AUDIO_S32BE
]

{ #category : 'accessing enum' }
S3SDL_AudioFormat class >> SDL_AUDIO_S32LE [
	"This method was automatically generated"
	^ SDL_AUDIO_S32LE
]

{ #category : 'accessing enum' }
S3SDL_AudioFormat class >> SDL_AUDIO_S8 [
	"This method was automatically generated"
	^ SDL_AUDIO_S8
]

{ #category : 'accessing enum' }
S3SDL_AudioFormat class >> SDL_AUDIO_U8 [
	"This method was automatically generated"
	^ SDL_AUDIO_U8
]

{ #category : 'accessing enum' }
S3SDL_AudioFormat class >> SDL_AUDIO_UNKNOWN [
	"This method was automatically generated"
	^ SDL_AUDIO_UNKNOWN
]

{ #category : 'enum declaration' }
S3SDL_AudioFormat class >> enumDecl [

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
