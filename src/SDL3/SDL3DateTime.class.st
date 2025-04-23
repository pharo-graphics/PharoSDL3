Class {
	#name : 'SDL3DateTime',
	#superclass : 'SDL3Structure',
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
SDL3DateTime class >> fieldsDesc [

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
SDL3DateTime >> day [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_DAY
]

{ #category : 'accessing - structure variables' }
SDL3DateTime >> day: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_DAY put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3DateTime >> day_of_week [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_DAY_OF_WEEK
]

{ #category : 'accessing - structure variables' }
SDL3DateTime >> day_of_week: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_DAY_OF_WEEK put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3DateTime >> hour [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_HOUR
]

{ #category : 'accessing - structure variables' }
SDL3DateTime >> hour: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_HOUR put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3DateTime >> minute [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_MINUTE
]

{ #category : 'accessing - structure variables' }
SDL3DateTime >> minute: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_MINUTE put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3DateTime >> month [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_MONTH
]

{ #category : 'accessing - structure variables' }
SDL3DateTime >> month: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_MONTH put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3DateTime >> nanosecond [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NANOSECOND
]

{ #category : 'accessing - structure variables' }
SDL3DateTime >> nanosecond: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NANOSECOND put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3DateTime >> second [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_SECOND
]

{ #category : 'accessing - structure variables' }
SDL3DateTime >> second: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_SECOND put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3DateTime >> utc_offset [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_UTC_OFFSET
]

{ #category : 'accessing - structure variables' }
SDL3DateTime >> utc_offset: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_UTC_OFFSET put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3DateTime >> year [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_YEAR
]

{ #category : 'accessing - structure variables' }
SDL3DateTime >> year: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_YEAR put: anObject
]
