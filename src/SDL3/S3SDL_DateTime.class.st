Class {
	#name : 'S3SDL_DateTime',
	#superclass : 'S3Structure',
	#classVars : [
		'OFFSET_DAY',
		'OFFSET_DAY_OF_WEEK',
		'OFFSET_HOUR',
		'OFFSET_MINUTE',
		'OFFSET_MONTH',
		'OFFSET_NANOSECOND',
		'OFFSET_SECOND',
		'OFFSET_UTC_OFFSET',
		'OFFSET_YEAR'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
S3SDL_DateTime class >> fieldsDesc [

	^ #(
	int year;
	int month;
	int day;
	int hour;
	int minute;
	int second;
	int nanosecond;
	int day_of_week;
	int utc_offset
	)
]

{ #category : 'accessing - structure variables' }
S3SDL_DateTime >> day [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_DAY
]

{ #category : 'accessing - structure variables' }
S3SDL_DateTime >> day: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_DAY put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_DateTime >> day_of_week [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_DAY_OF_WEEK
]

{ #category : 'accessing - structure variables' }
S3SDL_DateTime >> day_of_week: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_DAY_OF_WEEK put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_DateTime >> hour [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_HOUR
]

{ #category : 'accessing - structure variables' }
S3SDL_DateTime >> hour: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_HOUR put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_DateTime >> minute [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_MINUTE
]

{ #category : 'accessing - structure variables' }
S3SDL_DateTime >> minute: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_MINUTE put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_DateTime >> month [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_MONTH
]

{ #category : 'accessing - structure variables' }
S3SDL_DateTime >> month: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_MONTH put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_DateTime >> nanosecond [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NANOSECOND
]

{ #category : 'accessing - structure variables' }
S3SDL_DateTime >> nanosecond: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NANOSECOND put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_DateTime >> second [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_SECOND
]

{ #category : 'accessing - structure variables' }
S3SDL_DateTime >> second: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_SECOND put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_DateTime >> utc_offset [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_UTC_OFFSET
]

{ #category : 'accessing - structure variables' }
S3SDL_DateTime >> utc_offset: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_UTC_OFFSET put: anObject
]

{ #category : 'accessing - structure variables' }
S3SDL_DateTime >> year [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_YEAR
]

{ #category : 'accessing - structure variables' }
S3SDL_DateTime >> year: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_YEAR put: anObject
]
