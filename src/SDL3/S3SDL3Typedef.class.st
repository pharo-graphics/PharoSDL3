Class {
	#name : 'S3SDL3Typedef',
	#superclass : 'SharedPool',
	#classVars : [
		'SDLCALL',
		'SDL_AppResult',
		'SDL_ArrayOrder',
		'SDL_AssertData',
		'SDL_AssertState',
		'SDL_AtomicInt',
		'SDL_AtomicU32',
		'SDL_AudioDeviceEvent',
		'SDL_AudioDeviceID',
		'SDL_AudioFormat',
		'SDL_AudioSpec',
		'SDL_AudioStream',
		'SDL_BitmapOrder',
		'SDL_BlendFactor',
		'SDL_BlendMode',
		'SDL_BlendOperation',
		'SDL_Camera',
		'SDL_CameraDeviceEvent',
		'SDL_CameraID',
		'SDL_CameraPosition',
		'SDL_CameraSpec',
		'SDL_Capitalization',
		'SDL_ChromaLocation',
		'SDL_ClipboardEvent',
		'SDL_Color',
		'SDL_ColorPrimaries',
		'SDL_ColorRange',
		'SDL_ColorType',
		'SDL_Colorspace',
		'SDL_CommonEvent',
		'SDL_Condition',
		'SDL_Cursor',
		'SDL_DateFormat',
		'SDL_DateTime',
		'SDL_DialogFileFilter',
		'SDL_DisplayEvent',
		'SDL_DisplayID',
		'SDL_DisplayMode',
		'SDL_DisplayModeData',
		'SDL_DisplayOrientation',
		'SDL_DropEvent',
		'SDL_EGLAttrib',
		'SDL_EGLConfig',
		'SDL_EGLDisplay',
		'SDL_EGLSurface',
		'SDL_EGLint',
		'SDL_EnumerationResult',
		'SDL_Event',
		'SDL_EventAction',
		'SDL_EventType',
		'SDL_FColor',
		'SDL_FPoint',
		'SDL_FRect',
		'SDL_Finger',
		'SDL_FingerID',
		'SDL_FlashOperation',
		'SDL_FlipMode',
		'SDL_Folder',
		'SDL_GLAttr',
		'SDL_GLContext',
		'SDL_GLContextFlag',
		'SDL_GLContextReleaseFlag',
		'SDL_GLContextResetNotification',
		'SDL_GLContextState',
		'SDL_GLProfile',
		'SDL_GPUBlendFactor',
		'SDL_GPUBlendOp',
		'SDL_GPUBlitInfo',
		'SDL_GPUBlitRegion',
		'SDL_GPUBuffer',
		'SDL_GPUBufferBinding',
		'SDL_GPUBufferCreateInfo',
		'SDL_GPUBufferLocation',
		'SDL_GPUBufferRegion',
		'SDL_GPUBufferUsageFlags',
		'SDL_GPUColorComponentFlags',
		'SDL_GPUColorTargetBlendState',
		'SDL_GPUColorTargetDescription',
		'SDL_GPUColorTargetInfo',
		'SDL_GPUCommandBuffer',
		'SDL_GPUCompareOp',
		'SDL_GPUComputePass',
		'SDL_GPUComputePipeline',
		'SDL_GPUComputePipelineCreateInfo',
		'SDL_GPUCopyPass',
		'SDL_GPUCubeMapFace',
		'SDL_GPUCullMode',
		'SDL_GPUDepthStencilState',
		'SDL_GPUDepthStencilTargetInfo',
		'SDL_GPUDevice',
		'SDL_GPUFence',
		'SDL_GPUFillMode',
		'SDL_GPUFilter',
		'SDL_GPUFrontFace',
		'SDL_GPUGraphicsPipeline',
		'SDL_GPUGraphicsPipelineCreateInfo',
		'SDL_GPUGraphicsPipelineTargetInfo',
		'SDL_GPUIndexElementSize',
		'SDL_GPUIndexedIndirectDrawCommand',
		'SDL_GPUIndirectDispatchCommand',
		'SDL_GPUIndirectDrawCommand',
		'SDL_GPULoadOp',
		'SDL_GPUMultisampleState',
		'SDL_GPUPresentMode',
		'SDL_GPUPrimitiveType',
		'SDL_GPURasterizerState',
		'SDL_GPURenderPass',
		'SDL_GPUSampleCount',
		'SDL_GPUSampler',
		'SDL_GPUSamplerAddressMode',
		'SDL_GPUSamplerCreateInfo',
		'SDL_GPUSamplerMipmapMode',
		'SDL_GPUShader',
		'SDL_GPUShaderCreateInfo',
		'SDL_GPUShaderFormat',
		'SDL_GPUShaderStage',
		'SDL_GPUStencilOp',
		'SDL_GPUStencilOpState',
		'SDL_GPUStorageBufferReadWriteBinding',
		'SDL_GPUStorageTextureReadWriteBinding',
		'SDL_GPUStoreOp',
		'SDL_GPUSwapchainComposition',
		'SDL_GPUTexture',
		'SDL_GPUTextureCreateInfo',
		'SDL_GPUTextureFormat',
		'SDL_GPUTextureLocation',
		'SDL_GPUTextureRegion',
		'SDL_GPUTextureSamplerBinding',
		'SDL_GPUTextureTransferInfo',
		'SDL_GPUTextureType',
		'SDL_GPUTextureUsageFlags',
		'SDL_GPUTransferBuffer',
		'SDL_GPUTransferBufferCreateInfo',
		'SDL_GPUTransferBufferLocation',
		'SDL_GPUTransferBufferUsage',
		'SDL_GPUVertexAttribute',
		'SDL_GPUVertexBufferDescription',
		'SDL_GPUVertexElementFormat',
		'SDL_GPUVertexInputRate',
		'SDL_GPUVertexInputState',
		'SDL_GPUViewport',
		'SDL_GUID',
		'SDL_GamepadAxisEvent',
		'SDL_GamepadButtonEvent',
		'SDL_GamepadDeviceEvent',
		'SDL_GamepadSensorEvent',
		'SDL_GamepadTouchpadEvent',
		'SDL_GlobFlags',
		'SDL_Haptic',
		'SDL_HapticCondition',
		'SDL_HapticConstant',
		'SDL_HapticCustom',
		'SDL_HapticDirection',
		'SDL_HapticEffect',
		'SDL_HapticID',
		'SDL_HapticLeftRight',
		'SDL_HapticPeriodic',
		'SDL_HapticRamp',
		'SDL_HintPriority',
		'SDL_HitTestResult',
		'SDL_IOStatus',
		'SDL_IOStream',
		'SDL_IOStreamInterface',
		'SDL_IOWhence',
		'SDL_InitFlags',
		'SDL_InitState',
		'SDL_InitStatus',
		'SDL_JoyAxisEvent',
		'SDL_JoyBallEvent',
		'SDL_JoyBatteryEvent',
		'SDL_JoyButtonEvent',
		'SDL_JoyDeviceEvent',
		'SDL_JoyHatEvent',
		'SDL_KeyboardDeviceEvent',
		'SDL_KeyboardEvent',
		'SDL_KeyboardID',
		'SDL_Keycode',
		'SDL_Keymod',
		'SDL_Locale',
		'SDL_LogCategory',
		'SDL_LogPriority',
		'SDL_MatrixCoefficients',
		'SDL_MessageBoxButtonData',
		'SDL_MessageBoxButtonFlags',
		'SDL_MessageBoxColor',
		'SDL_MessageBoxColorScheme',
		'SDL_MessageBoxColorType',
		'SDL_MessageBoxColor_5',
		'SDL_MessageBoxData',
		'SDL_MessageBoxFlags',
		'SDL_MetalView',
		'SDL_MouseButtonEvent',
		'SDL_MouseButtonFlags',
		'SDL_MouseDeviceEvent',
		'SDL_MouseID',
		'SDL_MouseMotionEvent',
		'SDL_MouseWheelDirection',
		'SDL_MouseWheelEvent',
		'SDL_Mutex',
		'SDL_PackedLayout',
		'SDL_PackedOrder',
		'SDL_Palette',
		'SDL_PathInfo',
		'SDL_PathType',
		'SDL_PenAxis',
		'SDL_PenAxisEvent',
		'SDL_PenButtonEvent',
		'SDL_PenID',
		'SDL_PenInputFlags',
		'SDL_PenMotionEvent',
		'SDL_PenProximityEvent',
		'SDL_PenTouchEvent',
		'SDL_PixelFormat',
		'SDL_PixelFormatDetails',
		'SDL_PixelType',
		'SDL_Point',
		'SDL_PowerState',
		'SDL_Process',
		'SDL_ProcessIO',
		'SDL_PropertiesID',
		'SDL_PropertyType',
		'SDL_QuitEvent',
		'SDL_RWLock',
		'SDL_Rect',
		'SDL_Renderer',
		'SDL_RendererLogicalPresentation',
		'SDL_Sandbox',
		'SDL_ScaleMode',
		'SDL_Scancode',
		'SDL_Semaphore',
		'SDL_Sensor',
		'SDL_SensorEvent',
		'SDL_SensorID',
		'SDL_SensorType',
		'SDL_SharedObject',
		'SDL_SpinLock',
		'SDL_Storage',
		'SDL_StorageInterface',
		'SDL_Surface',
		'SDL_SurfaceFlags',
		'SDL_SystemCursor',
		'SDL_SystemTheme',
		'SDL_TLSID',
		'SDL_TextEditingCandidatesEvent',
		'SDL_TextEditingEvent',
		'SDL_TextInputEvent',
		'SDL_TextInputType',
		'SDL_Texture',
		'SDL_TextureAccess',
		'SDL_Thread',
		'SDL_ThreadID',
		'SDL_ThreadPriority',
		'SDL_TimeFormat',
		'SDL_TimerID',
		'SDL_TouchDeviceType',
		'SDL_TouchFingerEvent',
		'SDL_TouchID',
		'SDL_TransferCharacteristics',
		'SDL_UserEvent',
		'SDL_Vertex',
		'SDL_Window',
		'SDL_WindowEvent',
		'SDL_WindowFlags',
		'SDL_WindowID',
		'SDL_hid_bus_type',
		'SDL_hid_device',
		'SDL_hid_device_info',
		'Uint32',
		'Uint64',
		'XEvent',
		'_XEvent',
		'bool',
		'float_3',
		'float_6',
		'int16_t',
		'int32_t',
		'int64_t',
		'int8_t',
		'int_128',
		'int_16',
		'int_2',
		'int_3',
		'pid_t',
		'time_t',
		'uint16_t',
		'uint32_t',
		'uint64_t',
		'uint8_t',
		'uintptr_t'
	],
	#category : 'SDL3-Library',
	#package : 'SDL3',
	#tag : 'Library'
}

