Extension { #name : 'OSWorldRenderer' }

{ #category : '*SDL3-OSWindow' }
OSWorldRenderer class >> restart [

	| oldWindows driverClass |
	UIManager default deactivate.

	"We need to keep all open windows, after the restart if they are still valid we register them back. If we don't do this the events for these windows are never delivered."
	driverClass := OSWindowDriver driverClass.
	oldWindows := driverClass allWindows.

	self shutDown: true.
	driverClass shutDown: true.

	self startUp: true.
	UIManager default activate.

	oldWindows
	 select: [ :e | e shouldRegisterAfterRestart ]
	 thenDo: [ :e | driverClass current registerWindow: e ].

	InformativeNotification signal: self class name , ' restarted'
]
