Class {
	#name : 'S3SDLEventMap',
	#superclass : 'Object',
	#instVars : [
		'eventClassByTypeNumber'
	],
	#category : 'SDL3-Own',
	#package : 'SDL3-Own'
}

{ #category : 'accessing' }
S3SDLEventMap >> conversionOf: anEvent [

	| eventClass |
	eventClass := self eventClassFor: anEvent type.

	"Inspired on FFIUnion's generated accessors (e.g. S3SDL_Event>>#display)"
	^ eventClass fromHandle: (anEvent getHandle referenceStructAt: 1 length: eventClass byteSize)
]

{ #category : 'accessing' }
S3SDLEventMap >> eventClassFor: typeNumber [

	^ eventClassByTypeNumber at: typeNumber
]

{ #category : 'initialization' }
S3SDLEventMap >> initialize [

	super initialize.

	eventClassByTypeNumber := Dictionary new.
	
 	{
	#(#quit 256)
		-> S3SDL_QuitEvent.

	#(#localeChanged 263
	#systemThemeChanged 264)
		-> S3SDL_CommonEvent. "ok?"

	#(#displayOrientation 337
	#displayAdded 338
	#displayRemoved 339
	#displayMoved 340
	#displayDesktopModeChanged 341
	#displayCurrentModeChanged 342
	#displayContentScaleChanged 343)
		-> S3SDL_DisplayEvent.

	#(#windowShown 514
	#windowHidden 515
	#windowExposed 516
	#windowMoved 517
	#windowResized 518
	#windowPixelSizeChanged 519
	#windowMetalViewResized 520
	#windowMinimized 521
	#windowMaximized 522
	#windowRestored 523
	#windowMouseEnter 524
	#windowMouseLeave 525
	#windowFocusGained 526
	#windowFocusLost 527
	#windowCloseRequested 528
	#windowHitTest 529
	#windowIccprofChanged 530
	#windowDisplayChanged 531
	#windowDisplayScaleChanged 532
	#windowSafeAreaChanged 533
	#windowOccluded 534
	#windowEnterFullscreen 535
	#windowLeaveFullscreen 536
	#windowDestroyed 537
	#windowHdrStateChanged 538)
		-> S3SDL_WindowEvent.
	
	#(#keyDown 768
	#keyUp 769)
		-> S3SDL_KeyboardEvent.

	#(#textEditing 770)
		-> S3SDL_TextEditingEvent.
	
	#(#textInput 771)
		-> S3SDL_TextInputEvent.

	#(#keymapChanged 772)
		-> S3SDL_CommonEvent.

	#(#keyboardAdded 773
	#keyboardRemoved 774)
		-> S3SDL_KeyboardDeviceEvent.

	#(#textEditingCandidates 775)
		-> S3SDL_TextEditingCandidatesEvent.

	#(#mouseMotion 1024)
		-> S3SDL_MouseMotionEvent.
	
	#(#mouseButtonDown 1025
	#mouseButtonUp 1026)
		-> S3SDL_MouseButtonEvent.

	#(#mouseWheel 1027)
		-> S3SDL_MouseWheelEvent.

	#(#mouseAdded 1028
	#mouseRemoved 1029)
		-> S3SDL_MouseDeviceEvent.

	#(#joystickAxisMotion 1536)
		-> S3SDL_JoyAxisEvent.

	#(#joystickBallMotion 1537)
		-> S3SDL_JoyBallEvent.

	#(#joystickHatMotion 1538)
		-> S3SDL_JoyHatEvent.
	
	#(#joystickButtonDown 1539
	#joystickButtonUp 1540)
		-> S3SDL_JoyButtonEvent.

	#(#joystickAdded 1541
	#joystickRemoved 1542
	#joystickUpdateComplete 1544)
		-> S3SDL_JoyDeviceEvent.

	#(#joystickBatteryUpdated 1543)
		-> S3SDL_JoyBatteryEvent.

	#(#gamepadAxisMotion 1616)
		-> S3SDL_GamepadAxisEvent.

	#(#gamepadButtonDown 1617
	#gamepadButtonUp 1618)
		-> S3SDL_GamepadButtonEvent.

	#(#gamepadAdded 1619
	#gamepadRemoved 1620
	#gamepadRemapped 1621
	#gamepadUpdateComplete 1626
	#gamepadSteamHandleUpdated 1627)
		-> S3SDL_GamepadDeviceEvent.

	#(#gamepadTouchpadDown 1622
	#gamepadTouchpadMotion 1623
	#gamepadTouchpadUp 1624)
		-> S3SDL_GamepadTouchpadEvent.

	#(#gamepadSensorUpdate 1625)
		-> S3SDL_GamepadSensorEvent.

	#(#fingerDown 1792
	#fingerUp 1793
	#fingerMotion 1794
	#fingerCanceled 1795)
		-> S3SDL_TouchFingerEvent.

	#(#clipboardUpdate 2304)
		-> S3SDL_ClipboardEvent.

	#(#dropFile 4096
	#dropText 4097
	#dropBegin 4098
	#dropComplete 4099
	#dropPosition 4100)
		-> S3SDL_DropEvent.

	#(#audioDeviceAdded 4352
	#audioDeviceRemoved 4353
	#audioDeviceFormatChanged 4354)
		-> S3SDL_AudioDeviceEvent.

	#(#sensorUpdate 4608)
		-> S3SDL_SensorEvent.

	#(#penProximityIn 4864
	#penProximityOut 4865)
		-> S3SDL_PenProximityEvent.

	#(#penDown 4866
	#penUp 4867)
		-> S3SDL_PenTouchEvent.

	#(#penButtonDown 4868
	#penButtonUp 4869)
		-> S3SDL_PenButtonEvent.

	#(#penMotion 4870)
		-> S3SDL_PenMotionEvent.

	#(#penAxis 4871)
		-> S3SDL_PenAxisEvent.

	#(#cameraDeviceAdded 5120
	#cameraDeviceRemoved 5121
	#cameraDeviceApproved 5122
	#cameraDeviceDenied 5123)
		-> S3SDL_CameraDeviceEvent.

	#(#renderTargetsReset 8192
	#renderDeviceReset 8193
	#renderDeviceLost 8194)
		-> S3SDL_RenderEvent.

	#(#pollSentinel 32512)
		-> S3SDL_CommonEvent.

	#(#user 32768)
		-> S3SDL_UserEvent 

	} do: [ :association |
		association key pairsDo: [ :eachName :eachValue |
			eventClassByTypeNumber
				at: eachValue
				put: association value ] ]
]