{ #category : 'class initialization' }
S3SDL3Typedef class >> initialize [

	uint16_t := #uint16.
	uint64_t := #uint64.
	uint8_t := #uint8.
	int32_t := #int32.
	uint32_t := #uint32.
	time_t := #int.
	pid_t := #int.
	bool := #Boolean.
	int8_t := #int8.
	int16_t := #int16.
	int64_t := #int64.
	uintptr_t := #'void *'.
	SDL_CameraID := #int.
	SDL_GPUCubeMapFace := S3SDL_GPUCubeMapFace.
	SDL_GPUColorComponentFlags := #int.
	SDL_GPUShaderStage := S3SDL_GPUShaderStage.
	SDL_GamepadButtonEvent := S3SDL_GamepadButtonEvent.
	SDL_AudioDeviceEvent := S3SDL_AudioDeviceEvent.
	SDL_GPURenderPass := S3SDL_GPURenderPass.
	SDL_PackedOrder := S3SDL_PackedOrder.
	SDL_GPUFence := S3SDL_GPUFence.
	SDL_GPUBufferRegion := S3SDL_GPUBufferRegion.
	SDL_JoyDeviceEvent := S3SDL_JoyDeviceEvent.
	SDL_HapticCustom := S3SDL_HapticCustom.
	SDL_PowerState := S3SDL_PowerState.
	SDL_GPUBlitInfo := S3SDL_GPUBlitInfo.
	SDL_GPUCullMode := S3SDL_GPUCullMode.
	SDL_GPUStencilOp := S3SDL_GPUStencilOp.
	SDL_GPUBlendFactor := S3SDL_GPUBlendFactor.
	int_2 := FFIArray ofType: 'int' size: 2.
	SDL_TouchID := #int.
	SDL_PixelFormatDetails := S3SDL_PixelFormatDetails.
	SDL_GPUCopyPass := S3SDL_GPUCopyPass.
	SDL_GPUColorTargetInfo := S3SDL_GPUColorTargetInfo.
	SDL_GPUBufferCreateInfo := S3SDL_GPUBufferCreateInfo.
	SDL_GPUIndexedIndirectDrawCommand := S3SDL_GPUIndexedIndirectDrawCommand.
	SDL_TextInputType := S3SDL_TextInputType.
	SDL_GPUShaderFormat := #int.
	SDL_FRect := S3SDL_FRect.
	SDL_MessageBoxButtonFlags := #int.
	SDL_LogPriority := S3SDL_LogPriority.
	SDL_GPULoadOp := S3SDL_GPULoadOp.
	SDL_GPUBufferLocation := S3SDL_GPUBufferLocation.
	SDL_GPUPresentMode := S3SDL_GPUPresentMode.
	SDL_GPUGraphicsPipelineCreateInfo := S3SDL_GPUGraphicsPipelineCreateInfo.
	SDL_DisplayEvent := S3SDL_DisplayEvent.
	SDL_JoyAxisEvent := S3SDL_JoyAxisEvent.
	SDL_ClipboardEvent := S3SDL_ClipboardEvent.
	SDL_GPUVertexAttribute := S3SDL_GPUVertexAttribute.
	SDL_GamepadAxisEvent := S3SDL_GamepadAxisEvent.
	SDL_TouchFingerEvent := S3SDL_TouchFingerEvent.
	SDL_BlendMode := #int.
	SDL_GLContext := #'SDL_GLContextState* *'.
	SDL_Haptic := S3SDL_Haptic.
	SDL_PixelType := S3SDL_PixelType.
	int_3 := FFIArray ofType: 'int' size: 3.
	SDL_GPUSamplerCreateInfo := S3SDL_GPUSamplerCreateInfo.
	SDL_GamepadDeviceEvent := S3SDL_GamepadDeviceEvent.
	SDL_SurfaceFlags := #int.
	SDL_HapticID := #int.
	SDL_PixelFormat := S3SDL_PixelFormat.
	SDL_Point := S3SDL_Point.
	SDL_Palette := S3SDL_Palette.
	SDL_CameraSpec := S3SDL_CameraSpec.
	SDL_HapticCondition := S3SDL_HapticCondition.
	SDL_TextureAccess := S3SDL_TextureAccess.
	SDL_HintPriority := S3SDL_HintPriority.
	SDL_Cursor := S3SDL_Cursor.
	SDL_Keymod := #int.
	SDL_MouseWheelDirection := S3SDL_MouseWheelDirection.
	SDL_MouseButtonFlags := #int.
	SDL_TouchDeviceType := S3SDL_TouchDeviceType.
	int_16 := FFIArray ofType: 'int' size: 16.
	SDL_GLContextFlag := #int.
	SDL_GPUTransferBufferUsage := S3SDL_GPUTransferBufferUsage.
	SDL_GLContextReleaseFlag := #int.
	SDL_IOWhence := S3SDL_IOWhence.
	SDL_GPUTextureType := S3SDL_GPUTextureType.
	SDL_KeyboardEvent := S3SDL_KeyboardEvent.
	SDL_Scancode := S3SDL_Scancode.
	SDL_MessageBoxFlags := #int.
	SDL_GPUFilter := S3SDL_GPUFilter.
	SDL_Process := S3SDL_Process.
	SDL_ScaleMode := S3SDL_ScaleMode.
	SDL_CommonEvent := S3SDL_CommonEvent.
	SDL_GLProfile := #int.
	SDL_InitState := S3SDL_InitState.
	SDL_GPUGraphicsPipelineTargetInfo := S3SDL_GPUGraphicsPipelineTargetInfo.
	SDL_IOStream := S3SDL_IOStream.
	SDL_UserEvent := S3SDL_UserEvent.
	SDL_WindowEvent := S3SDL_WindowEvent.
	SDL_IOStatus := S3SDL_IOStatus.
	SDL_GPUTextureTransferInfo := S3SDL_GPUTextureTransferInfo.
	SDL_GPUGraphicsPipeline := S3SDL_GPUGraphicsPipeline.
	SDL_GLContextState := S3SDL_GLContextState.
	SDL_Sensor := S3SDL_Sensor.
	SDL_TextEditingEvent := S3SDL_TextEditingEvent.
	SDL_EGLint := #int.
	SDL_HapticEffect := S3SDL_HapticEffect.
	SDL_GLContextResetNotification := #int.
	SDL_GPUSampler := S3SDL_GPUSampler.
	SDL_GlobFlags := #int.
	SDL_HapticConstant := S3SDL_HapticConstant.
	SDL_HapticPeriodic := S3SDL_HapticPeriodic.
	SDL_GPUVertexInputRate := S3SDL_GPUVertexInputRate.
	SDL_EGLDisplay := #'void *'.
	SDL_Texture := S3SDL_Texture.
	SDL_SensorEvent := S3SDL_SensorEvent.
	SDL_GPUStorageBufferReadWriteBinding := S3SDL_GPUStorageBufferReadWriteBinding.
	SDL_QuitEvent := S3SDL_QuitEvent.
	SDL_PackedLayout := S3SDL_PackedLayout.
	SDL_GPUComputePipeline := S3SDL_GPUComputePipeline.
	SDL_BlendFactor := S3SDL_BlendFactor.
	SDL_GPUTextureFormat := S3SDL_GPUTextureFormat.
	int_128 := FFIArray ofType: 'int' size: 128.
	SDL_GPUStoreOp := S3SDL_GPUStoreOp.
	SDL_MessageBoxColorType := S3SDL_MessageBoxColorType.
	SDL_Color := S3SDL_Color.
	SDL_GPUTransferBufferCreateInfo := S3SDL_GPUTransferBufferCreateInfo.
	SDL_ArrayOrder := S3SDL_ArrayOrder.
	SDL_MessageBoxColorScheme := S3SDL_MessageBoxColorScheme.
	SDL_ColorRange := S3SDL_ColorRange.
	SDL_GPUSamplerMipmapMode := S3SDL_GPUSamplerMipmapMode.
	SDL_GPUColorTargetBlendState := S3SDL_GPUColorTargetBlendState.
	SDL_GPUTexture := S3SDL_GPUTexture.
	SDL_TransferCharacteristics := S3SDL_TransferCharacteristics.
	SDL_AtomicU32 := S3SDL_AtomicU32.
	SDL_GPUTextureUsageFlags := #int.
	SDL_MetalView := #'void *'.
	SDL_GPUColorTargetDescription := S3SDL_GPUColorTargetDescription.
	SDL_PenAxisEvent := S3SDL_PenAxisEvent.
	SDL_BlendOperation := S3SDL_BlendOperation.
	SDL_EventAction := S3SDL_EventAction.
	SDL_GPUBufferBinding := S3SDL_GPUBufferBinding.
	SDL_Sandbox := S3SDL_Sandbox.
	SDL_MouseMotionEvent := S3SDL_MouseMotionEvent.
	SDL_DisplayOrientation := S3SDL_DisplayOrientation.
	SDL_GPUIndexElementSize := S3SDL_GPUIndexElementSize.
	SDL_Folder := S3SDL_Folder.
	SDL_SpinLock := #int.
	SDL_PenProximityEvent := S3SDL_PenProximityEvent.
	SDL_SensorType := S3SDL_SensorType.
	SDL_GPUDepthStencilTargetInfo := S3SDL_GPUDepthStencilTargetInfo.
	SDL_TimerID := #int.
	SDL_AudioStream := S3SDL_AudioStream.
	SDL_PenMotionEvent := S3SDL_PenMotionEvent.
	SDL_ColorPrimaries := S3SDL_ColorPrimaries.
	SDL_GPUViewport := S3SDL_GPUViewport.
	SDL_GPUBuffer := S3SDL_GPUBuffer.
	SDL_HapticRamp := S3SDL_HapticRamp.
	SDL_hid_device_info := S3SDL_hid_device_info.
	SDL_EGLAttrib := #int.
	SDL_PropertyType := S3SDL_PropertyType.
	SDL_EnumerationResult := S3SDL_EnumerationResult.
	SDL_Vertex := S3SDL_Vertex.
	SDL_ThreadID := #int.
	SDL_Finger := S3SDL_Finger.
	SDL_GPUVertexElementFormat := S3SDL_GPUVertexElementFormat.
	SDL_Renderer := S3SDL_Renderer.
	SDL_MessageBoxColor := S3SDL_MessageBoxColor.
	SDL_MessageBoxButtonData := S3SDL_MessageBoxButtonData.
	SDL_ChromaLocation := S3SDL_ChromaLocation.
	SDL_MatrixCoefficients := S3SDL_MatrixCoefficients.
	SDL_Colorspace := S3SDL_Colorspace.
	SDL_GPUPrimitiveType := S3SDL_GPUPrimitiveType.
	SDL_SystemCursor := S3SDL_SystemCursor.
	SDL_GamepadTouchpadEvent := S3SDL_GamepadTouchpadEvent.
	SDL_DisplayID := #int.
	SDL_PathType := S3SDL_PathType.
	SDL_Thread := S3SDL_Thread.
	SDL_MessageBoxData := S3SDL_MessageBoxData.
	SDL_GPUDepthStencilState := S3SDL_GPUDepthStencilState.
	Uint32 := #void.
	SDL_IOStreamInterface := S3SDL_IOStreamInterface.
	SDL_GamepadSensorEvent := S3SDL_GamepadSensorEvent.
	_XEvent := S3_XEvent.
	SDL_KeyboardDeviceEvent := S3SDL_KeyboardDeviceEvent.
	SDL_GPUFrontFace := S3SDL_GPUFrontFace.
	SDL_TLSID := #int.
	SDL_FingerID := #int.
	SDL_StorageInterface := S3SDL_StorageInterface.
	SDL_DateFormat := S3SDL_DateFormat.
	SDL_GPUTextureSamplerBinding := S3SDL_GPUTextureSamplerBinding.
	SDL_GPUVertexBufferDescription := S3SDL_GPUVertexBufferDescription.
	SDL_ColorType := S3SDL_ColorType.
	SDL_SensorID := #int.
	SDL_GPUBlendOp := S3SDL_GPUBlendOp.
	SDL_GPUMultisampleState := S3SDL_GPUMultisampleState.
	SDL_GPUStencilOpState := S3SDL_GPUStencilOpState.
	SDL_GPUShader := S3SDL_GPUShader.
	SDL_AssertState := S3SDL_AssertState.
	SDL_Capitalization := S3SDL_Capitalization.
	SDL_RWLock := S3SDL_RWLock.
	SDL_Surface := S3SDL_Surface.
	SDL_ProcessIO := S3SDL_ProcessIO.
	SDL_GPUCompareOp := S3SDL_GPUCompareOp.
	SDL_Event := S3SDL_Event.
	SDL_JoyBallEvent := S3SDL_JoyBallEvent.
	Uint64 := #void.
	SDL_GPUIndirectDispatchCommand := S3SDL_GPUIndirectDispatchCommand.
	SDL_HitTestResult := S3SDL_HitTestResult.
	SDL_AudioFormat := S3SDL_AudioFormat.
	SDL_WindowFlags := #int.
	SDL_GPUTextureRegion := S3SDL_GPUTextureRegion.
	SDL_KeyboardID := #int.
	SDL_RendererLogicalPresentation := S3SDL_RendererLogicalPresentation.
	SDL_GPUTextureLocation := S3SDL_GPUTextureLocation.
	SDL_InitFlags := #int.
	SDL_TextInputEvent := S3SDL_TextInputEvent.
	SDL_HapticDirection := S3SDL_HapticDirection.
	float_3 := FFIArray ofType: 'float' size: 3.
	SDL_GPUTransferBuffer := S3SDL_GPUTransferBuffer.
	SDL_SharedObject := S3SDL_SharedObject.
	SDL_ThreadPriority := S3SDL_ThreadPriority.
	SDL_AppResult := S3SDL_AppResult.
	SDL_TimeFormat := S3SDL_TimeFormat.
	SDL_CameraPosition := S3SDL_CameraPosition.
	SDL_MouseDeviceEvent := S3SDL_MouseDeviceEvent.
	SDL_MouseID := #int.
	SDL_GPUIndirectDrawCommand := S3SDL_GPUIndirectDrawCommand.
	SDL_AudioSpec := S3SDL_AudioSpec.
	SDL_JoyBatteryEvent := S3SDL_JoyBatteryEvent.
	SDL_PenAxis := S3SDL_PenAxis.
	SDL_TextEditingCandidatesEvent := S3SDL_TextEditingCandidatesEvent.
	SDL_AudioDeviceID := #int.
	SDL_EventType := S3SDL_EventType.
	SDL_Camera := S3SDL_Camera.
	SDL_PenID := #int.
	SDL_Mutex := S3SDL_Mutex.
	SDL_GPUFillMode := S3SDL_GPUFillMode.
	SDL_FlashOperation := S3SDL_FlashOperation.
	SDL_EGLSurface := #'void *'.
	SDL_PropertiesID := #int.
	SDL_PenTouchEvent := S3SDL_PenTouchEvent.
	SDL_DisplayMode := S3SDL_DisplayMode.
	SDL_GPUVertexInputState := S3SDL_GPUVertexInputState.
	SDL_PenInputFlags := #int.
	SDL_InitStatus := S3SDL_InitStatus.
	SDL_FPoint := S3SDL_FPoint.
	SDL_GPUTextureCreateInfo := S3SDL_GPUTextureCreateInfo.
	SDL_GPUSamplerAddressMode := S3SDL_GPUSamplerAddressMode.
	SDL_MouseButtonEvent := S3SDL_MouseButtonEvent.
	SDL_MouseWheelEvent := S3SDL_MouseWheelEvent.
	SDL_AssertData := S3SDL_AssertData.
	SDL_GPUTransferBufferLocation := S3SDL_GPUTransferBufferLocation.
	SDL_GPUComputePipelineCreateInfo := S3SDL_GPUComputePipelineCreateInfo.
	XEvent := S3_XEvent.
	SDL_WindowID := #int.
	SDL_Window := S3SDL_Window.
	SDL_PenButtonEvent := S3SDL_PenButtonEvent.
	SDL_SystemTheme := S3SDL_SystemTheme.
	SDL_GPUShaderCreateInfo := S3SDL_GPUShaderCreateInfo.
	SDL_Storage := S3SDL_Storage.
	SDL_Semaphore := S3SDL_Semaphore.
	SDL_Condition := S3SDL_Condition.
	SDL_DateTime := S3SDL_DateTime.
	SDL_DialogFileFilter := S3SDL_DialogFileFilter.
	SDL_GPURasterizerState := S3SDL_GPURasterizerState.
	SDL_JoyButtonEvent := S3SDL_JoyButtonEvent.
	SDL_Locale := S3SDL_Locale.
	SDL_GPUBufferUsageFlags := #int.
	SDL_FlipMode := S3SDL_FlipMode.
	SDL_JoyHatEvent := S3SDL_JoyHatEvent.
	SDL_hid_bus_type := S3SDL_hid_bus_type.
	SDL_GPUCommandBuffer := S3SDL_GPUCommandBuffer.
	SDL_Keycode := #int.
	SDL_GPUBlitRegion := S3SDL_GPUBlitRegion.
	SDL_DropEvent := S3SDL_DropEvent.
	SDLCALL := #void.
	SDL_LogCategory := S3SDL_LogCategory.
	SDL_HapticLeftRight := S3SDL_HapticLeftRight.
	SDL_GPUSampleCount := S3SDL_GPUSampleCount.
	SDL_MessageBoxColor_5 := FFIArray ofType: SDL_MessageBoxColor size: 5.
	SDL_Rect := S3SDL_Rect.
	float_6 := FFIArray ofType: 'float' size: 6.
	SDL_DisplayModeData := S3SDL_DisplayModeData.
	SDL_GPUDevice := S3SDL_GPUDevice.
	SDL_EGLConfig := #'void *'.
	SDL_GPUSwapchainComposition := S3SDL_GPUSwapchainComposition.
	SDL_GLAttr := S3SDL_GLAttr.
	SDL_GPUStorageTextureReadWriteBinding := S3SDL_GPUStorageTextureReadWriteBinding.
	SDL_GUID := S3SDL_GUID.
	SDL_CameraDeviceEvent := S3SDL_CameraDeviceEvent.
	SDL_hid_device := S3SDL_hid_device.
	SDL_AtomicInt := S3SDL_AtomicInt.
	SDL_BitmapOrder := S3SDL_BitmapOrder.
	SDL_PathInfo := S3SDL_PathInfo.
	SDL_GPUComputePass := S3SDL_GPUComputePass.
	SDL_FColor := S3SDL_FColor
]
