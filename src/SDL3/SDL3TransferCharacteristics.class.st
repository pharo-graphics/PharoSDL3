Class {
	#name : 'SDL3TransferCharacteristics',
	#superclass : 'S3Enumeration',
	#classVars : [
		'SDL_TRANSFER_CHARACTERISTICS_BT1361',
		'SDL_TRANSFER_CHARACTERISTICS_BT2020_10BIT',
		'SDL_TRANSFER_CHARACTERISTICS_BT2020_12BIT',
		'SDL_TRANSFER_CHARACTERISTICS_BT601',
		'SDL_TRANSFER_CHARACTERISTICS_BT709',
		'SDL_TRANSFER_CHARACTERISTICS_CUSTOM',
		'SDL_TRANSFER_CHARACTERISTICS_GAMMA22',
		'SDL_TRANSFER_CHARACTERISTICS_GAMMA28',
		'SDL_TRANSFER_CHARACTERISTICS_HLG',
		'SDL_TRANSFER_CHARACTERISTICS_IEC61966',
		'SDL_TRANSFER_CHARACTERISTICS_LINEAR',
		'SDL_TRANSFER_CHARACTERISTICS_LOG100',
		'SDL_TRANSFER_CHARACTERISTICS_LOG100_SQRT10',
		'SDL_TRANSFER_CHARACTERISTICS_PQ',
		'SDL_TRANSFER_CHARACTERISTICS_SMPTE240',
		'SDL_TRANSFER_CHARACTERISTICS_SMPTE428',
		'SDL_TRANSFER_CHARACTERISTICS_SRGB',
		'SDL_TRANSFER_CHARACTERISTICS_UNKNOWN',
		'SDL_TRANSFER_CHARACTERISTICS_UNSPECIFIED'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
SDL3TransferCharacteristics class >> bt1361 [
	"This method was automatically generated"
	^ SDL_TRANSFER_CHARACTERISTICS_BT1361
]

{ #category : 'accessing enum' }
SDL3TransferCharacteristics class >> bt202010bit [
	"This method was automatically generated"
	^ SDL_TRANSFER_CHARACTERISTICS_BT2020_10BIT
]

{ #category : 'accessing enum' }
SDL3TransferCharacteristics class >> bt202012bit [
	"This method was automatically generated"
	^ SDL_TRANSFER_CHARACTERISTICS_BT2020_12BIT
]

{ #category : 'accessing enum' }
SDL3TransferCharacteristics class >> bt601 [
	"This method was automatically generated"
	^ SDL_TRANSFER_CHARACTERISTICS_BT601
]

{ #category : 'accessing enum' }
SDL3TransferCharacteristics class >> bt709 [
	"This method was automatically generated"
	^ SDL_TRANSFER_CHARACTERISTICS_BT709
]

{ #category : 'accessing enum' }
SDL3TransferCharacteristics class >> custom [
	"This method was automatically generated"
	^ SDL_TRANSFER_CHARACTERISTICS_CUSTOM
]

{ #category : 'enum declaration' }
SDL3TransferCharacteristics class >> enumDecl [

	^ #(
	SDL_TRANSFER_CHARACTERISTICS_UNKNOWN 0
	SDL_TRANSFER_CHARACTERISTICS_BT709 1
	SDL_TRANSFER_CHARACTERISTICS_UNSPECIFIED 2
	SDL_TRANSFER_CHARACTERISTICS_GAMMA22 4
	SDL_TRANSFER_CHARACTERISTICS_GAMMA28 5
	SDL_TRANSFER_CHARACTERISTICS_BT601 6
	SDL_TRANSFER_CHARACTERISTICS_SMPTE240 7
	SDL_TRANSFER_CHARACTERISTICS_LINEAR 8
	SDL_TRANSFER_CHARACTERISTICS_LOG100 9
	SDL_TRANSFER_CHARACTERISTICS_LOG100_SQRT10 10
	SDL_TRANSFER_CHARACTERISTICS_IEC61966 11
	SDL_TRANSFER_CHARACTERISTICS_BT1361 12
	SDL_TRANSFER_CHARACTERISTICS_SRGB 13
	SDL_TRANSFER_CHARACTERISTICS_BT2020_10BIT 14
	SDL_TRANSFER_CHARACTERISTICS_BT2020_12BIT 15
	SDL_TRANSFER_CHARACTERISTICS_PQ 16
	SDL_TRANSFER_CHARACTERISTICS_SMPTE428 17
	SDL_TRANSFER_CHARACTERISTICS_HLG 18
	SDL_TRANSFER_CHARACTERISTICS_CUSTOM 31 )
]

{ #category : 'accessing enum' }
SDL3TransferCharacteristics class >> gamma22 [
	"This method was automatically generated"
	^ SDL_TRANSFER_CHARACTERISTICS_GAMMA22
]

{ #category : 'accessing enum' }
SDL3TransferCharacteristics class >> gamma28 [
	"This method was automatically generated"
	^ SDL_TRANSFER_CHARACTERISTICS_GAMMA28
]

{ #category : 'accessing enum' }
SDL3TransferCharacteristics class >> hlg [
	"This method was automatically generated"
	^ SDL_TRANSFER_CHARACTERISTICS_HLG
]

{ #category : 'accessing enum' }
SDL3TransferCharacteristics class >> iec61966 [
	"This method was automatically generated"
	^ SDL_TRANSFER_CHARACTERISTICS_IEC61966
]

{ #category : 'accessing enum' }
SDL3TransferCharacteristics class >> linear [
	"This method was automatically generated"
	^ SDL_TRANSFER_CHARACTERISTICS_LINEAR
]

{ #category : 'accessing enum' }
SDL3TransferCharacteristics class >> log100 [
	"This method was automatically generated"
	^ SDL_TRANSFER_CHARACTERISTICS_LOG100
]

{ #category : 'accessing enum' }
SDL3TransferCharacteristics class >> log100Sqrt10 [
	"This method was automatically generated"
	^ SDL_TRANSFER_CHARACTERISTICS_LOG100_SQRT10
]

{ #category : 'accessing enum' }
SDL3TransferCharacteristics class >> pq [
	"This method was automatically generated"
	^ SDL_TRANSFER_CHARACTERISTICS_PQ
]

{ #category : 'accessing enum' }
SDL3TransferCharacteristics class >> smpte240 [
	"This method was automatically generated"
	^ SDL_TRANSFER_CHARACTERISTICS_SMPTE240
]

{ #category : 'accessing enum' }
SDL3TransferCharacteristics class >> smpte428 [
	"This method was automatically generated"
	^ SDL_TRANSFER_CHARACTERISTICS_SMPTE428
]

{ #category : 'accessing enum' }
SDL3TransferCharacteristics class >> srgb [
	"This method was automatically generated"
	^ SDL_TRANSFER_CHARACTERISTICS_SRGB
]

{ #category : 'accessing enum' }
SDL3TransferCharacteristics class >> unknown [
	"This method was automatically generated"
	^ SDL_TRANSFER_CHARACTERISTICS_UNKNOWN
]

{ #category : 'accessing enum' }
SDL3TransferCharacteristics class >> unspecified [
	"This method was automatically generated"
	^ SDL_TRANSFER_CHARACTERISTICS_UNSPECIFIED
]
