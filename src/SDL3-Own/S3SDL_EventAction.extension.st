Extension { #name : 'S3SDL_EventAction' }

{ #category : '*SDL3-Own' }
S3SDL_EventAction class >> enumDeclToCamelCaseDictionary [

	^ super enumDeclToCamelCaseDictionary
		add: #SDL_ADDEVENT -> 'addEvent';
		add: #SDL_PEEKEVENT -> 'peekEvent';
		add: #SDL_GETEVENT ->'getEvent';
		yourself
]
