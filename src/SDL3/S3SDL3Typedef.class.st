Class {
	#name : 'S3SDL3Typedef',
	#superclass : 'SharedPool',
	#classVars : [
		'SDL_AppEvent_func',
		'SDL_AppInit_func',
		'SDL_AppIterate_func',
		'SDL_AppQuit_func',
		'SDL_AppResult',
		'SDL_ArrayOrder',
		'SDL_AssertData',
		'SDL_AssertState',
		'SDL_AssertionHandler',
		'SDL_AtomicInt',
		'SDL_AtomicU32',
		'SDL_AudioDeviceEvent',
		'SDL_AudioDeviceID',
		'SDL_AudioFormat',
		'SDL_AudioPostmixCallback',
		'SDL_AudioSpec',
		'SDL_AudioStream',
		'SDL_AudioStreamCallback',
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
		'SDL_CleanupPropertyCallback',
		'SDL_ClipboardCleanupCallback',
		'SDL_ClipboardDataCallback',
		'SDL_ClipboardEvent',
		'SDL_Color',
		'SDL_ColorPrimaries',
		'SDL_ColorRange',
		'SDL_ColorType',
		'SDL_Colorspace',
		'SDL_CommonEvent',
		'SDL_CompareCallback',
		'SDL_CompareCallback_r',
		'SDL_Condition',
		'SDL_Cursor',
		'SDL_DUMMY_ENUM',
		'SDL_DateFormat',
		'SDL_DateTime',
		'SDL_DialogFileCallback',
		'SDL_DialogFileFilter',
		'SDL_DisplayEvent',
		'SDL_DisplayID',
		'SDL_DisplayMode',
		'SDL_DisplayModeData',
		'SDL_DisplayOrientation',
		'SDL_DropEvent',
		'SDL_EGLAttrib',
		'SDL_EGLAttribArrayCallback',
		'SDL_EGLConfig',
		'SDL_EGLDisplay',
		'SDL_EGLIntArrayCallback',
		'SDL_EGLSurface',
		'SDL_EGLint',
		'SDL_EnumerateDirectoryCallback',
		'SDL_EnumeratePropertiesCallback',
		'SDL_EnumerationResult',
		'SDL_Environment',
		'SDL_Event',
		'SDL_EventAction',
		'SDL_EventFilter',
		'SDL_EventType',
		'SDL_FColor',
		'SDL_FPoint',
		'SDL_FRect',
		'SDL_FileDialogType',
		'SDL_Finger',
		'SDL_FingerID',
		'SDL_FlashOperation',
		'SDL_FlipMode',
		'SDL_Folder',
		'SDL_FunctionPointer',
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
		'SDL_HitTest',
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
		'SDL_Joystick',
		'SDL_JoystickConnectionState',
		'SDL_JoystickID',
		'SDL_JoystickType',
		'SDL_KeyboardDeviceEvent',
		'SDL_KeyboardEvent',
		'SDL_KeyboardID',
		'SDL_Keycode',
		'SDL_Keymod',
		'SDL_MainThreadCallback',
		'SDL_MatrixCoefficients',
		'SDL_MessageBoxButtonData',
		'SDL_MessageBoxButtonFlags',
		'SDL_MessageBoxColor',
		'SDL_MessageBoxColorScheme',
		'SDL_MessageBoxColorType',
		'SDL_MessageBoxColor_5',
		'SDL_MessageBoxData',
		'SDL_MessageBoxFlags',
		'SDL_MouseButtonEvent',
		'SDL_MouseButtonFlags',
		'SDL_MouseDeviceEvent',
		'SDL_MouseID',
		'SDL_MouseMotionEvent',
		'SDL_MouseWheelDirection',
		'SDL_MouseWheelEvent',
		'SDL_Mutex',
		'SDL_NSTimerCallback',
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
		'SDL_PropertiesID',
		'SDL_PropertyType',
		'SDL_QuitEvent',
		'SDL_RWLock',
		'SDL_Rect',
		'SDL_RenderEvent',
		'SDL_Renderer',
		'SDL_RendererLogicalPresentation',
		'SDL_ScaleMode',
		'SDL_Scancode',
		'SDL_Semaphore',
		'SDL_Sensor',
		'SDL_SensorEvent',
		'SDL_SensorID',
		'SDL_SensorType',
		'SDL_SpinLock',
		'SDL_Surface',
		'SDL_SurfaceFlags',
		'SDL_SystemCursor',
		'SDL_SystemTheme',
		'SDL_TLSDestructorCallback',
		'SDL_TLSID',
		'SDL_TextEditingCandidatesEvent',
		'SDL_TextEditingEvent',
		'SDL_TextInputEvent',
		'SDL_TextInputType',
		'SDL_Texture',
		'SDL_TextureAccess',
		'SDL_Thread',
		'SDL_ThreadFunction',
		'SDL_ThreadID',
		'SDL_ThreadPriority',
		'SDL_ThreadState',
		'SDL_Time',
		'SDL_TimeFormat',
		'SDL_TimerCallback',
		'SDL_TimerID',
		'SDL_TouchDeviceType',
		'SDL_TouchFingerEvent',
		'SDL_TouchID',
		'SDL_TransferCharacteristics',
		'SDL_UserEvent',
		'SDL_Vertex',
		'SDL_VirtualJoystickDesc',
		'SDL_VirtualJoystickSensorDesc',
		'SDL_VirtualJoystickTouchpadDesc',
		'SDL_Window',
		'SDL_WindowEvent',
		'SDL_WindowFlags',
		'SDL_WindowID',
		'SDL_alignment_test',
		'SDL_calloc_func',
		'SDL_free_func',
		'SDL_iconv_data_t',
		'SDL_iconv_t',
		'SDL_malloc_func',
		'SDL_realloc_func',
		'Sint16',
		'Sint32',
		'Sint64',
		'Sint8',
		'Uint16',
		'Uint16_2',
		'Uint16_3',
		'Uint32',
		'Uint64',
		'Uint8',
		'Uint8_128',
		'Uint8_16',
		'Uint8_2',
		'__blkcnt64_t',
		'__blkcnt_t',
		'__blksize_t',
		'__caddr_t',
		'__clock_t',
		'__clockid_t',
		'__daddr_t',
		'__dev_t',
		'__fsblkcnt64_t',
		'__fsblkcnt_t',
		'__fsfilcnt64_t',
		'__fsfilcnt_t',
		'__fsword_t',
		'__gid_t',
		'__id_t',
		'__ino64_t',
		'__ino_t',
		'__int16_t',
		'__int32_t',
		'__int64_t',
		'__int8_t',
		'__int_least16_t',
		'__int_least32_t',
		'__int_least64_t',
		'__int_least8_t',
		'__intmax_t',
		'__intptr_t',
		'__key_t',
		'__loff_t',
		'__mode_t',
		'__nlink_t',
		'__off64_t',
		'__off_t',
		'__pid_t',
		'__quad_t',
		'__rlim64_t',
		'__rlim_t',
		'__sig_atomic_t',
		'__socklen_t',
		'__ssize_t',
		'__suseconds64_t',
		'__suseconds_t',
		'__syscall_slong_t',
		'__syscall_ulong_t',
		'__time_t',
		'__timer_t',
		'__u_char',
		'__u_int',
		'__u_long',
		'__u_quad_t',
		'__u_short',
		'__uid_t',
		'__uint16_t',
		'__uint32_t',
		'__uint64_t',
		'__uint8_t',
		'__uint_least16_t',
		'__uint_least32_t',
		'__uint_least64_t',
		'__uint_least8_t',
		'__uintmax_t',
		'__useconds_t',
		'bool',
		'float_3',
		'float_6',
		'int16_t',
		'int32_t',
		'int64_t',
		'int8_t',
		'int_fast16_t',
		'int_fast32_t',
		'int_fast64_t',
		'int_fast8_t',
		'int_least16_t',
		'int_least32_t',
		'int_least64_t',
		'int_least8_t',
		'intmax_t',
		'intptr_t',
		'pid_t',
		'time_t',
		'uint16_t',
		'uint32_t',
		'uint64_t',
		'uint8_t',
		'uint_fast16_t',
		'uint_fast32_t',
		'uint_fast64_t',
		'uint_fast8_t',
		'uint_least16_t',
		'uint_least32_t',
		'uint_least64_t',
		'uint_least8_t',
		'uintmax_t',
		'uintptr_t'
	],
	#category : 'SDL3-Library',
	#package : 'SDL3',
	#tag : 'Library'
}

