Class {
	#name : 'SDL3IconvDataT',
	#superclass : 'S3BaseObject',
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'finalizing' }
SDL3IconvDataT >> dispose [

	self ffiCall: #(void SDL_iconv_data_t_dispose(SDL_iconv_data_t* self))
]
