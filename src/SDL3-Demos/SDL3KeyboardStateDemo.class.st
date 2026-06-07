"
I am a demo application that demonstrates how to grab and ungrab the keyboard in SDL3.
I also monitor the keyboard state, including modifier keys and active keys.

### Usage
- Press **K** to toggle Keyboard Grab. When grabbed, the window receives all keyboard input, even system keys.
- Press **ESCAPE** to exit.
"
Class {
	#name : 'SDL3KeyboardStateDemo',
	#superclass : 'SDL3ConsoleDemoApp',
	#category : 'SDL3-Demos-API',
	#package : 'SDL3-Demos',
	#tag : 'API'
}

{ #category : 'accessing' }
SDL3KeyboardStateDemo >> initialExtent [

	^ 800 @ 240
]

{ #category : 'lifecycle' }
SDL3KeyboardStateDemo >> sdlInit [

	"We want to grab even Alt-Tab! (may not work in all platforms)"
	sdl setHintName: SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED value: '0'.

	super sdlInit
]

{ #category : 'hooks' }
SDL3KeyboardStateDemo >> step [

	| modState keyboardState |
	self console clear.
	self log: ('K: Keyboard Grabbed: <1p> - (Capture even OS shortcuts e.g. Alt-Tab, if OS allows it)' expandMacrosWith: window isKeyboardGrabbed).
	self log: ('I: Text Input: <1p> - Is Unicode text input active?' expandMacrosWith: window isTextInputActive).

	modState := sdl getModState.
	keyboardState := sdl getKeyboardState: nil.

	self log: ''.
	self log: 'Currently pressed keys (scancodes):'.
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
					self log: ('* Scancode: {1} Keycode: ? Name: ?' format: { eachScancode item }) ]
				ifNotNil: [ :keyCodeItem |
					| keyCode keyName |
					keyCode := SDL3Keycode at: keyCodeItem.
					keyName := sdl getKeyName: keyCode.
					self log:
						('* Scancode: {1} Keycode: {2} Name: {3}' format: {
							eachScancode item.
							keyCodeItem.
							keyName })
			] ].

	self log: ''.
	self log: 'Pressed modifier keys (e.g. shift, caps lock):'.
	(SDL3Keymod allItemsIn: modState) do: [ :each |
		self log: ('* {1}' format: { each }) ].

	self clearColor: Color black.
	self present
]

{ #category : 'hooks' }
SDL3KeyboardStateDemo >> visitKeyboardDownEvent: aKeyboardDownEvent [

	aKeyboardDownEvent key = SDLK_K ifTrue: [ 
		window keyboardGrabbed: window isKeyboardGrabbed not ].

	aKeyboardDownEvent key = SDLK_I ifTrue: [ 
		window isTextInputActive
			ifTrue: [ window stopTextInput ]
			ifFalse: [ window startTextInput ] ].

	super visitKeyboardDownEvent: aKeyboardDownEvent
]
