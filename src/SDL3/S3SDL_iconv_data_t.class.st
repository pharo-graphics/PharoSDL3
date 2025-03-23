Class {
	#name : 'S3SDL_iconv_data_t',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
S3SDL_iconv_data_t >> dispose [

	self ffiCall: #(void SDL_iconv_data_t_dispose(SDL_iconv_data_t* self))
]
