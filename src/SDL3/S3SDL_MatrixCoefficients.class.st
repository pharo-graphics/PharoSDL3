Class {
	#name : 'S3SDL_MatrixCoefficients',
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
S3SDL_MatrixCoefficients class >> SDL_MATRIX_COEFFICIENTS_BT2020_CL [
	"This method was automatically generated"
	^ SDL_MATRIX_COEFFICIENTS_BT2020_CL
]

{ #category : 'accessing enum' }
S3SDL_MatrixCoefficients class >> SDL_MATRIX_COEFFICIENTS_BT2020_NCL [
	"This method was automatically generated"
	^ SDL_MATRIX_COEFFICIENTS_BT2020_NCL
]

{ #category : 'accessing enum' }
S3SDL_MatrixCoefficients class >> SDL_MATRIX_COEFFICIENTS_BT470BG [
	"This method was automatically generated"
	^ SDL_MATRIX_COEFFICIENTS_BT470BG
]

{ #category : 'accessing enum' }
S3SDL_MatrixCoefficients class >> SDL_MATRIX_COEFFICIENTS_BT601 [
	"This method was automatically generated"
	^ SDL_MATRIX_COEFFICIENTS_BT601
]

{ #category : 'accessing enum' }
S3SDL_MatrixCoefficients class >> SDL_MATRIX_COEFFICIENTS_BT709 [
	"This method was automatically generated"
	^ SDL_MATRIX_COEFFICIENTS_BT709
]

{ #category : 'accessing enum' }
S3SDL_MatrixCoefficients class >> SDL_MATRIX_COEFFICIENTS_CHROMA_DERIVED_CL [
	"This method was automatically generated"
	^ SDL_MATRIX_COEFFICIENTS_CHROMA_DERIVED_CL
]

{ #category : 'accessing enum' }
S3SDL_MatrixCoefficients class >> SDL_MATRIX_COEFFICIENTS_CHROMA_DERIVED_NCL [
	"This method was automatically generated"
	^ SDL_MATRIX_COEFFICIENTS_CHROMA_DERIVED_NCL
]

{ #category : 'accessing enum' }
S3SDL_MatrixCoefficients class >> SDL_MATRIX_COEFFICIENTS_CUSTOM [
	"This method was automatically generated"
	^ SDL_MATRIX_COEFFICIENTS_CUSTOM
]

{ #category : 'accessing enum' }
S3SDL_MatrixCoefficients class >> SDL_MATRIX_COEFFICIENTS_FCC [
	"This method was automatically generated"
	^ SDL_MATRIX_COEFFICIENTS_FCC
]

{ #category : 'accessing enum' }
S3SDL_MatrixCoefficients class >> SDL_MATRIX_COEFFICIENTS_ICTCP [
	"This method was automatically generated"
	^ SDL_MATRIX_COEFFICIENTS_ICTCP
]

{ #category : 'accessing enum' }
S3SDL_MatrixCoefficients class >> SDL_MATRIX_COEFFICIENTS_IDENTITY [
	"This method was automatically generated"
	^ SDL_MATRIX_COEFFICIENTS_IDENTITY
]

{ #category : 'accessing enum' }
S3SDL_MatrixCoefficients class >> SDL_MATRIX_COEFFICIENTS_SMPTE2085 [
	"This method was automatically generated"
	^ SDL_MATRIX_COEFFICIENTS_SMPTE2085
]

{ #category : 'accessing enum' }
S3SDL_MatrixCoefficients class >> SDL_MATRIX_COEFFICIENTS_SMPTE240 [
	"This method was automatically generated"
	^ SDL_MATRIX_COEFFICIENTS_SMPTE240
]

{ #category : 'accessing enum' }
S3SDL_MatrixCoefficients class >> SDL_MATRIX_COEFFICIENTS_UNSPECIFIED [
	"This method was automatically generated"
	^ SDL_MATRIX_COEFFICIENTS_UNSPECIFIED
]

{ #category : 'accessing enum' }
S3SDL_MatrixCoefficients class >> SDL_MATRIX_COEFFICIENTS_YCGCO [
	"This method was automatically generated"
	^ SDL_MATRIX_COEFFICIENTS_YCGCO
]

{ #category : 'enum declaration' }
S3SDL_MatrixCoefficients class >> enumDecl [

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
