Class {
	#name : 'SDL3Typedef',
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
		'SDL_AsyncIO',
		'SDL_AsyncIOOutcome',
		'SDL_AsyncIOQueue',
		'SDL_AsyncIOResult',
		'SDL_AsyncIOTaskType',
		'SDL_AtomicInt',
		'SDL_AtomicU32',
		'SDL_AudioDeviceEvent',
		'SDL_AudioDeviceID',
		'SDL_AudioFormat',
		'SDL_AudioPostmixCallback',
		'SDL_AudioSpec',
		'SDL_AudioStream',
		'SDL_AudioStreamCallback',
		'SDL_AudioStreamDataCompleteCallback',
		'SDL_BitmapOrder',
		'SDL_BlendFactor',
		'SDL_BlendMode',
		'SDL_BlendOperation',
		'SDL_Camera',
		'SDL_CameraDeviceEvent',
		'SDL_CameraID',
		'SDL_CameraPermissionState',
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
		'SDL_CursorFrameInfo',
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
		'SDL_GPURenderState',
		'SDL_GPURenderStateCreateInfo',
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
		'SDL_GPUVulkanOptions',
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
		'SDL_Locale',
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
		'SDL_MouseMotionTransformCallback',
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
		'SDL_PenDeviceType',
		'SDL_PenID',
		'SDL_PenInputFlags',
		'SDL_PenMotionEvent',
		'SDL_PenProximityEvent',
		'SDL_PenTouchEvent',
		'SDL_PinchFingerEvent',
		'SDL_PixelFormat',
		'SDL_PixelFormatDetails',
		'SDL_PixelType',
		'SDL_Point',
		'SDL_PowerState',
		'SDL_ProgressState',
		'SDL_PropertiesID',
		'SDL_PropertyType',
		'SDL_QuitEvent',
		'SDL_RWLock',
		'SDL_Rect',
		'SDL_RenderEvent',
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
		'SDL_TextureAddressMode',
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
		'SDL_Tray',
		'SDL_TrayCallback',
		'SDL_TrayEntry',
		'SDL_TrayEntryFlags',
		'SDL_TrayMenu',
		'SDL_UserEvent',
		'SDL_Vertex',
		'SDL_VirtualJoystickDesc',
		'SDL_VirtualJoystickSensorDesc',
		'SDL_VirtualJoystickTouchpadDesc',
		'SDL_Window',
		'SDL_WindowEvent',
		'SDL_WindowFlags',
		'SDL_WindowID',
		'SDL_X11EventHook',
		'SDL_alignment_test',
		'SDL_calloc_func',
		'SDL_endian0',
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
		'XEvent',
		'_XEvent',
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
		'int_2',
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
		'types0',
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
SDL3Typedef class >> initialize [

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
	__intmax_t := #long.
	__intptr_t := #long.
	__key_t := #int.
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
	__uintmax_t := #ulong.
	__useconds_t := #uint.
	int_fast16_t := #long.
	int_fast32_t := #long.
	int_fast64_t := #long.
	int_fast8_t := #char.
	intptr_t := #long.
	uint_fast16_t := #ulong.
	uint_fast32_t := #ulong.
	uint_fast64_t := #ulong.
	uint_fast8_t := #uchar.
	uintptr_t := #ulong.

	__int_least16_t := __int16_t.
	__int_least32_t := __int32_t.
	__int_least64_t := __int64_t.
	__int_least8_t := __int8_t.
	__loff_t := __off64_t.
	__uint_least16_t := __uint16_t.
	__uint_least32_t := __uint32_t.
	__uint_least64_t := __uint64_t.
	__uint_least8_t := __uint8_t.
	int16_t := __int16_t.
	int32_t := __int32_t.
	int64_t := __int64_t.
	int8_t := __int8_t.
	int_least16_t := __int_least16_t.
	int_least32_t := __int_least32_t.
	int_least64_t := __int_least64_t.
	int_least8_t := __int_least8_t.
	intmax_t := __intmax_t.
	uint16_t := __uint16_t.
	uint32_t := __uint32_t.
	uint64_t := __uint64_t.
	uint8_t := __uint8_t.
	uint_least16_t := __uint_least16_t.
	uint_least32_t := __uint_least32_t.
	uint_least64_t := __uint_least64_t.
	uint_least8_t := __uint_least8_t.
	uintmax_t := __uintmax_t.
	Sint16 := int16_t.
	Sint32 := int32_t.
	Sint64 := int64_t.
	Sint8 := int8_t.
	Uint16 := uint16_t.
	Uint32 := uint32_t.
	Uint64 := uint64_t.
	Uint8 := uint8_t.

	int_2 := FFIArray ofType: 'int' size: 2.
	float_3 := FFIArray ofType: 'float' size: 3.
	float_6 := FFIArray ofType: 'float' size: 6.
	Uint16_2 := FFIArray ofType: Uint16 size: 2.
	Uint16_3 := FFIArray ofType: Uint16 size: 3.
	Uint8_2 := FFIArray ofType: Uint8 size: 2.
	Uint8_16 := FFIArray ofType: Uint8 size: 16.
	Uint8_128 := FFIArray ofType: Uint8 size: 128.

	SDL_AppEvent_func := FFICallback.
	SDL_AppInit_func := FFICallback.
	SDL_AppIterate_func := FFICallback.
	SDL_AppQuit_func := FFICallback.
	SDL_AppResult := SDL3AppResult.
	SDL_ArrayOrder := SDL3ArrayOrder.
	SDL_AssertData := SDL3AssertData.
	SDL_AssertState := SDL3AssertState.
	SDL_AssertionHandler := FFICallback.
	SDL_AsyncIO := SDL3AsyncIO.
	SDL_AsyncIOOutcome := SDL3AsyncIOOutcome.
	SDL_AsyncIOQueue := SDL3AsyncIOQueue.
	SDL_AsyncIOResult := SDL3AsyncIOResult.
	SDL_AsyncIOTaskType := SDL3AsyncIOTaskType.
	SDL_AtomicInt := SDL3AtomicInt.
	SDL_AtomicU32 := SDL3AtomicU32.
	SDL_AudioDeviceEvent := SDL3AudioDeviceEvent.
	SDL_AudioDeviceID := Uint32.
	SDL_AudioFormat := SDL3AudioFormat.
	SDL_AudioPostmixCallback := FFICallback.
	SDL_AudioSpec := SDL3AudioSpec.
	SDL_AudioStream := SDL3AudioStream.
	SDL_AudioStreamCallback := FFICallback.
	SDL_AudioStreamDataCompleteCallback := FFICallback.
	SDL_BitmapOrder := SDL3BitmapOrder.
	SDL_BlendFactor := SDL3BlendFactor.
	SDL_BlendMode := Uint32.
	SDL_BlendOperation := SDL3BlendOperation.
	SDL_Camera := SDL3Camera.
	SDL_CameraDeviceEvent := SDL3CameraDeviceEvent.
	SDL_CameraID := Uint32.
	SDL_CameraPermissionState := SDL3CameraPermissionState.
	SDL_CameraPosition := SDL3CameraPosition.
	SDL_CameraSpec := SDL3CameraSpec.
	SDL_Capitalization := SDL3Capitalization.
	SDL_ChromaLocation := SDL3ChromaLocation.
	SDL_CleanupPropertyCallback := FFICallback.
	SDL_ClipboardCleanupCallback := FFICallback.
	SDL_ClipboardDataCallback := FFICallback.
	SDL_ClipboardEvent := SDL3ClipboardEvent.
	SDL_Color := SDL3Color.
	SDL_ColorPrimaries := SDL3ColorPrimaries.
	SDL_ColorRange := SDL3ColorRange.
	SDL_ColorType := SDL3ColorType.
	SDL_Colorspace := SDL3Colorspace.
	SDL_CommonEvent := SDL3CommonEvent.
	SDL_CompareCallback := FFICallback.
	SDL_CompareCallback_r := FFICallback.
	SDL_Condition := SDL3Condition.
	SDL_Cursor := SDL3Cursor.
	SDL_CursorFrameInfo := SDL3CursorFrameInfo.
	SDL_DateFormat := SDL3DateFormat.
	SDL_DateTime := SDL3DateTime.
	SDL_DialogFileCallback := FFICallback.
	SDL_DialogFileFilter := SDL3DialogFileFilter.
	SDL_DisplayEvent := SDL3DisplayEvent.
	SDL_DisplayID := Uint32.
	SDL_DisplayMode := SDL3DisplayMode.
	SDL_DisplayModeData := SDL3DisplayModeData.
	SDL_DisplayOrientation := SDL3DisplayOrientation.
	SDL_DropEvent := SDL3DropEvent.
	SDL_EGLAttrib := intptr_t.
	SDL_EGLAttribArrayCallback := FFICallback.
	SDL_EGLConfig := #'void *'.
	SDL_EGLDisplay := #'void *'.
	SDL_EGLIntArrayCallback := FFICallback.
	SDL_EGLSurface := #'void *'.
	SDL_EGLint := #int.
	SDL_EnumerateDirectoryCallback := FFICallback.
	SDL_EnumeratePropertiesCallback := FFICallback.
	SDL_EnumerationResult := SDL3EnumerationResult.
	SDL_Environment := SDL3Environment.
	SDL_Event := SDL3Event.
	SDL_EventAction := SDL3EventAction.
	SDL_EventFilter := FFICallback.
	SDL_EventType := SDL3EventType.
	SDL_FColor := SDL3FColor.
	SDL_FPoint := SDL3FPoint.
	SDL_FRect := SDL3FRect.
	SDL_FileDialogType := SDL3FileDialogType.
	SDL_Finger := SDL3Finger.
	SDL_FingerID := Uint64.
	SDL_FlashOperation := SDL3FlashOperation.
	SDL_FlipMode := SDL3FlipMode.
	SDL_Folder := SDL3Folder.
	SDL_FunctionPointer := FFICallback.
	SDL_GLAttr := SDL3GLAttr.
	SDL_GLContext := #'SDL_GLContextState* *'.
	SDL_GLContextFlag := Uint32.
	SDL_GLContextReleaseFlag := Uint32.
	SDL_GLContextResetNotification := Uint32.
	SDL_GLContextState := SDL3GLContextState.
	SDL_GLProfile := Uint32.
	SDL_GPUBlendFactor := SDL3GPUBlendFactor.
	SDL_GPUBlendOp := SDL3GPUBlendOp.
	SDL_GPUBlitInfo := SDL3GPUBlitInfo.
	SDL_GPUBlitRegion := SDL3GPUBlitRegion.
	SDL_GPUBuffer := SDL3GPUBuffer.
	SDL_GPUBufferBinding := SDL3GPUBufferBinding.
	SDL_GPUBufferCreateInfo := SDL3GPUBufferCreateInfo.
	SDL_GPUBufferLocation := SDL3GPUBufferLocation.
	SDL_GPUBufferRegion := SDL3GPUBufferRegion.
	SDL_GPUBufferUsageFlags := Uint32.
	SDL_GPUColorComponentFlags := Uint8.
	SDL_GPUColorTargetBlendState := SDL3GPUColorTargetBlendState.
	SDL_GPUColorTargetDescription := SDL3GPUColorTargetDescription.
	SDL_GPUColorTargetInfo := SDL3GPUColorTargetInfo.
	SDL_GPUCommandBuffer := SDL3GPUCommandBuffer.
	SDL_GPUCompareOp := SDL3GPUCompareOp.
	SDL_GPUComputePass := SDL3GPUComputePass.
	SDL_GPUComputePipeline := SDL3GPUComputePipeline.
	SDL_GPUComputePipelineCreateInfo := SDL3GPUComputePipelineCreateInfo.
	SDL_GPUCopyPass := SDL3GPUCopyPass.
	SDL_GPUCubeMapFace := SDL3GPUCubeMapFace.
	SDL_GPUCullMode := SDL3GPUCullMode.
	SDL_GPUDepthStencilState := SDL3GPUDepthStencilState.
	SDL_GPUDepthStencilTargetInfo := SDL3GPUDepthStencilTargetInfo.
	SDL_GPUDevice := SDL3GPUDevice.
	SDL_GPUFence := SDL3GPUFence.
	SDL_GPUFillMode := SDL3GPUFillMode.
	SDL_GPUFilter := SDL3GPUFilter.
	SDL_GPUFrontFace := SDL3GPUFrontFace.
	SDL_GPUGraphicsPipeline := SDL3GPUGraphicsPipeline.
	SDL_GPUGraphicsPipelineCreateInfo := SDL3GPUGraphicsPipelineCreateInfo.
	SDL_GPUGraphicsPipelineTargetInfo := SDL3GPUGraphicsPipelineTargetInfo.
	SDL_GPUIndexElementSize := SDL3GPUIndexElementSize.
	SDL_GPUIndexedIndirectDrawCommand := SDL3GPUIndexedIndirectDrawCommand.
	SDL_GPUIndirectDispatchCommand := SDL3GPUIndirectDispatchCommand.
	SDL_GPUIndirectDrawCommand := SDL3GPUIndirectDrawCommand.
	SDL_GPULoadOp := SDL3GPULoadOp.
	SDL_GPUMultisampleState := SDL3GPUMultisampleState.
	SDL_GPUPresentMode := SDL3GPUPresentMode.
	SDL_GPUPrimitiveType := SDL3GPUPrimitiveType.
	SDL_GPURasterizerState := SDL3GPURasterizerState.
	SDL_GPURenderPass := SDL3GPURenderPass.
	SDL_GPURenderState := SDL3GPURenderState.
	SDL_GPURenderStateCreateInfo := SDL3GPURenderStateCreateInfo.
	SDL_GPUSampleCount := SDL3GPUSampleCount.
	SDL_GPUSampler := SDL3GPUSampler.
	SDL_GPUSamplerAddressMode := SDL3GPUSamplerAddressMode.
	SDL_GPUSamplerCreateInfo := SDL3GPUSamplerCreateInfo.
	SDL_GPUSamplerMipmapMode := SDL3GPUSamplerMipmapMode.
	SDL_GPUShader := SDL3GPUShader.
	SDL_GPUShaderCreateInfo := SDL3GPUShaderCreateInfo.
	SDL_GPUShaderFormat := Uint32.
	SDL_GPUShaderStage := SDL3GPUShaderStage.
	SDL_GPUStencilOp := SDL3GPUStencilOp.
	SDL_GPUStencilOpState := SDL3GPUStencilOpState.
	SDL_GPUStorageBufferReadWriteBinding := SDL3GPUStorageBufferReadWriteBinding.
	SDL_GPUStorageTextureReadWriteBinding := SDL3GPUStorageTextureReadWriteBinding.
	SDL_GPUStoreOp := SDL3GPUStoreOp.
	SDL_GPUSwapchainComposition := SDL3GPUSwapchainComposition.
	SDL_GPUTexture := SDL3GPUTexture.
	SDL_GPUTextureCreateInfo := SDL3GPUTextureCreateInfo.
	SDL_GPUTextureFormat := SDL3GPUTextureFormat.
	SDL_GPUTextureLocation := SDL3GPUTextureLocation.
	SDL_GPUTextureRegion := SDL3GPUTextureRegion.
	SDL_GPUTextureSamplerBinding := SDL3GPUTextureSamplerBinding.
	SDL_GPUTextureTransferInfo := SDL3GPUTextureTransferInfo.
	SDL_GPUTextureType := SDL3GPUTextureType.
	SDL_GPUTextureUsageFlags := Uint32.
	SDL_GPUTransferBuffer := SDL3GPUTransferBuffer.
	SDL_GPUTransferBufferCreateInfo := SDL3GPUTransferBufferCreateInfo.
	SDL_GPUTransferBufferLocation := SDL3GPUTransferBufferLocation.
	SDL_GPUTransferBufferUsage := SDL3GPUTransferBufferUsage.
	SDL_GPUVertexAttribute := SDL3GPUVertexAttribute.
	SDL_GPUVertexBufferDescription := SDL3GPUVertexBufferDescription.
	SDL_GPUVertexElementFormat := SDL3GPUVertexElementFormat.
	SDL_GPUVertexInputRate := SDL3GPUVertexInputRate.
	SDL_GPUVertexInputState := SDL3GPUVertexInputState.
	SDL_GPUViewport := SDL3GPUViewport.
	SDL_GUID := SDL3GUID.
	SDL_GamepadAxisEvent := SDL3GamepadAxisEvent.
	SDL_GamepadButtonEvent := SDL3GamepadButtonEvent.
	SDL_GamepadDeviceEvent := SDL3GamepadDeviceEvent.
	SDL_GamepadSensorEvent := SDL3GamepadSensorEvent.
	SDL_GamepadTouchpadEvent := SDL3GamepadTouchpadEvent.
	SDL_GlobFlags := Uint32.
	SDL_HitTest := FFICallback.
	SDL_HitTestResult := SDL3HitTestResult.
	SDL_IOStatus := SDL3IOStatus.
	SDL_IOStream := SDL3IOStream.
	SDL_IOStreamInterface := SDL3IOStreamInterface.
	SDL_IOWhence := SDL3IOWhence.
	SDL_InitFlags := Uint32.
	SDL_InitState := SDL3InitState.
	SDL_InitStatus := SDL3InitStatus.
	SDL_JoyAxisEvent := SDL3JoyAxisEvent.
	SDL_JoyBallEvent := SDL3JoyBallEvent.
	SDL_JoyBatteryEvent := SDL3JoyBatteryEvent.
	SDL_JoyButtonEvent := SDL3JoyButtonEvent.
	SDL_JoyDeviceEvent := SDL3JoyDeviceEvent.
	SDL_JoyHatEvent := SDL3JoyHatEvent.
	SDL_Joystick := SDL3Joystick.
	SDL_JoystickConnectionState := SDL3JoystickConnectionState.
	SDL_JoystickID := Uint32.
	SDL_JoystickType := SDL3JoystickType.
	SDL_KeyboardDeviceEvent := SDL3KeyboardDeviceEvent.
	SDL_KeyboardEvent := SDL3KeyboardEvent.
	SDL_KeyboardID := Uint32.
	SDL_Keycode := Uint32.
	SDL_Keymod := Uint16.
	SDL_Locale := SDL3Locale.
	SDL_MainThreadCallback := FFICallback.
	SDL_MatrixCoefficients := SDL3MatrixCoefficients.
	SDL_MessageBoxButtonData := SDL3MessageBoxButtonData.
	SDL_MessageBoxButtonFlags := Uint32.
	SDL_MessageBoxColor := SDL3MessageBoxColor.
	SDL_MessageBoxColorScheme := SDL3MessageBoxColorScheme.
	SDL_MessageBoxColorType := SDL3MessageBoxColorType.
	SDL_MessageBoxColor_5 := FFIArray ofType: SDL_MessageBoxColor size: 5.
	SDL_MessageBoxData := SDL3MessageBoxData.
	SDL_MessageBoxFlags := Uint32.
	SDL_MouseButtonEvent := SDL3MouseButtonEvent.
	SDL_MouseButtonFlags := Uint32.
	SDL_MouseDeviceEvent := SDL3MouseDeviceEvent.
	SDL_MouseID := Uint32.
	SDL_MouseMotionEvent := SDL3MouseMotionEvent.
	SDL_MouseMotionTransformCallback := FFICallback.
	SDL_MouseWheelDirection := SDL3MouseWheelDirection.
	SDL_MouseWheelEvent := SDL3MouseWheelEvent.
	SDL_Mutex := SDL3Mutex.
	SDL_NSTimerCallback := FFICallback.
	SDL_PackedLayout := SDL3PackedLayout.
	SDL_PackedOrder := SDL3PackedOrder.
	SDL_Palette := SDL3Palette.
	SDL_PathInfo := SDL3PathInfo.
	SDL_PathType := SDL3PathType.
	SDL_PenAxis := SDL3PenAxis.
	SDL_PenAxisEvent := SDL3PenAxisEvent.
	SDL_PenButtonEvent := SDL3PenButtonEvent.
	SDL_PenDeviceType := SDL3PenDeviceType.
	SDL_PenID := Uint32.
	SDL_PenInputFlags := Uint32.
	SDL_PenMotionEvent := SDL3PenMotionEvent.
	SDL_PenProximityEvent := SDL3PenProximityEvent.
	SDL_PenTouchEvent := SDL3PenTouchEvent.
	SDL_PinchFingerEvent := SDL3PinchFingerEvent.
	SDL_PixelFormat := SDL3PixelFormat.
	SDL_PixelFormatDetails := SDL3PixelFormatDetails.
	SDL_PixelType := SDL3PixelType.
	SDL_Point := SDL3Point.
	SDL_PowerState := SDL3PowerState.
	SDL_ProgressState := SDL3ProgressState.
	SDL_PropertiesID := Uint32.
	SDL_PropertyType := SDL3PropertyType.
	SDL_QuitEvent := SDL3QuitEvent.
	SDL_RWLock := SDL3RWLock.
	SDL_Rect := SDL3Rect.
	SDL_RenderEvent := SDL3RenderEvent.
	SDL_Renderer := SDL3Renderer.
	SDL_RendererLogicalPresentation := SDL3RendererLogicalPresentation.
	SDL_Sandbox := SDL3Sandbox.
	SDL_ScaleMode := SDL3ScaleMode.
	SDL_Scancode := SDL3Scancode.
	SDL_Semaphore := SDL3Semaphore.
	SDL_Sensor := SDL3Sensor.
	SDL_SensorEvent := SDL3SensorEvent.
	SDL_SensorID := Uint32.
	SDL_SensorType := SDL3SensorType.
	SDL_SharedObject := SDL3SharedObject.
	SDL_SpinLock := #int.
	SDL_Surface := SDL3Surface.
	SDL_SurfaceFlags := Uint32.
	SDL_SystemCursor := SDL3SystemCursor.
	SDL_SystemTheme := SDL3SystemTheme.
	SDL_TLSDestructorCallback := FFICallback.
	SDL_TLSID := SDL3AtomicInt.
	SDL_TextEditingCandidatesEvent := SDL3TextEditingCandidatesEvent.
	SDL_TextEditingEvent := SDL3TextEditingEvent.
	SDL_TextInputEvent := SDL3TextInputEvent.
	SDL_TextInputType := SDL3TextInputType.
	SDL_Texture := SDL3Texture.
	SDL_TextureAccess := SDL3TextureAccess.
	SDL_TextureAddressMode := SDL3TextureAddressMode.
	SDL_Thread := SDL3Thread.
	SDL_ThreadFunction := FFICallback.
	SDL_ThreadID := Uint64.
	SDL_ThreadPriority := SDL3ThreadPriority.
	SDL_ThreadState := SDL3ThreadState.
	SDL_Time := Sint64.
	SDL_TimeFormat := SDL3TimeFormat.
	SDL_TimerCallback := FFICallback.
	SDL_TimerID := Uint32.
	SDL_TouchDeviceType := SDL3TouchDeviceType.
	SDL_TouchFingerEvent := SDL3TouchFingerEvent.
	SDL_TouchID := Uint64.
	SDL_TransferCharacteristics := SDL3TransferCharacteristics.
	SDL_Tray := SDL3Tray.
	SDL_TrayCallback := FFICallback.
	SDL_TrayEntry := SDL3TrayEntry.
	SDL_TrayEntryFlags := Uint32.
	SDL_TrayMenu := SDL3TrayMenu.
	SDL_UserEvent := SDL3UserEvent.
	SDL_Vertex := SDL3Vertex.
	SDL_VirtualJoystickDesc := SDL3VirtualJoystickDesc.
	SDL_VirtualJoystickSensorDesc := SDL3VirtualJoystickSensorDesc.
	SDL_VirtualJoystickTouchpadDesc := SDL3VirtualJoystickTouchpadDesc.
	SDL_Window := SDL3Window.
	SDL_WindowEvent := SDL3WindowEvent.
	SDL_WindowFlags := Uint64.
	SDL_WindowID := Uint32.
	SDL_X11EventHook := FFICallback.
	SDL_calloc_func := FFICallback.
	SDL_free_func := FFICallback.
	SDL_iconv_data_t := SDL3IconvDataT.
	SDL_iconv_t := #'SDL_iconv_data_t* *'.
	SDL_malloc_func := FFICallback.
	SDL_realloc_func := FFICallback.
	XEvent := SDL3XEvent.
	_XEvent := SDL3XEvent
]