{ #category : 'class initialization' }
S3SDL3Typedef class >> ensureNoNilValue [
	<script>
	
	self assert: (self classVariables noneSatisfy: [ :each | each isNil ])
]

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
	SDL_AppEvent_func := FFICallback.
	SDL_AppInit_func := FFICallback.
	SDL_AppIterate_func := FFICallback.
	SDL_AppQuit_func := FFICallback.
	SDL_AppResult := S3SDL_AppResult.
	SDL_ArrayOrder := S3SDL_ArrayOrder.
	SDL_AssertData := S3SDL_AssertData.
	SDL_AssertState := S3SDL_AssertState.
	SDL_AssertionHandler := FFICallback.
	SDL_AtomicInt := S3SDL_AtomicInt.
	SDL_AtomicU32 := S3SDL_AtomicU32.
	SDL_AudioDeviceEvent := S3SDL_AudioDeviceEvent.
	SDL_AudioDeviceID := Uint32.
	SDL_AudioFormat := S3SDL_AudioFormat.
	SDL_AudioPostmixCallback := FFICallback.
	SDL_AudioSpec := S3SDL_AudioSpec.
	SDL_AudioStream := S3SDL_AudioStream.
	SDL_AudioStreamCallback := FFICallback.
	SDL_BitmapOrder := S3SDL_BitmapOrder.
	SDL_BlendFactor := S3SDL_BlendFactor.
	SDL_BlendMode := Uint32.
	SDL_BlendOperation := S3SDL_BlendOperation.
	SDL_Camera := S3SDL_Camera.
	SDL_CameraDeviceEvent := S3SDL_CameraDeviceEvent.
	SDL_CameraID := Uint32.
	SDL_CameraPosition := S3SDL_CameraPosition.
	SDL_CameraSpec := S3SDL_CameraSpec.
	SDL_Capitalization := S3SDL_Capitalization.
	SDL_ChromaLocation := S3SDL_ChromaLocation.
	SDL_CleanupPropertyCallback := FFICallback.
	SDL_ClipboardCleanupCallback := FFICallback.
	SDL_ClipboardDataCallback := FFICallback.
	SDL_ClipboardEvent := S3SDL_ClipboardEvent.
	SDL_Color := S3SDL_Color.
	SDL_ColorPrimaries := S3SDL_ColorPrimaries.
	SDL_ColorRange := S3SDL_ColorRange.
	SDL_ColorType := S3SDL_ColorType.
	SDL_Colorspace := S3SDL_Colorspace.
	SDL_CommonEvent := S3SDL_CommonEvent.
	SDL_CompareCallback := FFICallback.
	SDL_CompareCallback_r := FFICallback.
	SDL_Condition := S3SDL_Condition.
	SDL_Cursor := S3SDL_Cursor.
	SDL_DUMMY_ENUM := S3SDL_DUMMY_ENUM.
	SDL_DateFormat := S3SDL_DateFormat.
	SDL_DateTime := S3SDL_DateTime.
	SDL_DialogFileCallback := FFICallback.
	SDL_DialogFileFilter := S3SDL_DialogFileFilter.
	SDL_DisplayEvent := S3SDL_DisplayEvent.
	SDL_DisplayID := Uint32.
	SDL_DisplayMode := S3SDL_DisplayMode.
	SDL_DisplayModeData := S3SDL_DisplayModeData.
	SDL_DisplayOrientation := S3SDL_DisplayOrientation.
	SDL_DropEvent := S3SDL_DropEvent.
	SDL_EGLAttrib := intptr_t.
	SDL_EGLAttribArrayCallback := FFICallback.
	SDL_EGLConfig := #'void *'.
	SDL_EGLDisplay := #'void *'.
	SDL_EGLIntArrayCallback := FFICallback.
	SDL_EGLSurface := #'void *'.
	SDL_EGLint := #int.
	SDL_EnumerateDirectoryCallback := FFICallback.
	SDL_EnumeratePropertiesCallback := FFICallback.
	SDL_EnumerationResult := S3SDL_EnumerationResult.
	SDL_Environment := S3SDL_Environment.
	SDL_Event := S3SDL_Event.
	SDL_EventAction := S3SDL_EventAction.
	SDL_EventFilter := FFICallback.
	SDL_EventType := S3SDL_EventType.
	SDL_FColor := S3SDL_FColor.
	SDL_FPoint := S3SDL_FPoint.
	SDL_FRect := S3SDL_FRect.
	SDL_FileDialogType := S3SDL_FileDialogType.
	SDL_Finger := S3SDL_Finger.
	SDL_FingerID := Uint64.
	SDL_FlashOperation := S3SDL_FlashOperation.
	SDL_FlipMode := S3SDL_FlipMode.
	SDL_Folder := S3SDL_Folder.
	SDL_FunctionPointer := FFICallback.
	SDL_GLAttr := S3SDL_GLAttr.
	SDL_GLContext := #'SDL_GLContextState* *'.
	SDL_GLContextFlag := Uint32.
	SDL_GLContextReleaseFlag := Uint32.
	SDL_GLContextResetNotification := Uint32.
	SDL_GLContextState := S3SDL_GLContextState.
	SDL_GLProfile := Uint32.
	SDL_GPUBlendFactor := S3SDL_GPUBlendFactor.
	SDL_GPUBlendOp := S3SDL_GPUBlendOp.
	SDL_GPUBlitInfo := S3SDL_GPUBlitInfo.
	SDL_GPUBlitRegion := S3SDL_GPUBlitRegion.
	SDL_GPUBuffer := S3SDL_GPUBuffer.
	SDL_GPUBufferBinding := S3SDL_GPUBufferBinding.
	SDL_GPUBufferCreateInfo := S3SDL_GPUBufferCreateInfo.
	SDL_GPUBufferLocation := S3SDL_GPUBufferLocation.
	SDL_GPUBufferRegion := S3SDL_GPUBufferRegion.
	SDL_GPUBufferUsageFlags := Uint32.
	SDL_GPUColorComponentFlags := Uint8.
	SDL_GPUColorTargetBlendState := S3SDL_GPUColorTargetBlendState.
	SDL_GPUColorTargetDescription := S3SDL_GPUColorTargetDescription.
	SDL_GPUColorTargetInfo := S3SDL_GPUColorTargetInfo.
	SDL_GPUCommandBuffer := S3SDL_GPUCommandBuffer.
	SDL_GPUCompareOp := S3SDL_GPUCompareOp.
	SDL_GPUComputePass := S3SDL_GPUComputePass.
	SDL_GPUComputePipeline := S3SDL_GPUComputePipeline.
	SDL_GPUComputePipelineCreateInfo := S3SDL_GPUComputePipelineCreateInfo.
	SDL_GPUCopyPass := S3SDL_GPUCopyPass.
	SDL_GPUCubeMapFace := S3SDL_GPUCubeMapFace.
	SDL_GPUCullMode := S3SDL_GPUCullMode.
	SDL_GPUDepthStencilState := S3SDL_GPUDepthStencilState.
	SDL_GPUDepthStencilTargetInfo := S3SDL_GPUDepthStencilTargetInfo.
	SDL_GPUDevice := S3SDL_GPUDevice.
	SDL_GPUFence := S3SDL_GPUFence.
	SDL_GPUFillMode := S3SDL_GPUFillMode.
	SDL_GPUFilter := S3SDL_GPUFilter.
	SDL_GPUFrontFace := S3SDL_GPUFrontFace.
	SDL_GPUGraphicsPipeline := S3SDL_GPUGraphicsPipeline.
	SDL_GPUGraphicsPipelineCreateInfo := S3SDL_GPUGraphicsPipelineCreateInfo.
	SDL_GPUGraphicsPipelineTargetInfo := S3SDL_GPUGraphicsPipelineTargetInfo.
	SDL_GPUIndexElementSize := S3SDL_GPUIndexElementSize.
	SDL_GPUIndexedIndirectDrawCommand := S3SDL_GPUIndexedIndirectDrawCommand.
	SDL_GPUIndirectDispatchCommand := S3SDL_GPUIndirectDispatchCommand.
	SDL_GPUIndirectDrawCommand := S3SDL_GPUIndirectDrawCommand.
	SDL_GPULoadOp := S3SDL_GPULoadOp.
	SDL_GPUMultisampleState := S3SDL_GPUMultisampleState.
	SDL_GPUPresentMode := S3SDL_GPUPresentMode.
	SDL_GPUPrimitiveType := S3SDL_GPUPrimitiveType.
	SDL_GPURasterizerState := S3SDL_GPURasterizerState.
	SDL_GPURenderPass := S3SDL_GPURenderPass.
	SDL_GPUSampleCount := S3SDL_GPUSampleCount.
	SDL_GPUSampler := S3SDL_GPUSampler.
	SDL_GPUSamplerAddressMode := S3SDL_GPUSamplerAddressMode.
	SDL_GPUSamplerCreateInfo := S3SDL_GPUSamplerCreateInfo.
	SDL_GPUSamplerMipmapMode := S3SDL_GPUSamplerMipmapMode.
	SDL_GPUShader := S3SDL_GPUShader.
	SDL_GPUShaderCreateInfo := S3SDL_GPUShaderCreateInfo.
	SDL_GPUShaderFormat := Uint32.
	SDL_GPUShaderStage := S3SDL_GPUShaderStage.
	SDL_GPUStencilOp := S3SDL_GPUStencilOp.
	SDL_GPUStencilOpState := S3SDL_GPUStencilOpState.
	SDL_GPUStorageBufferReadWriteBinding := S3SDL_GPUStorageBufferReadWriteBinding.
	SDL_GPUStorageTextureReadWriteBinding := S3SDL_GPUStorageTextureReadWriteBinding.
	SDL_GPUStoreOp := S3SDL_GPUStoreOp.
	SDL_GPUSwapchainComposition := S3SDL_GPUSwapchainComposition.
	SDL_GPUTexture := S3SDL_GPUTexture.
	SDL_GPUTextureCreateInfo := S3SDL_GPUTextureCreateInfo.
	SDL_GPUTextureFormat := S3SDL_GPUTextureFormat.
	SDL_GPUTextureLocation := S3SDL_GPUTextureLocation.
	SDL_GPUTextureRegion := S3SDL_GPUTextureRegion.
	SDL_GPUTextureSamplerBinding := S3SDL_GPUTextureSamplerBinding.
	SDL_GPUTextureTransferInfo := S3SDL_GPUTextureTransferInfo.
	SDL_GPUTextureType := S3SDL_GPUTextureType.
	SDL_GPUTextureUsageFlags := Uint32.
	SDL_GPUTransferBuffer := S3SDL_GPUTransferBuffer.
	SDL_GPUTransferBufferCreateInfo := S3SDL_GPUTransferBufferCreateInfo.
	SDL_GPUTransferBufferLocation := S3SDL_GPUTransferBufferLocation.
	SDL_GPUTransferBufferUsage := S3SDL_GPUTransferBufferUsage.
	SDL_GPUVertexAttribute := S3SDL_GPUVertexAttribute.
	SDL_GPUVertexBufferDescription := S3SDL_GPUVertexBufferDescription.
	SDL_GPUVertexElementFormat := S3SDL_GPUVertexElementFormat.
	SDL_GPUVertexInputRate := S3SDL_GPUVertexInputRate.
	SDL_GPUVertexInputState := S3SDL_GPUVertexInputState.
	SDL_GPUViewport := S3SDL_GPUViewport.
	SDL_GUID := S3SDL_GUID.
	SDL_GamepadAxisEvent := S3SDL_GamepadAxisEvent.
	SDL_GamepadButtonEvent := S3SDL_GamepadButtonEvent.
	SDL_GamepadDeviceEvent := S3SDL_GamepadDeviceEvent.
	SDL_GamepadSensorEvent := S3SDL_GamepadSensorEvent.
	SDL_GamepadTouchpadEvent := S3SDL_GamepadTouchpadEvent.
	SDL_GlobFlags := Uint32.
	SDL_HitTest := FFICallback.
	SDL_HitTestResult := S3SDL_HitTestResult.
	SDL_IOStatus := S3SDL_IOStatus.
	SDL_IOStream := S3SDL_IOStream.
	SDL_IOStreamInterface := S3SDL_IOStreamInterface.
	SDL_IOWhence := S3SDL_IOWhence.
	SDL_InitFlags := Uint32.
	SDL_InitState := S3SDL_InitState.
	SDL_InitStatus := S3SDL_InitStatus.
	SDL_JoyAxisEvent := S3SDL_JoyAxisEvent.
	SDL_JoyBallEvent := S3SDL_JoyBallEvent.
	SDL_JoyBatteryEvent := S3SDL_JoyBatteryEvent.
	SDL_JoyButtonEvent := S3SDL_JoyButtonEvent.
	SDL_JoyDeviceEvent := S3SDL_JoyDeviceEvent.
	SDL_JoyHatEvent := S3SDL_JoyHatEvent.
	SDL_Joystick := S3SDL_Joystick.
	SDL_JoystickConnectionState := S3SDL_JoystickConnectionState.
	SDL_JoystickID := Uint32.
	SDL_JoystickType := S3SDL_JoystickType.
	SDL_KeyboardDeviceEvent := S3SDL_KeyboardDeviceEvent.
	SDL_KeyboardEvent := S3SDL_KeyboardEvent.
	SDL_KeyboardID := Uint32.
	SDL_Keycode := Uint32.
	SDL_Keymod := Uint16.
	SDL_MainThreadCallback := FFICallback.
	SDL_MatrixCoefficients := S3SDL_MatrixCoefficients.
	SDL_MessageBoxButtonData := S3SDL_MessageBoxButtonData.
	SDL_MessageBoxButtonFlags := Uint32.
	SDL_MessageBoxColor := S3SDL_MessageBoxColor.
	SDL_MessageBoxColorScheme := S3SDL_MessageBoxColorScheme.
	SDL_MessageBoxColorType := S3SDL_MessageBoxColorType.
	SDL_MessageBoxColor_5 := FFIArray ofType: SDL_MessageBoxColor size: 5.
	SDL_MessageBoxData := S3SDL_MessageBoxData.
	SDL_MessageBoxFlags := Uint32.
	SDL_MouseButtonEvent := S3SDL_MouseButtonEvent.
	SDL_MouseButtonFlags := Uint32.
	SDL_MouseDeviceEvent := S3SDL_MouseDeviceEvent.
	SDL_MouseID := Uint32.
	SDL_MouseMotionEvent := S3SDL_MouseMotionEvent.
	SDL_MouseWheelDirection := S3SDL_MouseWheelDirection.
	SDL_MouseWheelEvent := S3SDL_MouseWheelEvent.
	SDL_Mutex := S3SDL_Mutex.
	SDL_NSTimerCallback := FFICallback.
	SDL_PackedLayout := S3SDL_PackedLayout.
	SDL_PackedOrder := S3SDL_PackedOrder.
	SDL_Palette := S3SDL_Palette.
	SDL_PathInfo := S3SDL_PathInfo.
	SDL_PathType := S3SDL_PathType.
	SDL_PenAxis := S3SDL_PenAxis.
	SDL_PenAxisEvent := S3SDL_PenAxisEvent.
	SDL_PenButtonEvent := S3SDL_PenButtonEvent.
	SDL_PenID := Uint32.
	SDL_PenInputFlags := Uint32.
	SDL_PenMotionEvent := S3SDL_PenMotionEvent.
	SDL_PenProximityEvent := S3SDL_PenProximityEvent.
	SDL_PenTouchEvent := S3SDL_PenTouchEvent.
	SDL_PixelFormat := S3SDL_PixelFormat.
	SDL_PixelFormatDetails := S3SDL_PixelFormatDetails.
	SDL_PixelType := S3SDL_PixelType.
	SDL_Point := S3SDL_Point.
	SDL_PowerState := S3SDL_PowerState.
	SDL_PropertiesID := Uint32.
	SDL_PropertyType := S3SDL_PropertyType.
	SDL_QuitEvent := S3SDL_QuitEvent.
	SDL_RWLock := S3SDL_RWLock.
	SDL_Rect := S3SDL_Rect.
	SDL_RenderEvent := S3SDL_RenderEvent.
	SDL_Renderer := S3SDL_Renderer.
	SDL_RendererLogicalPresentation := S3SDL_RendererLogicalPresentation.
	SDL_ScaleMode := S3SDL_ScaleMode.
	SDL_Scancode := S3SDL_Scancode.
	SDL_Semaphore := S3SDL_Semaphore.
	SDL_Sensor := S3SDL_Sensor.
	SDL_SensorEvent := S3SDL_SensorEvent.
	SDL_SensorID := Uint32.
	SDL_SensorType := S3SDL_SensorType.
	SDL_SpinLock := #int.
	SDL_Surface := S3SDL_Surface.
	SDL_SurfaceFlags := Uint32.
	SDL_SystemCursor := S3SDL_SystemCursor.
	SDL_SystemTheme := S3SDL_SystemTheme.
	SDL_TLSDestructorCallback := FFICallback.
	SDL_TLSID := S3SDL_AtomicInt.
	SDL_TextEditingCandidatesEvent := S3SDL_TextEditingCandidatesEvent.
	SDL_TextEditingEvent := S3SDL_TextEditingEvent.
	SDL_TextInputEvent := S3SDL_TextInputEvent.
	SDL_TextInputType := S3SDL_TextInputType.
	SDL_Texture := S3SDL_Texture.
	SDL_TextureAccess := S3SDL_TextureAccess.
	SDL_Thread := S3SDL_Thread.
	SDL_ThreadFunction := FFICallback.
	SDL_ThreadID := Uint64.
	SDL_ThreadPriority := S3SDL_ThreadPriority.
	SDL_ThreadState := S3SDL_ThreadState.
	SDL_Time := Sint64.
	SDL_TimeFormat := S3SDL_TimeFormat.
	SDL_TimerCallback := FFICallback.
	SDL_TimerID := Uint32.
	SDL_TouchDeviceType := S3SDL_TouchDeviceType.
	SDL_TouchFingerEvent := S3SDL_TouchFingerEvent.
	SDL_TouchID := Uint64.
	SDL_TransferCharacteristics := S3SDL_TransferCharacteristics.
	SDL_UserEvent := S3SDL_UserEvent.
	SDL_Vertex := S3SDL_Vertex.
	SDL_VirtualJoystickDesc := S3SDL_VirtualJoystickDesc.
	SDL_VirtualJoystickSensorDesc := S3SDL_VirtualJoystickSensorDesc.
	SDL_VirtualJoystickTouchpadDesc := S3SDL_VirtualJoystickTouchpadDesc.
	SDL_Window := S3SDL_Window.
	SDL_WindowEvent := S3SDL_WindowEvent.
	SDL_WindowFlags := Uint64.
	SDL_WindowID := Uint32.
	SDL_alignment_test := S3SDL_alignment_test.
	SDL_calloc_func := FFICallback.
	SDL_free_func := FFICallback.
	SDL_iconv_data_t := S3SDL_iconv_data_t.
	SDL_iconv_t := #'SDL_iconv_data_t* *'.
	SDL_malloc_func := FFICallback.
	SDL_realloc_func := FFICallback.
	Sint16 := int16_t.
	Sint32 := int32_t.
	Sint64 := int64_t.
	Sint8 := int8_t.
	Uint16 := uint16_t.
	Uint16_2 := FFIArray ofType: Uint16 size: 2.
	Uint16_3 := FFIArray ofType: Uint16 size: 3.
	Uint32 := uint32_t.
	Uint64 := uint64_t.
	Uint8 := uint8_t.
	Uint8_128 := FFIArray ofType: Uint8 size: 128.
	Uint8_16 := FFIArray ofType: Uint8 size: 16.
	Uint8_2 := FFIArray ofType: Uint8 size: 2.
	__blkcnt64_t := #long.
	__blkcnt_t := #long.
	__blksize_t := #long.
	__caddr_t := #'char *'.
	__clock_t := #long.
	__clockid_t := #int.
	__daddr_t := #int.
	__dev_t := #ulong.
	__fsblkcnt64_t := #ulong.
	__fsblkcnt_t := #ulong.
	__fsfilcnt64_t := #ulong.
	__fsfilcnt_t := #ulong.
	__fsword_t := #long.
	__gid_t := #uint.
	__id_t := #uint.
	__ino64_t := #ulong.
	__ino_t := #ulong.
	__int16_t := #short.
	__int32_t := #int.
	__int64_t := #long.
	__int8_t := #char.
	__int_least16_t := __int16_t.
	__int_least32_t := __int32_t.
	__int_least64_t := __int64_t.
	__int_least8_t := __int8_t.
	__intmax_t := #long.
	__intptr_t := #long.
	__key_t := #int.
	__loff_t := __off64_t.
	__mode_t := #uint.
	__nlink_t := #ulong.
	__off64_t := #long.
	__off_t := #long.
	__pid_t := #int.
	__quad_t := #long.
	__rlim64_t := #ulong.
	__rlim_t := #ulong.
	__sig_atomic_t := #int.
	__socklen_t := #uint.
	__ssize_t := #long.
	__suseconds64_t := #long.
	__suseconds_t := #long.
	__syscall_slong_t := #long.
	__syscall_ulong_t := #ulong.
	__time_t := #long.
	__timer_t := #'void *'.
	__u_char := #uchar.
	__u_int := #uint.
	__u_long := #ulong.
	__u_quad_t := #ulong.
	__u_short := #ushort.
	__uid_t := #uint.
	__uint16_t := #ushort.
	__uint32_t := #uint.
	__uint64_t := #ulong.
	__uint8_t := #uchar.
	__uint_least16_t := __uint16_t.
	__uint_least32_t := __uint32_t.
	__uint_least64_t := __uint64_t.
	__uint_least8_t := __uint8_t.
	__uintmax_t := #ulong.
	__useconds_t := #uint.
	float_3 := FFIArray ofType: 'float' size: 3.
	float_6 := FFIArray ofType: 'float' size: 6.
	int16_t := __int16_t.
	int32_t := __int32_t.
	int64_t := __int64_t.
	int8_t := __int8_t.
	int_fast16_t := #long.
	int_fast32_t := #long.
	int_fast64_t := #long.
	int_fast8_t := #char.
	int_least16_t := __int_least16_t.
	int_least32_t := __int_least32_t.
	int_least64_t := __int_least64_t.
	int_least8_t := __int_least8_t.
	intmax_t := __intmax_t.
	intptr_t := #long.
	uint16_t := __uint16_t.
	uint32_t := __uint32_t.
	uint64_t := __uint64_t.
	uint8_t := __uint8_t.
	uint_fast16_t := #ulong.
	uint_fast32_t := #ulong.
	uint_fast64_t := #ulong.
	uint_fast8_t := #uchar.
	uint_least16_t := __uint_least16_t.
	uint_least32_t := __uint_least32_t.
	uint_least64_t := __uint_least64_t.
	uint_least8_t := __uint_least8_t.
	uintmax_t := __uintmax_t.
	uintptr_t := #ulong
]
