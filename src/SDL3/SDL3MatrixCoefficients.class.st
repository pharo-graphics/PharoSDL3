Class {
	#name : 'SDL3MatrixCoefficients',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_MATRIX_COEFFICIENTS_BT2020_CL',
		'SDL_MATRIX_COEFFICIENTS_BT2020_NCL',
		'SDL_MATRIX_COEFFICIENTS_BT470BG',
		'SDL_MATRIX_COEFFICIENTS_BT601',
		'SDL_MATRIX_COEFFICIENTS_BT709',
		'SDL_MATRIX_COEFFICIENTS_CHROMA_DERIVED_CL',
		'SDL_MATRIX_COEFFICIENTS_CHROMA_DERIVED_NCL',
		'SDL_MATRIX_COEFFICIENTS_CUSTOM',
		'SDL_MATRIX_COEFFICIENTS_FCC',
		'SDL_MATRIX_COEFFICIENTS_ICTCP',
		'SDL_MATRIX_COEFFICIENTS_IDENTITY',
		'SDL_MATRIX_COEFFICIENTS_SMPTE2085',
		'SDL_MATRIX_COEFFICIENTS_SMPTE240',
		'SDL_MATRIX_COEFFICIENTS_UNSPECIFIED',
		'SDL_MATRIX_COEFFICIENTS_YCGCO'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
SDL3MatrixCoefficients class >> bt2020Cl [
	"This method was automatically generated"
	^ SDL_MATRIX_COEFFICIENTS_BT2020_CL
]

{ #category : 'accessing enum' }
SDL3MatrixCoefficients class >> bt2020Ncl [
	"This method was automatically generated"
	^ SDL_MATRIX_COEFFICIENTS_BT2020_NCL
]

{ #category : 'accessing enum' }
SDL3MatrixCoefficients class >> bt470bg [
	"This method was automatically generated"
	^ SDL_MATRIX_COEFFICIENTS_BT470BG
]

{ #category : 'accessing enum' }
SDL3MatrixCoefficients class >> bt601 [
	"This method was automatically generated"
	^ SDL_MATRIX_COEFFICIENTS_BT601
]

{ #category : 'accessing enum' }
SDL3MatrixCoefficients class >> bt709 [
	"This method was automatically generated"
	^ SDL_MATRIX_COEFFICIENTS_BT709
]

{ #category : 'accessing enum' }
SDL3MatrixCoefficients class >> chromaDerivedCl [
	"This method was automatically generated"
	^ SDL_MATRIX_COEFFICIENTS_CHROMA_DERIVED_CL
]

{ #category : 'accessing enum' }
SDL3MatrixCoefficients class >> chromaDerivedNcl [
	"This method was automatically generated"
	^ SDL_MATRIX_COEFFICIENTS_CHROMA_DERIVED_NCL
]

{ #category : 'accessing enum' }
SDL3MatrixCoefficients class >> custom [
	"This method was automatically generated"
	^ SDL_MATRIX_COEFFICIENTS_CUSTOM
]

{ #category : 'enum declaration' }
SDL3MatrixCoefficients class >> enumDecl [

	^ #(
	SDL_MATRIX_COEFFICIENTS_IDENTITY 0
	SDL_MATRIX_COEFFICIENTS_BT709 1
	SDL_MATRIX_COEFFICIENTS_UNSPECIFIED 2
	SDL_MATRIX_COEFFICIENTS_FCC 4
	SDL_MATRIX_COEFFICIENTS_BT470BG 5
	SDL_MATRIX_COEFFICIENTS_BT601 6
	SDL_MATRIX_COEFFICIENTS_SMPTE240 7
	SDL_MATRIX_COEFFICIENTS_YCGCO 8
	SDL_MATRIX_COEFFICIENTS_BT2020_NCL 9
	SDL_MATRIX_COEFFICIENTS_BT2020_CL 10
	SDL_MATRIX_COEFFICIENTS_SMPTE2085 11
	SDL_MATRIX_COEFFICIENTS_CHROMA_DERIVED_NCL 12
	SDL_MATRIX_COEFFICIENTS_CHROMA_DERIVED_CL 13
	SDL_MATRIX_COEFFICIENTS_ICTCP 14
	SDL_MATRIX_COEFFICIENTS_CUSTOM 31 )
]

{ #category : 'accessing enum' }
SDL3MatrixCoefficients class >> fcc [
	"This method was automatically generated"
	^ SDL_MATRIX_COEFFICIENTS_FCC
]

{ #category : 'accessing enum' }
SDL3MatrixCoefficients class >> ictcp [
	"This method was automatically generated"
	^ SDL_MATRIX_COEFFICIENTS_ICTCP
]

{ #category : 'accessing enum' }
SDL3MatrixCoefficients class >> identity [
	"This method was automatically generated"
	^ SDL_MATRIX_COEFFICIENTS_IDENTITY
]

{ #category : 'accessing enum' }
SDL3MatrixCoefficients class >> smpte2085 [
	"This method was automatically generated"
	^ SDL_MATRIX_COEFFICIENTS_SMPTE2085
]

{ #category : 'accessing enum' }
SDL3MatrixCoefficients class >> smpte240 [
	"This method was automatically generated"
	^ SDL_MATRIX_COEFFICIENTS_SMPTE240
]

{ #category : 'accessing enum' }
SDL3MatrixCoefficients class >> unspecified [
	"This method was automatically generated"
	^ SDL_MATRIX_COEFFICIENTS_UNSPECIFIED
]

{ #category : 'accessing enum' }
SDL3MatrixCoefficients class >> ycgco [
	"This method was automatically generated"
	^ SDL_MATRIX_COEFFICIENTS_YCGCO
]
