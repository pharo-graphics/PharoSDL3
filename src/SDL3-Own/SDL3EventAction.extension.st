Extension { #name : 'SDL3EventAction' }

{ #category : '*SDL3-Own' }
SDL3EventAction class >> enumDeclToCamelCaseDictionary [

	^ super enumDeclToCamelCaseDictionary
		add: #SDL_ADDEVENT -> 'addEvent';
		add: #SDL_PEEKEVENT -> 'peekEvent';
		add: #SDL_GETEVENT ->'getEvent';
		yourself
]
