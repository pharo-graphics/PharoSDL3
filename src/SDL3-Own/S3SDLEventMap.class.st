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
		-> SDL3QuitEvent.

	#(#localeChanged 263
	#systemThemeChanged 264)
		-> SDL3CommonEvent. "ok?"

	#(#displayOrientation 337
	#displayAdded 338
	#displayRemoved 339
	#displayMoved 340
	#displayDesktopModeChanged 341
	#displayCurrentModeChanged 342
	#displayContentScaleChanged 343)
		-> SDL3DisplayEvent.

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
		-> SDL3WindowEvent.
	
	#(#keyDown 768
	#keyUp 769)
		-> SDL3KeyboardEvent.

	#(#textEditing 770)
		-> SDL3TextEditingEvent.
	
	#(#textInput 771)
		-> SDL3TextInputEvent.

	#(#keymapChanged 772)
		-> SDL3CommonEvent.

	#(#keyboardAdded 773
	#keyboardRemoved 774)
		-> SDL3KeyboardDeviceEvent.

	#(#textEditingCandidates 775)
		-> SDL3TextEditingCandidatesEvent.

	#(#mouseMotion 1024)
		-> SDL3MouseMotionEvent.
	
	#(#mouseButtonDown 1025
	#mouseButtonUp 1026)
		-> SDL3MouseButtonEvent.

	#(#mouseWheel 1027)
		-> SDL3MouseWheelEvent.

	#(#mouseAdded 1028
	#mouseRemoved 1029)
		-> SDL3MouseDeviceEvent.

	#(#joystickAxisMotion 1536)
		-> SDL3JoyAxisEvent.

	#(#joystickBallMotion 1537)
		-> SDL3JoyBallEvent.

	#(#joystickHatMotion 1538)
		-> SDL3JoyHatEvent.
	
	#(#joystickButtonDown 1539
	#joystickButtonUp 1540)
		-> SDL3JoyButtonEvent.

	#(#joystickAdded 1541
	#joystickRemoved 1542
	#joystickUpdateComplete 1544)
		-> SDL3JoyDeviceEvent.

	#(#joystickBatteryUpdated 1543)
		-> SDL3JoyBatteryEvent.

	#(#gamepadAxisMotion 1616)
		-> SDL3GamepadAxisEvent.

	#(#gamepadButtonDown 1617
	#gamepadButtonUp 1618)
		-> SDL3GamepadButtonEvent.

	#(#gamepadAdded 1619
	#gamepadRemoved 1620
	#gamepadRemapped 1621
	#gamepadUpdateComplete 1626
	#gamepadSteamHandleUpdated 1627)
		-> SDL3GamepadDeviceEvent.

	#(#gamepadTouchpadDown 1622
	#gamepadTouchpadMotion 1623
	#gamepadTouchpadUp 1624)
		-> SDL3GamepadTouchpadEvent.

	#(#gamepadSensorUpdate 1625)
		-> SDL3GamepadSensorEvent.

	#(#fingerDown 1792
	#fingerUp 1793
	#fingerMotion 1794
	#fingerCanceled 1795)
		-> SDL3TouchFingerEvent.

	#(#clipboardUpdate 2304)
		-> SDL3ClipboardEvent.

	#(#dropFile 4096
	#dropText 4097
	#dropBegin 4098
	#dropComplete 4099
	#dropPosition 4100)
		-> SDL3DropEvent.

	#(#audioDeviceAdded 4352
	#audioDeviceRemoved 4353
	#audioDeviceFormatChanged 4354)
		-> SDL3AudioDeviceEvent.

	#(#sensorUpdate 4608)
		-> SDL3SensorEvent.

	#(#penProximityIn 4864
	#penProximityOut 4865)
		-> SDL3PenProximityEvent.

	#(#penDown 4866
	#penUp 4867)
		-> SDL3PenTouchEvent.

	#(#penButtonDown 4868
	#penButtonUp 4869)
		-> SDL3PenButtonEvent.

	#(#penMotion 4870)
		-> SDL3PenMotionEvent.

	#(#penAxis 4871)
		-> SDL3PenAxisEvent.

	#(#cameraDeviceAdded 5120
	#cameraDeviceRemoved 5121
	#cameraDeviceApproved 5122
	#cameraDeviceDenied 5123)
		-> SDL3CameraDeviceEvent.

	#(#renderTargetsReset 8192
	#renderDeviceReset 8193
	#renderDeviceLost 8194)
		-> SDL3RenderEvent.

	#(#pollSentinel 32512)
		-> SDL3CommonEvent.

	#(#user 32768)
		-> SDL3UserEvent 

	} do: [ :association |
		association key pairsDo: [ :eachName :eachValue |
			eventClassByTypeNumber
				at: eachValue
				put: association value ] ]
]
