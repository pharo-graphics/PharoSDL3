"
This demo shows keyboard state monitoring (scancodes, keycodes, modifier keys) and Unicode text input.
"
Class {
	#name : 'SDL3KeyboardDemoApp',
	#superclass : 'SDL3ConsoleDemoApp',
	#category : 'SDL3-Demos-API',
	#package : 'SDL3-Demos',
	#tag : 'API'
}

{ #category : 'accessing' }
SDL3KeyboardDemoApp >> initialExtent [

	^ 800 @ 240
]

{ #category : 'initialization' }
SDL3KeyboardDemoApp >> initializeKeybindings [

	self
		bindKey: SDLK_K
		description: 'Toggle keyboard grab'
		action: [ window keyboardGrabbed: window isKeyboardGrabbed not ];
		bindKey: SDLK_I
		description: 'Toggle text input'
		action: [
			window isTextInputActive
				ifTrue: [ window stopTextInput ]
				ifFalse: [ window startTextInput ] ].
	super initializeKeybindings
]

{ #category : 'lifecycle' }
SDL3KeyboardDemoApp >> sdlInit [

	"We want to grab even Alt-Tab! (may not work in all platforms)"
	sdl setHintName: SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED value: '0'.

	super sdlInit
]

{ #category : 'hooks' }
SDL3KeyboardDemoApp >> step [

	| modState keyboardState |
	console clear.
	console addLine: ('Is Keyboard Grabbed? <1p> (Capture even OS shortcuts e.g. Alt-Tab, if OS allows it)' expandMacrosWith: window isKeyboardGrabbed).
	console addLine: ('Is Text Input? <1p> (Is Unicode text input active?)' expandMacrosWith: window isTextInputActive).

	modState := sdl getModState.
	keyboardState := sdl getKeyboardState: nil.

	console addLine.
	console addLine: 'Currently pressed keys (scancodes):' color: Color yellow.
	SDL3Scancode allValues
		select: [ :eachScancode | keyboardState boolean8AtOffset: eachScancode value ]
		thenDo: [ :eachScancode |
			| keyValue |
			keyValue := sdl
				getKeyFromScancode: eachScancode
				modstate: modState
				keyEvent: false.
			(SDL3Keycode itemAt: keyValue)
				ifNil: [
					"For example, when you press Ñ"
					console addLine: ('* Scancode: {1} Keycode: ? Name: ?' format: { eachScancode item }) ]
				ifNotNil: [ :keyCodeItem |
					| keyCode keyName |
					keyCode := SDL3Keycode at: keyCodeItem.
					keyName := sdl getKeyName: keyCode.
					console addLine:
						(('* Scancode: {1} Keycode: {2} Name: {3}' format: {
							eachScancode item.
							keyCodeItem.
							keyName }))
			] ].

	console addLine.
	console addLine: 'Pressed modifier keys (e.g. shift, caps lock):' color: Color yellow.
	(SDL3Keymod allItemsIn: modState) do: [ :each |
		console addLine: ('* {1}' format: { each }) ].

	self clearColor: Color black.
	self present
]
