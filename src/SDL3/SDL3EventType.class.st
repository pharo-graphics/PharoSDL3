Class {
	#name : 'SDL3EventType',
	#superclass : 'SDL3Enumeration',
	#classVars : [
		'SDL_EVENT_AUDIO_DEVICE_ADDED',
		'SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED',
		'SDL_EVENT_AUDIO_DEVICE_REMOVED',
		'SDL_EVENT_CAMERA_DEVICE_ADDED',
		'SDL_EVENT_CAMERA_DEVICE_APPROVED',
		'SDL_EVENT_CAMERA_DEVICE_DENIED',
		'SDL_EVENT_CAMERA_DEVICE_REMOVED',
		'SDL_EVENT_CLIPBOARD_UPDATE',
		'SDL_EVENT_DID_ENTER_BACKGROUND',
		'SDL_EVENT_DID_ENTER_FOREGROUND',
		'SDL_EVENT_DISPLAY_ADDED',
		'SDL_EVENT_DISPLAY_CONTENT_SCALE_CHANGED',
		'SDL_EVENT_DISPLAY_CURRENT_MODE_CHANGED',
		'SDL_EVENT_DISPLAY_DESKTOP_MODE_CHANGED',
		'SDL_EVENT_DISPLAY_MOVED',
		'SDL_EVENT_DISPLAY_ORIENTATION',
		'SDL_EVENT_DISPLAY_REMOVED',
		'SDL_EVENT_DISPLAY_USABLE_BOUNDS_CHANGED',
		'SDL_EVENT_DROP_BEGIN',
		'SDL_EVENT_DROP_COMPLETE',
		'SDL_EVENT_DROP_FILE',
		'SDL_EVENT_DROP_POSITION',
		'SDL_EVENT_DROP_TEXT',
		'SDL_EVENT_ENUM_PADDING',
		'SDL_EVENT_FINGER_CANCELED',
		'SDL_EVENT_FINGER_DOWN',
		'SDL_EVENT_FINGER_MOTION',
		'SDL_EVENT_FINGER_UP',
		'SDL_EVENT_GAMEPAD_ADDED',
		'SDL_EVENT_GAMEPAD_AXIS_MOTION',
		'SDL_EVENT_GAMEPAD_BUTTON_DOWN',
		'SDL_EVENT_GAMEPAD_BUTTON_UP',
		'SDL_EVENT_GAMEPAD_REMAPPED',
		'SDL_EVENT_GAMEPAD_REMOVED',
		'SDL_EVENT_GAMEPAD_SENSOR_UPDATE',
		'SDL_EVENT_GAMEPAD_STEAM_HANDLE_UPDATED',
		'SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN',
		'SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION',
		'SDL_EVENT_GAMEPAD_TOUCHPAD_UP',
		'SDL_EVENT_GAMEPAD_UPDATE_COMPLETE',
		'SDL_EVENT_JOYSTICK_ADDED',
		'SDL_EVENT_JOYSTICK_AXIS_MOTION',
		'SDL_EVENT_JOYSTICK_BALL_MOTION',
		'SDL_EVENT_JOYSTICK_BATTERY_UPDATED',
		'SDL_EVENT_JOYSTICK_BUTTON_DOWN',
		'SDL_EVENT_JOYSTICK_BUTTON_UP',
		'SDL_EVENT_JOYSTICK_HAT_MOTION',
		'SDL_EVENT_JOYSTICK_REMOVED',
		'SDL_EVENT_JOYSTICK_UPDATE_COMPLETE',
		'SDL_EVENT_KEYBOARD_ADDED',
		'SDL_EVENT_KEYBOARD_REMOVED',
		'SDL_EVENT_KEYMAP_CHANGED',
		'SDL_EVENT_KEY_DOWN',
		'SDL_EVENT_KEY_UP',
		'SDL_EVENT_LOCALE_CHANGED',
		'SDL_EVENT_LOW_MEMORY',
		'SDL_EVENT_MOUSE_ADDED',
		'SDL_EVENT_MOUSE_BUTTON_DOWN',
		'SDL_EVENT_MOUSE_BUTTON_UP',
		'SDL_EVENT_MOUSE_MOTION',
		'SDL_EVENT_MOUSE_REMOVED',
		'SDL_EVENT_MOUSE_WHEEL',
		'SDL_EVENT_PEN_AXIS',
		'SDL_EVENT_PEN_BUTTON_DOWN',
		'SDL_EVENT_PEN_BUTTON_UP',
		'SDL_EVENT_PEN_DOWN',
		'SDL_EVENT_PEN_MOTION',
		'SDL_EVENT_PEN_PROXIMITY_IN',
		'SDL_EVENT_PEN_PROXIMITY_OUT',
		'SDL_EVENT_PEN_UP',
		'SDL_EVENT_PINCH_BEGIN',
		'SDL_EVENT_PINCH_END',
		'SDL_EVENT_PINCH_UPDATE',
		'SDL_EVENT_POLL_SENTINEL',
		'SDL_EVENT_PRIVATE0',
		'SDL_EVENT_PRIVATE1',
		'SDL_EVENT_PRIVATE2',
		'SDL_EVENT_PRIVATE3',
		'SDL_EVENT_QUIT',
		'SDL_EVENT_RENDER_DEVICE_LOST',
		'SDL_EVENT_RENDER_DEVICE_RESET',
		'SDL_EVENT_RENDER_TARGETS_RESET',
		'SDL_EVENT_SCREEN_KEYBOARD_HIDDEN',
		'SDL_EVENT_SCREEN_KEYBOARD_SHOWN',
		'SDL_EVENT_SENSOR_UPDATE',
		'SDL_EVENT_SYSTEM_THEME_CHANGED',
		'SDL_EVENT_TERMINATING',
		'SDL_EVENT_TEXT_EDITING',
		'SDL_EVENT_TEXT_EDITING_CANDIDATES',
		'SDL_EVENT_TEXT_INPUT',
		'SDL_EVENT_USER',
		'SDL_EVENT_WILL_ENTER_BACKGROUND',
		'SDL_EVENT_WILL_ENTER_FOREGROUND',
		'SDL_EVENT_WINDOW_CLOSE_REQUESTED',
		'SDL_EVENT_WINDOW_DESTROYED',
		'SDL_EVENT_WINDOW_DISPLAY_CHANGED',
		'SDL_EVENT_WINDOW_DISPLAY_SCALE_CHANGED',
		'SDL_EVENT_WINDOW_ENTER_FULLSCREEN',
		'SDL_EVENT_WINDOW_EXPOSED',
		'SDL_EVENT_WINDOW_FOCUS_GAINED',
		'SDL_EVENT_WINDOW_FOCUS_LOST',
		'SDL_EVENT_WINDOW_HDR_STATE_CHANGED',
		'SDL_EVENT_WINDOW_HIDDEN',
		'SDL_EVENT_WINDOW_HIT_TEST',
		'SDL_EVENT_WINDOW_ICCPROF_CHANGED',
		'SDL_EVENT_WINDOW_LEAVE_FULLSCREEN',
		'SDL_EVENT_WINDOW_MAXIMIZED',
		'SDL_EVENT_WINDOW_METAL_VIEW_RESIZED',
		'SDL_EVENT_WINDOW_MINIMIZED',
		'SDL_EVENT_WINDOW_MOUSE_ENTER',
		'SDL_EVENT_WINDOW_MOUSE_LEAVE',
		'SDL_EVENT_WINDOW_MOVED',
		'SDL_EVENT_WINDOW_OCCLUDED',
		'SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED',
		'SDL_EVENT_WINDOW_RESIZED',
		'SDL_EVENT_WINDOW_RESTORED',
		'SDL_EVENT_WINDOW_SAFE_AREA_CHANGED',
		'SDL_EVENT_WINDOW_SHOWN'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
SDL3EventType class >> audioDeviceAdded [
	"This method was automatically generated"
	^ SDL_EVENT_AUDIO_DEVICE_ADDED
]

{ #category : 'accessing enum' }
SDL3EventType class >> audioDeviceFormatChanged [
	"This method was automatically generated"
	^ SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED
]

{ #category : 'accessing enum' }
SDL3EventType class >> audioDeviceRemoved [
	"This method was automatically generated"
	^ SDL_EVENT_AUDIO_DEVICE_REMOVED
]

{ #category : 'accessing enum' }
SDL3EventType class >> cameraDeviceAdded [
	"This method was automatically generated"
	^ SDL_EVENT_CAMERA_DEVICE_ADDED
]

{ #category : 'accessing enum' }
SDL3EventType class >> cameraDeviceApproved [
	"This method was automatically generated"
	^ SDL_EVENT_CAMERA_DEVICE_APPROVED
]

{ #category : 'accessing enum' }
SDL3EventType class >> cameraDeviceDenied [
	"This method was automatically generated"
	^ SDL_EVENT_CAMERA_DEVICE_DENIED
]

{ #category : 'accessing enum' }
SDL3EventType class >> cameraDeviceRemoved [
	"This method was automatically generated"
	^ SDL_EVENT_CAMERA_DEVICE_REMOVED
]

{ #category : 'accessing enum' }
SDL3EventType class >> clipboardUpdate [
	"This method was automatically generated"
	^ SDL_EVENT_CLIPBOARD_UPDATE
]

{ #category : 'accessing enum' }
SDL3EventType class >> didEnterBackground [
	"This method was automatically generated"
	^ SDL_EVENT_DID_ENTER_BACKGROUND
]

{ #category : 'accessing enum' }
SDL3EventType class >> didEnterForeground [
	"This method was automatically generated"
	^ SDL_EVENT_DID_ENTER_FOREGROUND
]

{ #category : 'accessing enum' }
SDL3EventType class >> displayAdded [
	"This method was automatically generated"
	^ SDL_EVENT_DISPLAY_ADDED
]

{ #category : 'accessing enum' }
SDL3EventType class >> displayContentScaleChanged [
	"This method was automatically generated"
	^ SDL_EVENT_DISPLAY_CONTENT_SCALE_CHANGED
]

{ #category : 'accessing enum' }
SDL3EventType class >> displayCurrentModeChanged [
	"This method was automatically generated"
	^ SDL_EVENT_DISPLAY_CURRENT_MODE_CHANGED
]

{ #category : 'accessing enum' }
SDL3EventType class >> displayDesktopModeChanged [
	"This method was automatically generated"
	^ SDL_EVENT_DISPLAY_DESKTOP_MODE_CHANGED
]

{ #category : 'accessing enum' }
SDL3EventType class >> displayMoved [
	"This method was automatically generated"
	^ SDL_EVENT_DISPLAY_MOVED
]

{ #category : 'accessing enum' }
SDL3EventType class >> displayOrientation [
	"This method was automatically generated"
	^ SDL_EVENT_DISPLAY_ORIENTATION
]

{ #category : 'accessing enum' }
SDL3EventType class >> displayRemoved [
	"This method was automatically generated"
	^ SDL_EVENT_DISPLAY_REMOVED
]

{ #category : 'accessing enum' }
SDL3EventType class >> displayUsableBoundsChanged [
	"This method was automatically generated"
	^ SDL_EVENT_DISPLAY_USABLE_BOUNDS_CHANGED
]

{ #category : 'accessing enum' }
SDL3EventType class >> dropBegin [
	"This method was automatically generated"
	^ SDL_EVENT_DROP_BEGIN
]

{ #category : 'accessing enum' }
SDL3EventType class >> dropComplete [
	"This method was automatically generated"
	^ SDL_EVENT_DROP_COMPLETE
]

{ #category : 'accessing enum' }
SDL3EventType class >> dropFile [
	"This method was automatically generated"
	^ SDL_EVENT_DROP_FILE
]

{ #category : 'accessing enum' }
SDL3EventType class >> dropPosition [
	"This method was automatically generated"
	^ SDL_EVENT_DROP_POSITION
]

{ #category : 'accessing enum' }
SDL3EventType class >> dropText [
	"This method was automatically generated"
	^ SDL_EVENT_DROP_TEXT
]

{ #category : 'enum declaration' }
SDL3EventType class >> enumDecl [
	"Manually removed from generated code all *_FIRST and *_LAST, because they override real names.
	
	Steps to reproduce:
	1. Delete all generated slots from class definition, and generated accessor methods.
	2. Do: self initializeEnumeration; rebuildEnumAccessors
	
	A change in SDL_events.h might require a manual update in this method, and add the corresponding camelCased accessing enum protocol.
	See: https://github.com/pharo-graphics/PharoSDL3/pull/12
	"

	^ #(
	SDL_EVENT_QUIT 256
	SDL_EVENT_TERMINATING 257
	SDL_EVENT_LOW_MEMORY 258
	SDL_EVENT_WILL_ENTER_BACKGROUND 259
	SDL_EVENT_DID_ENTER_BACKGROUND 260
	SDL_EVENT_WILL_ENTER_FOREGROUND 261
	SDL_EVENT_DID_ENTER_FOREGROUND 262
	SDL_EVENT_LOCALE_CHANGED 263
	SDL_EVENT_SYSTEM_THEME_CHANGED 264
	SDL_EVENT_DISPLAY_ORIENTATION 337
	SDL_EVENT_DISPLAY_ADDED 338
	SDL_EVENT_DISPLAY_REMOVED 339
	SDL_EVENT_DISPLAY_MOVED 340
	SDL_EVENT_DISPLAY_DESKTOP_MODE_CHANGED 341
	SDL_EVENT_DISPLAY_CURRENT_MODE_CHANGED 342
	SDL_EVENT_DISPLAY_CONTENT_SCALE_CHANGED 343
	SDL_EVENT_DISPLAY_USABLE_BOUNDS_CHANGED 344
	SDL_EVENT_WINDOW_SHOWN 514
	SDL_EVENT_WINDOW_HIDDEN 515
	SDL_EVENT_WINDOW_EXPOSED 516
	SDL_EVENT_WINDOW_MOVED 517
	SDL_EVENT_WINDOW_RESIZED 518
	SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED 519
	SDL_EVENT_WINDOW_METAL_VIEW_RESIZED 520
	SDL_EVENT_WINDOW_MINIMIZED 521
	SDL_EVENT_WINDOW_MAXIMIZED 522
	SDL_EVENT_WINDOW_RESTORED 523
	SDL_EVENT_WINDOW_MOUSE_ENTER 524
	SDL_EVENT_WINDOW_MOUSE_LEAVE 525
	SDL_EVENT_WINDOW_FOCUS_GAINED 526
	SDL_EVENT_WINDOW_FOCUS_LOST 527
	SDL_EVENT_WINDOW_CLOSE_REQUESTED 528
	SDL_EVENT_WINDOW_HIT_TEST 529
	SDL_EVENT_WINDOW_ICCPROF_CHANGED 530
	SDL_EVENT_WINDOW_DISPLAY_CHANGED 531
	SDL_EVENT_WINDOW_DISPLAY_SCALE_CHANGED 532
	SDL_EVENT_WINDOW_SAFE_AREA_CHANGED 533
	SDL_EVENT_WINDOW_OCCLUDED 534
	SDL_EVENT_WINDOW_ENTER_FULLSCREEN 535
	SDL_EVENT_WINDOW_LEAVE_FULLSCREEN 536
	SDL_EVENT_WINDOW_DESTROYED 537
	SDL_EVENT_WINDOW_HDR_STATE_CHANGED 538
	SDL_EVENT_KEY_DOWN 768
	SDL_EVENT_KEY_UP 769
	SDL_EVENT_TEXT_EDITING 770
	SDL_EVENT_TEXT_INPUT 771
	SDL_EVENT_KEYMAP_CHANGED 772
	SDL_EVENT_KEYBOARD_ADDED 773
	SDL_EVENT_KEYBOARD_REMOVED 774
	SDL_EVENT_TEXT_EDITING_CANDIDATES 775
	SDL_EVENT_SCREEN_KEYBOARD_SHOWN 776
	SDL_EVENT_SCREEN_KEYBOARD_HIDDEN 777
	SDL_EVENT_MOUSE_MOTION 1024
	SDL_EVENT_MOUSE_BUTTON_DOWN 1025
	SDL_EVENT_MOUSE_BUTTON_UP 1026
	SDL_EVENT_MOUSE_WHEEL 1027
	SDL_EVENT_MOUSE_ADDED 1028
	SDL_EVENT_MOUSE_REMOVED 1029
	SDL_EVENT_JOYSTICK_AXIS_MOTION 1536
	SDL_EVENT_JOYSTICK_BALL_MOTION 1537
	SDL_EVENT_JOYSTICK_HAT_MOTION 1538
	SDL_EVENT_JOYSTICK_BUTTON_DOWN 1539
	SDL_EVENT_JOYSTICK_BUTTON_UP 1540
	SDL_EVENT_JOYSTICK_ADDED 1541
	SDL_EVENT_JOYSTICK_REMOVED 1542
	SDL_EVENT_JOYSTICK_BATTERY_UPDATED 1543
	SDL_EVENT_JOYSTICK_UPDATE_COMPLETE 1544
	SDL_EVENT_GAMEPAD_AXIS_MOTION 1616
	SDL_EVENT_GAMEPAD_BUTTON_DOWN 1617
	SDL_EVENT_GAMEPAD_BUTTON_UP 1618
	SDL_EVENT_GAMEPAD_ADDED 1619
	SDL_EVENT_GAMEPAD_REMOVED 1620
	SDL_EVENT_GAMEPAD_REMAPPED 1621
	SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN 1622
	SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION 1623
	SDL_EVENT_GAMEPAD_TOUCHPAD_UP 1624
	SDL_EVENT_GAMEPAD_SENSOR_UPDATE 1625
	SDL_EVENT_GAMEPAD_UPDATE_COMPLETE 1626
	SDL_EVENT_GAMEPAD_STEAM_HANDLE_UPDATED 1627
	SDL_EVENT_FINGER_DOWN 1792
	SDL_EVENT_FINGER_UP 1793
	SDL_EVENT_FINGER_MOTION 1794
	SDL_EVENT_FINGER_CANCELED 1795
	SDL_EVENT_PINCH_BEGIN 1808
	SDL_EVENT_PINCH_UPDATE 1809
	SDL_EVENT_PINCH_END 1810
	SDL_EVENT_CLIPBOARD_UPDATE 2304
	SDL_EVENT_DROP_FILE 4096
	SDL_EVENT_DROP_TEXT 4097
	SDL_EVENT_DROP_BEGIN 4098
	SDL_EVENT_DROP_COMPLETE 4099
	SDL_EVENT_DROP_POSITION 4100
	SDL_EVENT_AUDIO_DEVICE_ADDED 4352
	SDL_EVENT_AUDIO_DEVICE_REMOVED 4353
	SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED 4354
	SDL_EVENT_SENSOR_UPDATE 4608
	SDL_EVENT_PEN_PROXIMITY_IN 4864
	SDL_EVENT_PEN_PROXIMITY_OUT 4865
	SDL_EVENT_PEN_DOWN 4866
	SDL_EVENT_PEN_UP 4867
	SDL_EVENT_PEN_BUTTON_DOWN 4868
	SDL_EVENT_PEN_BUTTON_UP 4869
	SDL_EVENT_PEN_MOTION 4870
	SDL_EVENT_PEN_AXIS 4871
	SDL_EVENT_CAMERA_DEVICE_ADDED 5120
	SDL_EVENT_CAMERA_DEVICE_REMOVED 5121
	SDL_EVENT_CAMERA_DEVICE_APPROVED 5122
	SDL_EVENT_CAMERA_DEVICE_DENIED 5123
	SDL_EVENT_RENDER_TARGETS_RESET 8192
	SDL_EVENT_RENDER_DEVICE_RESET 8193
	SDL_EVENT_RENDER_DEVICE_LOST 8194
	SDL_EVENT_PRIVATE0 16384
	SDL_EVENT_PRIVATE1 16385
	SDL_EVENT_PRIVATE2 16386
	SDL_EVENT_PRIVATE3 16387
	SDL_EVENT_POLL_SENTINEL 32512
	SDL_EVENT_USER 32768
	SDL_EVENT_ENUM_PADDING 2147483647 )
]

{ #category : 'accessing enum' }
SDL3EventType class >> enumPadding [
	"This method was automatically generated"
	^ SDL_EVENT_ENUM_PADDING
]

{ #category : 'accessing enum' }
SDL3EventType class >> fingerCanceled [
	"This method was automatically generated"
	^ SDL_EVENT_FINGER_CANCELED
]

{ #category : 'accessing enum' }
SDL3EventType class >> fingerDown [
	"This method was automatically generated"
	^ SDL_EVENT_FINGER_DOWN
]

{ #category : 'accessing enum' }
SDL3EventType class >> fingerMotion [
	"This method was automatically generated"
	^ SDL_EVENT_FINGER_MOTION
]

{ #category : 'accessing enum' }
SDL3EventType class >> fingerUp [
	"This method was automatically generated"
	^ SDL_EVENT_FINGER_UP
]

{ #category : 'accessing enum' }
SDL3EventType class >> gamepadAdded [
	"This method was automatically generated"
	^ SDL_EVENT_GAMEPAD_ADDED
]

{ #category : 'accessing enum' }
SDL3EventType class >> gamepadAxisMotion [
	"This method was automatically generated"
	^ SDL_EVENT_GAMEPAD_AXIS_MOTION
]

{ #category : 'accessing enum' }
SDL3EventType class >> gamepadButtonDown [
	"This method was automatically generated"
	^ SDL_EVENT_GAMEPAD_BUTTON_DOWN
]

{ #category : 'accessing enum' }
SDL3EventType class >> gamepadButtonUp [
	"This method was automatically generated"
	^ SDL_EVENT_GAMEPAD_BUTTON_UP
]

{ #category : 'accessing enum' }
SDL3EventType class >> gamepadRemapped [
	"This method was automatically generated"
	^ SDL_EVENT_GAMEPAD_REMAPPED
]

{ #category : 'accessing enum' }
SDL3EventType class >> gamepadRemoved [
	"This method was automatically generated"
	^ SDL_EVENT_GAMEPAD_REMOVED
]

{ #category : 'accessing enum' }
SDL3EventType class >> gamepadSensorUpdate [
	"This method was automatically generated"
	^ SDL_EVENT_GAMEPAD_SENSOR_UPDATE
]

{ #category : 'accessing enum' }
SDL3EventType class >> gamepadSteamHandleUpdated [
	"This method was automatically generated"
	^ SDL_EVENT_GAMEPAD_STEAM_HANDLE_UPDATED
]

{ #category : 'accessing enum' }
SDL3EventType class >> gamepadTouchpadDown [
	"This method was automatically generated"
	^ SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN
]

{ #category : 'accessing enum' }
SDL3EventType class >> gamepadTouchpadMotion [
	"This method was automatically generated"
	^ SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION
]

{ #category : 'accessing enum' }
SDL3EventType class >> gamepadTouchpadUp [
	"This method was automatically generated"
	^ SDL_EVENT_GAMEPAD_TOUCHPAD_UP
]

{ #category : 'accessing enum' }
SDL3EventType class >> gamepadUpdateComplete [
	"This method was automatically generated"
	^ SDL_EVENT_GAMEPAD_UPDATE_COMPLETE
]

{ #category : 'accessing enum' }
SDL3EventType class >> joystickAdded [
	"This method was automatically generated"
	^ SDL_EVENT_JOYSTICK_ADDED
]

{ #category : 'accessing enum' }
SDL3EventType class >> joystickAxisMotion [
	"This method was automatically generated"
	^ SDL_EVENT_JOYSTICK_AXIS_MOTION
]

{ #category : 'accessing enum' }
SDL3EventType class >> joystickBallMotion [
	"This method was automatically generated"
	^ SDL_EVENT_JOYSTICK_BALL_MOTION
]

{ #category : 'accessing enum' }
SDL3EventType class >> joystickBatteryUpdated [
	"This method was automatically generated"
	^ SDL_EVENT_JOYSTICK_BATTERY_UPDATED
]

{ #category : 'accessing enum' }
SDL3EventType class >> joystickButtonDown [
	"This method was automatically generated"
	^ SDL_EVENT_JOYSTICK_BUTTON_DOWN
]

{ #category : 'accessing enum' }
SDL3EventType class >> joystickButtonUp [
	"This method was automatically generated"
	^ SDL_EVENT_JOYSTICK_BUTTON_UP
]

{ #category : 'accessing enum' }
SDL3EventType class >> joystickHatMotion [
	"This method was automatically generated"
	^ SDL_EVENT_JOYSTICK_HAT_MOTION
]

{ #category : 'accessing enum' }
SDL3EventType class >> joystickRemoved [
	"This method was automatically generated"
	^ SDL_EVENT_JOYSTICK_REMOVED
]

{ #category : 'accessing enum' }
SDL3EventType class >> joystickUpdateComplete [
	"This method was automatically generated"
	^ SDL_EVENT_JOYSTICK_UPDATE_COMPLETE
]

{ #category : 'accessing enum' }
SDL3EventType class >> keyDown [
	"This method was automatically generated"
	^ SDL_EVENT_KEY_DOWN
]

{ #category : 'accessing enum' }
SDL3EventType class >> keyUp [
	"This method was automatically generated"
	^ SDL_EVENT_KEY_UP
]

{ #category : 'accessing enum' }
SDL3EventType class >> keyboardAdded [
	"This method was automatically generated"
	^ SDL_EVENT_KEYBOARD_ADDED
]

{ #category : 'accessing enum' }
SDL3EventType class >> keyboardRemoved [
	"This method was automatically generated"
	^ SDL_EVENT_KEYBOARD_REMOVED
]

{ #category : 'accessing enum' }
SDL3EventType class >> keymapChanged [
	"This method was automatically generated"
	^ SDL_EVENT_KEYMAP_CHANGED
]

{ #category : 'accessing enum' }
SDL3EventType class >> localeChanged [
	"This method was automatically generated"
	^ SDL_EVENT_LOCALE_CHANGED
]

{ #category : 'accessing enum' }
SDL3EventType class >> lowMemory [
	"This method was automatically generated"
	^ SDL_EVENT_LOW_MEMORY
]

{ #category : 'accessing enum' }
SDL3EventType class >> mouseAdded [
	"This method was automatically generated"
	^ SDL_EVENT_MOUSE_ADDED
]

{ #category : 'accessing enum' }
SDL3EventType class >> mouseButtonDown [
	"This method was automatically generated"
	^ SDL_EVENT_MOUSE_BUTTON_DOWN
]

{ #category : 'accessing enum' }
SDL3EventType class >> mouseButtonUp [
	"This method was automatically generated"
	^ SDL_EVENT_MOUSE_BUTTON_UP
]

{ #category : 'accessing enum' }
SDL3EventType class >> mouseMotion [
	"This method was automatically generated"
	^ SDL_EVENT_MOUSE_MOTION
]

{ #category : 'accessing enum' }
SDL3EventType class >> mouseRemoved [
	"This method was automatically generated"
	^ SDL_EVENT_MOUSE_REMOVED
]

{ #category : 'accessing enum' }
SDL3EventType class >> mouseWheel [
	"This method was automatically generated"
	^ SDL_EVENT_MOUSE_WHEEL
]

{ #category : 'accessing enum' }
SDL3EventType class >> penAxis [
	"This method was automatically generated"
	^ SDL_EVENT_PEN_AXIS
]

{ #category : 'accessing enum' }
SDL3EventType class >> penButtonDown [
	"This method was automatically generated"
	^ SDL_EVENT_PEN_BUTTON_DOWN
]

{ #category : 'accessing enum' }
SDL3EventType class >> penButtonUp [
	"This method was automatically generated"
	^ SDL_EVENT_PEN_BUTTON_UP
]

{ #category : 'accessing enum' }
SDL3EventType class >> penDown [
	"This method was automatically generated"
	^ SDL_EVENT_PEN_DOWN
]

{ #category : 'accessing enum' }
SDL3EventType class >> penMotion [
	"This method was automatically generated"
	^ SDL_EVENT_PEN_MOTION
]

{ #category : 'accessing enum' }
SDL3EventType class >> penProximityIn [
	"This method was automatically generated"
	^ SDL_EVENT_PEN_PROXIMITY_IN
]

{ #category : 'accessing enum' }
SDL3EventType class >> penProximityOut [
	"This method was automatically generated"
	^ SDL_EVENT_PEN_PROXIMITY_OUT
]

{ #category : 'accessing enum' }
SDL3EventType class >> penUp [
	"This method was automatically generated"
	^ SDL_EVENT_PEN_UP
]

{ #category : 'accessing enum' }
SDL3EventType class >> pinchBegin [
	"This method was automatically generated"
	^ SDL_EVENT_PINCH_BEGIN
]

{ #category : 'accessing enum' }
SDL3EventType class >> pinchEnd [
	"This method was automatically generated"
	^ SDL_EVENT_PINCH_END
]

{ #category : 'accessing enum' }
SDL3EventType class >> pinchUpdate [
	"This method was automatically generated"
	^ SDL_EVENT_PINCH_UPDATE
]

{ #category : 'accessing enum' }
SDL3EventType class >> pollSentinel [
	"This method was automatically generated"
	^ SDL_EVENT_POLL_SENTINEL
]

{ #category : 'accessing enum' }
SDL3EventType class >> private0 [
	"This method was automatically generated"
	^ SDL_EVENT_PRIVATE0
]

{ #category : 'accessing enum' }
SDL3EventType class >> private1 [
	"This method was automatically generated"
	^ SDL_EVENT_PRIVATE1
]

{ #category : 'accessing enum' }
SDL3EventType class >> private2 [
	"This method was automatically generated"
	^ SDL_EVENT_PRIVATE2
]

{ #category : 'accessing enum' }
SDL3EventType class >> private3 [
	"This method was automatically generated"
	^ SDL_EVENT_PRIVATE3
]

{ #category : 'accessing enum' }
SDL3EventType class >> quit [
	"This method was automatically generated"
	^ SDL_EVENT_QUIT
]

{ #category : 'accessing enum' }
SDL3EventType class >> renderDeviceLost [
	"This method was automatically generated"
	^ SDL_EVENT_RENDER_DEVICE_LOST
]

{ #category : 'accessing enum' }
SDL3EventType class >> renderDeviceReset [
	"This method was automatically generated"
	^ SDL_EVENT_RENDER_DEVICE_RESET
]

{ #category : 'accessing enum' }
SDL3EventType class >> renderTargetsReset [
	"This method was automatically generated"
	^ SDL_EVENT_RENDER_TARGETS_RESET
]

{ #category : 'accessing enum' }
SDL3EventType class >> screenKeyboardHidden [
	"This method was automatically generated"
	^ SDL_EVENT_SCREEN_KEYBOARD_HIDDEN
]

{ #category : 'accessing enum' }
SDL3EventType class >> screenKeyboardShown [
	"This method was automatically generated"
	^ SDL_EVENT_SCREEN_KEYBOARD_SHOWN
]

{ #category : 'accessing enum' }
SDL3EventType class >> sensorUpdate [
	"This method was automatically generated"
	^ SDL_EVENT_SENSOR_UPDATE
]

{ #category : 'accessing enum' }
SDL3EventType class >> systemThemeChanged [
	"This method was automatically generated"
	^ SDL_EVENT_SYSTEM_THEME_CHANGED
]

{ #category : 'accessing enum' }
SDL3EventType class >> terminating [
	"This method was automatically generated"
	^ SDL_EVENT_TERMINATING
]

{ #category : 'accessing enum' }
SDL3EventType class >> textEditing [
	"This method was automatically generated"
	^ SDL_EVENT_TEXT_EDITING
]

{ #category : 'accessing enum' }
SDL3EventType class >> textEditingCandidates [
	"This method was automatically generated"
	^ SDL_EVENT_TEXT_EDITING_CANDIDATES
]

{ #category : 'accessing enum' }
SDL3EventType class >> textInput [
	"This method was automatically generated"
	^ SDL_EVENT_TEXT_INPUT
]

{ #category : 'accessing enum' }
SDL3EventType class >> user [
	"This method was automatically generated"
	^ SDL_EVENT_USER
]

{ #category : 'accessing enum' }
SDL3EventType class >> willEnterBackground [
	"This method was automatically generated"
	^ SDL_EVENT_WILL_ENTER_BACKGROUND
]

{ #category : 'accessing enum' }
SDL3EventType class >> willEnterForeground [
	"This method was automatically generated"
	^ SDL_EVENT_WILL_ENTER_FOREGROUND
]

{ #category : 'accessing enum' }
SDL3EventType class >> windowCloseRequested [
	"This method was automatically generated"
	^ SDL_EVENT_WINDOW_CLOSE_REQUESTED
]

{ #category : 'accessing enum' }
SDL3EventType class >> windowDestroyed [
	"This method was automatically generated"
	^ SDL_EVENT_WINDOW_DESTROYED
]

{ #category : 'accessing enum' }
SDL3EventType class >> windowDisplayChanged [
	"This method was automatically generated"
	^ SDL_EVENT_WINDOW_DISPLAY_CHANGED
]

{ #category : 'accessing enum' }
SDL3EventType class >> windowDisplayScaleChanged [
	"This method was automatically generated"
	^ SDL_EVENT_WINDOW_DISPLAY_SCALE_CHANGED
]

{ #category : 'accessing enum' }
SDL3EventType class >> windowEnterFullscreen [
	"This method was automatically generated"
	^ SDL_EVENT_WINDOW_ENTER_FULLSCREEN
]

{ #category : 'accessing enum' }
SDL3EventType class >> windowExposed [
	"This method was automatically generated"
	^ SDL_EVENT_WINDOW_EXPOSED
]

{ #category : 'accessing enum' }
SDL3EventType class >> windowFocusGained [
	"This method was automatically generated"
	^ SDL_EVENT_WINDOW_FOCUS_GAINED
]

{ #category : 'accessing enum' }
SDL3EventType class >> windowFocusLost [
	"This method was automatically generated"
	^ SDL_EVENT_WINDOW_FOCUS_LOST
]

{ #category : 'accessing enum' }
SDL3EventType class >> windowHdrStateChanged [
	"This method was automatically generated"
	^ SDL_EVENT_WINDOW_HDR_STATE_CHANGED
]

{ #category : 'accessing enum' }
SDL3EventType class >> windowHidden [
	"This method was automatically generated"
	^ SDL_EVENT_WINDOW_HIDDEN
]

{ #category : 'accessing enum' }
SDL3EventType class >> windowHitTest [
	"This method was automatically generated"
	^ SDL_EVENT_WINDOW_HIT_TEST
]

{ #category : 'accessing enum' }
SDL3EventType class >> windowIccprofChanged [
	"This method was automatically generated"
	^ SDL_EVENT_WINDOW_ICCPROF_CHANGED
]

{ #category : 'accessing enum' }
SDL3EventType class >> windowLeaveFullscreen [
	"This method was automatically generated"
	^ SDL_EVENT_WINDOW_LEAVE_FULLSCREEN
]

{ #category : 'accessing enum' }
SDL3EventType class >> windowMaximized [
	"This method was automatically generated"
	^ SDL_EVENT_WINDOW_MAXIMIZED
]

{ #category : 'accessing enum' }
SDL3EventType class >> windowMetalViewResized [
	"This method was automatically generated"
	^ SDL_EVENT_WINDOW_METAL_VIEW_RESIZED
]

{ #category : 'accessing enum' }
SDL3EventType class >> windowMinimized [
	"This method was automatically generated"
	^ SDL_EVENT_WINDOW_MINIMIZED
]

{ #category : 'accessing enum' }
SDL3EventType class >> windowMouseEnter [
	"This method was automatically generated"
	^ SDL_EVENT_WINDOW_MOUSE_ENTER
]

{ #category : 'accessing enum' }
SDL3EventType class >> windowMouseLeave [
	"This method was automatically generated"
	^ SDL_EVENT_WINDOW_MOUSE_LEAVE
]

{ #category : 'accessing enum' }
SDL3EventType class >> windowMoved [
	"This method was automatically generated"
	^ SDL_EVENT_WINDOW_MOVED
]

{ #category : 'accessing enum' }
SDL3EventType class >> windowOccluded [
	"This method was automatically generated"
	^ SDL_EVENT_WINDOW_OCCLUDED
]

{ #category : 'accessing enum' }
SDL3EventType class >> windowPixelSizeChanged [
	"This method was automatically generated"
	^ SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED
]

{ #category : 'accessing enum' }
SDL3EventType class >> windowResized [
	"This method was automatically generated"
	^ SDL_EVENT_WINDOW_RESIZED
]

{ #category : 'accessing enum' }
SDL3EventType class >> windowRestored [
	"This method was automatically generated"
	^ SDL_EVENT_WINDOW_RESTORED
]

{ #category : 'accessing enum' }
SDL3EventType class >> windowSafeAreaChanged [
	"This method was automatically generated"
	^ SDL_EVENT_WINDOW_SAFE_AREA_CHANGED
]

{ #category : 'accessing enum' }
SDL3EventType class >> windowShown [
	"This method was automatically generated"
	^ SDL_EVENT_WINDOW_SHOWN
]
