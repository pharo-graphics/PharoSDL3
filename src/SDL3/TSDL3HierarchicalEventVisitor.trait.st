"
I am a trait providing a double-dispatch mechanism for visiting `SDL3MappedEvent` objects.
I implement a 'bubbling' delegation pattern: specific visit methods (e.g., #visitMouseButtonDownEvent:) delegate to more general ones (e.g., #visitMouseButtonEvent:), eventually terminating in a no-op at #visitMappedEvent:.

Users should compose me into any class that needs to process SDL3 events. This allows subclasses to selectively override only the specific events they care about, while high-level or unhandled events automatically fall back to the next level of generality.
"
Trait {
	#name : 'TSDL3HierarchicalEventVisitor',
	#category : 'SDL3-Events',
	#package : 'SDL3',
	#tag : 'Events'
}

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitAudioDeviceAddedEvent: anEvent [

	^ self visitAudioDeviceEvent: anEvent
]

{ #category : 'visiting - abstract' }
TSDL3HierarchicalEventVisitor >> visitAudioDeviceEvent: anEvent [

	^ self visitDeviceEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitAudioDeviceFormatChangedEvent: anEvent [

	^ self visitAudioDeviceEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitAudioDeviceRemovedEvent: anEvent [

	^ self visitAudioDeviceEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitCameraDeviceAddedEvent: anEvent [

	^ self visitCameraDeviceEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitCameraDeviceApprovedEvent: anEvent [

	^ self visitCameraDeviceEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitCameraDeviceDeniedEvent: anEvent [

	^ self visitCameraDeviceEvent: anEvent
]

{ #category : 'visiting - abstract' }
TSDL3HierarchicalEventVisitor >> visitCameraDeviceEvent: anEvent [

	^ self visitDeviceEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitCameraDeviceRemovedEvent: anEvent [

	^ self visitCameraDeviceEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitClipboardEvent: anEvent [

	^ self visitMappedEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitCommonEvent: anEvent [

	^ self visitMappedEvent: anEvent
]

{ #category : 'visiting - abstract' }
TSDL3HierarchicalEventVisitor >> visitDeviceEvent: anEvent [

	^ self visitMappedEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitDisplayAddedEvent: anEvent [

	^ self visitDisplayEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitDisplayContentScaleChangedEvent: anEvent [

	^ self visitDisplayEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitDisplayCurrentModeChangedEvent: anEvent [

	^ self visitDisplayEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitDisplayDesktopModeChangedEvent: anEvent [

	^ self visitDisplayEvent: anEvent
]

{ #category : 'visiting - abstract' }
TSDL3HierarchicalEventVisitor >> visitDisplayEvent: anEvent [

	^ self visitMappedEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitDisplayMovedEvent: anEvent [

	^ self visitDisplayEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitDisplayOrientationEvent: anEvent [

	^ self visitDisplayEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitDisplayRemovedEvent: anEvent [

	^ self visitDisplayEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitDisplayUsableBoundsChangedEvent: anEvent [

	^ self visitDisplayEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitDropBeginEvent: anEvent [

	^ self visitDropEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitDropCompleteEvent: anEvent [

	^ self visitDropEvent: anEvent
]

{ #category : 'visiting - abstract' }
TSDL3HierarchicalEventVisitor >> visitDropEvent: anEvent [

	^ self visitWindowIDEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitDropFileEvent: anEvent [

	^ self visitDropEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitDropPositionEvent: anEvent [

	^ self visitDropEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitDropTextEvent: anEvent [

	^ self visitDropEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitGamepadAxisEvent: anEvent [

	^ self visitGamepadEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitGamepadButtonDownEvent: anEvent [

	^ self visitGamepadButtonEvent: anEvent
]

{ #category : 'visiting - abstract' }
TSDL3HierarchicalEventVisitor >> visitGamepadButtonEvent: anEvent [

	^ self visitGamepadEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitGamepadButtonUpEvent: anEvent [

	^ self visitGamepadButtonEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitGamepadDeviceAddedEvent: anEvent [

	^ self visitGamepadDeviceEvent: anEvent
]

{ #category : 'visiting - abstract' }
TSDL3HierarchicalEventVisitor >> visitGamepadDeviceEvent: anEvent [

	^ self visitDeviceEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitGamepadDeviceRemappedEvent: anEvent [

	^ self visitGamepadDeviceEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitGamepadDeviceRemovedEvent: anEvent [

	^ self visitGamepadDeviceEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitGamepadDeviceSteamHandleUpdatedEvent: anEvent [

	^ self visitGamepadDeviceEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitGamepadDeviceUpdateCompleteEvent: anEvent [

	^ self visitGamepadDeviceEvent: anEvent
]

{ #category : 'visiting - abstract' }
TSDL3HierarchicalEventVisitor >> visitGamepadEvent: anEvent [

	^ self visitMappedEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitGamepadSensorEvent: anEvent [

	^ self visitGamepadEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitGamepadTouchpadDownEvent: anEvent [

	^ self visitGamepadTouchpadEvent: anEvent
]

{ #category : 'visiting - abstract' }
TSDL3HierarchicalEventVisitor >> visitGamepadTouchpadEvent: anEvent [

	^ self visitGamepadEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitGamepadTouchpadMotionEvent: anEvent [

	^ self visitGamepadTouchpadEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitGamepadTouchpadUpEvent: anEvent [

	^ self visitGamepadTouchpadEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitJoyAxisEvent: anEvent [

	^ self visitJoystickEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitJoyBallEvent: anEvent [

	^ self visitJoystickEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitJoyBatteryEvent: anEvent [

	^ self visitJoystickEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitJoyButtonDownEvent: anEvent [

	^ self visitJoyButtonEvent: anEvent
]

{ #category : 'visiting - abstract' }
TSDL3HierarchicalEventVisitor >> visitJoyButtonEvent: anEvent [

	^ self visitJoystickEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitJoyButtonUpEvent: anEvent [

	^ self visitJoyButtonEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitJoyDeviceAddedEvent: anEvent [

	^ self visitJoyDeviceEvent: anEvent
]

{ #category : 'visiting - abstract' }
TSDL3HierarchicalEventVisitor >> visitJoyDeviceEvent: anEvent [

	^ self visitDeviceEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitJoyDeviceRemovedEvent: anEvent [

	^ self visitJoyDeviceEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitJoyDeviceUpdateCompleteEvent: anEvent [

	^ self visitJoyDeviceEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitJoyHatEvent: anEvent [

	^ self visitJoystickEvent: anEvent
]

{ #category : 'visiting - abstract' }
TSDL3HierarchicalEventVisitor >> visitJoystickEvent: anEvent [

	^ self visitMappedEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitKeyboardDeviceAddedEvent: anEvent [

	^ self visitKeyboardDeviceEvent: anEvent
]

{ #category : 'visiting - abstract' }
TSDL3HierarchicalEventVisitor >> visitKeyboardDeviceEvent: anEvent [

	^ self visitDeviceEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitKeyboardDeviceRemovedEvent: anEvent [

	^ self visitKeyboardDeviceEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitKeyboardDownEvent: anEvent [

	^ self visitKeyboardEvent: anEvent
]

{ #category : 'visiting - abstract' }
TSDL3HierarchicalEventVisitor >> visitKeyboardEvent: anEvent [

	^ self visitWindowIDEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitKeyboardUpEvent: anEvent [

	^ self visitKeyboardEvent: anEvent
]

{ #category : 'visiting - root' }
TSDL3HierarchicalEventVisitor >> visitMappedEvent: aVisitor [
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitMouseButtonDownEvent: anEvent [

	^ self visitMouseButtonEvent: anEvent
]

{ #category : 'visiting - abstract' }
TSDL3HierarchicalEventVisitor >> visitMouseButtonEvent: anEvent [

	^ self visitMouseEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitMouseButtonUpEvent: anEvent [

	^ self visitMouseButtonEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitMouseDeviceAddedEvent: anEvent [

	^ self visitMouseDeviceEvent: anEvent
]

{ #category : 'visiting - abstract' }
TSDL3HierarchicalEventVisitor >> visitMouseDeviceEvent: anEvent [

	^ self visitDeviceEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitMouseDeviceRemovedEvent: anEvent [

	^ self visitMouseDeviceEvent: anEvent
]

{ #category : 'visiting - abstract' }
TSDL3HierarchicalEventVisitor >> visitMouseEvent: anEvent [

	^ self visitWindowIDEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitMouseMotionEvent: anEvent [

	^ self visitMouseEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitMouseWheelEvent: anEvent [

	^ self visitMouseEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitPenAxisEvent: anEvent [

	^ self visitPenEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitPenButtonDownEvent: anEvent [

	^ self visitPenButtonEvent: anEvent
]

{ #category : 'visiting - abstract' }
TSDL3HierarchicalEventVisitor >> visitPenButtonEvent: anEvent [

	^ self visitPenEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitPenButtonUpEvent: anEvent [

	^ self visitPenButtonEvent: anEvent
]

{ #category : 'visiting - abstract' }
TSDL3HierarchicalEventVisitor >> visitPenEvent: anEvent [

	^ self visitWindowIDEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitPenMotionEvent: anEvent [

	^ self visitPenEvent: anEvent
]

{ #category : 'visiting - abstract' }
TSDL3HierarchicalEventVisitor >> visitPenProximityEvent: anEvent [

	^ self visitPenEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitPenProximityInEvent: anEvent [

	^ self visitPenProximityEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitPenProximityOutEvent: anEvent [

	^ self visitPenProximityEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitPenTouchDownEvent: anEvent [

	^ self visitPenTouchEvent: anEvent
]

{ #category : 'visiting - abstract' }
TSDL3HierarchicalEventVisitor >> visitPenTouchEvent: anEvent [

	^ self visitPenEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitPenTouchUpEvent: anEvent [

	^ self visitPenTouchEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitPinchFingerBeginEvent: anEvent [

	^ self visitPinchFingerEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitPinchFingerEndEvent: anEvent [

	^ self visitPinchFingerEvent: anEvent
]

{ #category : 'visiting - abstract' }
TSDL3HierarchicalEventVisitor >> visitPinchFingerEvent: anEvent [

	^ self visitWindowIDEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitPinchFingerUpdateEvent: anEvent [

	^ self visitPinchFingerEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitQuitEvent: anEvent [

	^ self visitMappedEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitRenderDeviceLostEvent: anEvent [

	^ self visitRenderEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitRenderDeviceResetEvent: anEvent [

	^ self visitRenderEvent: anEvent
]

{ #category : 'visiting - abstract' }
TSDL3HierarchicalEventVisitor >> visitRenderEvent: anEvent [

	^ self visitWindowIDEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitRenderTargetsResetEvent: anEvent [

	^ self visitRenderEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitSensorEvent: anEvent [

	^ self visitMappedEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitTextEditingCandidatesEvent: anEvent [

	^ self visitTextEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitTextEditingEvent: anEvent [

	^ self visitTextEvent: anEvent
]

{ #category : 'visiting - abstract' }
TSDL3HierarchicalEventVisitor >> visitTextEvent: anEvent [

	^ self visitWindowIDEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitTextInputEvent: anEvent [

	^ self visitTextEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitTouchFingerCanceledEvent: anEvent [

	^ self visitTouchFingerEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitTouchFingerDownEvent: anEvent [

	^ self visitTouchFingerEvent: anEvent
]

{ #category : 'visiting - abstract' }
TSDL3HierarchicalEventVisitor >> visitTouchFingerEvent: anEvent [

	^ self visitWindowIDEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitTouchFingerMotionEvent: anEvent [

	^ self visitTouchFingerEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitTouchFingerUpEvent: anEvent [

	^ self visitTouchFingerEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitUserEvent: anEvent [

	^ self visitWindowIDEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitWindowCloseRequestedEvent: anEvent [

	^ self visitWindowEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitWindowDestroyedEvent: anEvent [

	^ self visitWindowEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitWindowDisplayChangedEvent: anEvent [

	^ self visitWindowEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitWindowDisplayScaleChangedEvent: anEvent [

	^ self visitWindowEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitWindowEnterFullscreenEvent: anEvent [

	^ self visitWindowEvent: anEvent
]

{ #category : 'visiting - abstract' }
TSDL3HierarchicalEventVisitor >> visitWindowEvent: anEvent [

	^ self visitWindowIDEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitWindowExposedEvent: anEvent [

	^ self visitWindowEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitWindowFocusGainedEvent: anEvent [

	^ self visitWindowEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitWindowFocusLostEvent: anEvent [

	^ self visitWindowEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitWindowHdrStateChangedEvent: anEvent [

	^ self visitWindowEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitWindowHiddenEvent: anEvent [

	^ self visitWindowEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitWindowHitTestEvent: anEvent [

	^ self visitWindowEvent: anEvent
]

{ #category : 'visiting - abstract' }
TSDL3HierarchicalEventVisitor >> visitWindowIDEvent: anEvent [

	^ self visitMappedEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitWindowIccprofChangedEvent: anEvent [

	^ self visitWindowEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitWindowLeaveFullscreenEvent: anEvent [

	^ self visitWindowEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitWindowMaximizedEvent: anEvent [

	^ self visitWindowEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitWindowMetalViewResizedEvent: anEvent [

	^ self visitWindowEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitWindowMinimizedEvent: anEvent [

	^ self visitWindowEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitWindowMouseEnterEvent: anEvent [

	^ self visitWindowEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitWindowMouseLeaveEvent: anEvent [

	^ self visitWindowEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitWindowMovedEvent: anEvent [

	^ self visitWindowEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitWindowOccludedEvent: anEvent [

	^ self visitWindowEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitWindowPixelSizeChangedEvent: anEvent [

	^ self visitWindowEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitWindowResizedEvent: anEvent [

	^ self visitWindowEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitWindowRestoredEvent: anEvent [

	^ self visitWindowEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitWindowSafeAreaChangedEvent: anEvent [

	^ self visitWindowEvent: anEvent
]

{ #category : 'visiting - concrete' }
TSDL3HierarchicalEventVisitor >> visitWindowShownEvent: anEvent [

	^ self visitWindowEvent: anEvent
]
