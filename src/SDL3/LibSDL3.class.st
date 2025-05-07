Class {
	#name : 'LibSDL3',
	#superclass : 'FFILibrary',
	#pools : [
		'SDL3Typedef'
	],
	#category : 'SDL3-Library',
	#package : 'SDL3',
	#tag : 'Library'
}

{ #category : 'public' }
LibSDL3 >> abs: x [
	"/**
	 * Compute the absolute value of `x`.
	 *
	 * \param x an integer value.
	 * \returns the absolute value of x.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(int SDL_abs(int x))
]

{ #category : 'public' }
LibSDL3 >> acos: x [
	"/**
	 * Compute the arc cosine of `x`.
	 *
	 * The definition of `y = acos(x)` is `x = cos(y)`.
	 *
	 * Domain: `-1 <= x <= 1`
	 *
	 * Range: `0 <= y <= Pi`
	 *
	 * This function operates on double-precision floating point values, use
	 * SDL_acosf for single-precision floats.
	 *
	 * This function may use a different approximation across different versions,
	 * platforms and configurations. i.e, it can return a different value given
	 * the same input on different machines or operating systems, or if SDL is
	 * updated.
	 *
	 * \param x floating point value.
	 * \returns arc cosine of `x`, in radians.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_acosf
	 * \sa SDL_asin
	 * \sa SDL_cos
	 */"

	^ self ffiCall: #(double SDL_acos(double x))
]

{ #category : 'public' }
LibSDL3 >> acosf: x [
	"/**
	 * Compute the arc cosine of `x`.
	 *
	 * The definition of `y = acos(x)` is `x = cos(y)`.
	 *
	 * Domain: `-1 <= x <= 1`
	 *
	 * Range: `0 <= y <= Pi`
	 *
	 * This function operates on single-precision floating point values, use
	 * SDL_acos for double-precision floats.
	 *
	 * This function may use a different approximation across different versions,
	 * platforms and configurations. i.e, it can return a different value given
	 * the same input on different machines or operating systems, or if SDL is
	 * updated.
	 *
	 * \param x floating point value.
	 * \returns arc cosine of `x`, in radians.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_acos
	 * \sa SDL_asinf
	 * \sa SDL_cosf
	 */"

	^ self ffiCall: #(float SDL_acosf(float x))
]

{ #category : 'public' }
LibSDL3 >> acquireCameraFrameCamera: camera timestampNS: timestampNS [
	"/**
	 * Acquire a frame.
	 *
	 * The frame is a memory pointer to the image data, whose size and format are
	 * given by the spec requested when opening the device.
	 *
	 * This is a non blocking API. If there is a frame available, a non-NULL
	 * surface is returned, and timestampNS will be filled with a non-zero value.
	 *
	 * Note that an error case can also return NULL, but a NULL by itself is
	 * normal and just signifies that a new frame is not yet available. Note that
	 * even if a camera device fails outright (a USB camera is unplugged while in
	 * use, etc), SDL will send an event separately to notify the app, but
	 * continue to provide blank frames at ongoing intervals until
	 * SDL_CloseCamera() is called, so real failure here is almost always an out
	 * of memory condition.
	 *
	 * After use, the frame should be released with SDL_ReleaseCameraFrame(). If
	 * you don't do this, the system may stop providing more video!
	 *
	 * Do not call SDL_DestroySurface() on the returned surface! It must be given
	 * back to the camera subsystem with SDL_ReleaseCameraFrame!
	 *
	 * If the system is waiting for the user to approve access to the camera, as
	 * some platforms require, this will return NULL (no frames available); you
	 * should either wait for an SDL_EVENT_CAMERA_DEVICE_APPROVED (or
	 * SDL_EVENT_CAMERA_DEVICE_DENIED) event, or poll
	 * SDL_GetCameraPermissionState() occasionally until it returns non-zero.
	 *
	 * \param camera opened camera device.
	 * \param timestampNS a pointer filled in with the frame's timestamp, or 0 on
	 *                    error. Can be NULL.
	 * \returns a new frame of video on success, NULL if none is currently
	 *          available.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_ReleaseCameraFrame
	 */"

	^ self ffiCall: #(SDL_Surface* SDL_AcquireCameraFrame(SDL_Camera* camera, Uint64* timestampNS))
]

{ #category : 'public' }
LibSDL3 >> acquireGPUCommandBuffer: device [
	"/**
	 * Acquire a command buffer.
	 *
	 * This command buffer is managed by the implementation and should not be
	 * freed by the user. The command buffer may only be used on the thread it was
	 * acquired on. The command buffer should be submitted on the thread it was
	 * acquired on.
	 *
	 * It is valid to acquire multiple command buffers on the same thread at once.
	 * In fact a common design pattern is to acquire two command buffers per frame
	 * where one is dedicated to render and compute passes and the other is
	 * dedicated to copy passes and other preparatory work such as generating
	 * mipmaps. Interleaving commands between the two command buffers reduces the
	 * total amount of passes overall which improves rendering performance.
	 *
	 * \param device a GPU context.
	 * \returns a command buffer, or NULL on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SubmitGPUCommandBuffer
	 * \sa SDL_SubmitGPUCommandBufferAndAcquireFence
	 */"

	^ self ffiCall: #(SDL_GPUCommandBuffer* SDL_AcquireGPUCommandBuffer(SDL_GPUDevice* device))
]

{ #category : 'public' }
LibSDL3 >> acquireGPUSwapchainTextureCommandBuffer: command_buffer window: window swapchainTexture: swapchain_texture swapchainTextureWidth: swapchain_texture_width swapchainTextureHeight: swapchain_texture_height [
	"/**
	 * Acquire a texture to use in presentation.
	 *
	 * When a swapchain texture is acquired on a command buffer, it will
	 * automatically be submitted for presentation when the command buffer is
	 * submitted. The swapchain texture should only be referenced by the command
	 * buffer used to acquire it.
	 *
	 * This function will fill the swapchain texture handle with NULL if too many
	 * frames are in flight. This is not an error.
	 *
	 * If you use this function, it is possible to create a situation where many
	 * command buffers are allocated while the rendering context waits for the GPU
	 * to catch up, which will cause memory usage to grow. You should use
	 * SDL_WaitAndAcquireGPUSwapchainTexture() unless you know what you are doing
	 * with timing.
	 *
	 * The swapchain texture is managed by the implementation and must not be
	 * freed by the user. You MUST NOT call this function from any thread other
	 * than the one that created the window.
	 *
	 * \param command_buffer a command buffer.
	 * \param window a window that has been claimed.
	 * \param swapchain_texture a pointer filled in with a swapchain texture
	 *                          handle.
	 * \param swapchain_texture_width a pointer filled in with the swapchain
	 *                                texture width, may be NULL.
	 * \param swapchain_texture_height a pointer filled in with the swapchain
	 *                                 texture height, may be NULL.
	 * \returns true on success, false on error; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called from the thread that
	 *               created the window.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_ClaimWindowForGPUDevice
	 * \sa SDL_SubmitGPUCommandBuffer
	 * \sa SDL_SubmitGPUCommandBufferAndAcquireFence
	 * \sa SDL_CancelGPUCommandBuffer
	 * \sa SDL_GetWindowSizeInPixels
	 * \sa SDL_WaitForGPUSwapchain
	 * \sa SDL_WaitAndAcquireGPUSwapchainTexture
	 * \sa SDL_SetGPUAllowedFramesInFlight
	 */"

	^ self ffiCall: #(bool SDL_AcquireGPUSwapchainTexture(SDL_GPUCommandBuffer* command_buffer, SDL_Window* window, SDL_GPUTexture* swapchain_texture, Uint32* swapchain_texture_width, Uint32* swapchain_texture_height))
]

{ #category : 'public' }
LibSDL3 >> addAtomicIntA: a v: v [
	"/**
	 * Add to an atomic variable.
	 *
	 * This function also acts as a full memory barrier.
	 *
	 * ***Note: If you don't know what this function is for, you shouldn't use
	 * it!***
	 *
	 * \param a a pointer to an SDL_AtomicInt variable to be modified.
	 * \param v the desired value to add.
	 * \returns the previous value of the atomic variable.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_AtomicDecRef
	 * \sa SDL_AtomicIncRef
	 */"

	^ self ffiCall: #(int SDL_AddAtomicInt(SDL_AtomicInt* a, int v))
]

{ #category : 'public' }
LibSDL3 >> addEventWatchFilter: filter userdata: userdata [
	"/**
	 * Add a callback to be triggered when an event is added to the event queue.
	 *
	 * `filter` will be called when an event happens, and its return value is
	 * ignored.
	 *
	 * **WARNING**: Be very careful of what you do in the event filter function,
	 * as it may run in a different thread!
	 *
	 * If the quit event is generated by a signal (e.g. SIGINT), it will bypass
	 * the internal queue and be delivered to the watch callback immediately, and
	 * arrive at the next event poll.
	 *
	 * Note: the callback is called for events posted by the user through
	 * SDL_PushEvent(), but not for disabled events, nor for events by a filter
	 * callback set with SDL_SetEventFilter(), nor for events posted by the user
	 * through SDL_PeepEvents().
	 *
	 * \param filter an SDL_EventFilter function to call when an event happens.
	 * \param userdata a pointer that is passed to `filter`.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_RemoveEventWatch
	 * \sa SDL_SetEventFilter
	 */"

	^ self ffiCall: #(bool SDL_AddEventWatch(SDL_EventFilter filter, void* userdata))
]

{ #category : 'public' }
LibSDL3 >> addSurfaceAlternateImageSurface: surface image: image [
	"/**
	 * Add an alternate version of a surface.
	 *
	 * This function adds an alternate version of this surface, usually used for
	 * content with high DPI representations like cursors or icons. The size,
	 * format, and content do not need to match the original surface, and these
	 * alternate versions will not be updated when the original surface changes.
	 *
	 * This function adds a reference to the alternate version, so you should call
	 * SDL_DestroySurface() on the image after this call.
	 *
	 * \param surface the SDL_Surface structure to update.
	 * \param image a pointer to an alternate SDL_Surface to associate with this
	 *              surface.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_RemoveSurfaceAlternateImages
	 * \sa SDL_GetSurfaceImages
	 * \sa SDL_SurfaceHasAlternateImages
	 */"

	^ self ffiCall: #(bool SDL_AddSurfaceAlternateImage(SDL_Surface* surface, SDL_Surface* image))
]

{ #category : 'public' }
LibSDL3 >> addTimerInterval: interval callback: callback userdata: userdata [
	"/**
	 * Call a callback function at a future time.
	 *
	 * The callback function is passed the current timer interval and the user
	 * supplied parameter from the SDL_AddTimer() call and should return the next
	 * timer interval. If the value returned from the callback is 0, the timer is
	 * canceled and will be removed.
	 *
	 * The callback is run on a separate thread, and for short timeouts can
	 * potentially be called before this function returns.
	 *
	 * Timers take into account the amount of time it took to execute the
	 * callback. For example, if the callback took 250 ms to execute and returned
	 * 1000 (ms), the timer would only wait another 750 ms before its next
	 * iteration.
	 *
	 * Timing may be inexact due to OS scheduling. Be sure to note the current
	 * time with SDL_GetTicksNS() or SDL_GetPerformanceCounter() in case your
	 * callback needs to adjust for variances.
	 *
	 * \param interval the timer delay, in milliseconds, passed to `callback`.
	 * \param callback the SDL_TimerCallback function to call when the specified
	 *                 `interval` elapses.
	 * \param userdata a pointer that is passed to `callback`.
	 * \returns a timer ID or 0 on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_AddTimerNS
	 * \sa SDL_RemoveTimer
	 */"

	^ self ffiCall: #(SDL_TimerID SDL_AddTimer(Uint32 interval, SDL_TimerCallback callback, void* userdata))
]

{ #category : 'public' }
LibSDL3 >> addTimerNSInterval: interval callback: callback userdata: userdata [
	"/**
	 * Call a callback function at a future time.
	 *
	 * The callback function is passed the current timer interval and the user
	 * supplied parameter from the SDL_AddTimerNS() call and should return the
	 * next timer interval. If the value returned from the callback is 0, the
	 * timer is canceled and will be removed.
	 *
	 * The callback is run on a separate thread, and for short timeouts can
	 * potentially be called before this function returns.
	 *
	 * Timers take into account the amount of time it took to execute the
	 * callback. For example, if the callback took 250 ns to execute and returned
	 * 1000 (ns), the timer would only wait another 750 ns before its next
	 * iteration.
	 *
	 * Timing may be inexact due to OS scheduling. Be sure to note the current
	 * time with SDL_GetTicksNS() or SDL_GetPerformanceCounter() in case your
	 * callback needs to adjust for variances.
	 *
	 * \param interval the timer delay, in nanoseconds, passed to `callback`.
	 * \param callback the SDL_TimerCallback function to call when the specified
	 *                 `interval` elapses.
	 * \param userdata a pointer that is passed to `callback`.
	 * \returns a timer ID or 0 on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_AddTimer
	 * \sa SDL_RemoveTimer
	 */"

	^ self ffiCall: #(SDL_TimerID SDL_AddTimerNS(Uint64 interval, SDL_NSTimerCallback callback, void* userdata))
]

{ #category : 'public' }
LibSDL3 >> addVulkanRenderSemaphoresRenderer: renderer waitStageMask: wait_stage_mask waitSemaphore: wait_semaphore signalSemaphore: signal_semaphore [
	"/**
	 * Add a set of synchronization semaphores for the current frame.
	 *
	 * The Vulkan renderer will wait for `wait_semaphore` before submitting
	 * rendering commands and signal `signal_semaphore` after rendering commands
	 * are complete for this frame.
	 *
	 * This should be called each frame that you want semaphore synchronization.
	 * The Vulkan renderer may have multiple frames in flight on the GPU, so you
	 * should have multiple semaphores that are used for synchronization. Querying
	 * SDL_PROP_RENDERER_VULKAN_SWAPCHAIN_IMAGE_COUNT_NUMBER will give you the
	 * maximum number of semaphores you'll need.
	 *
	 * \param renderer the rendering context.
	 * \param wait_stage_mask the VkPipelineStageFlags for the wait.
	 * \param wait_semaphore a VkSempahore to wait on before rendering the current
	 *                       frame, or 0 if not needed.
	 * \param signal_semaphore a VkSempahore that SDL will signal when rendering
	 *                         for the current frame is complete, or 0 if not
	 *                         needed.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is **NOT** safe to call this function from two threads at
	 *               once.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_AddVulkanRenderSemaphores(SDL_Renderer* renderer, Uint32 wait_stage_mask, Sint64 wait_semaphore, Sint64 signal_semaphore))
]

{ #category : 'public' }
LibSDL3 >> alignedAllocAlignment: alignment size: size [
	"/**
	 * Allocate memory aligned to a specific alignment.
	 *
	 * The memory returned by this function must be freed with SDL_aligned_free(),
	 * _not_ SDL_free().
	 *
	 * If `alignment` is less than the size of `void *`, it will be increased to
	 * match that.
	 *
	 * The returned memory address will be a multiple of the alignment value, and
	 * the size of the memory allocated will be a multiple of the alignment value.
	 *
	 * \param alignment the alignment of the memory.
	 * \param size the size to allocate.
	 * \returns a pointer to the aligned memory, or NULL if allocation failed.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_aligned_free
	 */"

	^ self ffiCall: #(void* SDL_aligned_alloc(size_t alignment, size_t size))
]

{ #category : 'public' }
LibSDL3 >> alignedFree: mem [
	"/**
	 * Free memory allocated by SDL_aligned_alloc().
	 *
	 * The pointer is no longer valid after this call and cannot be dereferenced
	 * anymore.
	 *
	 * If `mem` is NULL, this function does nothing.
	 *
	 * \param mem a pointer previously returned by SDL_aligned_alloc(), or NULL.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_aligned_alloc
	 */"

	self ffiCall: #(void SDL_aligned_free(void* mem))
]

{ #category : 'public' }
LibSDL3 >> asin: x [
	"/**
	 * Compute the arc sine of `x`.
	 *
	 * The definition of `y = asin(x)` is `x = sin(y)`.
	 *
	 * Domain: `-1 <= x <= 1`
	 *
	 * Range: `-Pi/2 <= y <= Pi/2`
	 *
	 * This function operates on double-precision floating point values, use
	 * SDL_asinf for single-precision floats.
	 *
	 * This function may use a different approximation across different versions,
	 * platforms and configurations. i.e, it can return a different value given
	 * the same input on different machines or operating systems, or if SDL is
	 * updated.
	 *
	 * \param x floating point value.
	 * \returns arc sine of `x`, in radians.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_asinf
	 * \sa SDL_acos
	 * \sa SDL_sin
	 */"

	^ self ffiCall: #(double SDL_asin(double x))
]

{ #category : 'public' }
LibSDL3 >> asinf: x [
	"/**
	 * Compute the arc sine of `x`.
	 *
	 * The definition of `y = asin(x)` is `x = sin(y)`.
	 *
	 * Domain: `-1 <= x <= 1`
	 *
	 * Range: `-Pi/2 <= y <= Pi/2`
	 *
	 * This function operates on single-precision floating point values, use
	 * SDL_asin for double-precision floats.
	 *
	 * This function may use a different approximation across different versions,
	 * platforms and configurations. i.e, it can return a different value given
	 * the same input on different machines or operating systems, or if SDL is
	 * updated.
	 *
	 * \param x floating point value.
	 * \returns arc sine of `x`, in radians.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_asin
	 * \sa SDL_acosf
	 * \sa SDL_sinf
	 */"

	^ self ffiCall: #(float SDL_asinf(float x))
]

{ #category : 'public' }
LibSDL3 >> asyncIOFromFile: file mode: mode [
	"/**
	 * Use this function to create a new SDL_AsyncIO object for reading from
	 * and/or writing to a named file.
	 *
	 * The `mode` string understands the following values:
	 *
	 * - ""r"": Open a file for reading only. It must exist.
	 * - ""w"": Open a file for writing only. It will create missing files or
	 *   truncate existing ones.
	 * - ""r+"": Open a file for update both reading and writing. The file must
	 *   exist.
	 * - ""w+"": Create an empty file for both reading and writing. If a file with
	 *   the same name already exists its content is erased and the file is
	 *   treated as a new empty file.
	 *
	 * There is no ""b"" mode, as there is only ""binary"" style I/O, and no ""a"" mode
	 * for appending, since you specify the position when starting a task.
	 *
	 * This function supports Unicode filenames, but they must be encoded in UTF-8
	 * format, regardless of the underlying operating system.
	 *
	 * This call is _not_ asynchronous; it will open the file before returning,
	 * under the assumption that doing so is generally a fast operation. Future
	 * reads and writes to the opened file will be async, however.
	 *
	 * \param file a UTF-8 string representing the filename to open.
	 * \param mode an ASCII string representing the mode to be used for opening
	 *             the file.
	 * \returns a pointer to the SDL_AsyncIO structure that is created or NULL on
	 *          failure; call SDL_GetError() for more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CloseAsyncIO
	 * \sa SDL_ReadAsyncIO
	 * \sa SDL_WriteAsyncIO
	 */"

	^ self ffiCall: #(SDL_AsyncIO* SDL_AsyncIOFromFile(const char* file, const char* mode))
]

{ #category : 'public' }
LibSDL3 >> atan2Y: y x: x [
	"/**
	 * Compute the arc tangent of `y / x`, using the signs of x and y to adjust
	 * the result's quadrant.
	 *
	 * The definition of `z = atan2(x, y)` is `y = x tan(z)`, where the quadrant
	 * of z is determined based on the signs of x and y.
	 *
	 * Domain: `-INF <= x <= INF`, `-INF <= y <= INF`
	 *
	 * Range: `-Pi/2 <= y <= Pi/2`
	 *
	 * This function operates on double-precision floating point values, use
	 * SDL_atan2f for single-precision floats.
	 *
	 * To calculate the arc tangent of a single value, use SDL_atan.
	 *
	 * This function may use a different approximation across different versions,
	 * platforms and configurations. i.e, it can return a different value given
	 * the same input on different machines or operating systems, or if SDL is
	 * updated.
	 *
	 * \param y floating point value of the numerator (y coordinate).
	 * \param x floating point value of the denominator (x coordinate).
	 * \returns arc tangent of of `y / x` in radians, or, if `x = 0`, either
	 *          `-Pi/2`, `0`, or `Pi/2`, depending on the value of `y`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_atan2f
	 * \sa SDL_atan
	 * \sa SDL_tan
	 */"

	^ self ffiCall: #(double SDL_atan2(double y, double x))
]

{ #category : 'public' }
LibSDL3 >> atan2fY: y x: x [
	"/**
	 * Compute the arc tangent of `y / x`, using the signs of x and y to adjust
	 * the result's quadrant.
	 *
	 * The definition of `z = atan2(x, y)` is `y = x tan(z)`, where the quadrant
	 * of z is determined based on the signs of x and y.
	 *
	 * Domain: `-INF <= x <= INF`, `-INF <= y <= INF`
	 *
	 * Range: `-Pi/2 <= y <= Pi/2`
	 *
	 * This function operates on single-precision floating point values, use
	 * SDL_atan2 for double-precision floats.
	 *
	 * To calculate the arc tangent of a single value, use SDL_atanf.
	 *
	 * This function may use a different approximation across different versions,
	 * platforms and configurations. i.e, it can return a different value given
	 * the same input on different machines or operating systems, or if SDL is
	 * updated.
	 *
	 * \param y floating point value of the numerator (y coordinate).
	 * \param x floating point value of the denominator (x coordinate).
	 * \returns arc tangent of of `y / x` in radians, or, if `x = 0`, either
	 *          `-Pi/2`, `0`, or `Pi/2`, depending on the value of `y`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_atan2
	 * \sa SDL_atan
	 * \sa SDL_tan
	 */"

	^ self ffiCall: #(float SDL_atan2f(float y, float x))
]

{ #category : 'public' }
LibSDL3 >> atan: x [
	"/**
	 * Compute the arc tangent of `x`.
	 *
	 * The definition of `y = atan(x)` is `x = tan(y)`.
	 *
	 * Domain: `-INF <= x <= INF`
	 *
	 * Range: `-Pi/2 <= y <= Pi/2`
	 *
	 * This function operates on double-precision floating point values, use
	 * SDL_atanf for single-precision floats.
	 *
	 * To calculate the arc tangent of y / x, use SDL_atan2.
	 *
	 * This function may use a different approximation across different versions,
	 * platforms and configurations. i.e, it can return a different value given
	 * the same input on different machines or operating systems, or if SDL is
	 * updated.
	 *
	 * \param x floating point value.
	 * \returns arc tangent of of `x` in radians, or 0 if `x = 0`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_atanf
	 * \sa SDL_atan2
	 * \sa SDL_tan
	 */"

	^ self ffiCall: #(double SDL_atan(double x))
]

{ #category : 'public' }
LibSDL3 >> atanf: x [
	"/**
	 * Compute the arc tangent of `x`.
	 *
	 * The definition of `y = atan(x)` is `x = tan(y)`.
	 *
	 * Domain: `-INF <= x <= INF`
	 *
	 * Range: `-Pi/2 <= y <= Pi/2`
	 *
	 * This function operates on single-precision floating point values, use
	 * SDL_atan for dboule-precision floats.
	 *
	 * To calculate the arc tangent of y / x, use SDL_atan2f.
	 *
	 * This function may use a different approximation across different versions,
	 * platforms and configurations. i.e, it can return a different value given
	 * the same input on different machines or operating systems, or if SDL is
	 * updated.
	 *
	 * \param x floating point value.
	 * \returns arc tangent of of `x` in radians, or 0 if `x = 0`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_atan
	 * \sa SDL_atan2f
	 * \sa SDL_tanf
	 */"

	^ self ffiCall: #(float SDL_atanf(float x))
]

{ #category : 'public' }
LibSDL3 >> atof: str [
	"/**
	 * Parse a `double` from a string.
	 *
	 * The result of calling `SDL_atof(str)` is equivalent to `SDL_strtod(str,
	 * NULL)`.
	 *
	 * \param str The null-terminated string to read. Must not be NULL.
	 * \returns the parsed `double`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_atoi
	 * \sa SDL_strtol
	 * \sa SDL_strtoul
	 * \sa SDL_strtoll
	 * \sa SDL_strtoull
	 * \sa SDL_strtod
	 */"

	^ self ffiCall: #(double SDL_atof(const char* str))
]

{ #category : 'public' }
LibSDL3 >> atoi: str [
	"/**
	 * Parse an `int` from a string.
	 *
	 * The result of calling `SDL_atoi(str)` is equivalent to
	 * `(int)SDL_strtol(str, NULL, 10)`.
	 *
	 * \param str The null-terminated string to read. Must not be NULL.
	 * \returns the parsed `int`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_atof
	 * \sa SDL_strtol
	 * \sa SDL_strtoul
	 * \sa SDL_strtoll
	 * \sa SDL_strtoull
	 * \sa SDL_strtod
	 * \sa SDL_itoa
	 */"

	^ self ffiCall: #(int SDL_atoi(const char* str))
]

{ #category : 'public' }
LibSDL3 >> attachVirtualJoystick: desc [
	"/**
	 * Attach a new virtual joystick.
	 *
	 * \param desc joystick description, initialized using SDL_INIT_INTERFACE().
	 * \returns the joystick instance ID, or 0 on failure; call SDL_GetError() for
	 *          more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_DetachVirtualJoystick
	 */"

	^ self ffiCall: #(SDL_JoystickID SDL_AttachVirtualJoystick(SDL_VirtualJoystickDesc* desc))
]

{ #category : 'public' }
LibSDL3 >> audioDevicePaused: devid [
	"/**
	 * Use this function to query if an audio device is paused.
	 *
	 * Unlike in SDL2, audio devices start in an _unpaused_ state, since an app
	 * has to bind a stream before any audio will flow.
	 *
	 * Physical devices can not be paused or unpaused, only logical devices
	 * created through SDL_OpenAudioDevice() can be. Physical and invalid device
	 * IDs will report themselves as unpaused here.
	 *
	 * \param devid a device opened by SDL_OpenAudioDevice().
	 * \returns true if device is valid and paused, false otherwise.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_PauseAudioDevice
	 * \sa SDL_ResumeAudioDevice
	 */"

	^ self ffiCall: #(bool SDL_AudioDevicePaused(SDL_AudioDeviceID devid))
]

{ #category : 'public' }
LibSDL3 >> audioStreamDevicePaused: stream [
	"/**
	 * Use this function to query if an audio device associated with a stream is
	 * paused.
	 *
	 * Unlike in SDL2, audio devices start in an _unpaused_ state, since an app
	 * has to bind a stream before any audio will flow.
	 *
	 * \param stream the audio stream associated with the audio device to query.
	 * \returns true if device is valid and paused, false otherwise.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_PauseAudioStreamDevice
	 * \sa SDL_ResumeAudioStreamDevice
	 */"

	^ self ffiCall: #(bool SDL_AudioStreamDevicePaused(SDL_AudioStream* stream))
]

{ #category : 'public' }
LibSDL3 >> beginGPUComputePassCommandBuffer: command_buffer storageTextureBindings: storage_texture_bindings numStorageTextureBindings: num_storage_texture_bindings storageBufferBindings: storage_buffer_bindings numStorageBufferBindings: num_storage_buffer_bindings [
	"/**
	 * Begins a compute pass on a command buffer.
	 *
	 * A compute pass is defined by a set of texture subresources and buffers that
	 * may be written to by compute pipelines. These textures and buffers must
	 * have been created with the COMPUTE_STORAGE_WRITE bit or the
	 * COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE bit. If you do not create a texture
	 * with COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE, you must not read from the
	 * texture in the compute pass. All operations related to compute pipelines
	 * must take place inside of a compute pass. You must not begin another
	 * compute pass, or a render pass or copy pass before ending the compute pass.
	 *
	 * A VERY IMPORTANT NOTE - Reads and writes in compute passes are NOT
	 * implicitly synchronized. This means you may cause data races by both
	 * reading and writing a resource region in a compute pass, or by writing
	 * multiple times to a resource region. If your compute work depends on
	 * reading the completed output from a previous dispatch, you MUST end the
	 * current compute pass and begin a new one before you can safely access the
	 * data. Otherwise you will receive unexpected results. Reading and writing a
	 * texture in the same compute pass is only supported by specific texture
	 * formats. Make sure you check the format support!
	 *
	 * \param command_buffer a command buffer.
	 * \param storage_texture_bindings an array of writeable storage texture
	 *                                 binding structs.
	 * \param num_storage_texture_bindings the number of storage textures to bind
	 *                                     from the array.
	 * \param storage_buffer_bindings an array of writeable storage buffer binding
	 *                                structs.
	 * \param num_storage_buffer_bindings the number of storage buffers to bind
	 *                                    from the array.
	 * \returns a compute pass handle.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_EndGPUComputePass
	 */"

	^ self ffiCall: #(SDL_GPUComputePass* SDL_BeginGPUComputePass(SDL_GPUCommandBuffer* command_buffer, SDL_GPUStorageTextureReadWriteBinding* storage_texture_bindings, Uint32 num_storage_texture_bindings, SDL_GPUStorageBufferReadWriteBinding* storage_buffer_bindings, Uint32 num_storage_buffer_bindings))
]

{ #category : 'public' }
LibSDL3 >> beginGPUCopyPass: command_buffer [
	"/**
	 * Begins a copy pass on a command buffer.
	 *
	 * All operations related to copying to or from buffers or textures take place
	 * inside a copy pass. You must not begin another copy pass, or a render pass
	 * or compute pass before ending the copy pass.
	 *
	 * \param command_buffer a command buffer.
	 * \returns a copy pass handle.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_GPUCopyPass* SDL_BeginGPUCopyPass(SDL_GPUCommandBuffer* command_buffer))
]

{ #category : 'public' }
LibSDL3 >> beginGPURenderPassCommandBuffer: command_buffer colorTargetInfos: color_target_infos numColorTargets: num_color_targets depthStencilTargetInfo: depth_stencil_target_info [
	"/**
	 * Begins a render pass on a command buffer.
	 *
	 * A render pass consists of a set of texture subresources (or depth slices in
	 * the 3D texture case) which will be rendered to during the render pass,
	 * along with corresponding clear values and load/store operations. All
	 * operations related to graphics pipelines must take place inside of a render
	 * pass. A default viewport and scissor state are automatically set when this
	 * is called. You cannot begin another render pass, or begin a compute pass or
	 * copy pass until you have ended the render pass.
	 *
	 * \param command_buffer a command buffer.
	 * \param color_target_infos an array of texture subresources with
	 *                           corresponding clear values and load/store ops.
	 * \param num_color_targets the number of color targets in the
	 *                          color_target_infos array.
	 * \param depth_stencil_target_info a texture subresource with corresponding
	 *                                  clear value and load/store ops, may be
	 *                                  NULL.
	 * \returns a render pass handle.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_EndGPURenderPass
	 */"

	^ self ffiCall: #(SDL_GPURenderPass* SDL_BeginGPURenderPass(SDL_GPUCommandBuffer* command_buffer, SDL_GPUColorTargetInfo* color_target_infos, Uint32 num_color_targets, SDL_GPUDepthStencilTargetInfo* depth_stencil_target_info))
]

{ #category : 'public' }
LibSDL3 >> bindAudioStreamDevid: devid stream: stream [
	"/**
	 * Bind a single audio stream to an audio device.
	 *
	 * This is a convenience function, equivalent to calling
	 * `SDL_BindAudioStreams(devid, &stream, 1)`.
	 *
	 * \param devid an audio device to bind a stream to.
	 * \param stream an audio stream to bind to a device.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_BindAudioStreams
	 * \sa SDL_UnbindAudioStream
	 * \sa SDL_GetAudioStreamDevice
	 */"

	^ self ffiCall: #(bool SDL_BindAudioStream(SDL_AudioDeviceID devid, SDL_AudioStream* stream))
]

{ #category : 'public' }
LibSDL3 >> bindAudioStreamsDevid: devid streams: streams numStreams: num_streams [
	"/**
	 * Bind a list of audio streams to an audio device.
	 *
	 * Audio data will flow through any bound streams. For a playback device, data
	 * for all bound streams will be mixed together and fed to the device. For a
	 * recording device, a copy of recorded data will be provided to each bound
	 * stream.
	 *
	 * Audio streams can only be bound to an open device. This operation is
	 * atomic--all streams bound in the same call will start processing at the
	 * same time, so they can stay in sync. Also: either all streams will be bound
	 * or none of them will be.
	 *
	 * It is an error to bind an already-bound stream; it must be explicitly
	 * unbound first.
	 *
	 * Binding a stream to a device will set its output format for playback
	 * devices, and its input format for recording devices, so they match the
	 * device's settings. The caller is welcome to change the other end of the
	 * stream's format at any time with SDL_SetAudioStreamFormat().
	 *
	 * \param devid an audio device to bind a stream to.
	 * \param streams an array of audio streams to bind.
	 * \param num_streams number streams listed in the `streams` array.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_BindAudioStreams
	 * \sa SDL_UnbindAudioStream
	 * \sa SDL_GetAudioStreamDevice
	 */"

	^ self ffiCall: #(bool SDL_BindAudioStreams(SDL_AudioDeviceID devid, SDL_AudioStream* streams, int num_streams))
]

{ #category : 'public' }
LibSDL3 >> bindGPUComputePipelineComputePass: compute_pass computePipeline: compute_pipeline [
	"/**
	 * Binds a compute pipeline on a command buffer for use in compute dispatch.
	 *
	 * \param compute_pass a compute pass handle.
	 * \param compute_pipeline a compute pipeline to bind.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_BindGPUComputePipeline(SDL_GPUComputePass* compute_pass, SDL_GPUComputePipeline* compute_pipeline))
]

{ #category : 'public' }
LibSDL3 >> bindGPUComputeSamplersComputePass: compute_pass firstSlot: first_slot textureSamplerBindings: texture_sampler_bindings numBindings: num_bindings [
	"/**
	 * Binds texture-sampler pairs for use on the compute shader.
	 *
	 * The textures must have been created with SDL_GPU_TEXTUREUSAGE_SAMPLER.
	 *
	 * Be sure your shader is set up according to the requirements documented in
	 * SDL_CreateGPUShader().
	 *
	 * \param compute_pass a compute pass handle.
	 * \param first_slot the compute sampler slot to begin binding from.
	 * \param texture_sampler_bindings an array of texture-sampler binding
	 *                                 structs.
	 * \param num_bindings the number of texture-sampler bindings to bind from the
	 *                     array.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateGPUShader
	 */"

	self ffiCall: #(void SDL_BindGPUComputeSamplers(SDL_GPUComputePass* compute_pass, Uint32 first_slot, SDL_GPUTextureSamplerBinding* texture_sampler_bindings, Uint32 num_bindings))
]

{ #category : 'public' }
LibSDL3 >> bindGPUComputeStorageBuffersComputePass: compute_pass firstSlot: first_slot storageBuffers: storage_buffers numBindings: num_bindings [
	"/**
	 * Binds storage buffers as readonly for use on the compute pipeline.
	 *
	 * These buffers must have been created with
	 * SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ.
	 *
	 * Be sure your shader is set up according to the requirements documented in
	 * SDL_CreateGPUShader().
	 *
	 * \param compute_pass a compute pass handle.
	 * \param first_slot the compute storage buffer slot to begin binding from.
	 * \param storage_buffers an array of storage buffer binding structs.
	 * \param num_bindings the number of storage buffers to bind from the array.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateGPUShader
	 */"

	self ffiCall: #(void SDL_BindGPUComputeStorageBuffers(SDL_GPUComputePass* compute_pass, Uint32 first_slot, SDL_GPUBuffer* storage_buffers, Uint32 num_bindings))
]

{ #category : 'public' }
LibSDL3 >> bindGPUComputeStorageTexturesComputePass: compute_pass firstSlot: first_slot storageTextures: storage_textures numBindings: num_bindings [
	"/**
	 * Binds storage textures as readonly for use on the compute pipeline.
	 *
	 * These textures must have been created with
	 * SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ.
	 *
	 * Be sure your shader is set up according to the requirements documented in
	 * SDL_CreateGPUShader().
	 *
	 * \param compute_pass a compute pass handle.
	 * \param first_slot the compute storage texture slot to begin binding from.
	 * \param storage_textures an array of storage textures.
	 * \param num_bindings the number of storage textures to bind from the array.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateGPUShader
	 */"

	self ffiCall: #(void SDL_BindGPUComputeStorageTextures(SDL_GPUComputePass* compute_pass, Uint32 first_slot, SDL_GPUTexture* storage_textures, Uint32 num_bindings))
]

{ #category : 'public' }
LibSDL3 >> bindGPUFragmentSamplersRenderPass: render_pass firstSlot: first_slot textureSamplerBindings: texture_sampler_bindings numBindings: num_bindings [
	"/**
	 * Binds texture-sampler pairs for use on the fragment shader.
	 *
	 * The textures must have been created with SDL_GPU_TEXTUREUSAGE_SAMPLER.
	 *
	 * Be sure your shader is set up according to the requirements documented in
	 * SDL_CreateGPUShader().
	 *
	 * \param render_pass a render pass handle.
	 * \param first_slot the fragment sampler slot to begin binding from.
	 * \param texture_sampler_bindings an array of texture-sampler binding
	 *                                 structs.
	 * \param num_bindings the number of texture-sampler pairs to bind from the
	 *                     array.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateGPUShader
	 */"

	self ffiCall: #(void SDL_BindGPUFragmentSamplers(SDL_GPURenderPass* render_pass, Uint32 first_slot, SDL_GPUTextureSamplerBinding* texture_sampler_bindings, Uint32 num_bindings))
]

{ #category : 'public' }
LibSDL3 >> bindGPUFragmentStorageBuffersRenderPass: render_pass firstSlot: first_slot storageBuffers: storage_buffers numBindings: num_bindings [
	"/**
	 * Binds storage buffers for use on the fragment shader.
	 *
	 * These buffers must have been created with
	 * SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ.
	 *
	 * Be sure your shader is set up according to the requirements documented in
	 * SDL_CreateGPUShader().
	 *
	 * \param render_pass a render pass handle.
	 * \param first_slot the fragment storage buffer slot to begin binding from.
	 * \param storage_buffers an array of storage buffers.
	 * \param num_bindings the number of storage buffers to bind from the array.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateGPUShader
	 */"

	self ffiCall: #(void SDL_BindGPUFragmentStorageBuffers(SDL_GPURenderPass* render_pass, Uint32 first_slot, SDL_GPUBuffer* storage_buffers, Uint32 num_bindings))
]

{ #category : 'public' }
LibSDL3 >> bindGPUFragmentStorageTexturesRenderPass: render_pass firstSlot: first_slot storageTextures: storage_textures numBindings: num_bindings [
	"/**
	 * Binds storage textures for use on the fragment shader.
	 *
	 * These textures must have been created with
	 * SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ.
	 *
	 * Be sure your shader is set up according to the requirements documented in
	 * SDL_CreateGPUShader().
	 *
	 * \param render_pass a render pass handle.
	 * \param first_slot the fragment storage texture slot to begin binding from.
	 * \param storage_textures an array of storage textures.
	 * \param num_bindings the number of storage textures to bind from the array.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateGPUShader
	 */"

	self ffiCall: #(void SDL_BindGPUFragmentStorageTextures(SDL_GPURenderPass* render_pass, Uint32 first_slot, SDL_GPUTexture* storage_textures, Uint32 num_bindings))
]

{ #category : 'public' }
LibSDL3 >> bindGPUGraphicsPipelineRenderPass: render_pass graphicsPipeline: graphics_pipeline [
	"/**
	 * Binds a graphics pipeline on a render pass to be used in rendering.
	 *
	 * A graphics pipeline must be bound before making any draw calls.
	 *
	 * \param render_pass a render pass handle.
	 * \param graphics_pipeline the graphics pipeline to bind.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_BindGPUGraphicsPipeline(SDL_GPURenderPass* render_pass, SDL_GPUGraphicsPipeline* graphics_pipeline))
]

{ #category : 'public' }
LibSDL3 >> bindGPUIndexBufferRenderPass: render_pass binding: binding indexElementSize: index_element_size [
	"/**
	 * Binds an index buffer on a command buffer for use with subsequent draw
	 * calls.
	 *
	 * \param render_pass a render pass handle.
	 * \param binding a pointer to a struct containing an index buffer and offset.
	 * \param index_element_size whether the index values in the buffer are 16- or
	 *                           32-bit.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_BindGPUIndexBuffer(SDL_GPURenderPass* render_pass, SDL_GPUBufferBinding* binding, SDL_GPUIndexElementSize index_element_size))
]

{ #category : 'public' }
LibSDL3 >> bindGPUVertexBuffersRenderPass: render_pass firstSlot: first_slot bindings: bindings numBindings: num_bindings [
	"/**
	 * Binds vertex buffers on a command buffer for use with subsequent draw
	 * calls.
	 *
	 * \param render_pass a render pass handle.
	 * \param first_slot the vertex buffer slot to begin binding from.
	 * \param bindings an array of SDL_GPUBufferBinding structs containing vertex
	 *                 buffers and offset values.
	 * \param num_bindings the number of bindings in the bindings array.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_BindGPUVertexBuffers(SDL_GPURenderPass* render_pass, Uint32 first_slot, SDL_GPUBufferBinding* bindings, Uint32 num_bindings))
]

{ #category : 'public' }
LibSDL3 >> bindGPUVertexSamplersRenderPass: render_pass firstSlot: first_slot textureSamplerBindings: texture_sampler_bindings numBindings: num_bindings [
	"/**
	 * Binds texture-sampler pairs for use on the vertex shader.
	 *
	 * The textures must have been created with SDL_GPU_TEXTUREUSAGE_SAMPLER.
	 *
	 * Be sure your shader is set up according to the requirements documented in
	 * SDL_CreateGPUShader().
	 *
	 * \param render_pass a render pass handle.
	 * \param first_slot the vertex sampler slot to begin binding from.
	 * \param texture_sampler_bindings an array of texture-sampler binding
	 *                                 structs.
	 * \param num_bindings the number of texture-sampler pairs to bind from the
	 *                     array.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateGPUShader
	 */"

	self ffiCall: #(void SDL_BindGPUVertexSamplers(SDL_GPURenderPass* render_pass, Uint32 first_slot, SDL_GPUTextureSamplerBinding* texture_sampler_bindings, Uint32 num_bindings))
]

{ #category : 'public' }
LibSDL3 >> bindGPUVertexStorageBuffersRenderPass: render_pass firstSlot: first_slot storageBuffers: storage_buffers numBindings: num_bindings [
	"/**
	 * Binds storage buffers for use on the vertex shader.
	 *
	 * These buffers must have been created with
	 * SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ.
	 *
	 * Be sure your shader is set up according to the requirements documented in
	 * SDL_CreateGPUShader().
	 *
	 * \param render_pass a render pass handle.
	 * \param first_slot the vertex storage buffer slot to begin binding from.
	 * \param storage_buffers an array of buffers.
	 * \param num_bindings the number of buffers to bind from the array.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateGPUShader
	 */"

	self ffiCall: #(void SDL_BindGPUVertexStorageBuffers(SDL_GPURenderPass* render_pass, Uint32 first_slot, SDL_GPUBuffer* storage_buffers, Uint32 num_bindings))
]

{ #category : 'public' }
LibSDL3 >> bindGPUVertexStorageTexturesRenderPass: render_pass firstSlot: first_slot storageTextures: storage_textures numBindings: num_bindings [
	"/**
	 * Binds storage textures for use on the vertex shader.
	 *
	 * These textures must have been created with
	 * SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ.
	 *
	 * Be sure your shader is set up according to the requirements documented in
	 * SDL_CreateGPUShader().
	 *
	 * \param render_pass a render pass handle.
	 * \param first_slot the vertex storage texture slot to begin binding from.
	 * \param storage_textures an array of storage textures.
	 * \param num_bindings the number of storage texture to bind from the array.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateGPUShader
	 */"

	self ffiCall: #(void SDL_BindGPUVertexStorageTextures(SDL_GPURenderPass* render_pass, Uint32 first_slot, SDL_GPUTexture* storage_textures, Uint32 num_bindings))
]

{ #category : 'public' }
LibSDL3 >> blitGPUTextureCommandBuffer: command_buffer info: info [
	"/**
	 * Blits from a source texture region to a destination texture region.
	 *
	 * This function must not be called inside of any pass.
	 *
	 * \param command_buffer a command buffer.
	 * \param info the blit info struct containing the blit parameters.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_BlitGPUTexture(SDL_GPUCommandBuffer* command_buffer, SDL_GPUBlitInfo* info))
]

{ #category : 'public' }
LibSDL3 >> blitSurface9GridSrc: src srcrect: srcrect leftWidth: left_width rightWidth: right_width topHeight: top_height bottomHeight: bottom_height scale: scale scaleMode: scaleMode dst: dst dstrect: dstrect [
	"/**
	 * Perform a scaled blit using the 9-grid algorithm to a destination surface,
	 * which may be of a different format.
	 *
	 * The pixels in the source surface are split into a 3x3 grid, using the
	 * different corner sizes for each corner, and the sides and center making up
	 * the remaining pixels. The corners are then scaled using `scale` and fit
	 * into the corners of the destination rectangle. The sides and center are
	 * then stretched into place to cover the remaining destination rectangle.
	 *
	 * \param src the SDL_Surface structure to be copied from.
	 * \param srcrect the SDL_Rect structure representing the rectangle to be used
	 *                for the 9-grid, or NULL to use the entire surface.
	 * \param left_width the width, in pixels, of the left corners in `srcrect`.
	 * \param right_width the width, in pixels, of the right corners in `srcrect`.
	 * \param top_height the height, in pixels, of the top corners in `srcrect`.
	 * \param bottom_height the height, in pixels, of the bottom corners in
	 *                      `srcrect`.
	 * \param scale the scale used to transform the corner of `srcrect` into the
	 *              corner of `dstrect`, or 0.0f for an unscaled blit.
	 * \param scaleMode scale algorithm to be used.
	 * \param dst the SDL_Surface structure that is the blit target.
	 * \param dstrect the SDL_Rect structure representing the target rectangle in
	 *                the destination surface, or NULL to fill the entire surface.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety Only one thread should be using the `src` and `dst` surfaces
	 *               at any given time.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_BlitSurface
	 */"

	^ self ffiCall: #(bool SDL_BlitSurface9Grid(SDL_Surface* src, SDL_Rect* srcrect, int left_width, int right_width, int top_height, int bottom_height, float scale, SDL_ScaleMode scaleMode, SDL_Surface* dst, SDL_Rect* dstrect))
]

{ #category : 'public' }
LibSDL3 >> blitSurfaceScaledSrc: src srcrect: srcrect dst: dst dstrect: dstrect scaleMode: scaleMode [
	"/**
	 * Perform a scaled blit to a destination surface, which may be of a different
	 * format.
	 *
	 * \param src the SDL_Surface structure to be copied from.
	 * \param srcrect the SDL_Rect structure representing the rectangle to be
	 *                copied, or NULL to copy the entire surface.
	 * \param dst the SDL_Surface structure that is the blit target.
	 * \param dstrect the SDL_Rect structure representing the target rectangle in
	 *                the destination surface, or NULL to fill the entire
	 *                destination surface.
	 * \param scaleMode the SDL_ScaleMode to be used.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety Only one thread should be using the `src` and `dst` surfaces
	 *               at any given time.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_BlitSurface
	 */"

	^ self ffiCall: #(bool SDL_BlitSurfaceScaled(SDL_Surface* src, SDL_Rect* srcrect, SDL_Surface* dst, SDL_Rect* dstrect, SDL_ScaleMode scaleMode))
]

{ #category : 'public' }
LibSDL3 >> blitSurfaceSrc: src srcrect: srcrect dst: dst dstrect: dstrect [
	"/**
	 * Performs a fast blit from the source surface to the destination surface
	 * with clipping.
	 *
	 * If either `srcrect` or `dstrect` are NULL, the entire surface (`src` or
	 * `dst`) is copied while ensuring clipping to `dst->clip_rect`.
	 *
	 * The final blit rectangles are saved in `srcrect` and `dstrect` after all
	 * clipping is performed.
	 *
	 * The blit function should not be called on a locked surface.
	 *
	 * The blit semantics for surfaces with and without blending and colorkey are
	 * defined as follows:
	 *
	 * ```
	 *    RGBA->RGB:
	 *      Source surface blend mode set to SDL_BLENDMODE_BLEND:
	 *       alpha-blend (using the source alpha-channel and per-surface alpha)
	 *       SDL_SRCCOLORKEY ignored.
	 *     Source surface blend mode set to SDL_BLENDMODE_NONE:
	 *       copy RGB.
	 *       if SDL_SRCCOLORKEY set, only copy the pixels that do not match the
	 *       RGB values of the source color key, ignoring alpha in the
	 *       comparison.
	 *
	 *   RGB->RGBA:
	 *     Source surface blend mode set to SDL_BLENDMODE_BLEND:
	 *       alpha-blend (using the source per-surface alpha)
	 *     Source surface blend mode set to SDL_BLENDMODE_NONE:
	 *       copy RGB, set destination alpha to source per-surface alpha value.
	 *     both:
	 *       if SDL_SRCCOLORKEY set, only copy the pixels that do not match the
	 *       source color key.
	 *
	 *   RGBA->RGBA:
	 *     Source surface blend mode set to SDL_BLENDMODE_BLEND:
	 *       alpha-blend (using the source alpha-channel and per-surface alpha)
	 *       SDL_SRCCOLORKEY ignored.
	 *     Source surface blend mode set to SDL_BLENDMODE_NONE:
	 *       copy all of RGBA to the destination.
	 *       if SDL_SRCCOLORKEY set, only copy the pixels that do not match the
	 *       RGB values of the source color key, ignoring alpha in the
	 *       comparison.
	 *
	 *   RGB->RGB:
	 *     Source surface blend mode set to SDL_BLENDMODE_BLEND:
	 *       alpha-blend (using the source per-surface alpha)
	 *     Source surface blend mode set to SDL_BLENDMODE_NONE:
	 *       copy RGB.
	 *     both:
	 *       if SDL_SRCCOLORKEY set, only copy the pixels that do not match the
	 *       source color key.
	 * ```
	 *
	 * \param src the SDL_Surface structure to be copied from.
	 * \param srcrect the SDL_Rect structure representing the rectangle to be
	 *                copied, or NULL to copy the entire surface.
	 * \param dst the SDL_Surface structure that is the blit target.
	 * \param dstrect the SDL_Rect structure representing the x and y position in
	 *                the destination surface, or NULL for (0,0). The width and
	 *                height are ignored, and are copied from `srcrect`. If you
	 *                want a specific width and height, you should use
	 *                SDL_BlitSurfaceScaled().
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety Only one thread should be using the `src` and `dst` surfaces
	 *               at any given time.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_BlitSurfaceScaled
	 */"

	^ self ffiCall: #(bool SDL_BlitSurface(SDL_Surface* src, SDL_Rect* srcrect, SDL_Surface* dst, SDL_Rect* dstrect))
]

{ #category : 'public' }
LibSDL3 >> blitSurfaceTiledSrc: src srcrect: srcrect dst: dst dstrect: dstrect [
	"/**
	 * Perform a tiled blit to a destination surface, which may be of a different
	 * format.
	 *
	 * The pixels in `srcrect` will be repeated as many times as needed to
	 * completely fill `dstrect`.
	 *
	 * \param src the SDL_Surface structure to be copied from.
	 * \param srcrect the SDL_Rect structure representing the rectangle to be
	 *                copied, or NULL to copy the entire surface.
	 * \param dst the SDL_Surface structure that is the blit target.
	 * \param dstrect the SDL_Rect structure representing the target rectangle in
	 *                the destination surface, or NULL to fill the entire surface.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety Only one thread should be using the `src` and `dst` surfaces
	 *               at any given time.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_BlitSurface
	 */"

	^ self ffiCall: #(bool SDL_BlitSurfaceTiled(SDL_Surface* src, SDL_Rect* srcrect, SDL_Surface* dst, SDL_Rect* dstrect))
]

{ #category : 'public' }
LibSDL3 >> blitSurfaceTiledWithScaleSrc: src srcrect: srcrect scale: scale scaleMode: scaleMode dst: dst dstrect: dstrect [
	"/**
	 * Perform a scaled and tiled blit to a destination surface, which may be of a
	 * different format.
	 *
	 * The pixels in `srcrect` will be scaled and repeated as many times as needed
	 * to completely fill `dstrect`.
	 *
	 * \param src the SDL_Surface structure to be copied from.
	 * \param srcrect the SDL_Rect structure representing the rectangle to be
	 *                copied, or NULL to copy the entire surface.
	 * \param scale the scale used to transform srcrect into the destination
	 *              rectangle, e.g. a 32x32 texture with a scale of 2 would fill
	 *              64x64 tiles.
	 * \param scaleMode scale algorithm to be used.
	 * \param dst the SDL_Surface structure that is the blit target.
	 * \param dstrect the SDL_Rect structure representing the target rectangle in
	 *                the destination surface, or NULL to fill the entire surface.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety Only one thread should be using the `src` and `dst` surfaces
	 *               at any given time.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_BlitSurface
	 */"

	^ self ffiCall: #(bool SDL_BlitSurfaceTiledWithScale(SDL_Surface* src, SDL_Rect* srcrect, float scale, SDL_ScaleMode scaleMode, SDL_Surface* dst, SDL_Rect* dstrect))
]

{ #category : 'public' }
LibSDL3 >> blitSurfaceUncheckedScaledSrc: src srcrect: srcrect dst: dst dstrect: dstrect scaleMode: scaleMode [
	"/**
	 * Perform low-level surface scaled blitting only.
	 *
	 * This is a semi-private function and it performs low-level surface blitting,
	 * assuming the input rectangles have already been clipped.
	 *
	 * \param src the SDL_Surface structure to be copied from.
	 * \param srcrect the SDL_Rect structure representing the rectangle to be
	 *                copied, may not be NULL.
	 * \param dst the SDL_Surface structure that is the blit target.
	 * \param dstrect the SDL_Rect structure representing the target rectangle in
	 *                the destination surface, may not be NULL.
	 * \param scaleMode the SDL_ScaleMode to be used.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety Only one thread should be using the `src` and `dst` surfaces
	 *               at any given time.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_BlitSurfaceScaled
	 */"

	^ self ffiCall: #(bool SDL_BlitSurfaceUncheckedScaled(SDL_Surface* src, SDL_Rect* srcrect, SDL_Surface* dst, SDL_Rect* dstrect, SDL_ScaleMode scaleMode))
]

{ #category : 'public' }
LibSDL3 >> blitSurfaceUncheckedSrc: src srcrect: srcrect dst: dst dstrect: dstrect [
	"/**
	 * Perform low-level surface blitting only.
	 *
	 * This is a semi-private blit function and it performs low-level surface
	 * blitting, assuming the input rectangles have already been clipped.
	 *
	 * \param src the SDL_Surface structure to be copied from.
	 * \param srcrect the SDL_Rect structure representing the rectangle to be
	 *                copied, may not be NULL.
	 * \param dst the SDL_Surface structure that is the blit target.
	 * \param dstrect the SDL_Rect structure representing the target rectangle in
	 *                the destination surface, may not be NULL.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety Only one thread should be using the `src` and `dst` surfaces
	 *               at any given time.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_BlitSurface
	 */"

	^ self ffiCall: #(bool SDL_BlitSurfaceUnchecked(SDL_Surface* src, SDL_Rect* srcrect, SDL_Surface* dst, SDL_Rect* dstrect))
]

{ #category : 'public' }
LibSDL3 >> broadcastCondition: cond [
	"/**
	 * Restart all threads that are waiting on the condition variable.
	 *
	 * \param cond the condition variable to signal.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SignalCondition
	 * \sa SDL_WaitCondition
	 * \sa SDL_WaitConditionTimeout
	 */"

	self ffiCall: #(void SDL_BroadcastCondition(SDL_Condition* cond))
]

{ #category : 'public' }
LibSDL3 >> bsearchKey: key base: base nmemb: nmemb size: size compare: compare [
	"/**
	 * Perform a binary search on a previously sorted array.
	 *
	 * For example:
	 *
	 * ```c
	 * typedef struct {
	 *     int key;
	 *     const char *string;
	 * } data;
	 *
	 * int SDLCALL compare(const void *a, const void *b)
	 * {
	 *     const data *A = (const data *)a;
	 *     const data *B = (const data *)b;
	 *
	 *     if (A->n < B->n) {
	 *         return -1;
	 *     } else if (B->n < A->n) {
	 *         return 1;
	 *     } else {
	 *         return 0;
	 *     }
	 * }
	 *
	 * data values[] = {
	 *     { 1, ""first"" }, { 2, ""second"" }, { 3, ""third"" }
	 * };
	 * data key = { 2, NULL };
	 *
	 * data *result = SDL_bsearch(&key, values, SDL_arraysize(values), sizeof(values[0]), compare);
	 * ```
	 *
	 * \param key a pointer to a key equal to the element being searched for.
	 * \param base a pointer to the start of the array.
	 * \param nmemb the number of elements in the array.
	 * \param size the size of the elements in the array.
	 * \param compare a function used to compare elements in the array.
	 * \returns a pointer to the matching element in the array, or NULL if not
	 *          found.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_bsearch_r
	 * \sa SDL_qsort
	 */"

	^ self ffiCall: #(void* SDL_bsearch(const void* key, const void* base, size_t nmemb, size_t size, SDL_CompareCallback compare))
]

{ #category : 'public' }
LibSDL3 >> bsearchRKey: key base: base nmemb: nmemb size: size compare: compare userdata: userdata [
	"/**
	 * Perform a binary search on a previously sorted array, passing a userdata
	 * pointer to the compare function.
	 *
	 * For example:
	 *
	 * ```c
	 * typedef enum {
	 *     sort_increasing,
	 *     sort_decreasing,
	 * } sort_method;
	 *
	 * typedef struct {
	 *     int key;
	 *     const char *string;
	 * } data;
	 *
	 * int SDLCALL compare(const void *userdata, const void *a, const void *b)
	 * {
	 *     sort_method method = (sort_method)(uintptr_t)userdata;
	 *     const data *A = (const data *)a;
	 *     const data *B = (const data *)b;
	 *
	 *     if (A->key < B->key) {
	 *         return (method == sort_increasing) ? -1 : 1;
	 *     } else if (B->key < A->key) {
	 *         return (method == sort_increasing) ? 1 : -1;
	 *     } else {
	 *         return 0;
	 *     }
	 * }
	 *
	 * data values[] = {
	 *     { 1, ""first"" }, { 2, ""second"" }, { 3, ""third"" }
	 * };
	 * data key = { 2, NULL };
	 *
	 * data *result = SDL_bsearch_r(&key, values, SDL_arraysize(values), sizeof(values[0]), compare, (const void *)(uintptr_t)sort_increasing);
	 * ```
	 *
	 * \param key a pointer to a key equal to the element being searched for.
	 * \param base a pointer to the start of the array.
	 * \param nmemb the number of elements in the array.
	 * \param size the size of the elements in the array.
	 * \param compare a function used to compare elements in the array.
	 * \param userdata a pointer to pass to the compare function.
	 * \returns a pointer to the matching element in the array, or NULL if not
	 *          found.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_bsearch
	 * \sa SDL_qsort_r
	 */"

	^ self ffiCall: #(void* SDL_bsearch_r(const void* key, const void* base, size_t nmemb, size_t size, SDL_CompareCallback_r compare, void* userdata))
]

{ #category : 'public' }
LibSDL3 >> calculateGPUTextureFormatSizeFormat: format width: width height: height depthOrLayerCount: depth_or_layer_count [
	"/**
	 * Calculate the size in bytes of a texture format with dimensions.
	 *
	 * \param format a texture format.
	 * \param width width in pixels.
	 * \param height height in pixels.
	 * \param depth_or_layer_count depth for 3D textures or layer count otherwise.
	 * \returns the size of a texture with this format and dimensions.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(Uint32 SDL_CalculateGPUTextureFormatSize(SDL_GPUTextureFormat format, Uint32 width, Uint32 height, Uint32 depth_or_layer_count))
]

{ #category : 'public' }
LibSDL3 >> callocNmemb: nmemb size: size [
	"/**
	 * Allocate a zero-initialized array.
	 *
	 * The memory returned by this function must be freed with SDL_free().
	 *
	 * If either of `nmemb` or `size` is 0, they will both be set to 1.
	 *
	 * If the allocation is successful, the returned pointer is guaranteed to be
	 * aligned to either the *fundamental alignment* (`alignof(max_align_t)` in
	 * C11 and later) or `2 * sizeof(void *)`, whichever is smaller.
	 *
	 * \param nmemb the number of elements in the array.
	 * \param size the size of each element of the array.
	 * \returns a pointer to the allocated array, or NULL if allocation failed.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_free
	 * \sa SDL_malloc
	 * \sa SDL_realloc
	 */"

	^ self ffiCall: #(void* SDL_calloc(size_t nmemb, size_t size))
]

{ #category : 'public' }
LibSDL3 >> cancelGPUCommandBuffer: command_buffer [
	"/**
	 * Cancels a command buffer.
	 *
	 * None of the enqueued commands are executed.
	 *
	 * It is an error to call this function after a swapchain texture has been
	 * acquired.
	 *
	 * This must be called from the thread the command buffer was acquired on.
	 *
	 * You must not reference the command buffer after calling this function.
	 *
	 * \param command_buffer a command buffer.
	 * \returns true on success, false on error; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_WaitAndAcquireGPUSwapchainTexture
	 * \sa SDL_AcquireGPUCommandBuffer
	 * \sa SDL_AcquireGPUSwapchainTexture
	 */"

	^ self ffiCall: #(bool SDL_CancelGPUCommandBuffer(SDL_GPUCommandBuffer* command_buffer))
]

{ #category : 'public' }
LibSDL3 >> captureMouse: enabled [
	"/**
	 * Capture the mouse and to track input outside an SDL window.
	 *
	 * Capturing enables your app to obtain mouse events globally, instead of just
	 * within your window. Not all video targets support this function. When
	 * capturing is enabled, the current window will get all mouse events, but
	 * unlike relative mode, no change is made to the cursor and it is not
	 * restrained to your window.
	 *
	 * This function may also deny mouse input to other windows--both those in
	 * your application and others on the system--so you should use this function
	 * sparingly, and in small bursts. For example, you might want to track the
	 * mouse while the user is dragging something, until the user releases a mouse
	 * button. It is not recommended that you capture the mouse for long periods
	 * of time, such as the entire time your app is running. For that, you should
	 * probably use SDL_SetWindowRelativeMouseMode() or SDL_SetWindowMouseGrab(),
	 * depending on your goals.
	 *
	 * While captured, mouse events still report coordinates relative to the
	 * current (foreground) window, but those coordinates may be outside the
	 * bounds of the window (including negative values). Capturing is only allowed
	 * for the foreground window. If the window loses focus while capturing, the
	 * capture will be disabled automatically.
	 *
	 * While capturing is enabled, the current window will have the
	 * `SDL_WINDOW_MOUSE_CAPTURE` flag set.
	 *
	 * Please note that SDL will attempt to ""auto capture"" the mouse while the
	 * user is pressing a button; this is to try and make mouse behavior more
	 * consistent between platforms, and deal with the common case of a user
	 * dragging the mouse outside of the window. This means that if you are
	 * calling SDL_CaptureMouse() only to deal with this situation, you do not
	 * have to (although it is safe to do so). If this causes problems for your
	 * app, you can disable auto capture by setting the
	 * `SDL_HINT_MOUSE_AUTO_CAPTURE` hint to zero.
	 *
	 * \param enabled true to enable capturing, false to disable.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetGlobalMouseState
	 */"

	^ self ffiCall: #(bool SDL_CaptureMouse(_Bool enabled))
]

{ #category : 'public' }
LibSDL3 >> ceil: x [
	"/**
	 * Compute the ceiling of `x`.
	 *
	 * The ceiling of `x` is the smallest integer `y` such that `y > x`, i.e `x`
	 * rounded up to the nearest integer.
	 *
	 * Domain: `-INF <= x <= INF`
	 *
	 * Range: `-INF <= y <= INF`, y integer
	 *
	 * This function operates on double-precision floating point values, use
	 * SDL_ceilf for single-precision floats.
	 *
	 * \param x floating point value.
	 * \returns the ceiling of `x`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_ceilf
	 * \sa SDL_floor
	 * \sa SDL_trunc
	 * \sa SDL_round
	 * \sa SDL_lround
	 */"

	^ self ffiCall: #(double SDL_ceil(double x))
]

{ #category : 'public' }
LibSDL3 >> ceilf: x [
	"/**
	 * Compute the ceiling of `x`.
	 *
	 * The ceiling of `x` is the smallest integer `y` such that `y > x`, i.e `x`
	 * rounded up to the nearest integer.
	 *
	 * Domain: `-INF <= x <= INF`
	 *
	 * Range: `-INF <= y <= INF`, y integer
	 *
	 * This function operates on single-precision floating point values, use
	 * SDL_ceil for double-precision floats.
	 *
	 * \param x floating point value.
	 * \returns the ceiling of `x`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_ceil
	 * \sa SDL_floorf
	 * \sa SDL_truncf
	 * \sa SDL_roundf
	 * \sa SDL_lroundf
	 */"

	^ self ffiCall: #(float SDL_ceilf(float x))
]

{ #category : 'public' }
LibSDL3 >> claimWindowForGPUDevice: device window: window [
	"/**
	 * Claims a window, creating a swapchain structure for it.
	 *
	 * This must be called before SDL_AcquireGPUSwapchainTexture is called using
	 * the window. You should only call this function from the thread that created
	 * the window.
	 *
	 * The swapchain will be created with SDL_GPU_SWAPCHAINCOMPOSITION_SDR and
	 * SDL_GPU_PRESENTMODE_VSYNC. If you want to have different swapchain
	 * parameters, you must call SDL_SetGPUSwapchainParameters after claiming the
	 * window.
	 *
	 * \param device a GPU context.
	 * \param window an SDL_Window.
	 * \returns true on success, or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called from the thread that
	 *               created the window.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_WaitAndAcquireGPUSwapchainTexture
	 * \sa SDL_ReleaseWindowFromGPUDevice
	 * \sa SDL_WindowSupportsGPUPresentMode
	 * \sa SDL_WindowSupportsGPUSwapchainComposition
	 */"

	^ self ffiCall: #(bool SDL_ClaimWindowForGPUDevice(SDL_GPUDevice* device, SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> cleanupTLS [
	"/**
	 * Cleanup all TLS data for this thread.
	 *
	 * If you are creating your threads outside of SDL and then calling SDL
	 * functions, you should call this function before your thread exits, to
	 * properly clean up SDL memory.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_CleanupTLS())
]

{ #category : 'public' }
LibSDL3 >> clearAudioStream: stream [
	"/**
	 * Clear any pending data in the stream.
	 *
	 * This drops any queued data, so there will be nothing to read from the
	 * stream until more is added.
	 *
	 * \param stream the audio stream to clear.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetAudioStreamAvailable
	 * \sa SDL_GetAudioStreamData
	 * \sa SDL_GetAudioStreamQueued
	 * \sa SDL_PutAudioStreamData
	 */"

	^ self ffiCall: #(bool SDL_ClearAudioStream(SDL_AudioStream* stream))
]

{ #category : 'public' }
LibSDL3 >> clearClipboardData [
	"/**
	 * Clear the clipboard data.
	 *
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetClipboardData
	 */"

	^ self ffiCall: #(bool SDL_ClearClipboardData())
]

{ #category : 'public' }
LibSDL3 >> clearComposition: window [
	"/**
	 * Dismiss the composition window/IME without disabling the subsystem.
	 *
	 * \param window the window to affect.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_StartTextInput
	 * \sa SDL_StopTextInput
	 */"

	^ self ffiCall: #(bool SDL_ClearComposition(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> clearError [
	"/**
	 * Clear any previous error message for this thread.
	 *
	 * \returns true.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetError
	 * \sa SDL_SetError
	 */"

	^ self ffiCall: #(bool SDL_ClearError())
]

{ #category : 'public' }
LibSDL3 >> clearPropertyProps: props name: name [
	"/**
	 * Clear a property from a group of properties.
	 *
	 * \param props the properties to modify.
	 * \param name the name of the property to clear.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_ClearProperty(SDL_PropertiesID props, const char* name))
]

{ #category : 'public' }
LibSDL3 >> clearSurface: surface r: r g: g b: b a: a [
	"/**
	 * Clear a surface with a specific color, with floating point precision.
	 *
	 * This function handles all surface formats, and ignores any clip rectangle.
	 *
	 * If the surface is YUV, the color is assumed to be in the sRGB colorspace,
	 * otherwise the color is assumed to be in the colorspace of the suface.
	 *
	 * \param surface the SDL_Surface to clear.
	 * \param r the red component of the pixel, normally in the range 0-1.
	 * \param g the green component of the pixel, normally in the range 0-1.
	 * \param b the blue component of the pixel, normally in the range 0-1.
	 * \param a the alpha component of the pixel, normally in the range 0-1.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_ClearSurface(SDL_Surface* surface, float r, float g, float b, float a))
]

{ #category : 'public' }
LibSDL3 >> clickTrayEntry: entry [
	"/**
	 * Simulate a click on a tray entry.
	 *
	 * \param entry The entry to activate.
	 *
	 * \threadsafety This function should be called on the thread that created the
	 *               tray.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_ClickTrayEntry(SDL_TrayEntry* entry))
]

{ #category : 'public' }
LibSDL3 >> closeAsyncIO: asyncio flush: flush queue: queue userdata: userdata [
	"/**
	 * Close and free any allocated resources for an async I/O object.
	 *
	 * Closing a file is _also_ an asynchronous task! If a write failure were to
	 * happen during the closing process, for example, the task results will
	 * report it as usual.
	 *
	 * Closing a file that has been written to does not guarantee the data has
	 * made it to physical media; it may remain in the operating system's file
	 * cache, for later writing to disk. This means that a successfully-closed
	 * file can be lost if the system crashes or loses power in this small window.
	 * To prevent this, call this function with the `flush` parameter set to true.
	 * This will make the operation take longer, and perhaps increase system load
	 * in general, but a successful result guarantees that the data has made it to
	 * physical storage. Don't use this for temporary files, caches, and
	 * unimportant data, and definitely use it for crucial irreplaceable files,
	 * like game saves.
	 *
	 * This function guarantees that the close will happen after any other pending
	 * tasks to `asyncio`, so it's safe to open a file, start several operations,
	 * close the file immediately, then check for all results later. This function
	 * will not block until the tasks have completed.
	 *
	 * Once this function returns true, `asyncio` is no longer valid, regardless
	 * of any future outcomes. Any completed tasks might still contain this
	 * pointer in their SDL_AsyncIOOutcome data, in case the app was using this
	 * value to track information, but it should not be used again.
	 *
	 * If this function returns false, the close wasn't started at all, and it's
	 * safe to attempt to close again later.
	 *
	 * An SDL_AsyncIOQueue must be specified. The newly-created task will be added
	 * to it when it completes its work.
	 *
	 * \param asyncio a pointer to an SDL_AsyncIO structure to close.
	 * \param flush true if data should sync to disk before the task completes.
	 * \param queue a queue to add the new SDL_AsyncIO to.
	 * \param userdata an app-defined pointer that will be provided with the task
	 *                 results.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread, but two
	 *               threads should not attempt to close the same object.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_CloseAsyncIO(SDL_AsyncIO* asyncio, _Bool flush, SDL_AsyncIOQueue* queue, void* userdata))
]

{ #category : 'public' }
LibSDL3 >> closeAudioDevice: devid [
	"/**
	 * Close a previously-opened audio device.
	 *
	 * The application should close open audio devices once they are no longer
	 * needed.
	 *
	 * This function may block briefly while pending audio data is played by the
	 * hardware, so that applications don't drop the last buffer of data they
	 * supplied if terminating immediately afterwards.
	 *
	 * \param devid an audio device id previously returned by
	 *              SDL_OpenAudioDevice().
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_OpenAudioDevice
	 */"

	self ffiCall: #(void SDL_CloseAudioDevice(SDL_AudioDeviceID devid))
]

{ #category : 'public' }
LibSDL3 >> closeCamera: camera [
	"/**
	 * Use this function to shut down camera processing and close the camera
	 * device.
	 *
	 * \param camera opened camera device.
	 *
	 * \threadsafety It is safe to call this function from any thread, but no
	 *               thread may reference `device` once this function is called.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_OpenCamera
	 */"

	self ffiCall: #(void SDL_CloseCamera(SDL_Camera* camera))
]

{ #category : 'public' }
LibSDL3 >> closeIO: context [
	"/**
	 * Close and free an allocated SDL_IOStream structure.
	 *
	 * SDL_CloseIO() closes and cleans up the SDL_IOStream stream. It releases any
	 * resources used by the stream and frees the SDL_IOStream itself. This
	 * returns true on success, or false if the stream failed to flush to its
	 * output (e.g. to disk).
	 *
	 * Note that if this fails to flush the stream for any reason, this function
	 * reports an error, but the SDL_IOStream is still invalid once this function
	 * returns.
	 *
	 * This call flushes any buffered writes to the operating system, but there
	 * are no guarantees that those writes have gone to physical media; they might
	 * be in the OS's file cache, waiting to go to disk later. If it's absolutely
	 * crucial that writes go to disk immediately, so they are definitely stored
	 * even if the power fails before the file cache would have caught up, one
	 * should call SDL_FlushIO() before closing. Note that flushing takes time and
	 * makes the system and your app operate less efficiently, so do so sparingly.
	 *
	 * \param context SDL_IOStream structure to close.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_OpenIO
	 */"

	^ self ffiCall: #(bool SDL_CloseIO(SDL_IOStream* context))
]

{ #category : 'public' }
LibSDL3 >> closeJoystick: joystick [
	"/**
	 * Close a joystick previously opened with SDL_OpenJoystick().
	 *
	 * \param joystick the joystick device to close.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_OpenJoystick
	 */"

	self ffiCall: #(void SDL_CloseJoystick(SDL_Joystick* joystick))
]

{ #category : 'public' }
LibSDL3 >> closeSensor: sensor [
	"/**
	 * Close a sensor previously opened with SDL_OpenSensor().
	 *
	 * \param sensor the SDL_Sensor object to close.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_CloseSensor(SDL_Sensor* sensor))
]

{ #category : 'public' }
LibSDL3 >> compareAndSwapAtomicIntA: a oldval: oldval newval: newval [
	"/**
	 * Set an atomic variable to a new value if it is currently an old value.
	 *
	 * ***Note: If you don't know what this function is for, you shouldn't use
	 * it!***
	 *
	 * \param a a pointer to an SDL_AtomicInt variable to be modified.
	 * \param oldval the old value.
	 * \param newval the new value.
	 * \returns true if the atomic variable was set, false otherwise.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetAtomicInt
	 * \sa SDL_SetAtomicInt
	 */"

	^ self ffiCall: #(bool SDL_CompareAndSwapAtomicInt(SDL_AtomicInt* a, int oldval, int newval))
]

{ #category : 'public' }
LibSDL3 >> compareAndSwapAtomicPointerA: a oldval: oldval newval: newval [
	"/**
	 * Set a pointer to a new value if it is currently an old value.
	 *
	 * ***Note: If you don't know what this function is for, you shouldn't use
	 * it!***
	 *
	 * \param a a pointer to a pointer.
	 * \param oldval the old pointer value.
	 * \param newval the new pointer value.
	 * \returns true if the pointer was set, false otherwise.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CompareAndSwapAtomicInt
	 * \sa SDL_GetAtomicPointer
	 * \sa SDL_SetAtomicPointer
	 */"

	^ self ffiCall: #(bool SDL_CompareAndSwapAtomicPointer(void** a, void* oldval, void* newval))
]

{ #category : 'public' }
LibSDL3 >> compareAndSwapAtomicU32A: a oldval: oldval newval: newval [
	"/**
	 * Set an atomic variable to a new value if it is currently an old value.
	 *
	 * ***Note: If you don't know what this function is for, you shouldn't use
	 * it!***
	 *
	 * \param a a pointer to an SDL_AtomicU32 variable to be modified.
	 * \param oldval the old value.
	 * \param newval the new value.
	 * \returns true if the atomic variable was set, false otherwise.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetAtomicU32
	 * \sa SDL_SetAtomicU32
	 */"

	^ self ffiCall: #(bool SDL_CompareAndSwapAtomicU32(SDL_AtomicU32* a, Uint32 oldval, Uint32 newval))
]

{ #category : 'public' }
LibSDL3 >> composeCustomBlendModeSrcColorFactor: srcColorFactor dstColorFactor: dstColorFactor colorOperation: colorOperation srcAlphaFactor: srcAlphaFactor dstAlphaFactor: dstAlphaFactor alphaOperation: alphaOperation [
	"/**
	 * Compose a custom blend mode for renderers.
	 *
	 * The functions SDL_SetRenderDrawBlendMode and SDL_SetTextureBlendMode accept
	 * the SDL_BlendMode returned by this function if the renderer supports it.
	 *
	 * A blend mode controls how the pixels from a drawing operation (source) get
	 * combined with the pixels from the render target (destination). First, the
	 * components of the source and destination pixels get multiplied with their
	 * blend factors. Then, the blend operation takes the two products and
	 * calculates the result that will get stored in the render target.
	 *
	 * Expressed in pseudocode, it would look like this:
	 *
	 * ```c
	 * dstRGB = colorOperation(srcRGB * srcColorFactor, dstRGB * dstColorFactor);
	 * dstA = alphaOperation(srcA * srcAlphaFactor, dstA * dstAlphaFactor);
	 * ```
	 *
	 * Where the functions `colorOperation(src, dst)` and `alphaOperation(src,
	 * dst)` can return one of the following:
	 *
	 * - `src + dst`
	 * - `src - dst`
	 * - `dst - src`
	 * - `min(src, dst)`
	 * - `max(src, dst)`
	 *
	 * The red, green, and blue components are always multiplied with the first,
	 * second, and third components of the SDL_BlendFactor, respectively. The
	 * fourth component is not used.
	 *
	 * The alpha component is always multiplied with the fourth component of the
	 * SDL_BlendFactor. The other components are not used in the alpha
	 * calculation.
	 *
	 * Support for these blend modes varies for each renderer. To check if a
	 * specific SDL_BlendMode is supported, create a renderer and pass it to
	 * either SDL_SetRenderDrawBlendMode or SDL_SetTextureBlendMode. They will
	 * return with an error if the blend mode is not supported.
	 *
	 * This list describes the support of custom blend modes for each renderer.
	 * All renderers support the four blend modes listed in the SDL_BlendMode
	 * enumeration.
	 *
	 * - **direct3d**: Supports all operations with all factors. However, some
	 *   factors produce unexpected results with `SDL_BLENDOPERATION_MINIMUM` and
	 *   `SDL_BLENDOPERATION_MAXIMUM`.
	 * - **direct3d11**: Same as Direct3D 9.
	 * - **opengl**: Supports the `SDL_BLENDOPERATION_ADD` operation with all
	 *   factors. OpenGL versions 1.1, 1.2, and 1.3 do not work correctly here.
	 * - **opengles2**: Supports the `SDL_BLENDOPERATION_ADD`,
	 *   `SDL_BLENDOPERATION_SUBTRACT`, `SDL_BLENDOPERATION_REV_SUBTRACT`
	 *   operations with all factors.
	 * - **psp**: No custom blend mode support.
	 * - **software**: No custom blend mode support.
	 *
	 * Some renderers do not provide an alpha component for the default render
	 * target. The `SDL_BLENDFACTOR_DST_ALPHA` and
	 * `SDL_BLENDFACTOR_ONE_MINUS_DST_ALPHA` factors do not have an effect in this
	 * case.
	 *
	 * \param srcColorFactor the SDL_BlendFactor applied to the red, green, and
	 *                       blue components of the source pixels.
	 * \param dstColorFactor the SDL_BlendFactor applied to the red, green, and
	 *                       blue components of the destination pixels.
	 * \param colorOperation the SDL_BlendOperation used to combine the red,
	 *                       green, and blue components of the source and
	 *                       destination pixels.
	 * \param srcAlphaFactor the SDL_BlendFactor applied to the alpha component of
	 *                       the source pixels.
	 * \param dstAlphaFactor the SDL_BlendFactor applied to the alpha component of
	 *                       the destination pixels.
	 * \param alphaOperation the SDL_BlendOperation used to combine the alpha
	 *                       component of the source and destination pixels.
	 * \returns an SDL_BlendMode that represents the chosen factors and
	 *          operations.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetRenderDrawBlendMode
	 * \sa SDL_GetRenderDrawBlendMode
	 * \sa SDL_SetTextureBlendMode
	 * \sa SDL_GetTextureBlendMode
	 */"

	^ self ffiCall: #(SDL_BlendMode SDL_ComposeCustomBlendMode(SDL_BlendFactor srcColorFactor, SDL_BlendFactor dstColorFactor, SDL_BlendOperation colorOperation, SDL_BlendFactor srcAlphaFactor, SDL_BlendFactor dstAlphaFactor, SDL_BlendOperation alphaOperation))
]

{ #category : 'public' }
LibSDL3 >> convertAudioSamplesSrcSpec: src_spec srcData: src_data srcLen: src_len dstSpec: dst_spec dstData: dst_data dstLen: dst_len [
	"/**
	 * Convert some audio data of one format to another format.
	 *
	 * Please note that this function is for convenience, but should not be used
	 * to resample audio in blocks, as it will introduce audio artifacts on the
	 * boundaries. You should only use this function if you are converting audio
	 * data in its entirety in one call. If you want to convert audio in smaller
	 * chunks, use an SDL_AudioStream, which is designed for this situation.
	 *
	 * Internally, this function creates and destroys an SDL_AudioStream on each
	 * use, so it's also less efficient than using one directly, if you need to
	 * convert multiple times.
	 *
	 * \param src_spec the format details of the input audio.
	 * \param src_data the audio data to be converted.
	 * \param src_len the len of src_data.
	 * \param dst_spec the format details of the output audio.
	 * \param dst_data will be filled with a pointer to converted audio data,
	 *                 which should be freed with SDL_free(). On error, it will be
	 *                 NULL.
	 * \param dst_len will be filled with the len of dst_data.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_ConvertAudioSamples(SDL_AudioSpec* src_spec, const Uint8* src_data, int src_len, SDL_AudioSpec* dst_spec, Uint8** dst_data, int* dst_len))
]

{ #category : 'public' }
LibSDL3 >> convertEventToRenderCoordinatesRenderer: renderer event: event [
	"/**
	 * Convert the coordinates in an event to render coordinates.
	 *
	 * This takes into account several states:
	 *
	 * - The window dimensions.
	 * - The logical presentation settings (SDL_SetRenderLogicalPresentation)
	 * - The scale (SDL_SetRenderScale)
	 * - The viewport (SDL_SetRenderViewport)
	 *
	 * Various event types are converted with this function: mouse, touch, pen,
	 * etc.
	 *
	 * Touch coordinates are converted from normalized coordinates in the window
	 * to non-normalized rendering coordinates.
	 *
	 * Relative mouse coordinates (xrel and yrel event fields) are _also_
	 * converted. Applications that do not want these fields converted should use
	 * SDL_RenderCoordinatesFromWindow() on the specific event fields instead of
	 * converting the entire event structure.
	 *
	 * Once converted, coordinates may be outside the rendering area.
	 *
	 * \param renderer the rendering context.
	 * \param event the event to modify.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_RenderCoordinatesFromWindow
	 */"

	^ self ffiCall: #(bool SDL_ConvertEventToRenderCoordinates(SDL_Renderer* renderer, SDL_Event* event))
]

{ #category : 'public' }
LibSDL3 >> convertPixelsAndColorspaceWidth: width height: height srcFormat: src_format srcColorspace: src_colorspace srcProperties: src_properties src: src srcPitch: src_pitch dstFormat: dst_format dstColorspace: dst_colorspace dstProperties: dst_properties dst: dst dstPitch: dst_pitch [
	"/**
	 * Copy a block of pixels of one format and colorspace to another format and
	 * colorspace.
	 *
	 * \param width the width of the block to copy, in pixels.
	 * \param height the height of the block to copy, in pixels.
	 * \param src_format an SDL_PixelFormat value of the `src` pixels format.
	 * \param src_colorspace an SDL_Colorspace value describing the colorspace of
	 *                       the `src` pixels.
	 * \param src_properties an SDL_PropertiesID with additional source color
	 *                       properties, or 0.
	 * \param src a pointer to the source pixels.
	 * \param src_pitch the pitch of the source pixels, in bytes.
	 * \param dst_format an SDL_PixelFormat value of the `dst` pixels format.
	 * \param dst_colorspace an SDL_Colorspace value describing the colorspace of
	 *                       the `dst` pixels.
	 * \param dst_properties an SDL_PropertiesID with additional destination color
	 *                       properties, or 0.
	 * \param dst a pointer to be filled in with new pixel data.
	 * \param dst_pitch the pitch of the destination pixels, in bytes.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety The same destination pixels should not be used from two
	 *               threads at once. It is safe to use the same source pixels
	 *               from multiple threads.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_ConvertPixels
	 */"

	^ self ffiCall: #(bool SDL_ConvertPixelsAndColorspace(int width, int height, SDL_PixelFormat src_format, SDL_Colorspace src_colorspace, SDL_PropertiesID src_properties, const void* src, int src_pitch, SDL_PixelFormat dst_format, SDL_Colorspace dst_colorspace, SDL_PropertiesID dst_properties, void* dst, int dst_pitch))
]

{ #category : 'public' }
LibSDL3 >> convertPixelsWidth: width height: height srcFormat: src_format src: src srcPitch: src_pitch dstFormat: dst_format dst: dst dstPitch: dst_pitch [
	"/**
	 * Copy a block of pixels of one format to another format.
	 *
	 * \param width the width of the block to copy, in pixels.
	 * \param height the height of the block to copy, in pixels.
	 * \param src_format an SDL_PixelFormat value of the `src` pixels format.
	 * \param src a pointer to the source pixels.
	 * \param src_pitch the pitch of the source pixels, in bytes.
	 * \param dst_format an SDL_PixelFormat value of the `dst` pixels format.
	 * \param dst a pointer to be filled in with new pixel data.
	 * \param dst_pitch the pitch of the destination pixels, in bytes.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety The same destination pixels should not be used from two
	 *               threads at once. It is safe to use the same source pixels
	 *               from multiple threads.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_ConvertPixelsAndColorspace
	 */"

	^ self ffiCall: #(bool SDL_ConvertPixels(int width, int height, SDL_PixelFormat src_format, const void* src, int src_pitch, SDL_PixelFormat dst_format, void* dst, int dst_pitch))
]

{ #category : 'public' }
LibSDL3 >> convertSurface: surface format: format [
	"/**
	 * Copy an existing surface to a new surface of the specified format.
	 *
	 * This function is used to optimize images for faster *repeat* blitting. This
	 * is accomplished by converting the original and storing the result as a new
	 * surface. The new, optimized surface can then be used as the source for
	 * future blits, making them faster.
	 *
	 * If you are converting to an indexed surface and want to map colors to a
	 * palette, you can use SDL_ConvertSurfaceAndColorspace() instead.
	 *
	 * If the original surface has alternate images, the new surface will have a
	 * reference to them as well.
	 *
	 * \param surface the existing SDL_Surface structure to convert.
	 * \param format the new pixel format.
	 * \returns the new SDL_Surface structure that is created or NULL on failure;
	 *          call SDL_GetError() for more information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_ConvertSurfaceAndColorspace
	 * \sa SDL_DestroySurface
	 */"

	^ self ffiCall: #(SDL_Surface* SDL_ConvertSurface(SDL_Surface* surface, SDL_PixelFormat format))
]

{ #category : 'public' }
LibSDL3 >> convertSurfaceAndColorspaceSurface: surface format: format palette: palette colorspace: colorspace props: props [
	"/**
	 * Copy an existing surface to a new surface of the specified format and
	 * colorspace.
	 *
	 * This function converts an existing surface to a new format and colorspace
	 * and returns the new surface. This will perform any pixel format and
	 * colorspace conversion needed.
	 *
	 * If the original surface has alternate images, the new surface will have a
	 * reference to them as well.
	 *
	 * \param surface the existing SDL_Surface structure to convert.
	 * \param format the new pixel format.
	 * \param palette an optional palette to use for indexed formats, may be NULL.
	 * \param colorspace the new colorspace.
	 * \param props an SDL_PropertiesID with additional color properties, or 0.
	 * \returns the new SDL_Surface structure that is created or NULL on failure;
	 *          call SDL_GetError() for more information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_ConvertSurface
	 * \sa SDL_DestroySurface
	 */"

	^ self ffiCall: #(SDL_Surface* SDL_ConvertSurfaceAndColorspace(SDL_Surface* surface, SDL_PixelFormat format, SDL_Palette* palette, SDL_Colorspace colorspace, SDL_PropertiesID props))
]

{ #category : 'public' }
LibSDL3 >> copyFileOldpath: oldpath newpath: newpath [
	"/**
	 * Copy a file.
	 *
	 * If the file at `newpath` already exists, it will be overwritten with the
	 * contents of the file at `oldpath`.
	 *
	 * This function will block until the copy is complete, which might be a
	 * significant time for large files on slow disks. On some platforms, the copy
	 * can be handed off to the OS itself, but on others SDL might just open both
	 * paths, and read from one and write to the other.
	 *
	 * Note that this is not an atomic operation! If something tries to read from
	 * `newpath` while the copy is in progress, it will see an incomplete copy of
	 * the data, and if the calling thread terminates (or the power goes out)
	 * during the copy, `newpath`'s previous contents will be gone, replaced with
	 * an incomplete copy of the data. To avoid this risk, it is recommended that
	 * the app copy to a temporary file in the same directory as `newpath`, and if
	 * the copy is successful, use SDL_RenamePath() to replace `newpath` with the
	 * temporary file. This will ensure that reads of `newpath` will either see a
	 * complete copy of the data, or it will see the pre-copy state of `newpath`.
	 *
	 * This function attempts to synchronize the newly-copied data to disk before
	 * returning, if the platform allows it, so that the renaming trick will not
	 * have a problem in a system crash or power failure, where the file could be
	 * renamed but the contents never made it from the system file cache to the
	 * physical disk.
	 *
	 * If the copy fails for any reason, the state of `newpath` is undefined. It
	 * might be half a copy, it might be the untouched data of what was already
	 * there, or it might be a zero-byte file, etc.
	 *
	 * \param oldpath the old path.
	 * \param newpath the new path.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_CopyFile(const char* oldpath, const char* newpath))
]

{ #category : 'public' }
LibSDL3 >> copyGPUBufferToBufferCopyPass: copy_pass source: source destination: destination size: size cycle: cycle [
	"/**
	 * Performs a buffer-to-buffer copy.
	 *
	 * This copy occurs on the GPU timeline. You may assume the copy has finished
	 * in subsequent commands.
	 *
	 * \param copy_pass a copy pass handle.
	 * \param source the buffer and offset to copy from.
	 * \param destination the buffer and offset to copy to.
	 * \param size the length of the buffer to copy.
	 * \param cycle if true, cycles the destination buffer if it is already bound,
	 *              otherwise overwrites the data.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_CopyGPUBufferToBuffer(SDL_GPUCopyPass* copy_pass, SDL_GPUBufferLocation* source, SDL_GPUBufferLocation* destination, Uint32 size, _Bool cycle))
]

{ #category : 'public' }
LibSDL3 >> copyGPUTextureToTextureCopyPass: copy_pass source: source destination: destination w: w h: h d: d cycle: cycle [
	"/**
	 * Performs a texture-to-texture copy.
	 *
	 * This copy occurs on the GPU timeline. You may assume the copy has finished
	 * in subsequent commands.
	 *
	 * \param copy_pass a copy pass handle.
	 * \param source a source texture region.
	 * \param destination a destination texture region.
	 * \param w the width of the region to copy.
	 * \param h the height of the region to copy.
	 * \param d the depth of the region to copy.
	 * \param cycle if true, cycles the destination texture if the destination
	 *              texture is bound, otherwise overwrites the data.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_CopyGPUTextureToTexture(SDL_GPUCopyPass* copy_pass, SDL_GPUTextureLocation* source, SDL_GPUTextureLocation* destination, Uint32 w, Uint32 h, Uint32 d, _Bool cycle))
]

{ #category : 'public' }
LibSDL3 >> copyPropertiesSrc: src dst: dst [
	"/**
	 * Copy a group of properties.
	 *
	 * Copy all the properties from one group of properties to another, with the
	 * exception of properties requiring cleanup (set using
	 * SDL_SetPointerPropertyWithCleanup()), which will not be copied. Any
	 * property that already exists on `dst` will be overwritten.
	 *
	 * \param src the properties to copy.
	 * \param dst the destination properties.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_CopyProperties(SDL_PropertiesID src, SDL_PropertiesID dst))
]

{ #category : 'public' }
LibSDL3 >> copysignX: x y: y [
	"/**
	 * Copy the sign of one floating-point value to another.
	 *
	 * The definition of copysign is that ``copysign(x, y) = abs(x) * sign(y)``.
	 *
	 * Domain: `-INF <= x <= INF`, ``-INF <= y <= f``
	 *
	 * Range: `-INF <= z <= INF`
	 *
	 * This function operates on double-precision floating point values, use
	 * SDL_copysignf for single-precision floats.
	 *
	 * \param x floating point value to use as the magnitude.
	 * \param y floating point value to use as the sign.
	 * \returns the floating point value with the sign of y and the magnitude of
	 *          x.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_copysignf
	 * \sa SDL_fabs
	 */"

	^ self ffiCall: #(double SDL_copysign(double x, double y))
]

{ #category : 'public' }
LibSDL3 >> copysignfX: x y: y [
	"/**
	 * Copy the sign of one floating-point value to another.
	 *
	 * The definition of copysign is that ``copysign(x, y) = abs(x) * sign(y)``.
	 *
	 * Domain: `-INF <= x <= INF`, ``-INF <= y <= f``
	 *
	 * Range: `-INF <= z <= INF`
	 *
	 * This function operates on single-precision floating point values, use
	 * SDL_copysign for double-precision floats.
	 *
	 * \param x floating point value to use as the magnitude.
	 * \param y floating point value to use as the sign.
	 * \returns the floating point value with the sign of y and the magnitude of
	 *          x.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_copysign
	 * \sa SDL_fabsf
	 */"

	^ self ffiCall: #(float SDL_copysignf(float x, float y))
]

{ #category : 'public' }
LibSDL3 >> cos: x [
	"/**
	 * Compute the cosine of `x`.
	 *
	 * Domain: `-INF <= x <= INF`
	 *
	 * Range: `-1 <= y <= 1`
	 *
	 * This function operates on double-precision floating point values, use
	 * SDL_cosf for single-precision floats.
	 *
	 * This function may use a different approximation across different versions,
	 * platforms and configurations. i.e, it can return a different value given
	 * the same input on different machines or operating systems, or if SDL is
	 * updated.
	 *
	 * \param x floating point value, in radians.
	 * \returns cosine of `x`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_cosf
	 * \sa SDL_acos
	 * \sa SDL_sin
	 */"

	^ self ffiCall: #(double SDL_cos(double x))
]

{ #category : 'public' }
LibSDL3 >> cosf: x [
	"/**
	 * Compute the cosine of `x`.
	 *
	 * Domain: `-INF <= x <= INF`
	 *
	 * Range: `-1 <= y <= 1`
	 *
	 * This function operates on single-precision floating point values, use
	 * SDL_cos for double-precision floats.
	 *
	 * This function may use a different approximation across different versions,
	 * platforms and configurations. i.e, it can return a different value given
	 * the same input on different machines or operating systems, or if SDL is
	 * updated.
	 *
	 * \param x floating point value, in radians.
	 * \returns cosine of `x`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_cos
	 * \sa SDL_acosf
	 * \sa SDL_sinf
	 */"

	^ self ffiCall: #(float SDL_cosf(float x))
]

{ #category : 'public' }
LibSDL3 >> crc16Crc: crc data: data len: len [
	"/**
	 * Calculate a CRC-16 value.
	 *
	 * https://en.wikipedia.org/wiki/Cyclic_redundancy_check
	 *
	 * This function can be called multiple times, to stream data to be
	 * checksummed in blocks. Each call must provide the previous CRC-16 return
	 * value to be updated with the next block. The first call to this function
	 * for a set of blocks should pass in a zero CRC value.
	 *
	 * \param crc the current checksum for this data set, or 0 for a new data set.
	 * \param data a new block of data to add to the checksum.
	 * \param len the size, in bytes, of the new block of data.
	 * \returns a CRC-16 checksum value of all blocks in the data set.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(Uint16 SDL_crc16(Uint16 crc, const void* data, size_t len))
]

{ #category : 'public' }
LibSDL3 >> crc32Crc: crc data: data len: len [
	"/**
	 * Calculate a CRC-32 value.
	 *
	 * https://en.wikipedia.org/wiki/Cyclic_redundancy_check
	 *
	 * This function can be called multiple times, to stream data to be
	 * checksummed in blocks. Each call must provide the previous CRC-32 return
	 * value to be updated with the next block. The first call to this function
	 * for a set of blocks should pass in a zero CRC value.
	 *
	 * \param crc the current checksum for this data set, or 0 for a new data set.
	 * \param data a new block of data to add to the checksum.
	 * \param len the size, in bytes, of the new block of data.
	 * \returns a CRC-32 checksum value of all blocks in the data set.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(Uint32 SDL_crc32(Uint32 crc, const void* data, size_t len))
]

{ #category : 'public' }
LibSDL3 >> cursorVisible [
	"/**
	 * Return whether the cursor is currently being shown.
	 *
	 * \returns `true` if the cursor is being shown, or `false` if the cursor is
	 *          hidden.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_HideCursor
	 * \sa SDL_ShowCursor
	 */"

	^ self ffiCall: #(bool SDL_CursorVisible())
]

{ #category : 'public' }
LibSDL3 >> dateTimeToTimeDt: dt ticks: ticks [
	"/**
	 * Converts a calendar time to an SDL_Time in nanoseconds since the epoch.
	 *
	 * This function ignores the day_of_week member of the SDL_DateTime struct, so
	 * it may remain unset.
	 *
	 * \param dt the source SDL_DateTime.
	 * \param ticks the resulting SDL_Time.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_DateTimeToTime(SDL_DateTime* dt, SDL_Time* ticks))
]

{ #category : 'public' }
LibSDL3 >> delay: ms [
	"/**
	 * Wait a specified number of milliseconds before returning.
	 *
	 * This function waits a specified number of milliseconds before returning. It
	 * waits at least the specified time, but possibly longer due to OS
	 * scheduling.
	 *
	 * \param ms the number of milliseconds to delay.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_DelayNS
	 * \sa SDL_DelayPrecise
	 */"

	self ffiCall: #(void SDL_Delay(Uint32 ms))
]

{ #category : 'public' }
LibSDL3 >> delayNS: ns [
	"/**
	 * Wait a specified number of nanoseconds before returning.
	 *
	 * This function waits a specified number of nanoseconds before returning. It
	 * waits at least the specified time, but possibly longer due to OS
	 * scheduling.
	 *
	 * \param ns the number of nanoseconds to delay.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_Delay
	 * \sa SDL_DelayPrecise
	 */"

	self ffiCall: #(void SDL_DelayNS(Uint64 ns))
]

{ #category : 'public' }
LibSDL3 >> delayPrecise: ns [
	"/**
	 * Wait a specified number of nanoseconds before returning.
	 *
	 * This function waits a specified number of nanoseconds before returning. It
	 * will attempt to wait as close to the requested time as possible, busy
	 * waiting if necessary, but could return later due to OS scheduling.
	 *
	 * \param ns the number of nanoseconds to delay.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_Delay
	 * \sa SDL_DelayNS
	 */"

	self ffiCall: #(void SDL_DelayPrecise(Uint64 ns))
]

{ #category : 'public' }
LibSDL3 >> destroyAsyncIOQueue: queue [
	"/**
	 * Destroy a previously-created async I/O task queue.
	 *
	 * If there are still tasks pending for this queue, this call will block until
	 * those tasks are finished. All those tasks will be deallocated. Their
	 * results will be lost to the app.
	 *
	 * Any pending reads from SDL_LoadFileAsync() that are still in this queue
	 * will have their buffers deallocated by this function, to prevent a memory
	 * leak.
	 *
	 * Once this function is called, the queue is no longer valid and should not
	 * be used, including by other threads that might access it while destruction
	 * is blocking on pending tasks.
	 *
	 * Do not destroy a queue that still has threads waiting on it through
	 * SDL_WaitAsyncIOResult(). You can call SDL_SignalAsyncIOQueue() first to
	 * unblock those threads, and take measures (such as SDL_WaitThread()) to make
	 * sure they have finished their wait and won't wait on the queue again.
	 *
	 * \param queue the task queue to destroy.
	 *
	 * \threadsafety It is safe to call this function from any thread, so long as
	 *               no other thread is waiting on the queue with
	 *               SDL_WaitAsyncIOResult.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_DestroyAsyncIOQueue(SDL_AsyncIOQueue* queue))
]

{ #category : 'public' }
LibSDL3 >> destroyAudioStream: stream [
	"/**
	 * Free an audio stream.
	 *
	 * This will release all allocated data, including any audio that is still
	 * queued. You do not need to manually clear the stream first.
	 *
	 * If this stream was bound to an audio device, it is unbound during this
	 * call. If this stream was created with SDL_OpenAudioDeviceStream, the audio
	 * device that was opened alongside this stream's creation will be closed,
	 * too.
	 *
	 * \param stream the audio stream to destroy.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateAudioStream
	 */"

	self ffiCall: #(void SDL_DestroyAudioStream(SDL_AudioStream* stream))
]

{ #category : 'public' }
LibSDL3 >> destroyCondition: cond [
	"/**
	 * Destroy a condition variable.
	 *
	 * \param cond the condition variable to destroy.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateCondition
	 */"

	self ffiCall: #(void SDL_DestroyCondition(SDL_Condition* cond))
]

{ #category : 'public' }
LibSDL3 >> destroyCursor: cursor [
	"/**
	 * Free a previously-created cursor.
	 *
	 * Use this function to free cursor resources created with SDL_CreateCursor(),
	 * SDL_CreateColorCursor() or SDL_CreateSystemCursor().
	 *
	 * \param cursor the cursor to free.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateColorCursor
	 * \sa SDL_CreateCursor
	 * \sa SDL_CreateSystemCursor
	 */"

	self ffiCall: #(void SDL_DestroyCursor(SDL_Cursor* cursor))
]

{ #category : 'public' }
LibSDL3 >> destroyEnvironment: env [
	"/**
	 * Destroy a set of environment variables.
	 *
	 * \param env the environment to destroy.
	 *
	 * \threadsafety It is safe to call this function from any thread, as long as
	 *               the environment is no longer in use.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateEnvironment
	 */"

	self ffiCall: #(void SDL_DestroyEnvironment(SDL_Environment* env))
]

{ #category : 'public' }
LibSDL3 >> destroyGPUDevice: device [
	"/**
	 * Destroys a GPU context previously returned by SDL_CreateGPUDevice.
	 *
	 * \param device a GPU Context to destroy.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateGPUDevice
	 */"

	self ffiCall: #(void SDL_DestroyGPUDevice(SDL_GPUDevice* device))
]

{ #category : 'public' }
LibSDL3 >> destroyMutex: mutex [
	"/**
	 * Destroy a mutex created with SDL_CreateMutex().
	 *
	 * This function must be called on any mutex that is no longer needed. Failure
	 * to destroy a mutex will result in a system memory or resource leak. While
	 * it is safe to destroy a mutex that is _unlocked_, it is not safe to attempt
	 * to destroy a locked mutex, and may result in undefined behavior depending
	 * on the platform.
	 *
	 * \param mutex the mutex to destroy.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateMutex
	 */"

	self ffiCall: #(void SDL_DestroyMutex(SDL_Mutex* mutex))
]

{ #category : 'public' }
LibSDL3 >> destroyPalette: palette [
	"/**
	 * Free a palette created with SDL_CreatePalette().
	 *
	 * \param palette the SDL_Palette structure to be freed.
	 *
	 * \threadsafety It is safe to call this function from any thread, as long as
	 *               the palette is not modified or destroyed in another thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreatePalette
	 */"

	self ffiCall: #(void SDL_DestroyPalette(SDL_Palette* palette))
]

{ #category : 'public' }
LibSDL3 >> destroyProperties: props [
	"/**
	 * Destroy a group of properties.
	 *
	 * All properties are deleted and their cleanup functions will be called, if
	 * any.
	 *
	 * \param props the properties to destroy.
	 *
	 * \threadsafety This function should not be called while these properties are
	 *               locked or other threads might be setting or getting values
	 *               from these properties.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateProperties
	 */"

	self ffiCall: #(void SDL_DestroyProperties(SDL_PropertiesID props))
]

{ #category : 'public' }
LibSDL3 >> destroyRWLock: rwlock [
	"/**
	 * Destroy a read/write lock created with SDL_CreateRWLock().
	 *
	 * This function must be called on any read/write lock that is no longer
	 * needed. Failure to destroy a rwlock will result in a system memory or
	 * resource leak. While it is safe to destroy a rwlock that is _unlocked_, it
	 * is not safe to attempt to destroy a locked rwlock, and may result in
	 * undefined behavior depending on the platform.
	 *
	 * \param rwlock the rwlock to destroy.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateRWLock
	 */"

	self ffiCall: #(void SDL_DestroyRWLock(SDL_RWLock* rwlock))
]

{ #category : 'public' }
LibSDL3 >> destroyRenderer: renderer [
	"/**
	 * Destroy the rendering context for a window and free all associated
	 * textures.
	 *
	 * This should be called before destroying the associated window.
	 *
	 * \param renderer the rendering context.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateRenderer
	 */"

	self ffiCall: #(void SDL_DestroyRenderer(SDL_Renderer* renderer))
]

{ #category : 'public' }
LibSDL3 >> destroySemaphore: sem [
	"/**
	 * Destroy a semaphore.
	 *
	 * It is not safe to destroy a semaphore if there are threads currently
	 * waiting on it.
	 *
	 * \param sem the semaphore to destroy.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateSemaphore
	 */"

	self ffiCall: #(void SDL_DestroySemaphore(SDL_Semaphore* sem))
]

{ #category : 'public' }
LibSDL3 >> destroySurface: surface [
	"/**
	 * Free a surface.
	 *
	 * It is safe to pass NULL to this function.
	 *
	 * \param surface the SDL_Surface to free.
	 *
	 * \threadsafety No other thread should be using the surface when it is freed.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateSurface
	 * \sa SDL_CreateSurfaceFrom
	 */"

	self ffiCall: #(void SDL_DestroySurface(SDL_Surface* surface))
]

{ #category : 'public' }
LibSDL3 >> destroyTexture: texture [
	"/**
	 * Destroy the specified texture.
	 *
	 * Passing NULL or an otherwise invalid texture will set the SDL error message
	 * to ""Invalid texture"".
	 *
	 * \param texture the texture to destroy.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateTexture
	 * \sa SDL_CreateTextureFromSurface
	 */"

	self ffiCall: #(void SDL_DestroyTexture(SDL_Texture* texture))
]

{ #category : 'public' }
LibSDL3 >> destroyTray: tray [
	"/**
	 * Destroys a tray object.
	 *
	 * This also destroys all associated menus and entries.
	 *
	 * \param tray the tray icon to be destroyed.
	 *
	 * \threadsafety This function should be called on the thread that created the
	 *               tray.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateTray
	 */"

	self ffiCall: #(void SDL_DestroyTray(SDL_Tray* tray))
]

{ #category : 'public' }
LibSDL3 >> destroyWindow: window [
	"/**
	 * Destroy a window.
	 *
	 * Any child windows owned by the window will be recursively destroyed as
	 * well.
	 *
	 * Note that on some platforms, the visible window may not actually be removed
	 * from the screen until the SDL event loop is pumped again, even though the
	 * SDL_Window is no longer valid after this call.
	 *
	 * \param window the window to destroy.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreatePopupWindow
	 * \sa SDL_CreateWindow
	 * \sa SDL_CreateWindowWithProperties
	 */"

	self ffiCall: #(void SDL_DestroyWindow(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> destroyWindowSurface: window [
	"/**
	 * Destroy the surface associated with the window.
	 *
	 * \param window the window to update.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetWindowSurface
	 * \sa SDL_WindowHasSurface
	 */"

	^ self ffiCall: #(bool SDL_DestroyWindowSurface(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> detachThread: thread [
	"/**
	 * Let a thread clean up on exit without intervention.
	 *
	 * A thread may be ""detached"" to signify that it should not remain until
	 * another thread has called SDL_WaitThread() on it. Detaching a thread is
	 * useful for long-running threads that nothing needs to synchronize with or
	 * further manage. When a detached thread is done, it simply goes away.
	 *
	 * There is no way to recover the return code of a detached thread. If you
	 * need this, don't detach the thread and instead use SDL_WaitThread().
	 *
	 * Once a thread is detached, you should usually assume the SDL_Thread isn't
	 * safe to reference again, as it will become invalid immediately upon the
	 * detached thread's exit, instead of remaining until someone has called
	 * SDL_WaitThread() to finally clean it up. As such, don't detach the same
	 * thread more than once.
	 *
	 * If a thread has already exited when passed to SDL_DetachThread(), it will
	 * stop waiting for a call to SDL_WaitThread() and clean up immediately. It is
	 * not safe to detach a thread that might be used with SDL_WaitThread().
	 *
	 * You may not call SDL_WaitThread() on a thread that has been detached. Use
	 * either that function or this one, but not both, or behavior is undefined.
	 *
	 * It is safe to pass NULL to this function; it is a no-op.
	 *
	 * \param thread the SDL_Thread pointer that was returned from the
	 *               SDL_CreateThread() call that started this thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateThread
	 * \sa SDL_WaitThread
	 */"

	self ffiCall: #(void SDL_DetachThread(SDL_Thread* thread))
]

{ #category : 'public' }
LibSDL3 >> detachVirtualJoystick: instance_id [
	"/**
	 * Detach a virtual joystick.
	 *
	 * \param instance_id the joystick instance ID, previously returned from
	 *                    SDL_AttachVirtualJoystick().
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_AttachVirtualJoystick
	 */"

	^ self ffiCall: #(bool SDL_DetachVirtualJoystick(SDL_JoystickID instance_id))
]

{ #category : 'public' }
LibSDL3 >> disableScreenSaver [
	"/**
	 * Prevent the screen from being blanked by a screen saver.
	 *
	 * If you disable the screensaver, it is automatically re-enabled when SDL
	 * quits.
	 *
	 * The screensaver is disabled by default, but this may by changed by
	 * SDL_HINT_VIDEO_ALLOW_SCREENSAVER.
	 *
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_EnableScreenSaver
	 * \sa SDL_ScreenSaverEnabled
	 */"

	^ self ffiCall: #(bool SDL_DisableScreenSaver())
]

{ #category : 'public' }
LibSDL3 >> dispatchGPUComputeComputePass: compute_pass groupcountX: groupcount_x groupcountY: groupcount_y groupcountZ: groupcount_z [
	"/**
	 * Dispatches compute work.
	 *
	 * You must not call this function before binding a compute pipeline.
	 *
	 * A VERY IMPORTANT NOTE If you dispatch multiple times in a compute pass, and
	 * the dispatches write to the same resource region as each other, there is no
	 * guarantee of which order the writes will occur. If the write order matters,
	 * you MUST end the compute pass and begin another one.
	 *
	 * \param compute_pass a compute pass handle.
	 * \param groupcount_x number of local workgroups to dispatch in the X
	 *                     dimension.
	 * \param groupcount_y number of local workgroups to dispatch in the Y
	 *                     dimension.
	 * \param groupcount_z number of local workgroups to dispatch in the Z
	 *                     dimension.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_DispatchGPUCompute(SDL_GPUComputePass* compute_pass, Uint32 groupcount_x, Uint32 groupcount_y, Uint32 groupcount_z))
]

{ #category : 'public' }
LibSDL3 >> dispatchGPUComputeIndirectComputePass: compute_pass buffer: buffer offset: offset [
	"/**
	 * Dispatches compute work with parameters set from a buffer.
	 *
	 * The buffer layout should match the layout of
	 * SDL_GPUIndirectDispatchCommand. You must not call this function before
	 * binding a compute pipeline.
	 *
	 * A VERY IMPORTANT NOTE If you dispatch multiple times in a compute pass, and
	 * the dispatches write to the same resource region as each other, there is no
	 * guarantee of which order the writes will occur. If the write order matters,
	 * you MUST end the compute pass and begin another one.
	 *
	 * \param compute_pass a compute pass handle.
	 * \param buffer a buffer containing dispatch parameters.
	 * \param offset the offset to start reading from the dispatch buffer.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_DispatchGPUComputeIndirect(SDL_GPUComputePass* compute_pass, SDL_GPUBuffer* buffer, Uint32 offset))
]

{ #category : 'public' }
LibSDL3 >> downloadFromGPUBufferCopyPass: copy_pass source: source destination: destination [
	"/**
	 * Copies data from a buffer to a transfer buffer on the GPU timeline.
	 *
	 * This data is not guaranteed to be copied until the command buffer fence is
	 * signaled.
	 *
	 * \param copy_pass a copy pass handle.
	 * \param source the source buffer with offset and size.
	 * \param destination the destination transfer buffer with offset.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_DownloadFromGPUBuffer(SDL_GPUCopyPass* copy_pass, SDL_GPUBufferRegion* source, SDL_GPUTransferBufferLocation* destination))
]

{ #category : 'public' }
LibSDL3 >> downloadFromGPUTextureCopyPass: copy_pass source: source destination: destination [
	"/**
	 * Copies data from a texture to a transfer buffer on the GPU timeline.
	 *
	 * This data is not guaranteed to be copied until the command buffer fence is
	 * signaled.
	 *
	 * \param copy_pass a copy pass handle.
	 * \param source the source texture region.
	 * \param destination the destination transfer buffer with image layout
	 *                    information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_DownloadFromGPUTexture(SDL_GPUCopyPass* copy_pass, SDL_GPUTextureRegion* source, SDL_GPUTextureTransferInfo* destination))
]

{ #category : 'public' }
LibSDL3 >> drawGPUIndexedPrimitivesIndirectRenderPass: render_pass buffer: buffer offset: offset drawCount: draw_count [
	"/**
	 * Draws data using bound graphics state with an index buffer enabled and with
	 * draw parameters set from a buffer.
	 *
	 * The buffer must consist of tightly-packed draw parameter sets that each
	 * match the layout of SDL_GPUIndexedIndirectDrawCommand. You must not call
	 * this function before binding a graphics pipeline.
	 *
	 * \param render_pass a render pass handle.
	 * \param buffer a buffer containing draw parameters.
	 * \param offset the offset to start reading from the draw buffer.
	 * \param draw_count the number of draw parameter sets that should be read
	 *                   from the draw buffer.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_DrawGPUIndexedPrimitivesIndirect(SDL_GPURenderPass* render_pass, SDL_GPUBuffer* buffer, Uint32 offset, Uint32 draw_count))
]

{ #category : 'public' }
LibSDL3 >> drawGPUIndexedPrimitivesRenderPass: render_pass numIndices: num_indices numInstances: num_instances firstIndex: first_index vertexOffset: vertex_offset firstInstance: first_instance [
	"/**
	 * Draws data using bound graphics state with an index buffer and instancing
	 * enabled.
	 *
	 * You must not call this function before binding a graphics pipeline.
	 *
	 * Note that the `first_vertex` and `first_instance` parameters are NOT
	 * compatible with built-in vertex/instance ID variables in shaders (for
	 * example, SV_VertexID); GPU APIs and shader languages do not define these
	 * built-in variables consistently, so if your shader depends on them, the
	 * only way to keep behavior consistent and portable is to always pass 0 for
	 * the correlating parameter in the draw calls.
	 *
	 * \param render_pass a render pass handle.
	 * \param num_indices the number of indices to draw per instance.
	 * \param num_instances the number of instances to draw.
	 * \param first_index the starting index within the index buffer.
	 * \param vertex_offset value added to vertex index before indexing into the
	 *                      vertex buffer.
	 * \param first_instance the ID of the first instance to draw.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_DrawGPUIndexedPrimitives(SDL_GPURenderPass* render_pass, Uint32 num_indices, Uint32 num_instances, Uint32 first_index, Sint32 vertex_offset, Uint32 first_instance))
]

{ #category : 'public' }
LibSDL3 >> drawGPUPrimitivesIndirectRenderPass: render_pass buffer: buffer offset: offset drawCount: draw_count [
	"/**
	 * Draws data using bound graphics state and with draw parameters set from a
	 * buffer.
	 *
	 * The buffer must consist of tightly-packed draw parameter sets that each
	 * match the layout of SDL_GPUIndirectDrawCommand. You must not call this
	 * function before binding a graphics pipeline.
	 *
	 * \param render_pass a render pass handle.
	 * \param buffer a buffer containing draw parameters.
	 * \param offset the offset to start reading from the draw buffer.
	 * \param draw_count the number of draw parameter sets that should be read
	 *                   from the draw buffer.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_DrawGPUPrimitivesIndirect(SDL_GPURenderPass* render_pass, SDL_GPUBuffer* buffer, Uint32 offset, Uint32 draw_count))
]

{ #category : 'public' }
LibSDL3 >> drawGPUPrimitivesRenderPass: render_pass numVertices: num_vertices numInstances: num_instances firstVertex: first_vertex firstInstance: first_instance [
	"/**
	 * Draws data using bound graphics state.
	 *
	 * You must not call this function before binding a graphics pipeline.
	 *
	 * Note that the `first_vertex` and `first_instance` parameters are NOT
	 * compatible with built-in vertex/instance ID variables in shaders (for
	 * example, SV_VertexID); GPU APIs and shader languages do not define these
	 * built-in variables consistently, so if your shader depends on them, the
	 * only way to keep behavior consistent and portable is to always pass 0 for
	 * the correlating parameter in the draw calls.
	 *
	 * \param render_pass a render pass handle.
	 * \param num_vertices the number of vertices to draw.
	 * \param num_instances the number of instances that will be drawn.
	 * \param first_vertex the index of the first vertex to draw.
	 * \param first_instance the ID of the first instance to draw.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_DrawGPUPrimitives(SDL_GPURenderPass* render_pass, Uint32 num_vertices, Uint32 num_instances, Uint32 first_vertex, Uint32 first_instance))
]

{ #category : 'public' }
LibSDL3 >> duplicateSurface: surface [
	"/**
	 * Creates a new surface identical to the existing surface.
	 *
	 * If the original surface has alternate images, the new surface will have a
	 * reference to them as well.
	 *
	 * The returned surface should be freed with SDL_DestroySurface().
	 *
	 * \param surface the surface to duplicate.
	 * \returns a copy of the surface or NULL on failure; call SDL_GetError() for
	 *          more information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_DestroySurface
	 */"

	^ self ffiCall: #(SDL_Surface* SDL_DuplicateSurface(SDL_Surface* surface))
]

{ #category : 'public' }
LibSDL3 >> eglGetCurrentConfig [
	"/**
	 * Get the currently active EGL config.
	 *
	 * \returns the currently active EGL config or NULL on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_EGLConfig SDL_EGL_GetCurrentConfig())
]

{ #category : 'public' }
LibSDL3 >> eglGetCurrentDisplay [
	"/**
	 * Get the currently active EGL display.
	 *
	 * \returns the currently active EGL display or NULL on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_EGLDisplay SDL_EGL_GetCurrentDisplay())
]

{ #category : 'public' }
LibSDL3 >> eglGetProcAddress: proc [
	"/**
	 * Get an EGL library function by name.
	 *
	 * If an EGL library is loaded, this function allows applications to get entry
	 * points for EGL functions. This is useful to provide to an EGL API and
	 * extension loader.
	 *
	 * \param proc the name of an EGL function.
	 * \returns a pointer to the named EGL function. The returned pointer should
	 *          be cast to the appropriate function signature.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_EGL_GetCurrentDisplay
	 */"

	^ self ffiCall: #(SDL_FunctionPointer SDL_EGL_GetProcAddress(const char* proc))
]

{ #category : 'public' }
LibSDL3 >> eglGetWindowSurface: window [
	"/**
	 * Get the EGL surface associated with the window.
	 *
	 * \param window the window to query.
	 * \returns the EGLSurface pointer associated with the window, or NULL on
	 *          failure.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_EGLSurface SDL_EGL_GetWindowSurface(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> eglSetAttributeCallbacksPlatformAttribCallback: platformAttribCallback surfaceAttribCallback: surfaceAttribCallback contextAttribCallback: contextAttribCallback userdata: userdata [
	"/**
	 * Sets the callbacks for defining custom EGLAttrib arrays for EGL
	 * initialization.
	 *
	 * Callbacks that aren't needed can be set to NULL.
	 *
	 * NOTE: These callback pointers will be reset after SDL_GL_ResetAttributes.
	 *
	 * \param platformAttribCallback callback for attributes to pass to
	 *                               eglGetPlatformDisplay. May be NULL.
	 * \param surfaceAttribCallback callback for attributes to pass to
	 *                              eglCreateSurface. May be NULL.
	 * \param contextAttribCallback callback for attributes to pass to
	 *                              eglCreateContext. May be NULL.
	 * \param userdata a pointer that is passed to the callbacks.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_EGL_SetAttributeCallbacks(SDL_EGLAttribArrayCallback platformAttribCallback, SDL_EGLIntArrayCallback surfaceAttribCallback, SDL_EGLIntArrayCallback contextAttribCallback, void* userdata))
]

{ #category : 'public' }
LibSDL3 >> enableScreenSaver [
	"/**
	 * Allow the screen to be blanked by a screen saver.
	 *
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_DisableScreenSaver
	 * \sa SDL_ScreenSaverEnabled
	 */"

	^ self ffiCall: #(bool SDL_EnableScreenSaver())
]

{ #category : 'public' }
LibSDL3 >> endGPUComputePass: compute_pass [
	"/**
	 * Ends the current compute pass.
	 *
	 * All bound compute state on the command buffer is unset. The compute pass
	 * handle is now invalid.
	 *
	 * \param compute_pass a compute pass handle.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_EndGPUComputePass(SDL_GPUComputePass* compute_pass))
]

{ #category : 'public' }
LibSDL3 >> endGPUCopyPass: copy_pass [
	"/**
	 * Ends the current copy pass.
	 *
	 * \param copy_pass a copy pass handle.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_EndGPUCopyPass(SDL_GPUCopyPass* copy_pass))
]

{ #category : 'public' }
LibSDL3 >> endGPURenderPass: render_pass [
	"/**
	 * Ends the given render pass.
	 *
	 * All bound graphics state on the render pass command buffer is unset. The
	 * render pass handle is now invalid.
	 *
	 * \param render_pass a render pass handle.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_EndGPURenderPass(SDL_GPURenderPass* render_pass))
]

{ #category : 'public' }
LibSDL3 >> enumerateDirectoryPath: path callback: callback userdata: userdata [
	"/**
	 * Enumerate a directory through a callback function.
	 *
	 * This function provides every directory entry through an app-provided
	 * callback, called once for each directory entry, until all results have been
	 * provided or the callback returns either SDL_ENUM_SUCCESS or
	 * SDL_ENUM_FAILURE.
	 *
	 * This will return false if there was a system problem in general, or if a
	 * callback returns SDL_ENUM_FAILURE. A successful return means a callback
	 * returned SDL_ENUM_SUCCESS to halt enumeration, or all directory entries
	 * were enumerated.
	 *
	 * \param path the path of the directory to enumerate.
	 * \param callback a function that is called for each entry in the directory.
	 * \param userdata a pointer that is passed to `callback`.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_EnumerateDirectory(const char* path, SDL_EnumerateDirectoryCallback callback, void* userdata))
]

{ #category : 'public' }
LibSDL3 >> enumeratePropertiesProps: props callback: callback userdata: userdata [
	"/**
	 * Enumerate the properties contained in a group of properties.
	 *
	 * The callback function is called for each property in the group of
	 * properties. The properties are locked during enumeration.
	 *
	 * \param props the properties to query.
	 * \param callback the function to call for each property.
	 * \param userdata a pointer that is passed to `callback`.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_EnumerateProperties(SDL_PropertiesID props, SDL_EnumeratePropertiesCallback callback, void* userdata))
]

{ #category : 'public' }
LibSDL3 >> eventEnabled: type [
	"/**
	 * Query the state of processing events by type.
	 *
	 * \param type the type of event; see SDL_EventType for details.
	 * \returns true if the event is being processed, false otherwise.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetEventEnabled
	 */"

	^ self ffiCall: #(bool SDL_EventEnabled(Uint32 type))
]

{ #category : 'public' }
LibSDL3 >> exp: x [
	"/**
	 * Compute the exponential of `x`.
	 *
	 * The definition of `y = exp(x)` is `y = e^x`, where `e` is the base of the
	 * natural logarithm. The inverse is the natural logarithm, SDL_log.
	 *
	 * Domain: `-INF <= x <= INF`
	 *
	 * Range: `0 <= y <= INF`
	 *
	 * The output will overflow if `exp(x)` is too large to be represented.
	 *
	 * This function operates on double-precision floating point values, use
	 * SDL_expf for single-precision floats.
	 *
	 * This function may use a different approximation across different versions,
	 * platforms and configurations. i.e, it can return a different value given
	 * the same input on different machines or operating systems, or if SDL is
	 * updated.
	 *
	 * \param x floating point value.
	 * \returns value of `e^x`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_expf
	 * \sa SDL_log
	 */"

	^ self ffiCall: #(double SDL_exp(double x))
]

{ #category : 'public' }
LibSDL3 >> expf: x [
	"/**
	 * Compute the exponential of `x`.
	 *
	 * The definition of `y = exp(x)` is `y = e^x`, where `e` is the base of the
	 * natural logarithm. The inverse is the natural logarithm, SDL_logf.
	 *
	 * Domain: `-INF <= x <= INF`
	 *
	 * Range: `0 <= y <= INF`
	 *
	 * The output will overflow if `exp(x)` is too large to be represented.
	 *
	 * This function operates on single-precision floating point values, use
	 * SDL_exp for double-precision floats.
	 *
	 * This function may use a different approximation across different versions,
	 * platforms and configurations. i.e, it can return a different value given
	 * the same input on different machines or operating systems, or if SDL is
	 * updated.
	 *
	 * \param x floating point value.
	 * \returns value of `e^x`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_exp
	 * \sa SDL_logf
	 */"

	^ self ffiCall: #(float SDL_expf(float x))
]

{ #category : 'public' }
LibSDL3 >> fabs: x [
	"/**
	 * Compute the absolute value of `x`
	 *
	 * Domain: `-INF <= x <= INF`
	 *
	 * Range: `0 <= y <= INF`
	 *
	 * This function operates on double-precision floating point values, use
	 * SDL_fabsf for single-precision floats.
	 *
	 * \param x floating point value to use as the magnitude.
	 * \returns the absolute value of `x`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_fabsf
	 */"

	^ self ffiCall: #(double SDL_fabs(double x))
]

{ #category : 'public' }
LibSDL3 >> fabsf: x [
	"/**
	 * Compute the absolute value of `x`
	 *
	 * Domain: `-INF <= x <= INF`
	 *
	 * Range: `0 <= y <= INF`
	 *
	 * This function operates on single-precision floating point values, use
	 * SDL_fabs for double-precision floats.
	 *
	 * \param x floating point value to use as the magnitude.
	 * \returns the absolute value of `x`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_fabs
	 */"

	^ self ffiCall: #(float SDL_fabsf(float x))
]

{ #category : 'public' }
LibSDL3 >> fillSurfaceRectDst: dst rect: rect color: color [
	"/**
	 * Perform a fast fill of a rectangle with a specific color.
	 *
	 * `color` should be a pixel of the format used by the surface, and can be
	 * generated by SDL_MapRGB() or SDL_MapRGBA(). If the color value contains an
	 * alpha component then the destination is simply filled with that alpha
	 * information, no blending takes place.
	 *
	 * If there is a clip rectangle set on the destination (set via
	 * SDL_SetSurfaceClipRect()), then this function will fill based on the
	 * intersection of the clip rectangle and `rect`.
	 *
	 * \param dst the SDL_Surface structure that is the drawing target.
	 * \param rect the SDL_Rect structure representing the rectangle to fill, or
	 *             NULL to fill the entire surface.
	 * \param color the color to fill with.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_FillSurfaceRects
	 */"

	^ self ffiCall: #(bool SDL_FillSurfaceRect(SDL_Surface* dst, SDL_Rect* rect, Uint32 color))
]

{ #category : 'public' }
LibSDL3 >> fillSurfaceRectsDst: dst rects: rects count: count color: color [
	"/**
	 * Perform a fast fill of a set of rectangles with a specific color.
	 *
	 * `color` should be a pixel of the format used by the surface, and can be
	 * generated by SDL_MapRGB() or SDL_MapRGBA(). If the color value contains an
	 * alpha component then the destination is simply filled with that alpha
	 * information, no blending takes place.
	 *
	 * If there is a clip rectangle set on the destination (set via
	 * SDL_SetSurfaceClipRect()), then this function will fill based on the
	 * intersection of the clip rectangle and `rect`.
	 *
	 * \param dst the SDL_Surface structure that is the drawing target.
	 * \param rects an array of SDL_Rects representing the rectangles to fill.
	 * \param count the number of rectangles in the array.
	 * \param color the color to fill with.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_FillSurfaceRect
	 */"

	^ self ffiCall: #(bool SDL_FillSurfaceRects(SDL_Surface* dst, SDL_Rect* rects, int count, Uint32 color))
]

{ #category : 'public' }
LibSDL3 >> filterEventsFilter: filter userdata: userdata [
	"/**
	 * Run a specific filter function on the current event queue, removing any
	 * events for which the filter returns false.
	 *
	 * See SDL_SetEventFilter() for more information. Unlike SDL_SetEventFilter(),
	 * this function does not change the filter permanently, it only uses the
	 * supplied filter until this function returns.
	 *
	 * \param filter the SDL_EventFilter function to call when an event happens.
	 * \param userdata a pointer that is passed to `filter`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetEventFilter
	 * \sa SDL_SetEventFilter
	 */"

	self ffiCall: #(void SDL_FilterEvents(SDL_EventFilter filter, void* userdata))
]

{ #category : 'public' }
LibSDL3 >> flashWindow: window operation: operation [
	"/**
	 * Request a window to demand attention from the user.
	 *
	 * \param window the window to be flashed.
	 * \param operation the operation to perform.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_FlashWindow(SDL_Window* window, SDL_FlashOperation operation))
]

{ #category : 'public' }
LibSDL3 >> flipSurface: surface flip: flip [
	"/**
	 * Flip a surface vertically or horizontally.
	 *
	 * \param surface the surface to flip.
	 * \param flip the direction to flip.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_FlipSurface(SDL_Surface* surface, SDL_FlipMode flip))
]

{ #category : 'public' }
LibSDL3 >> floor: x [
	"/**
	 * Compute the floor of `x`.
	 *
	 * The floor of `x` is the largest integer `y` such that `y > x`, i.e `x`
	 * rounded down to the nearest integer.
	 *
	 * Domain: `-INF <= x <= INF`
	 *
	 * Range: `-INF <= y <= INF`, y integer
	 *
	 * This function operates on double-precision floating point values, use
	 * SDL_floorf for single-precision floats.
	 *
	 * \param x floating point value.
	 * \returns the floor of `x`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_floorf
	 * \sa SDL_ceil
	 * \sa SDL_trunc
	 * \sa SDL_round
	 * \sa SDL_lround
	 */"

	^ self ffiCall: #(double SDL_floor(double x))
]

{ #category : 'public' }
LibSDL3 >> floorf: x [
	"/**
	 * Compute the floor of `x`.
	 *
	 * The floor of `x` is the largest integer `y` such that `y > x`, i.e `x`
	 * rounded down to the nearest integer.
	 *
	 * Domain: `-INF <= x <= INF`
	 *
	 * Range: `-INF <= y <= INF`, y integer
	 *
	 * This function operates on single-precision floating point values, use
	 * SDL_floor for double-precision floats.
	 *
	 * \param x floating point value.
	 * \returns the floor of `x`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_floor
	 * \sa SDL_ceilf
	 * \sa SDL_truncf
	 * \sa SDL_roundf
	 * \sa SDL_lroundf
	 */"

	^ self ffiCall: #(float SDL_floorf(float x))
]

{ #category : 'public' }
LibSDL3 >> flushAudioStream: stream [
	"/**
	 * Tell the stream that you're done sending data, and anything being buffered
	 * should be converted/resampled and made available immediately.
	 *
	 * It is legal to add more data to a stream after flushing, but there may be
	 * audio gaps in the output. Generally this is intended to signal the end of
	 * input, so the complete output becomes available.
	 *
	 * \param stream the audio stream to flush.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_PutAudioStreamData
	 */"

	^ self ffiCall: #(bool SDL_FlushAudioStream(SDL_AudioStream* stream))
]

{ #category : 'public' }
LibSDL3 >> flushEvent: type [
	"/**
	 * Clear events of a specific type from the event queue.
	 *
	 * This will unconditionally remove any events from the queue that match
	 * `type`. If you need to remove a range of event types, use SDL_FlushEvents()
	 * instead.
	 *
	 * It's also normal to just ignore events you don't care about in your event
	 * loop without calling this function.
	 *
	 * This function only affects currently queued events. If you want to make
	 * sure that all pending OS events are flushed, you can call SDL_PumpEvents()
	 * on the main thread immediately before the flush call.
	 *
	 * If you have user events with custom data that needs to be freed, you should
	 * use SDL_PeepEvents() to remove and clean up those events before calling
	 * this function.
	 *
	 * \param type the type of event to be cleared; see SDL_EventType for details.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_FlushEvents
	 */"

	self ffiCall: #(void SDL_FlushEvent(Uint32 type))
]

{ #category : 'public' }
LibSDL3 >> flushEventsMinType: minType maxType: maxType [
	"/**
	 * Clear events of a range of types from the event queue.
	 *
	 * This will unconditionally remove any events from the queue that are in the
	 * range of `minType` to `maxType`, inclusive. If you need to remove a single
	 * event type, use SDL_FlushEvent() instead.
	 *
	 * It's also normal to just ignore events you don't care about in your event
	 * loop without calling this function.
	 *
	 * This function only affects currently queued events. If you want to make
	 * sure that all pending OS events are flushed, you can call SDL_PumpEvents()
	 * on the main thread immediately before the flush call.
	 *
	 * \param minType the low end of event type to be cleared, inclusive; see
	 *                SDL_EventType for details.
	 * \param maxType the high end of event type to be cleared, inclusive; see
	 *                SDL_EventType for details.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_FlushEvent
	 */"

	self ffiCall: #(void SDL_FlushEvents(Uint32 minType, Uint32 maxType))
]

{ #category : 'public' }
LibSDL3 >> flushIO: context [
	"/**
	 * Flush any buffered data in the stream.
	 *
	 * This function makes sure that any buffered data is written to the stream.
	 * Normally this isn't necessary but if the stream is a pipe or socket it
	 * guarantees that any pending data is sent.
	 *
	 * \param context SDL_IOStream structure to flush.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_OpenIO
	 * \sa SDL_WriteIO
	 */"

	^ self ffiCall: #(bool SDL_FlushIO(SDL_IOStream* context))
]

{ #category : 'public' }
LibSDL3 >> flushRenderer: renderer [
	"/**
	 * Force the rendering context to flush any pending commands and state.
	 *
	 * You do not need to (and in fact, shouldn't) call this function unless you
	 * are planning to call into OpenGL/Direct3D/Metal/whatever directly, in
	 * addition to using an SDL_Renderer.
	 *
	 * This is for a very-specific case: if you are using SDL's render API, and
	 * you plan to make OpenGL/D3D/whatever calls in addition to SDL render API
	 * calls. If this applies, you should call this function between calls to
	 * SDL's render API and the low-level API you're using in cooperation.
	 *
	 * In all other cases, you can ignore this function.
	 *
	 * This call makes SDL flush any pending rendering work it was queueing up to
	 * do later in a single batch, and marks any internal cached state as invalid,
	 * so it'll prepare all its state again later, from scratch.
	 *
	 * This means you do not need to save state in your rendering code to protect
	 * the SDL renderer. However, there lots of arbitrary pieces of Direct3D and
	 * OpenGL state that can confuse things; you should use your best judgment and
	 * be prepared to make changes if specific state needs to be protected.
	 *
	 * \param renderer the rendering context.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_FlushRenderer(SDL_Renderer* renderer))
]

{ #category : 'public' }
LibSDL3 >> fmodX: x y: y [
	"/**
	 * Return the floating-point remainder of `x / y`
	 *
	 * Divides `x` by `y`, and returns the remainder.
	 *
	 * Domain: `-INF <= x <= INF`, `-INF <= y <= INF`, `y != 0`
	 *
	 * Range: `-y <= z <= y`
	 *
	 * This function operates on double-precision floating point values, use
	 * SDL_fmodf for single-precision floats.
	 *
	 * \param x the numerator.
	 * \param y the denominator. Must not be 0.
	 * \returns the remainder of `x / y`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_fmodf
	 * \sa SDL_modf
	 * \sa SDL_trunc
	 * \sa SDL_ceil
	 * \sa SDL_floor
	 * \sa SDL_round
	 * \sa SDL_lround
	 */"

	^ self ffiCall: #(double SDL_fmod(double x, double y))
]

{ #category : 'public' }
LibSDL3 >> fmodfX: x y: y [
	"/**
	 * Return the floating-point remainder of `x / y`
	 *
	 * Divides `x` by `y`, and returns the remainder.
	 *
	 * Domain: `-INF <= x <= INF`, `-INF <= y <= INF`, `y != 0`
	 *
	 * Range: `-y <= z <= y`
	 *
	 * This function operates on single-precision floating point values, use
	 * SDL_fmod for double-precision floats.
	 *
	 * \param x the numerator.
	 * \param y the denominator. Must not be 0.
	 * \returns the remainder of `x / y`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_fmod
	 * \sa SDL_truncf
	 * \sa SDL_modff
	 * \sa SDL_ceilf
	 * \sa SDL_floorf
	 * \sa SDL_roundf
	 * \sa SDL_lroundf
	 */"

	^ self ffiCall: #(float SDL_fmodf(float x, float y))
]

{ #category : 'public' }
LibSDL3 >> free: mem [
	"/**
	 * Free allocated memory.
	 *
	 * The pointer is no longer valid after this call and cannot be dereferenced
	 * anymore.
	 *
	 * If `mem` is NULL, this function does nothing.
	 *
	 * \param mem a pointer to allocated memory, or NULL.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_malloc
	 * \sa SDL_calloc
	 * \sa SDL_realloc
	 */"

	self ffiCall: #(void SDL_free(void* mem))
]

{ #category : 'public' }
LibSDL3 >> generateMipmapsForGPUTextureCommandBuffer: command_buffer texture: texture [
	"/**
	 * Generates mipmaps for the given texture.
	 *
	 * This function must not be called inside of any pass.
	 *
	 * \param command_buffer a command_buffer.
	 * \param texture a texture with more than 1 mip level.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_GenerateMipmapsForGPUTexture(SDL_GPUCommandBuffer* command_buffer, SDL_GPUTexture* texture))
]

{ #category : 'public' }
LibSDL3 >> getAppMetadataProperty: name [
	"/**
	 * Get metadata about your app.
	 *
	 * This returns metadata previously set using SDL_SetAppMetadata() or
	 * SDL_SetAppMetadataProperty(). See SDL_SetAppMetadataProperty() for the list
	 * of available properties and their meanings.
	 *
	 * \param name the name of the metadata property to get.
	 * \returns the current value of the metadata property, or the default if it
	 *          is not set, NULL for properties with no default.
	 *
	 * \threadsafety It is safe to call this function from any thread, although
	 *               the string returned is not protected and could potentially be
	 *               freed if you call SDL_SetAppMetadataProperty() to set that
	 *               property from another thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetAppMetadata
	 * \sa SDL_SetAppMetadataProperty
	 */"

	^ self ffiCall: #(const char* SDL_GetAppMetadataProperty(const char* name))
]

{ #category : 'public' }
LibSDL3 >> getAssertionHandler: puserdata [
	"/**
	 * Get the current assertion handler.
	 *
	 * This returns the function pointer that is called when an assertion is
	 * triggered. This is either the value last passed to
	 * SDL_SetAssertionHandler(), or if no application-specified function is set,
	 * is equivalent to calling SDL_GetDefaultAssertionHandler().
	 *
	 * The parameter `puserdata` is a pointer to a void*, which will store the
	 * ""userdata"" pointer that was passed to SDL_SetAssertionHandler(). This value
	 * will always be NULL for the default handler. If you don't care about this
	 * data, it is safe to pass a NULL pointer to this function to ignore it.
	 *
	 * \param puserdata pointer which is filled with the ""userdata"" pointer that
	 *                  was passed to SDL_SetAssertionHandler().
	 * \returns the SDL_AssertionHandler that is called when an assert triggers.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetAssertionHandler
	 */"

	^ self ffiCall: #(SDL_AssertionHandler SDL_GetAssertionHandler(void** puserdata))
]

{ #category : 'public' }
LibSDL3 >> getAssertionReport [
	"/**
	 * Get a list of all assertion failures.
	 *
	 * This function gets all assertions triggered since the last call to
	 * SDL_ResetAssertionReport(), or the start of the program.
	 *
	 * The proper way to examine this data looks something like this:
	 *
	 * ```c
	 * const SDL_AssertData *item = SDL_GetAssertionReport();
	 * while (item) {
	 *    printf(""'%s', %s (%s:%d), triggered %u times, always ignore: %s.\\n"",
	 *           item->condition, item->function, item->filename,
	 *           item->linenum, item->trigger_count,
	 *           item->always_ignore ? ""yes"" : ""no"");
	 *    item = item->next;
	 * }
	 * ```
	 *
	 * \returns a list of all failed assertions or NULL if the list is empty. This
	 *          memory should not be modified or freed by the application. This
	 *          pointer remains valid until the next call to SDL_Quit() or
	 *          SDL_ResetAssertionReport().
	 *
	 * \threadsafety This function is not thread safe. Other threads calling
	 *               SDL_ResetAssertionReport() simultaneously, may render the
	 *               returned pointer invalid.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_ResetAssertionReport
	 */"

	^ self ffiCall: #(SDL_AssertData* SDL_GetAssertionReport())
]

{ #category : 'public' }
LibSDL3 >> getAsyncIOResultQueue: queue outcome: outcome [
	"/**
	 * Query an async I/O task queue for completed tasks.
	 *
	 * If a task assigned to this queue has finished, this will return true and
	 * fill in `outcome` with the details of the task. If no task in the queue has
	 * finished, this function will return false. This function does not block.
	 *
	 * If a task has completed, this function will free its resources and the task
	 * pointer will no longer be valid. The task will be removed from the queue.
	 *
	 * It is safe for multiple threads to call this function on the same queue at
	 * once; a completed task will only go to one of the threads.
	 *
	 * \param queue the async I/O task queue to query.
	 * \param outcome details of a finished task will be written here. May not be
	 *                NULL.
	 * \returns true if a task has completed, false otherwise.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_WaitAsyncIOResult
	 */"

	^ self ffiCall: #(bool SDL_GetAsyncIOResult(SDL_AsyncIOQueue* queue, SDL_AsyncIOOutcome* outcome))
]

{ #category : 'public' }
LibSDL3 >> getAsyncIOSize: asyncio [
	"/**
	 * Use this function to get the size of the data stream in an SDL_AsyncIO.
	 *
	 * This call is _not_ asynchronous; it assumes that obtaining this info is a
	 * non-blocking operation in most reasonable cases.
	 *
	 * \param asyncio the SDL_AsyncIO to get the size of the data stream from.
	 * \returns the size of the data stream in the SDL_IOStream on success or a
	 *          negative error code on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(Sint64 SDL_GetAsyncIOSize(SDL_AsyncIO* asyncio))
]

{ #category : 'public' }
LibSDL3 >> getAtomicInt: a [
	"/**
	 * Get the value of an atomic variable.
	 *
	 * ***Note: If you don't know what this function is for, you shouldn't use
	 * it!***
	 *
	 * \param a a pointer to an SDL_AtomicInt variable.
	 * \returns the current value of an atomic variable.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetAtomicInt
	 */"

	^ self ffiCall: #(int SDL_GetAtomicInt(SDL_AtomicInt* a))
]

{ #category : 'public' }
LibSDL3 >> getAtomicPointer: a [
	"/**
	 * Get the value of a pointer atomically.
	 *
	 * ***Note: If you don't know what this function is for, you shouldn't use
	 * it!***
	 *
	 * \param a a pointer to a pointer.
	 * \returns the current value of a pointer.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CompareAndSwapAtomicPointer
	 * \sa SDL_SetAtomicPointer
	 */"

	^ self ffiCall: #(void* SDL_GetAtomicPointer(void** a))
]

{ #category : 'public' }
LibSDL3 >> getAtomicU32: a [
	"/**
	 * Get the value of an atomic variable.
	 *
	 * ***Note: If you don't know what this function is for, you shouldn't use
	 * it!***
	 *
	 * \param a a pointer to an SDL_AtomicU32 variable.
	 * \returns the current value of an atomic variable.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetAtomicU32
	 */"

	^ self ffiCall: #(Uint32 SDL_GetAtomicU32(SDL_AtomicU32* a))
]

{ #category : 'public' }
LibSDL3 >> getAudioDeviceChannelMapDevid: devid count: count [
	"/**
	 * Get the current channel map of an audio device.
	 *
	 * Channel maps are optional; most things do not need them, instead passing
	 * data in the [order that SDL expects](CategoryAudio#channel-layouts).
	 *
	 * Audio devices usually have no remapping applied. This is represented by
	 * returning NULL, and does not signify an error.
	 *
	 * \param devid the instance ID of the device to query.
	 * \param count On output, set to number of channels in the map. Can be NULL.
	 * \returns an array of the current channel mapping, with as many elements as
	 *          the current output spec's channels, or NULL if default. This
	 *          should be freed with SDL_free() when it is no longer needed.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetAudioStreamInputChannelMap
	 */"

	^ self ffiCall: #(int* SDL_GetAudioDeviceChannelMap(SDL_AudioDeviceID devid, int* count))
]

{ #category : 'public' }
LibSDL3 >> getAudioDeviceFormatDevid: devid spec: spec sampleFrames: sample_frames [
	"/**
	 * Get the current audio format of a specific audio device.
	 *
	 * For an opened device, this will report the format the device is currently
	 * using. If the device isn't yet opened, this will report the device's
	 * preferred format (or a reasonable default if this can't be determined).
	 *
	 * You may also specify SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK or
	 * SDL_AUDIO_DEVICE_DEFAULT_RECORDING here, which is useful for getting a
	 * reasonable recommendation before opening the system-recommended default
	 * device.
	 *
	 * You can also use this to request the current device buffer size. This is
	 * specified in sample frames and represents the amount of data SDL will feed
	 * to the physical hardware in each chunk. This can be converted to
	 * milliseconds of audio with the following equation:
	 *
	 * `ms = (int) ((((Sint64) frames) * 1000) / spec.freq);`
	 *
	 * Buffer size is only important if you need low-level control over the audio
	 * playback timing. Most apps do not need this.
	 *
	 * \param devid the instance ID of the device to query.
	 * \param spec on return, will be filled with device details.
	 * \param sample_frames pointer to store device buffer size, in sample frames.
	 *                      Can be NULL.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_GetAudioDeviceFormat(SDL_AudioDeviceID devid, SDL_AudioSpec* spec, int* sample_frames))
]

{ #category : 'public' }
LibSDL3 >> getAudioDeviceGain: devid [
	"/**
	 * Get the gain of an audio device.
	 *
	 * The gain of a device is its volume; a larger gain means a louder output,
	 * with a gain of zero being silence.
	 *
	 * Audio devices default to a gain of 1.0f (no change in output).
	 *
	 * Physical devices may not have their gain changed, only logical devices, and
	 * this function will always return -1.0f when used on physical devices.
	 *
	 * \param devid the audio device to query.
	 * \returns the gain of the device or -1.0f on failure; call SDL_GetError()
	 *          for more information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetAudioDeviceGain
	 */"

	^ self ffiCall: #(float SDL_GetAudioDeviceGain(SDL_AudioDeviceID devid))
]

{ #category : 'public' }
LibSDL3 >> getAudioDeviceName: devid [
	"/**
	 * Get the human-readable name of a specific audio device.
	 *
	 * \param devid the instance ID of the device to query.
	 * \returns the name of the audio device, or NULL on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetAudioPlaybackDevices
	 * \sa SDL_GetAudioRecordingDevices
	 */"

	^ self ffiCall: #(const char* SDL_GetAudioDeviceName(SDL_AudioDeviceID devid))
]

{ #category : 'public' }
LibSDL3 >> getAudioDriver: index [
	"/**
	 * Use this function to get the name of a built in audio driver.
	 *
	 * The list of audio drivers is given in the order that they are normally
	 * initialized by default; the drivers that seem more reasonable to choose
	 * first (as far as the SDL developers believe) are earlier in the list.
	 *
	 * The names of drivers are all simple, low-ASCII identifiers, like ""alsa"",
	 * ""coreaudio"" or ""wasapi"". These never have Unicode characters, and are not
	 * meant to be proper names.
	 *
	 * \param index the index of the audio driver; the value ranges from 0 to
	 *              SDL_GetNumAudioDrivers() - 1.
	 * \returns the name of the audio driver at the requested index, or NULL if an
	 *          invalid index was specified.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetNumAudioDrivers
	 */"

	^ self ffiCall: #(const char* SDL_GetAudioDriver(int index))
]

{ #category : 'public' }
LibSDL3 >> getAudioFormatName: format [
	"/**
	 * Get the human readable name of an audio format.
	 *
	 * \param format the audio format to query.
	 * \returns the human readable name of the specified audio format or
	 *          ""SDL_AUDIO_UNKNOWN"" if the format isn't recognized.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(const char* SDL_GetAudioFormatName(SDL_AudioFormat format))
]

{ #category : 'public' }
LibSDL3 >> getAudioPlaybackDevices: count [
	"/**
	 * Get a list of currently-connected audio playback devices.
	 *
	 * This returns of list of available devices that play sound, perhaps to
	 * speakers or headphones (""playback"" devices). If you want devices that
	 * record audio, like a microphone (""recording"" devices), use
	 * SDL_GetAudioRecordingDevices() instead.
	 *
	 * This only returns a list of physical devices; it will not have any device
	 * IDs returned by SDL_OpenAudioDevice().
	 *
	 * If this function returns NULL, to signify an error, `*count` will be set to
	 * zero.
	 *
	 * \param count a pointer filled in with the number of devices returned, may
	 *              be NULL.
	 * \returns a 0 terminated array of device instance IDs or NULL on error; call
	 *          SDL_GetError() for more information. This should be freed with
	 *          SDL_free() when it is no longer needed.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_OpenAudioDevice
	 * \sa SDL_GetAudioRecordingDevices
	 */"

	^ self ffiCall: #(SDL_AudioDeviceID* SDL_GetAudioPlaybackDevices(int* count))
]

{ #category : 'public' }
LibSDL3 >> getAudioRecordingDevices: count [
	"/**
	 * Get a list of currently-connected audio recording devices.
	 *
	 * This returns of list of available devices that record audio, like a
	 * microphone (""recording"" devices). If you want devices that play sound,
	 * perhaps to speakers or headphones (""playback"" devices), use
	 * SDL_GetAudioPlaybackDevices() instead.
	 *
	 * This only returns a list of physical devices; it will not have any device
	 * IDs returned by SDL_OpenAudioDevice().
	 *
	 * If this function returns NULL, to signify an error, `*count` will be set to
	 * zero.
	 *
	 * \param count a pointer filled in with the number of devices returned, may
	 *              be NULL.
	 * \returns a 0 terminated array of device instance IDs, or NULL on failure;
	 *          call SDL_GetError() for more information. This should be freed
	 *          with SDL_free() when it is no longer needed.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_OpenAudioDevice
	 * \sa SDL_GetAudioPlaybackDevices
	 */"

	^ self ffiCall: #(SDL_AudioDeviceID* SDL_GetAudioRecordingDevices(int* count))
]

{ #category : 'public' }
LibSDL3 >> getAudioStreamAvailable: stream [
	"/**
	 * Get the number of converted/resampled bytes available.
	 *
	 * The stream may be buffering data behind the scenes until it has enough to
	 * resample correctly, so this number might be lower than what you expect, or
	 * even be zero. Add more data or flush the stream if you need the data now.
	 *
	 * If the stream has so much data that it would overflow an int, the return
	 * value is clamped to a maximum value, but no queued data is lost; if there
	 * are gigabytes of data queued, the app might need to read some of it with
	 * SDL_GetAudioStreamData before this function's return value is no longer
	 * clamped.
	 *
	 * \param stream the audio stream to query.
	 * \returns the number of converted/resampled bytes available or -1 on
	 *          failure; call SDL_GetError() for more information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetAudioStreamData
	 * \sa SDL_PutAudioStreamData
	 */"

	^ self ffiCall: #(int SDL_GetAudioStreamAvailable(SDL_AudioStream* stream))
]

{ #category : 'public' }
LibSDL3 >> getAudioStreamDataStream: stream buf: buf len: len [
	"/**
	 * Get converted/resampled data from the stream.
	 *
	 * The input/output data format/channels/samplerate is specified when creating
	 * the stream, and can be changed after creation by calling
	 * SDL_SetAudioStreamFormat.
	 *
	 * Note that any conversion and resampling necessary is done during this call,
	 * and SDL_PutAudioStreamData simply queues unconverted data for later. This
	 * is different than SDL2, where that work was done while inputting new data
	 * to the stream and requesting the output just copied the converted data.
	 *
	 * \param stream the stream the audio is being requested from.
	 * \param buf a buffer to fill with audio data.
	 * \param len the maximum number of bytes to fill.
	 * \returns the number of bytes read from the stream or -1 on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety It is safe to call this function from any thread, but if the
	 *               stream has a callback set, the caller might need to manage
	 *               extra locking.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_ClearAudioStream
	 * \sa SDL_GetAudioStreamAvailable
	 * \sa SDL_PutAudioStreamData
	 */"

	^ self ffiCall: #(int SDL_GetAudioStreamData(SDL_AudioStream* stream, void* buf, int len))
]

{ #category : 'public' }
LibSDL3 >> getAudioStreamDevice: stream [
	"/**
	 * Query an audio stream for its currently-bound device.
	 *
	 * This reports the audio device that an audio stream is currently bound to.
	 *
	 * If not bound, or invalid, this returns zero, which is not a valid device
	 * ID.
	 *
	 * \param stream the audio stream to query.
	 * \returns the bound audio device, or 0 if not bound or invalid.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_BindAudioStream
	 * \sa SDL_BindAudioStreams
	 */"

	^ self ffiCall: #(SDL_AudioDeviceID SDL_GetAudioStreamDevice(SDL_AudioStream* stream))
]

{ #category : 'public' }
LibSDL3 >> getAudioStreamFormatStream: stream srcSpec: src_spec dstSpec: dst_spec [
	"/**
	 * Query the current format of an audio stream.
	 *
	 * \param stream the SDL_AudioStream to query.
	 * \param src_spec where to store the input audio format; ignored if NULL.
	 * \param dst_spec where to store the output audio format; ignored if NULL.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread, as it holds
	 *               a stream-specific mutex while running.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetAudioStreamFormat
	 */"

	^ self ffiCall: #(bool SDL_GetAudioStreamFormat(SDL_AudioStream* stream, SDL_AudioSpec* src_spec, SDL_AudioSpec* dst_spec))
]

{ #category : 'public' }
LibSDL3 >> getAudioStreamFrequencyRatio: stream [
	"/**
	 * Get the frequency ratio of an audio stream.
	 *
	 * \param stream the SDL_AudioStream to query.
	 * \returns the frequency ratio of the stream or 0.0 on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety It is safe to call this function from any thread, as it holds
	 *               a stream-specific mutex while running.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetAudioStreamFrequencyRatio
	 */"

	^ self ffiCall: #(float SDL_GetAudioStreamFrequencyRatio(SDL_AudioStream* stream))
]

{ #category : 'public' }
LibSDL3 >> getAudioStreamGain: stream [
	"/**
	 * Get the gain of an audio stream.
	 *
	 * The gain of a stream is its volume; a larger gain means a louder output,
	 * with a gain of zero being silence.
	 *
	 * Audio streams default to a gain of 1.0f (no change in output).
	 *
	 * \param stream the SDL_AudioStream to query.
	 * \returns the gain of the stream or -1.0f on failure; call SDL_GetError()
	 *          for more information.
	 *
	 * \threadsafety It is safe to call this function from any thread, as it holds
	 *               a stream-specific mutex while running.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetAudioStreamGain
	 */"

	^ self ffiCall: #(float SDL_GetAudioStreamGain(SDL_AudioStream* stream))
]

{ #category : 'public' }
LibSDL3 >> getAudioStreamInputChannelMapStream: stream count: count [
	"/**
	 * Get the current input channel map of an audio stream.
	 *
	 * Channel maps are optional; most things do not need them, instead passing
	 * data in the [order that SDL expects](CategoryAudio#channel-layouts).
	 *
	 * Audio streams default to no remapping applied. This is represented by
	 * returning NULL, and does not signify an error.
	 *
	 * \param stream the SDL_AudioStream to query.
	 * \param count On output, set to number of channels in the map. Can be NULL.
	 * \returns an array of the current channel mapping, with as many elements as
	 *          the current output spec's channels, or NULL if default. This
	 *          should be freed with SDL_free() when it is no longer needed.
	 *
	 * \threadsafety It is safe to call this function from any thread, as it holds
	 *               a stream-specific mutex while running.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetAudioStreamInputChannelMap
	 */"

	^ self ffiCall: #(int* SDL_GetAudioStreamInputChannelMap(SDL_AudioStream* stream, int* count))
]

{ #category : 'public' }
LibSDL3 >> getAudioStreamOutputChannelMapStream: stream count: count [
	"/**
	 * Get the current output channel map of an audio stream.
	 *
	 * Channel maps are optional; most things do not need them, instead passing
	 * data in the [order that SDL expects](CategoryAudio#channel-layouts).
	 *
	 * Audio streams default to no remapping applied. This is represented by
	 * returning NULL, and does not signify an error.
	 *
	 * \param stream the SDL_AudioStream to query.
	 * \param count On output, set to number of channels in the map. Can be NULL.
	 * \returns an array of the current channel mapping, with as many elements as
	 *          the current output spec's channels, or NULL if default. This
	 *          should be freed with SDL_free() when it is no longer needed.
	 *
	 * \threadsafety It is safe to call this function from any thread, as it holds
	 *               a stream-specific mutex while running.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetAudioStreamInputChannelMap
	 */"

	^ self ffiCall: #(int* SDL_GetAudioStreamOutputChannelMap(SDL_AudioStream* stream, int* count))
]

{ #category : 'public' }
LibSDL3 >> getAudioStreamProperties: stream [
	"/**
	 * Get the properties associated with an audio stream.
	 *
	 * \param stream the SDL_AudioStream to query.
	 * \returns a valid property ID on success or 0 on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_PropertiesID SDL_GetAudioStreamProperties(SDL_AudioStream* stream))
]

{ #category : 'public' }
LibSDL3 >> getAudioStreamQueued: stream [
	"/**
	 * Get the number of bytes currently queued.
	 *
	 * This is the number of bytes put into a stream as input, not the number that
	 * can be retrieved as output. Because of several details, it's not possible
	 * to calculate one number directly from the other. If you need to know how
	 * much usable data can be retrieved right now, you should use
	 * SDL_GetAudioStreamAvailable() and not this function.
	 *
	 * Note that audio streams can change their input format at any time, even if
	 * there is still data queued in a different format, so the returned byte
	 * count will not necessarily match the number of _sample frames_ available.
	 * Users of this API should be aware of format changes they make when feeding
	 * a stream and plan accordingly.
	 *
	 * Queued data is not converted until it is consumed by
	 * SDL_GetAudioStreamData, so this value should be representative of the exact
	 * data that was put into the stream.
	 *
	 * If the stream has so much data that it would overflow an int, the return
	 * value is clamped to a maximum value, but no queued data is lost; if there
	 * are gigabytes of data queued, the app might need to read some of it with
	 * SDL_GetAudioStreamData before this function's return value is no longer
	 * clamped.
	 *
	 * \param stream the audio stream to query.
	 * \returns the number of bytes queued or -1 on failure; call SDL_GetError()
	 *          for more information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_PutAudioStreamData
	 * \sa SDL_ClearAudioStream
	 */"

	^ self ffiCall: #(int SDL_GetAudioStreamQueued(SDL_AudioStream* stream))
]

{ #category : 'public' }
LibSDL3 >> getBasePath [
	"/**
	 * Get the directory where the application was run from.
	 *
	 * SDL caches the result of this call internally, but the first call to this
	 * function is not necessarily fast, so plan accordingly.
	 *
	 * **macOS and iOS Specific Functionality**: If the application is in a "".app""
	 * bundle, this function returns the Resource directory (e.g.
	 * MyApp.app/Contents/Resources/). This behaviour can be overridden by adding
	 * a property to the Info.plist file. Adding a string key with the name
	 * SDL_FILESYSTEM_BASE_DIR_TYPE with a supported value will change the
	 * behaviour.
	 *
	 * Supported values for the SDL_FILESYSTEM_BASE_DIR_TYPE property (Given an
	 * application in /Applications/SDLApp/MyApp.app):
	 *
	 * - `resource`: bundle resource directory (the default). For example:
	 *   `/Applications/SDLApp/MyApp.app/Contents/Resources`
	 * - `bundle`: the Bundle directory. For example:
	 *   `/Applications/SDLApp/MyApp.app/`
	 * - `parent`: the containing directory of the bundle. For example:
	 *   `/Applications/SDLApp/`
	 *
	 * **Nintendo 3DS Specific Functionality**: This function returns ""romfs""
	 * directory of the application as it is uncommon to store resources outside
	 * the executable. As such it is not a writable directory.
	 *
	 * The returned path is guaranteed to end with a path separator ('\\' on
	 * Windows, '/' on most other platforms).
	 *
	 * \returns an absolute path in UTF-8 encoding to the application data
	 *          directory. NULL will be returned on error or when the platform
	 *          doesn't implement this functionality, call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetPrefPath
	 */"

	^ self ffiCall: #(const char* SDL_GetBasePath())
]

{ #category : 'public' }
LibSDL3 >> getBooleanPropertyProps: props name: name defaultValue: default_value [
	"/**
	 * Get a boolean property from a group of properties.
	 *
	 * You can use SDL_GetPropertyType() to query whether the property exists and
	 * is a boolean property.
	 *
	 * \param props the properties to query.
	 * \param name the name of the property to query.
	 * \param default_value the default value of the property.
	 * \returns the value of the property, or `default_value` if it is not set or
	 *          not a boolean property.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetPropertyType
	 * \sa SDL_HasProperty
	 * \sa SDL_SetBooleanProperty
	 */"

	^ self ffiCall: #(bool SDL_GetBooleanProperty(SDL_PropertiesID props, const char* name, _Bool default_value))
]

{ #category : 'public' }
LibSDL3 >> getCPUCacheLineSize [
	"/**
	 * Determine the L1 cache line size of the CPU.
	 *
	 * This is useful for determining multi-threaded structure padding or SIMD
	 * prefetch sizes.
	 *
	 * \returns the L1 cache line size of the CPU, in bytes.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(int SDL_GetCPUCacheLineSize())
]

{ #category : 'public' }
LibSDL3 >> getCameraDriver: index [
	"/**
	 * Use this function to get the name of a built in camera driver.
	 *
	 * The list of camera drivers is given in the order that they are normally
	 * initialized by default; the drivers that seem more reasonable to choose
	 * first (as far as the SDL developers believe) are earlier in the list.
	 *
	 * The names of drivers are all simple, low-ASCII identifiers, like ""v4l2"",
	 * ""coremedia"" or ""android"". These never have Unicode characters, and are not
	 * meant to be proper names.
	 *
	 * \param index the index of the camera driver; the value ranges from 0 to
	 *              SDL_GetNumCameraDrivers() - 1.
	 * \returns the name of the camera driver at the requested index, or NULL if
	 *          an invalid index was specified.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetNumCameraDrivers
	 */"

	^ self ffiCall: #(const char* SDL_GetCameraDriver(int index))
]

{ #category : 'public' }
LibSDL3 >> getCameraFormatCamera: camera spec: spec [
	"/**
	 * Get the spec that a camera is using when generating images.
	 *
	 * Note that this might not be the native format of the hardware, as SDL might
	 * be converting to this format behind the scenes.
	 *
	 * If the system is waiting for the user to approve access to the camera, as
	 * some platforms require, this will return false, but this isn't necessarily
	 * a fatal error; you should either wait for an
	 * SDL_EVENT_CAMERA_DEVICE_APPROVED (or SDL_EVENT_CAMERA_DEVICE_DENIED) event,
	 * or poll SDL_GetCameraPermissionState() occasionally until it returns
	 * non-zero.
	 *
	 * \param camera opened camera device.
	 * \param spec the SDL_CameraSpec to be initialized by this function.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_OpenCamera
	 */"

	^ self ffiCall: #(bool SDL_GetCameraFormat(SDL_Camera* camera, SDL_CameraSpec* spec))
]

{ #category : 'public' }
LibSDL3 >> getCameraID: camera [
	"/**
	 * Get the instance ID of an opened camera.
	 *
	 * \param camera an SDL_Camera to query.
	 * \returns the instance ID of the specified camera on success or 0 on
	 *          failure; call SDL_GetError() for more information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_OpenCamera
	 */"

	^ self ffiCall: #(SDL_CameraID SDL_GetCameraID(SDL_Camera* camera))
]

{ #category : 'public' }
LibSDL3 >> getCameraName: instance_id [
	"/**
	 * Get the human-readable device name for a camera.
	 *
	 * \param instance_id the camera device instance ID.
	 * \returns a human-readable device name or NULL on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetCameras
	 */"

	^ self ffiCall: #(const char* SDL_GetCameraName(SDL_CameraID instance_id))
]

{ #category : 'public' }
LibSDL3 >> getCameraPermissionState: camera [
	"/**
	 * Query if camera access has been approved by the user.
	 *
	 * Cameras will not function between when the device is opened by the app and
	 * when the user permits access to the hardware. On some platforms, this
	 * presents as a popup dialog where the user has to explicitly approve access;
	 * on others the approval might be implicit and not alert the user at all.
	 *
	 * This function can be used to check the status of that approval. It will
	 * return 0 if still waiting for user response, 1 if the camera is approved
	 * for use, and -1 if the user denied access.
	 *
	 * Instead of polling with this function, you can wait for a
	 * SDL_EVENT_CAMERA_DEVICE_APPROVED (or SDL_EVENT_CAMERA_DEVICE_DENIED) event
	 * in the standard SDL event loop, which is guaranteed to be sent once when
	 * permission to use the camera is decided.
	 *
	 * If a camera is declined, there's nothing to be done but call
	 * SDL_CloseCamera() to dispose of it.
	 *
	 * \param camera the opened camera device to query.
	 * \returns -1 if user denied access to the camera, 1 if user approved access,
	 *          0 if no decision has been made yet.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_OpenCamera
	 * \sa SDL_CloseCamera
	 */"

	^ self ffiCall: #(int SDL_GetCameraPermissionState(SDL_Camera* camera))
]

{ #category : 'public' }
LibSDL3 >> getCameraPosition: instance_id [
	"/**
	 * Get the position of the camera in relation to the system.
	 *
	 * Most platforms will report UNKNOWN, but mobile devices, like phones, can
	 * often make a distinction between cameras on the front of the device (that
	 * points towards the user, for taking ""selfies"") and cameras on the back (for
	 * filming in the direction the user is facing).
	 *
	 * \param instance_id the camera device instance ID.
	 * \returns the position of the camera on the system hardware.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetCameras
	 */"

	^ self ffiCall: #(SDL_CameraPosition SDL_GetCameraPosition(SDL_CameraID instance_id))
]

{ #category : 'public' }
LibSDL3 >> getCameraProperties: camera [
	"/**
	 * Get the properties associated with an opened camera.
	 *
	 * \param camera the SDL_Camera obtained from SDL_OpenCamera().
	 * \returns a valid property ID on success or 0 on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_PropertiesID SDL_GetCameraProperties(SDL_Camera* camera))
]

{ #category : 'public' }
LibSDL3 >> getCameraSupportedFormatsInstanceId: instance_id count: count [
	"/**
	 * Get the list of native formats/sizes a camera supports.
	 *
	 * This returns a list of all formats and frame sizes that a specific camera
	 * can offer. This is useful if your app can accept a variety of image formats
	 * and sizes and so want to find the optimal spec that doesn't require
	 * conversion.
	 *
	 * This function isn't strictly required; if you call SDL_OpenCamera with a
	 * NULL spec, SDL will choose a native format for you, and if you instead
	 * specify a desired format, it will transparently convert to the requested
	 * format on your behalf.
	 *
	 * If `count` is not NULL, it will be filled with the number of elements in
	 * the returned array.
	 *
	 * Note that it's legal for a camera to supply an empty list. This is what
	 * will happen on Emscripten builds, since that platform won't tell _anything_
	 * about available cameras until you've opened one, and won't even tell if
	 * there _is_ a camera until the user has given you permission to check
	 * through a scary warning popup.
	 *
	 * \param instance_id the camera device instance ID.
	 * \param count a pointer filled in with the number of elements in the list,
	 *              may be NULL.
	 * \returns a NULL terminated array of pointers to SDL_CameraSpec or NULL on
	 *          failure; call SDL_GetError() for more information. This is a
	 *          single allocation that should be freed with SDL_free() when it is
	 *          no longer needed.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetCameras
	 * \sa SDL_OpenCamera
	 */"

	^ self ffiCall: #(SDL_CameraSpec** SDL_GetCameraSupportedFormats(SDL_CameraID instance_id, int* count))
]

{ #category : 'public' }
LibSDL3 >> getCameras: count [
	"/**
	 * Get a list of currently connected camera devices.
	 *
	 * \param count a pointer filled in with the number of cameras returned, may
	 *              be NULL.
	 * \returns a 0 terminated array of camera instance IDs or NULL on failure;
	 *          call SDL_GetError() for more information. This should be freed
	 *          with SDL_free() when it is no longer needed.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_OpenCamera
	 */"

	^ self ffiCall: #(SDL_CameraID* SDL_GetCameras(int* count))
]

{ #category : 'public' }
LibSDL3 >> getClipboardDataMimeType: mime_type size: size [
	"/**
	 * Get the data from clipboard for a given mime type.
	 *
	 * The size of text data does not include the terminator, but the text is
	 * guaranteed to be null terminated.
	 *
	 * \param mime_type the mime type to read from the clipboard.
	 * \param size a pointer filled in with the length of the returned data.
	 * \returns the retrieved data buffer or NULL on failure; call SDL_GetError()
	 *          for more information. This should be freed with SDL_free() when it
	 *          is no longer needed.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_HasClipboardData
	 * \sa SDL_SetClipboardData
	 */"

	^ self ffiCall: #(void* SDL_GetClipboardData(const char* mime_type, size_t* size))
]

{ #category : 'public' }
LibSDL3 >> getClipboardMimeTypes: num_mime_types [
	"/**
	 * Retrieve the list of mime types available in the clipboard.
	 *
	 * \param num_mime_types a pointer filled with the number of mime types, may
	 *                       be NULL.
	 * \returns a null terminated array of strings with mime types, or NULL on
	 *          failure; call SDL_GetError() for more information. This should be
	 *          freed with SDL_free() when it is no longer needed.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetClipboardData
	 */"

	^ self ffiCall: #(char** SDL_GetClipboardMimeTypes(size_t* num_mime_types))
]

{ #category : 'public' }
LibSDL3 >> getClipboardText [
	"/**
	 * Get UTF-8 text from the clipboard.
	 *
	 * This functions returns an empty string if there was not enough memory left
	 * for a copy of the clipboard's content.
	 *
	 * \returns the clipboard text on success or an empty string on failure; call
	 *          SDL_GetError() for more information. This should be freed with
	 *          SDL_free() when it is no longer needed.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_HasClipboardText
	 * \sa SDL_SetClipboardText
	 */"

	^ self ffiCall: #(char* SDL_GetClipboardText())
]

{ #category : 'public' }
LibSDL3 >> getClosestFullscreenDisplayModeDisplayID: displayID w: w h: h refreshRate: refresh_rate includeHighDensityModes: include_high_density_modes closest: closest [
	"/**
	 * Get the closest match to the requested display mode.
	 *
	 * The available display modes are scanned and `closest` is filled in with the
	 * closest mode matching the requested mode and returned. The mode format and
	 * refresh rate default to the desktop mode if they are set to 0. The modes
	 * are scanned with size being first priority, format being second priority,
	 * and finally checking the refresh rate. If all the available modes are too
	 * small, then false is returned.
	 *
	 * \param displayID the instance ID of the display to query.
	 * \param w the width in pixels of the desired display mode.
	 * \param h the height in pixels of the desired display mode.
	 * \param refresh_rate the refresh rate of the desired display mode, or 0.0f
	 *                     for the desktop refresh rate.
	 * \param include_high_density_modes boolean to include high density modes in
	 *                                   the search.
	 * \param closest a pointer filled in with the closest display mode equal to
	 *                or larger than the desired mode.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetDisplays
	 * \sa SDL_GetFullscreenDisplayModes
	 */"

	^ self ffiCall: #(bool SDL_GetClosestFullscreenDisplayMode(SDL_DisplayID displayID, int w, int h, float refresh_rate, _Bool include_high_density_modes, SDL_DisplayMode* closest))
]

{ #category : 'public' }
LibSDL3 >> getClosestFullscreenDisplayModeDisplayID: displayID w: w h: h refreshRate: refresh_rate includeHighDensityModes: include_high_density_modes mode: mode [
	"/**
	 * Get the closest match to the requested display mode.
	 *
	 * The available display modes are scanned and `closest` is filled in with the
	 * closest mode matching the requested mode and returned. The mode format and
	 * refresh rate default to the desktop mode if they are set to 0. The modes
	 * are scanned with size being first priority, format being second priority,
	 * and finally checking the refresh rate. If all the available modes are too
	 * small, then false is returned.
	 *
	 * \param displayID the instance ID of the display to query.
	 * \param w the width in pixels of the desired display mode.
	 * \param h the height in pixels of the desired display mode.
	 * \param refresh_rate the refresh rate of the desired display mode, or 0.0f
	 *                     for the desktop refresh rate.
	 * \param include_high_density_modes boolean to include high density modes in
	 *                                   the search.
	 * \param mode a pointer filled in with the closest display mode equal to or
	 *             larger than the desired mode.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GetDisplays
	 * \sa SDL_GetFullscreenDisplayModes
	 */"

	self ffiCall: #(int SDL_GetClosestFullscreenDisplayMode(int displayID, int w, int h, float refresh_rate, int include_high_density_modes, SDL_DisplayMode* mode))
]

{ #category : 'public' }
LibSDL3 >> getCurrentAudioDriver [
	"/**
	 * Get the name of the current audio driver.
	 *
	 * The names of drivers are all simple, low-ASCII identifiers, like ""alsa"",
	 * ""coreaudio"" or ""wasapi"". These never have Unicode characters, and are not
	 * meant to be proper names.
	 *
	 * \returns the name of the current audio driver or NULL if no driver has been
	 *          initialized.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(const char* SDL_GetCurrentAudioDriver())
]

{ #category : 'public' }
LibSDL3 >> getCurrentCameraDriver [
	"/**
	 * Get the name of the current camera driver.
	 *
	 * The names of drivers are all simple, low-ASCII identifiers, like ""v4l2"",
	 * ""coremedia"" or ""android"". These never have Unicode characters, and are not
	 * meant to be proper names.
	 *
	 * \returns the name of the current camera driver or NULL if no driver has
	 *          been initialized.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(const char* SDL_GetCurrentCameraDriver())
]

{ #category : 'public' }
LibSDL3 >> getCurrentDirectory [
	"/**
	 * Get what the system believes is the ""current working directory.""
	 *
	 * For systems without a concept of a current working directory, this will
	 * still attempt to provide something reasonable.
	 *
	 * SDL does not provide a means to _change_ the current working directory; for
	 * platforms without this concept, this would cause surprises with file access
	 * outside of SDL.
	 *
	 * The returned path is guaranteed to end with a path separator ('\\' on
	 * Windows, '/' on most other platforms).
	 *
	 * \returns a UTF-8 string of the current working directory in
	 *          platform-dependent notation. NULL if there's a problem. This
	 *          should be freed with SDL_free() when it is no longer needed.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(char* SDL_GetCurrentDirectory())
]

{ #category : 'public' }
LibSDL3 >> getCurrentDisplayMode: displayID [
	"/**
	 * Get information about the current display mode.
	 *
	 * There's a difference between this function and SDL_GetDesktopDisplayMode()
	 * when SDL runs fullscreen and has changed the resolution. In that case this
	 * function will return the current display mode, and not the previous native
	 * display mode.
	 *
	 * \param displayID the instance ID of the display to query.
	 * \returns a pointer to the desktop display mode or NULL on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetDesktopDisplayMode
	 * \sa SDL_GetDisplays
	 */"

	^ self ffiCall: #(SDL_DisplayMode* SDL_GetCurrentDisplayMode(SDL_DisplayID displayID))
]

{ #category : 'public' }
LibSDL3 >> getCurrentDisplayOrientation: displayID [
	"/**
	 * Get the orientation of a display.
	 *
	 * \param displayID the instance ID of the display to query.
	 * \returns the SDL_DisplayOrientation enum value of the display, or
	 *          `SDL_ORIENTATION_UNKNOWN` if it isn't available.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetDisplays
	 */"

	^ self ffiCall: #(SDL_DisplayOrientation SDL_GetCurrentDisplayOrientation(SDL_DisplayID displayID))
]

{ #category : 'public' }
LibSDL3 >> getCurrentRenderOutputSizeRenderer: renderer w: w h: h [
	"/**
	 * Get the current output size in pixels of a rendering context.
	 *
	 * If a rendering target is active, this will return the size of the rendering
	 * target in pixels, otherwise return the value of SDL_GetRenderOutputSize().
	 *
	 * Rendering target or not, the output will be adjusted by the current logical
	 * presentation state, dictated by SDL_SetRenderLogicalPresentation().
	 *
	 * \param renderer the rendering context.
	 * \param w a pointer filled in with the current width.
	 * \param h a pointer filled in with the current height.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetRenderOutputSize
	 */"

	^ self ffiCall: #(bool SDL_GetCurrentRenderOutputSize(SDL_Renderer* renderer, int* w, int* h))
]

{ #category : 'public' }
LibSDL3 >> getCurrentThreadID [
	"/**
	 * Get the thread identifier for the current thread.
	 *
	 * This thread identifier is as reported by the underlying operating system.
	 * If SDL is running on a platform that does not support threads the return
	 * value will always be zero.
	 *
	 * This function also returns a valid thread ID when called from the main
	 * thread.
	 *
	 * \returns the ID of the current thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetThreadID
	 */"

	^ self ffiCall: #(SDL_ThreadID SDL_GetCurrentThreadID())
]

{ #category : 'public' }
LibSDL3 >> getCurrentTime: ticks [
	"/**
	 * Gets the current value of the system realtime clock in nanoseconds since
	 * Jan 1, 1970 in Universal Coordinated Time (UTC).
	 *
	 * \param ticks the SDL_Time to hold the returned tick count.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_GetCurrentTime(SDL_Time* ticks))
]

{ #category : 'public' }
LibSDL3 >> getCurrentVideoDriver [
	"/**
	 * Get the name of the currently initialized video driver.
	 *
	 * The names of drivers are all simple, low-ASCII identifiers, like ""cocoa"",
	 * ""x11"" or ""windows"". These never have Unicode characters, and are not meant
	 * to be proper names.
	 *
	 * \returns the name of the current video driver or NULL if no driver has been
	 *          initialized.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetNumVideoDrivers
	 * \sa SDL_GetVideoDriver
	 */"

	^ self ffiCall: #(const char* SDL_GetCurrentVideoDriver())
]

{ #category : 'public' }
LibSDL3 >> getCursor [
	"/**
	 * Get the active cursor.
	 *
	 * This function returns a pointer to the current cursor which is owned by the
	 * library. It is not necessary to free the cursor with SDL_DestroyCursor().
	 *
	 * \returns the active cursor or NULL if there is no mouse.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetCursor
	 */"

	^ self ffiCall: #(SDL_Cursor* SDL_GetCursor())
]

{ #category : 'public' }
LibSDL3 >> getDateTimeLocalePreferencesDateFormat: dateFormat timeFormat: timeFormat [
	"/**
	 * Gets the current preferred date and time format for the system locale.
	 *
	 * This might be a ""slow"" call that has to query the operating system. It's
	 * best to ask for this once and save the results. However, the preferred
	 * formats can change, usually because the user has changed a system
	 * preference outside of your program.
	 *
	 * \param dateFormat a pointer to the SDL_DateFormat to hold the returned date
	 *                   format, may be NULL.
	 * \param timeFormat a pointer to the SDL_TimeFormat to hold the returned time
	 *                   format, may be NULL.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_GetDateTimeLocalePreferences(SDL_DateFormat dateFormat, SDL_TimeFormat timeFormat))
]

{ #category : 'public' }
LibSDL3 >> getDayOfWeekYear: year month: month day: day [
	"/**
	 * Get the day of week for a calendar date.
	 *
	 * \param year the year component of the date.
	 * \param month the month component of the date.
	 * \param day the day component of the date.
	 * \returns a value between 0 and 6 (0 being Sunday) if the date is valid or
	 *          -1 on failure; call SDL_GetError() for more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(int SDL_GetDayOfWeek(int year, int month, int day))
]

{ #category : 'public' }
LibSDL3 >> getDayOfYear: year month: month day: day [
	"/**
	 * Get the day of year for a calendar date.
	 *
	 * \param year the year component of the date.
	 * \param month the month component of the date.
	 * \param day the day component of the date.
	 * \returns the day of year [0-365] if the date is valid or -1 on failure;
	 *          call SDL_GetError() for more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(int SDL_GetDayOfYear(int year, int month, int day))
]

{ #category : 'public' }
LibSDL3 >> getDaysInMonthYear: year month: month [
	"/**
	 * Get the number of days in a month for a given year.
	 *
	 * \param year the year.
	 * \param month the month [1-12].
	 * \returns the number of days in the requested month or -1 on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(int SDL_GetDaysInMonth(int year, int month))
]

{ #category : 'public' }
LibSDL3 >> getDefaultAssertionHandler [
	"/**
	 * Get the default assertion handler.
	 *
	 * This returns the function pointer that is called by default when an
	 * assertion is triggered. This is an internal function provided by SDL, that
	 * is used for assertions when SDL_SetAssertionHandler() hasn't been used to
	 * provide a different function.
	 *
	 * \returns the default SDL_AssertionHandler that is called when an assert
	 *          triggers.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetAssertionHandler
	 */"

	^ self ffiCall: #(SDL_AssertionHandler SDL_GetDefaultAssertionHandler())
]

{ #category : 'public' }
LibSDL3 >> getDefaultCursor [
	"/**
	 * Get the default cursor.
	 *
	 * You do not have to call SDL_DestroyCursor() on the return value, but it is
	 * safe to do so.
	 *
	 * \returns the default cursor on success or NULL on failuree; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_Cursor* SDL_GetDefaultCursor())
]

{ #category : 'public' }
LibSDL3 >> getDesktopDisplayMode: displayID [
	"/**
	 * Get information about the desktop's display mode.
	 *
	 * There's a difference between this function and SDL_GetCurrentDisplayMode()
	 * when SDL runs fullscreen and has changed the resolution. In that case this
	 * function will return the previous native display mode, and not the current
	 * display mode.
	 *
	 * \param displayID the instance ID of the display to query.
	 * \returns a pointer to the desktop display mode or NULL on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetCurrentDisplayMode
	 * \sa SDL_GetDisplays
	 */"

	^ self ffiCall: #(SDL_DisplayMode* SDL_GetDesktopDisplayMode(SDL_DisplayID displayID))
]

{ #category : 'public' }
LibSDL3 >> getDisplayBoundsDisplayID: displayID rect: rect [
	"/**
	 * Get the desktop area represented by a display.
	 *
	 * The primary display is often located at (0,0), but may be placed at a
	 * different location depending on monitor layout.
	 *
	 * \param displayID the instance ID of the display to query.
	 * \param rect the SDL_Rect structure filled in with the display bounds.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetDisplayUsableBounds
	 * \sa SDL_GetDisplays
	 */"

	^ self ffiCall: #(bool SDL_GetDisplayBounds(SDL_DisplayID displayID, SDL_Rect* rect))
]

{ #category : 'public' }
LibSDL3 >> getDisplayContentScale: displayID [
	"/**
	 * Get the content scale of a display.
	 *
	 * The content scale is the expected scale for content based on the DPI
	 * settings of the display. For example, a 4K display might have a 2.0 (200%)
	 * display scale, which means that the user expects UI elements to be twice as
	 * big on this display, to aid in readability.
	 *
	 * After window creation, SDL_GetWindowDisplayScale() should be used to query
	 * the content scale factor for individual windows instead of querying the
	 * display for a window and calling this function, as the per-window content
	 * scale factor may differ from the base value of the display it is on,
	 * particularly on high-DPI and/or multi-monitor desktop configurations.
	 *
	 * \param displayID the instance ID of the display to query.
	 * \returns the content scale of the display, or 0.0f on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetWindowDisplayScale
	 * \sa SDL_GetDisplays
	 */"

	^ self ffiCall: #(float SDL_GetDisplayContentScale(SDL_DisplayID displayID))
]

{ #category : 'public' }
LibSDL3 >> getDisplayForPoint: point [
	"/**
	 * Get the display containing a point.
	 *
	 * \param point the point to query.
	 * \returns the instance ID of the display containing the point or 0 on
	 *          failure; call SDL_GetError() for more information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetDisplayBounds
	 * \sa SDL_GetDisplays
	 */"

	^ self ffiCall: #(SDL_DisplayID SDL_GetDisplayForPoint(SDL_Point* point))
]

{ #category : 'public' }
LibSDL3 >> getDisplayForRect: rect [
	"/**
	 * Get the display primarily containing a rect.
	 *
	 * \param rect the rect to query.
	 * \returns the instance ID of the display entirely containing the rect or
	 *          closest to the center of the rect on success or 0 on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetDisplayBounds
	 * \sa SDL_GetDisplays
	 */"

	^ self ffiCall: #(SDL_DisplayID SDL_GetDisplayForRect(SDL_Rect* rect))
]

{ #category : 'public' }
LibSDL3 >> getDisplayForWindow: window [
	"/**
	 * Get the display associated with a window.
	 *
	 * \param window the window to query.
	 * \returns the instance ID of the display containing the center of the window
	 *          on success or 0 on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetDisplayBounds
	 * \sa SDL_GetDisplays
	 */"

	^ self ffiCall: #(SDL_DisplayID SDL_GetDisplayForWindow(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> getDisplayName: displayID [
	"/**
	 * Get the name of a display in UTF-8 encoding.
	 *
	 * \param displayID the instance ID of the display to query.
	 * \returns the name of a display or NULL on failure; call SDL_GetError() for
	 *          more information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetDisplays
	 */"

	^ self ffiCall: #(const char* SDL_GetDisplayName(SDL_DisplayID displayID))
]

{ #category : 'public' }
LibSDL3 >> getDisplayProperties: displayID [
	"/**
	 * Get the properties associated with a display.
	 *
	 * The following read-only properties are provided by SDL:
	 *
	 * - `SDL_PROP_DISPLAY_HDR_ENABLED_BOOLEAN`: true if the display has HDR
	 *   headroom above the SDR white point. This is for informational and
	 *   diagnostic purposes only, as not all platforms provide this information
	 *   at the display level.
	 *
	 * On KMS/DRM:
	 *
	 * - `SDL_PROP_DISPLAY_KMSDRM_PANEL_ORIENTATION_NUMBER`: the ""panel
	 *   orientation"" property for the display in degrees of clockwise rotation.
	 *   Note that this is provided only as a hint, and the application is
	 *   responsible for any coordinate transformations needed to conform to the
	 *   requested display orientation.
	 *
	 * \param displayID the instance ID of the display to query.
	 * \returns a valid property ID on success or 0 on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_PropertiesID SDL_GetDisplayProperties(SDL_DisplayID displayID))
]

{ #category : 'public' }
LibSDL3 >> getDisplayUsableBoundsDisplayID: displayID rect: rect [
	"/**
	 * Get the usable desktop area represented by a display, in screen
	 * coordinates.
	 *
	 * This is the same area as SDL_GetDisplayBounds() reports, but with portions
	 * reserved by the system removed. For example, on Apple's macOS, this
	 * subtracts the area occupied by the menu bar and dock.
	 *
	 * Setting a window to be fullscreen generally bypasses these unusable areas,
	 * so these are good guidelines for the maximum space available to a
	 * non-fullscreen window.
	 *
	 * \param displayID the instance ID of the display to query.
	 * \param rect the SDL_Rect structure filled in with the display bounds.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetDisplayBounds
	 * \sa SDL_GetDisplays
	 */"

	^ self ffiCall: #(bool SDL_GetDisplayUsableBounds(SDL_DisplayID displayID, SDL_Rect* rect))
]

{ #category : 'public' }
LibSDL3 >> getDisplays: count [
	"/**
	 * Get a list of currently connected displays.
	 *
	 * \param count a pointer filled in with the number of displays returned, may
	 *              be NULL.
	 * \returns a 0 terminated array of display instance IDs or NULL on failure;
	 *          call SDL_GetError() for more information. This should be freed
	 *          with SDL_free() when it is no longer needed.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_DisplayID* SDL_GetDisplays(int* count))
]

{ #category : 'public' }
LibSDL3 >> getEnvironment [
	"/**
	 * Get the process environment.
	 *
	 * This is initialized at application start and is not affected by setenv()
	 * and unsetenv() calls after that point. Use SDL_SetEnvironmentVariable() and
	 * SDL_UnsetEnvironmentVariable() if you want to modify this environment, or
	 * SDL_setenv_unsafe() or SDL_unsetenv_unsafe() if you want changes to persist
	 * in the C runtime environment after SDL_Quit().
	 *
	 * \returns a pointer to the environment for the process or NULL on failure;
	 *          call SDL_GetError() for more information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetEnvironmentVariable
	 * \sa SDL_GetEnvironmentVariables
	 * \sa SDL_SetEnvironmentVariable
	 * \sa SDL_UnsetEnvironmentVariable
	 */"

	^ self ffiCall: #(SDL_Environment* SDL_GetEnvironment())
]

{ #category : 'public' }
LibSDL3 >> getEnvironmentVariableEnv: env name: name [
	"/**
	 * Get the value of a variable in the environment.
	 *
	 * \param env the environment to query.
	 * \param name the name of the variable to get.
	 * \returns a pointer to the value of the variable or NULL if it can't be
	 *          found.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetEnvironment
	 * \sa SDL_CreateEnvironment
	 * \sa SDL_GetEnvironmentVariables
	 * \sa SDL_SetEnvironmentVariable
	 * \sa SDL_UnsetEnvironmentVariable
	 */"

	^ self ffiCall: #(const char* SDL_GetEnvironmentVariable(SDL_Environment* env, const char* name))
]

{ #category : 'public' }
LibSDL3 >> getEnvironmentVariables: env [
	"/**
	 * Get all variables in the environment.
	 *
	 * \param env the environment to query.
	 * \returns a NULL terminated array of pointers to environment variables in
	 *          the form ""variable=value"" or NULL on failure; call SDL_GetError()
	 *          for more information. This is a single allocation that should be
	 *          freed with SDL_free() when it is no longer needed.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetEnvironment
	 * \sa SDL_CreateEnvironment
	 * \sa SDL_GetEnvironmentVariables
	 * \sa SDL_SetEnvironmentVariable
	 * \sa SDL_UnsetEnvironmentVariable
	 */"

	^ self ffiCall: #(char** SDL_GetEnvironmentVariables(SDL_Environment* env))
]

{ #category : 'public' }
LibSDL3 >> getError [
	"/**
	 * Retrieve a message about the last error that occurred on the current
	 * thread.
	 *
	 * It is possible for multiple errors to occur before calling SDL_GetError().
	 * Only the last error is returned.
	 *
	 * The message is only applicable when an SDL function has signaled an error.
	 * You must check the return values of SDL function calls to determine when to
	 * appropriately call SDL_GetError(). You should *not* use the results of
	 * SDL_GetError() to decide if an error has occurred! Sometimes SDL will set
	 * an error string even when reporting success.
	 *
	 * SDL will *not* clear the error string for successful API calls. You *must*
	 * check return values for failure cases before you can assume the error
	 * string applies.
	 *
	 * Error strings are set per-thread, so an error set in a different thread
	 * will not interfere with the current thread's operation.
	 *
	 * The returned value is a thread-local string which will remain valid until
	 * the current thread's error string is changed. The caller should make a copy
	 * if the value is needed after the next SDL API call.
	 *
	 * \returns a message with information about the specific error that occurred,
	 *          or an empty string if there hasn't been an error message set since
	 *          the last call to SDL_ClearError().
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_ClearError
	 * \sa SDL_SetError
	 */"

	^ self ffiCall: #(const char* SDL_GetError())
]

{ #category : 'public' }
LibSDL3 >> getEventFilter: filter userdata: userdata [
	"/**
	 * Query the current event filter.
	 *
	 * This function can be used to ""chain"" filters, by saving the existing filter
	 * before replacing it with a function that will call that saved filter.
	 *
	 * \param filter the current callback function will be stored here.
	 * \param userdata the pointer that is passed to the current event filter will
	 *                 be stored here.
	 * \returns true on success or false if there is no event filter set.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetEventFilter
	 */"

	^ self ffiCall: #(bool SDL_GetEventFilter(SDL_EventFilter* filter, void** userdata))
]

{ #category : 'public' }
LibSDL3 >> getFloatPropertyProps: props name: name defaultValue: default_value [
	"/**
	 * Get a floating point property from a group of properties.
	 *
	 * You can use SDL_GetPropertyType() to query whether the property exists and
	 * is a floating point property.
	 *
	 * \param props the properties to query.
	 * \param name the name of the property to query.
	 * \param default_value the default value of the property.
	 * \returns the value of the property, or `default_value` if it is not set or
	 *          not a float property.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetPropertyType
	 * \sa SDL_HasProperty
	 * \sa SDL_SetFloatProperty
	 */"

	^ self ffiCall: #(float SDL_GetFloatProperty(SDL_PropertiesID props, const char* name, float default_value))
]

{ #category : 'public' }
LibSDL3 >> getFullscreenDisplayModesDisplayID: displayID count: count [
	"/**
	 * Get a list of fullscreen display modes available on a display.
	 *
	 * The display modes are sorted in this priority:
	 *
	 * - w -> largest to smallest
	 * - h -> largest to smallest
	 * - bits per pixel -> more colors to fewer colors
	 * - packed pixel layout -> largest to smallest
	 * - refresh rate -> highest to lowest
	 * - pixel density -> lowest to highest
	 *
	 * \param displayID the instance ID of the display to query.
	 * \param count a pointer filled in with the number of display modes returned,
	 *              may be NULL.
	 * \returns a NULL terminated array of display mode pointers or NULL on
	 *          failure; call SDL_GetError() for more information. This is a
	 *          single allocation that should be freed with SDL_free() when it is
	 *          no longer needed.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetDisplays
	 */"

	^ self ffiCall: #(SDL_DisplayMode** SDL_GetFullscreenDisplayModes(SDL_DisplayID displayID, int* count))
]

{ #category : 'public' }
LibSDL3 >> getGPUDeviceDriver: device [
	"/**
	 * Returns the name of the backend used to create this GPU context.
	 *
	 * \param device a GPU context to query.
	 * \returns the name of the device's driver, or NULL on error.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(const char* SDL_GetGPUDeviceDriver(SDL_GPUDevice* device))
]

{ #category : 'public' }
LibSDL3 >> getGPUDriver: index [
	"/**
	 * Get the name of a built in GPU driver.
	 *
	 * The GPU drivers are presented in the order in which they are normally
	 * checked during initialization.
	 *
	 * The names of drivers are all simple, low-ASCII identifiers, like ""vulkan"",
	 * ""metal"" or ""direct3d12"". These never have Unicode characters, and are not
	 * meant to be proper names.
	 *
	 * \param index the index of a GPU driver.
	 * \returns the name of the GPU driver with the given **index**.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetNumGPUDrivers
	 */"

	^ self ffiCall: #(const char* SDL_GetGPUDriver(int index))
]

{ #category : 'public' }
LibSDL3 >> getGPUShaderFormats: device [
	"/**
	 * Returns the supported shader formats for this GPU context.
	 *
	 * \param device a GPU context to query.
	 * \returns a bitflag indicating which shader formats the driver is able to
	 *          consume.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_GPUShaderFormat SDL_GetGPUShaderFormats(SDL_GPUDevice* device))
]

{ #category : 'public' }
LibSDL3 >> getGPUSwapchainTextureFormatDevice: device window: window [
	"/**
	 * Obtains the texture format of the swapchain for the given window.
	 *
	 * Note that this format can change if the swapchain parameters change.
	 *
	 * \param device a GPU context.
	 * \param window an SDL_Window that has been claimed.
	 * \returns the texture format of the swapchain.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_GPUTextureFormat SDL_GetGPUSwapchainTextureFormat(SDL_GPUDevice* device, SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> getGlobalMouseStateX: x y: y [
	"/**
	 * Query the platform for the asynchronous mouse button state and the
	 * desktop-relative platform-cursor position.
	 *
	 * This function immediately queries the platform for the most recent
	 * asynchronous state, more costly than retrieving SDL's cached state in
	 * SDL_GetMouseState().
	 *
	 * Passing non-NULL pointers to `x` or `y` will write the destination with
	 * respective x or y coordinates relative to the desktop.
	 *
	 * In Relative Mode, the platform-cursor's position usually contradicts the
	 * SDL-cursor's position as manually calculated from SDL_GetMouseState() and
	 * SDL_GetWindowPosition.
	 *
	 * This function can be useful if you need to track the mouse outside of a
	 * specific window and SDL_CaptureMouse() doesn't fit your needs. For example,
	 * it could be useful if you need to track the mouse while dragging a window,
	 * where coordinates relative to a window might not be in sync at all times.
	 *
	 * \param x a pointer to receive the platform-cursor's x-position from the
	 *          desktop's top left corner, can be NULL if unused.
	 * \param y a pointer to receive the platform-cursor's y-position from the
	 *          desktop's top left corner, can be NULL if unused.
	 * \returns a 32-bit bitmask of the button state that can be bitwise-compared
	 *          against the SDL_BUTTON_MASK(X) macro.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CaptureMouse
	 * \sa SDL_GetMouseState
	 * \sa SDL_GetGlobalMouseState
	 */"

	^ self ffiCall: #(SDL_MouseButtonFlags SDL_GetGlobalMouseState(float* x, float* y))
]

{ #category : 'public' }
LibSDL3 >> getGlobalProperties [
	"/**
	 * Get the global SDL properties.
	 *
	 * \returns a valid property ID on success or 0 on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_PropertiesID SDL_GetGlobalProperties())
]

{ #category : 'public' }
LibSDL3 >> getGrabbedWindow [
	"/**
	 * Get the window that currently has an input grab enabled.
	 *
	 * \returns the window if input is grabbed or NULL otherwise.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetWindowMouseGrab
	 * \sa SDL_SetWindowKeyboardGrab
	 */"

	^ self ffiCall: #(SDL_Window* SDL_GetGrabbedWindow())
]

{ #category : 'public' }
LibSDL3 >> getIOProperties: context [
	"/**
	 * Get the properties associated with an SDL_IOStream.
	 *
	 * \param context a pointer to an SDL_IOStream structure.
	 * \returns a valid property ID on success or 0 on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_PropertiesID SDL_GetIOProperties(SDL_IOStream* context))
]

{ #category : 'public' }
LibSDL3 >> getIOSize: context [
	"/**
	 * Use this function to get the size of the data stream in an SDL_IOStream.
	 *
	 * \param context the SDL_IOStream to get the size of the data stream from.
	 * \returns the size of the data stream in the SDL_IOStream on success or a
	 *          negative error code on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(Sint64 SDL_GetIOSize(SDL_IOStream* context))
]

{ #category : 'public' }
LibSDL3 >> getIOStatus: context [
	"/**
	 * Query the stream status of an SDL_IOStream.
	 *
	 * This information can be useful to decide if a short read or write was due
	 * to an error, an EOF, or a non-blocking operation that isn't yet ready to
	 * complete.
	 *
	 * An SDL_IOStream's status is only expected to change after a SDL_ReadIO or
	 * SDL_WriteIO call; don't expect it to change if you just call this query
	 * function in a tight loop.
	 *
	 * \param context the SDL_IOStream to query.
	 * \returns an SDL_IOStatus enum with the current state.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_IOStatus SDL_GetIOStatus(SDL_IOStream* context))
]

{ #category : 'public' }
LibSDL3 >> getJoystickAxisInitialStateJoystick: joystick axis: axis state: state [
	"/**
	 * Get the initial state of an axis control on a joystick.
	 *
	 * The state is a value ranging from -32768 to 32767.
	 *
	 * The axis indices start at index 0.
	 *
	 * \param joystick an SDL_Joystick structure containing joystick information.
	 * \param axis the axis to query; the axis indices start at index 0.
	 * \param state upon return, the initial value is supplied here.
	 * \returns true if this axis has any initial value, or false if not.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_GetJoystickAxisInitialState(SDL_Joystick* joystick, int axis, Sint16* state))
]

{ #category : 'public' }
LibSDL3 >> getJoystickAxisJoystick: joystick axis: axis [
	"/**
	 * Get the current state of an axis control on a joystick.
	 *
	 * SDL makes no promises about what part of the joystick any given axis refers
	 * to. Your game should have some sort of configuration UI to let users
	 * specify what each axis should be bound to. Alternately, SDL's higher-level
	 * Game Controller API makes a great effort to apply order to this lower-level
	 * interface, so you know that a specific axis is the ""left thumb stick,"" etc.
	 *
	 * The value returned by SDL_GetJoystickAxis() is a signed integer (-32768 to
	 * 32767) representing the current position of the axis. It may be necessary
	 * to impose certain tolerances on these values to account for jitter.
	 *
	 * \param joystick an SDL_Joystick structure containing joystick information.
	 * \param axis the axis to query; the axis indices start at index 0.
	 * \returns a 16-bit signed integer representing the current position of the
	 *          axis or 0 on failure; call SDL_GetError() for more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetNumJoystickAxes
	 */"

	^ self ffiCall: #(Sint16 SDL_GetJoystickAxis(SDL_Joystick* joystick, int axis))
]

{ #category : 'public' }
LibSDL3 >> getJoystickBallJoystick: joystick ball: ball dx: dx dy: dy [
	"/**
	 * Get the ball axis change since the last poll.
	 *
	 * Trackballs can only return relative motion since the last call to
	 * SDL_GetJoystickBall(), these motion deltas are placed into `dx` and `dy`.
	 *
	 * Most joysticks do not have trackballs.
	 *
	 * \param joystick the SDL_Joystick to query.
	 * \param ball the ball index to query; ball indices start at index 0.
	 * \param dx stores the difference in the x axis position since the last poll.
	 * \param dy stores the difference in the y axis position since the last poll.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetNumJoystickBalls
	 */"

	^ self ffiCall: #(bool SDL_GetJoystickBall(SDL_Joystick* joystick, int ball, int* dx, int* dy))
]

{ #category : 'public' }
LibSDL3 >> getJoystickButtonJoystick: joystick button: button [
	"/**
	 * Get the current state of a button on a joystick.
	 *
	 * \param joystick an SDL_Joystick structure containing joystick information.
	 * \param button the button index to get the state from; indices start at
	 *               index 0.
	 * \returns true if the button is pressed, false otherwise.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetNumJoystickButtons
	 */"

	^ self ffiCall: #(bool SDL_GetJoystickButton(SDL_Joystick* joystick, int button))
]

{ #category : 'public' }
LibSDL3 >> getJoystickConnectionState: joystick [
	"/**
	 * Get the connection state of a joystick.
	 *
	 * \param joystick the joystick to query.
	 * \returns the connection state on success or
	 *          `SDL_JOYSTICK_CONNECTION_INVALID` on failure; call SDL_GetError()
	 *          for more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_JoystickConnectionState SDL_GetJoystickConnectionState(SDL_Joystick* joystick))
]

{ #category : 'public' }
LibSDL3 >> getJoystickFirmwareVersion: joystick [
	"/**
	 * Get the firmware version of an opened joystick, if available.
	 *
	 * If the firmware version isn't available this function returns 0.
	 *
	 * \param joystick the SDL_Joystick obtained from SDL_OpenJoystick().
	 * \returns the firmware version of the selected joystick, or 0 if
	 *          unavailable.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(Uint16 SDL_GetJoystickFirmwareVersion(SDL_Joystick* joystick))
]

{ #category : 'public' }
LibSDL3 >> getJoystickFromID: instance_id [
	"/**
	 * Get the SDL_Joystick associated with an instance ID, if it has been opened.
	 *
	 * \param instance_id the instance ID to get the SDL_Joystick for.
	 * \returns an SDL_Joystick on success or NULL on failure or if it hasn't been
	 *          opened yet; call SDL_GetError() for more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_Joystick* SDL_GetJoystickFromID(SDL_JoystickID instance_id))
]

{ #category : 'public' }
LibSDL3 >> getJoystickFromPlayerIndex: player_index [
	"/**
	 * Get the SDL_Joystick associated with a player index.
	 *
	 * \param player_index the player index to get the SDL_Joystick for.
	 * \returns an SDL_Joystick on success or NULL on failure; call SDL_GetError()
	 *          for more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetJoystickPlayerIndex
	 * \sa SDL_SetJoystickPlayerIndex
	 */"

	^ self ffiCall: #(SDL_Joystick* SDL_GetJoystickFromPlayerIndex(int player_index))
]

{ #category : 'public' }
LibSDL3 >> getJoystickGUID: joystick [
	"/**
	 * Get the implementation-dependent GUID for the joystick.
	 *
	 * This function requires an open joystick.
	 *
	 * \param joystick the SDL_Joystick obtained from SDL_OpenJoystick().
	 * \returns the GUID of the given joystick. If called on an invalid index,
	 *          this function returns a zero GUID; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetJoystickGUIDForID
	 * \sa SDL_GUIDToString
	 */"

	^ self ffiCall: #(SDL_GUID SDL_GetJoystickGUID(SDL_Joystick* joystick))
]

{ #category : 'public' }
LibSDL3 >> getJoystickGUIDForID: instance_id [
	"/**
	 * Get the implementation-dependent GUID of a joystick.
	 *
	 * This can be called before any joysticks are opened.
	 *
	 * \param instance_id the joystick instance ID.
	 * \returns the GUID of the selected joystick. If called with an invalid
	 *          instance_id, this function returns a zero GUID.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetJoystickGUID
	 * \sa SDL_GUIDToString
	 */"

	^ self ffiCall: #(SDL_GUID SDL_GetJoystickGUIDForID(SDL_JoystickID instance_id))
]

{ #category : 'public' }
LibSDL3 >> getJoystickGUIDInfoGuid: guid vendor: vendor product: product version: version crc16: crc16 [
	"/**
	 * Get the device information encoded in a SDL_GUID structure.
	 *
	 * \param guid the SDL_GUID you wish to get info about.
	 * \param vendor a pointer filled in with the device VID, or 0 if not
	 *               available.
	 * \param product a pointer filled in with the device PID, or 0 if not
	 *                available.
	 * \param version a pointer filled in with the device version, or 0 if not
	 *                available.
	 * \param crc16 a pointer filled in with a CRC used to distinguish different
	 *              products with the same VID/PID, or 0 if not available.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetJoystickGUIDForID
	 */"

	self ffiCall: #(void SDL_GetJoystickGUIDInfo(SDL_GUID guid, Uint16* vendor, Uint16* product, Uint16* version, Uint16* crc16))
]

{ #category : 'public' }
LibSDL3 >> getJoystickHatJoystick: joystick hat: hat [
	"/**
	 * Get the current state of a POV hat on a joystick.
	 *
	 * The returned value will be one of the `SDL_HAT_*` values.
	 *
	 * \param joystick an SDL_Joystick structure containing joystick information.
	 * \param hat the hat index to get the state from; indices start at index 0.
	 * \returns the current hat position.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetNumJoystickHats
	 */"

	^ self ffiCall: #(Uint8 SDL_GetJoystickHat(SDL_Joystick* joystick, int hat))
]

{ #category : 'public' }
LibSDL3 >> getJoystickID: joystick [
	"/**
	 * Get the instance ID of an opened joystick.
	 *
	 * \param joystick an SDL_Joystick structure containing joystick information.
	 * \returns the instance ID of the specified joystick on success or 0 on
	 *          failure; call SDL_GetError() for more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_JoystickID SDL_GetJoystickID(SDL_Joystick* joystick))
]

{ #category : 'public' }
LibSDL3 >> getJoystickName: joystick [
	"/**
	 * Get the implementation dependent name of a joystick.
	 *
	 * \param joystick the SDL_Joystick obtained from SDL_OpenJoystick().
	 * \returns the name of the selected joystick. If no name can be found, this
	 *          function returns NULL; call SDL_GetError() for more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetJoystickNameForID
	 */"

	^ self ffiCall: #(const char* SDL_GetJoystickName(SDL_Joystick* joystick))
]

{ #category : 'public' }
LibSDL3 >> getJoystickNameForID: instance_id [
	"/**
	 * Get the implementation dependent name of a joystick.
	 *
	 * This can be called before any joysticks are opened.
	 *
	 * \param instance_id the joystick instance ID.
	 * \returns the name of the selected joystick. If no name can be found, this
	 *          function returns NULL; call SDL_GetError() for more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetJoystickName
	 * \sa SDL_GetJoysticks
	 */"

	^ self ffiCall: #(const char* SDL_GetJoystickNameForID(SDL_JoystickID instance_id))
]

{ #category : 'public' }
LibSDL3 >> getJoystickPath: joystick [
	"/**
	 * Get the implementation dependent path of a joystick.
	 *
	 * \param joystick the SDL_Joystick obtained from SDL_OpenJoystick().
	 * \returns the path of the selected joystick. If no path can be found, this
	 *          function returns NULL; call SDL_GetError() for more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetJoystickPathForID
	 */"

	^ self ffiCall: #(const char* SDL_GetJoystickPath(SDL_Joystick* joystick))
]

{ #category : 'public' }
LibSDL3 >> getJoystickPathForID: instance_id [
	"/**
	 * Get the implementation dependent path of a joystick.
	 *
	 * This can be called before any joysticks are opened.
	 *
	 * \param instance_id the joystick instance ID.
	 * \returns the path of the selected joystick. If no path can be found, this
	 *          function returns NULL; call SDL_GetError() for more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetJoystickPath
	 * \sa SDL_GetJoysticks
	 */"

	^ self ffiCall: #(const char* SDL_GetJoystickPathForID(SDL_JoystickID instance_id))
]

{ #category : 'public' }
LibSDL3 >> getJoystickPlayerIndex: joystick [
	"/**
	 * Get the player index of an opened joystick.
	 *
	 * For XInput controllers this returns the XInput user index. Many joysticks
	 * will not be able to supply this information.
	 *
	 * \param joystick the SDL_Joystick obtained from SDL_OpenJoystick().
	 * \returns the player index, or -1 if it's not available.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetJoystickPlayerIndex
	 */"

	^ self ffiCall: #(int SDL_GetJoystickPlayerIndex(SDL_Joystick* joystick))
]

{ #category : 'public' }
LibSDL3 >> getJoystickPlayerIndexForID: instance_id [
	"/**
	 * Get the player index of a joystick.
	 *
	 * This can be called before any joysticks are opened.
	 *
	 * \param instance_id the joystick instance ID.
	 * \returns the player index of a joystick, or -1 if it's not available.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetJoystickPlayerIndex
	 * \sa SDL_GetJoysticks
	 */"

	^ self ffiCall: #(int SDL_GetJoystickPlayerIndexForID(SDL_JoystickID instance_id))
]

{ #category : 'public' }
LibSDL3 >> getJoystickPowerInfoJoystick: joystick percent: percent [
	"/**
	 * Get the battery state of a joystick.
	 *
	 * You should never take a battery status as absolute truth. Batteries
	 * (especially failing batteries) are delicate hardware, and the values
	 * reported here are best estimates based on what that hardware reports. It's
	 * not uncommon for older batteries to lose stored power much faster than it
	 * reports, or completely drain when reporting it has 20 percent left, etc.
	 *
	 * \param joystick the joystick to query.
	 * \param percent a pointer filled in with the percentage of battery life
	 *                left, between 0 and 100, or NULL to ignore. This will be
	 *                filled in with -1 we can't determine a value or there is no
	 *                battery.
	 * \returns the current battery state or `SDL_POWERSTATE_ERROR` on failure;
	 *          call SDL_GetError() for more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_PowerState SDL_GetJoystickPowerInfo(SDL_Joystick* joystick, int* percent))
]

{ #category : 'public' }
LibSDL3 >> getJoystickProduct: joystick [
	"/**
	 * Get the USB product ID of an opened joystick, if available.
	 *
	 * If the product ID isn't available this function returns 0.
	 *
	 * \param joystick the SDL_Joystick obtained from SDL_OpenJoystick().
	 * \returns the USB product ID of the selected joystick, or 0 if unavailable.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetJoystickProductForID
	 */"

	^ self ffiCall: #(Uint16 SDL_GetJoystickProduct(SDL_Joystick* joystick))
]

{ #category : 'public' }
LibSDL3 >> getJoystickProductForID: instance_id [
	"/**
	 * Get the USB product ID of a joystick, if available.
	 *
	 * This can be called before any joysticks are opened. If the product ID isn't
	 * available this function returns 0.
	 *
	 * \param instance_id the joystick instance ID.
	 * \returns the USB product ID of the selected joystick. If called with an
	 *          invalid instance_id, this function returns 0.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetJoystickProduct
	 * \sa SDL_GetJoysticks
	 */"

	^ self ffiCall: #(Uint16 SDL_GetJoystickProductForID(SDL_JoystickID instance_id))
]

{ #category : 'public' }
LibSDL3 >> getJoystickProductVersion: joystick [
	"/**
	 * Get the product version of an opened joystick, if available.
	 *
	 * If the product version isn't available this function returns 0.
	 *
	 * \param joystick the SDL_Joystick obtained from SDL_OpenJoystick().
	 * \returns the product version of the selected joystick, or 0 if unavailable.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetJoystickProductVersionForID
	 */"

	^ self ffiCall: #(Uint16 SDL_GetJoystickProductVersion(SDL_Joystick* joystick))
]

{ #category : 'public' }
LibSDL3 >> getJoystickProductVersionForID: instance_id [
	"/**
	 * Get the product version of a joystick, if available.
	 *
	 * This can be called before any joysticks are opened. If the product version
	 * isn't available this function returns 0.
	 *
	 * \param instance_id the joystick instance ID.
	 * \returns the product version of the selected joystick. If called with an
	 *          invalid instance_id, this function returns 0.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetJoystickProductVersion
	 * \sa SDL_GetJoysticks
	 */"

	^ self ffiCall: #(Uint16 SDL_GetJoystickProductVersionForID(SDL_JoystickID instance_id))
]

{ #category : 'public' }
LibSDL3 >> getJoystickProperties: joystick [
	"/**
	 * Get the properties associated with a joystick.
	 *
	 * The following read-only properties are provided by SDL:
	 *
	 * - `SDL_PROP_JOYSTICK_CAP_MONO_LED_BOOLEAN`: true if this joystick has an
	 *   LED that has adjustable brightness
	 * - `SDL_PROP_JOYSTICK_CAP_RGB_LED_BOOLEAN`: true if this joystick has an LED
	 *   that has adjustable color
	 * - `SDL_PROP_JOYSTICK_CAP_PLAYER_LED_BOOLEAN`: true if this joystick has a
	 *   player LED
	 * - `SDL_PROP_JOYSTICK_CAP_RUMBLE_BOOLEAN`: true if this joystick has
	 *   left/right rumble
	 * - `SDL_PROP_JOYSTICK_CAP_TRIGGER_RUMBLE_BOOLEAN`: true if this joystick has
	 *   simple trigger rumble
	 *
	 * \param joystick the SDL_Joystick obtained from SDL_OpenJoystick().
	 * \returns a valid property ID on success or 0 on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_PropertiesID SDL_GetJoystickProperties(SDL_Joystick* joystick))
]

{ #category : 'public' }
LibSDL3 >> getJoystickSerial: joystick [
	"/**
	 * Get the serial number of an opened joystick, if available.
	 *
	 * Returns the serial number of the joystick, or NULL if it is not available.
	 *
	 * \param joystick the SDL_Joystick obtained from SDL_OpenJoystick().
	 * \returns the serial number of the selected joystick, or NULL if
	 *          unavailable.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(const char* SDL_GetJoystickSerial(SDL_Joystick* joystick))
]

{ #category : 'public' }
LibSDL3 >> getJoystickType: joystick [
	"/**
	 * Get the type of an opened joystick.
	 *
	 * \param joystick the SDL_Joystick obtained from SDL_OpenJoystick().
	 * \returns the SDL_JoystickType of the selected joystick.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetJoystickTypeForID
	 */"

	^ self ffiCall: #(SDL_JoystickType SDL_GetJoystickType(SDL_Joystick* joystick))
]

{ #category : 'public' }
LibSDL3 >> getJoystickTypeForID: instance_id [
	"/**
	 * Get the type of a joystick, if available.
	 *
	 * This can be called before any joysticks are opened.
	 *
	 * \param instance_id the joystick instance ID.
	 * \returns the SDL_JoystickType of the selected joystick. If called with an
	 *          invalid instance_id, this function returns
	 *          `SDL_JOYSTICK_TYPE_UNKNOWN`.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetJoystickType
	 * \sa SDL_GetJoysticks
	 */"

	^ self ffiCall: #(SDL_JoystickType SDL_GetJoystickTypeForID(SDL_JoystickID instance_id))
]

{ #category : 'public' }
LibSDL3 >> getJoystickVendor: joystick [
	"/**
	 * Get the USB vendor ID of an opened joystick, if available.
	 *
	 * If the vendor ID isn't available this function returns 0.
	 *
	 * \param joystick the SDL_Joystick obtained from SDL_OpenJoystick().
	 * \returns the USB vendor ID of the selected joystick, or 0 if unavailable.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetJoystickVendorForID
	 */"

	^ self ffiCall: #(Uint16 SDL_GetJoystickVendor(SDL_Joystick* joystick))
]

{ #category : 'public' }
LibSDL3 >> getJoystickVendorForID: instance_id [
	"/**
	 * Get the USB vendor ID of a joystick, if available.
	 *
	 * This can be called before any joysticks are opened. If the vendor ID isn't
	 * available this function returns 0.
	 *
	 * \param instance_id the joystick instance ID.
	 * \returns the USB vendor ID of the selected joystick. If called with an
	 *          invalid instance_id, this function returns 0.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetJoystickVendor
	 * \sa SDL_GetJoysticks
	 */"

	^ self ffiCall: #(Uint16 SDL_GetJoystickVendorForID(SDL_JoystickID instance_id))
]

{ #category : 'public' }
LibSDL3 >> getJoysticks: count [
	"/**
	 * Get a list of currently connected joysticks.
	 *
	 * \param count a pointer filled in with the number of joysticks returned, may
	 *              be NULL.
	 * \returns a 0 terminated array of joystick instance IDs or NULL on failure;
	 *          call SDL_GetError() for more information. This should be freed
	 *          with SDL_free() when it is no longer needed.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_HasJoystick
	 * \sa SDL_OpenJoystick
	 */"

	^ self ffiCall: #(SDL_JoystickID* SDL_GetJoysticks(int* count))
]

{ #category : 'public' }
LibSDL3 >> getKeyFromName: name [
	"/**
	 * Get a key code from a human-readable name.
	 *
	 * \param name the human-readable key name.
	 * \returns key code, or `SDLK_UNKNOWN` if the name wasn't recognized; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetKeyFromScancode
	 * \sa SDL_GetKeyName
	 * \sa SDL_GetScancodeFromName
	 */"

	^ self ffiCall: #(SDL_Keycode SDL_GetKeyFromName(const char* name))
]

{ #category : 'public' }
LibSDL3 >> getKeyFromScancode: scancode modstate: modstate keyEvent: key_event [
	"/**
	 * Get the key code corresponding to the given scancode according to the
	 * current keyboard layout.
	 *
	 * If you want to get the keycode as it would be delivered in key events,
	 * including options specified in SDL_HINT_KEYCODE_OPTIONS, then you should
	 * pass `key_event` as true. Otherwise this function simply translates the
	 * scancode based on the given modifier state.
	 *
	 * \param scancode the desired SDL_Scancode to query.
	 * \param modstate the modifier state to use when translating the scancode to
	 *                 a keycode.
	 * \param key_event true if the keycode will be used in key events.
	 * \returns the SDL_Keycode that corresponds to the given SDL_Scancode.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetKeyName
	 * \sa SDL_GetScancodeFromKey
	 */"

	^ self ffiCall: #(SDL_Keycode SDL_GetKeyFromScancode(SDL_Scancode scancode, SDL_Keymod modstate, _Bool key_event))
]

{ #category : 'public' }
LibSDL3 >> getKeyName: key [
	"/**
	 * Get a human-readable name for a key.
	 *
	 * If the key doesn't have a name, this function returns an empty string ("""").
	 *
	 * Letters will be presented in their uppercase form, if applicable.
	 *
	 * \param key the desired SDL_Keycode to query.
	 * \returns a UTF-8 encoded string of the key name.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetKeyFromName
	 * \sa SDL_GetKeyFromScancode
	 * \sa SDL_GetScancodeFromKey
	 */"

	^ self ffiCall: #(const char* SDL_GetKeyName(SDL_Keycode key))
]

{ #category : 'public' }
LibSDL3 >> getKeyboardFocus [
	"/**
	 * Query the window which currently has keyboard focus.
	 *
	 * \returns the window with keyboard focus.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_Window* SDL_GetKeyboardFocus())
]

{ #category : 'public' }
LibSDL3 >> getKeyboardNameForID: instance_id [
	"/**
	 * Get the name of a keyboard.
	 *
	 * This function returns """" if the keyboard doesn't have a name.
	 *
	 * \param instance_id the keyboard instance ID.
	 * \returns the name of the selected keyboard or NULL on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetKeyboards
	 */"

	^ self ffiCall: #(const char* SDL_GetKeyboardNameForID(SDL_KeyboardID instance_id))
]

{ #category : 'public' }
LibSDL3 >> getKeyboardState: numkeys [
	"/**
	 * Get a snapshot of the current state of the keyboard.
	 *
	 * The pointer returned is a pointer to an internal SDL array. It will be
	 * valid for the whole lifetime of the application and should not be freed by
	 * the caller.
	 *
	 * A array element with a value of true means that the key is pressed and a
	 * value of false means that it is not. Indexes into this array are obtained
	 * by using SDL_Scancode values.
	 *
	 * Use SDL_PumpEvents() to update the state array.
	 *
	 * This function gives you the current state after all events have been
	 * processed, so if a key or button has been pressed and released before you
	 * process events, then the pressed state will never show up in the
	 * SDL_GetKeyboardState() calls.
	 *
	 * Note: This function doesn't take into account whether shift has been
	 * pressed or not.
	 *
	 * \param numkeys if non-NULL, receives the length of the returned array.
	 * \returns a pointer to an array of key states.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_PumpEvents
	 * \sa SDL_ResetKeyboard
	 */"

	^ self ffiCall: #(bool* SDL_GetKeyboardState(int* numkeys))
]

{ #category : 'public' }
LibSDL3 >> getKeyboards: count [
	"/**
	 * Get a list of currently connected keyboards.
	 *
	 * Note that this will include any device or virtual driver that includes
	 * keyboard functionality, including some mice, KVM switches, motherboard
	 * power buttons, etc. You should wait for input from a device before you
	 * consider it actively in use.
	 *
	 * \param count a pointer filled in with the number of keyboards returned, may
	 *              be NULL.
	 * \returns a 0 terminated array of keyboards instance IDs or NULL on failure;
	 *          call SDL_GetError() for more information. This should be freed
	 *          with SDL_free() when it is no longer needed.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetKeyboardNameForID
	 * \sa SDL_HasKeyboard
	 */"

	^ self ffiCall: #(SDL_KeyboardID* SDL_GetKeyboards(int* count))
]

{ #category : 'public' }
LibSDL3 >> getMasksForPixelFormat: format bpp: bpp Rmask: Rmask Gmask: Gmask Bmask: Bmask Amask: Amask [
	"/**
	 * Convert one of the enumerated pixel formats to a bpp value and RGBA masks.
	 *
	 * \param format one of the SDL_PixelFormat values.
	 * \param bpp a bits per pixel value; usually 15, 16, or 32.
	 * \param Rmask a pointer filled in with the red mask for the format.
	 * \param Gmask a pointer filled in with the green mask for the format.
	 * \param Bmask a pointer filled in with the blue mask for the format.
	 * \param Amask a pointer filled in with the alpha mask for the format.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetPixelFormatForMasks
	 */"

	^ self ffiCall: #(bool SDL_GetMasksForPixelFormat(SDL_PixelFormat format, int* bpp, Uint32* Rmask, Uint32* Gmask, Uint32* Bmask, Uint32* Amask))
]

{ #category : 'public' }
LibSDL3 >> getMemoryFunctionsMallocFunc: malloc_func callocFunc: calloc_func reallocFunc: realloc_func freeFunc: free_func [
	"/**
	 * Get the current set of SDL memory functions.
	 *
	 * \param malloc_func filled with malloc function.
	 * \param calloc_func filled with calloc function.
	 * \param realloc_func filled with realloc function.
	 * \param free_func filled with free function.
	 *
	 * \threadsafety This does not hold a lock, so do not call this in the
	 *               unlikely event of a background thread calling
	 *               SDL_SetMemoryFunctions simultaneously.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetMemoryFunctions
	 * \sa SDL_GetOriginalMemoryFunctions
	 */"

	self ffiCall: #(void SDL_GetMemoryFunctions(SDL_malloc_func* malloc_func, SDL_calloc_func* calloc_func, SDL_realloc_func* realloc_func, SDL_free_func* free_func))
]

{ #category : 'public' }
LibSDL3 >> getMice: count [
	"/**
	 * Get a list of currently connected mice.
	 *
	 * Note that this will include any device or virtual driver that includes
	 * mouse functionality, including some game controllers, KVM switches, etc.
	 * You should wait for input from a device before you consider it actively in
	 * use.
	 *
	 * \param count a pointer filled in with the number of mice returned, may be
	 *              NULL.
	 * \returns a 0 terminated array of mouse instance IDs or NULL on failure;
	 *          call SDL_GetError() for more information. This should be freed
	 *          with SDL_free() when it is no longer needed.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetMouseNameForID
	 * \sa SDL_HasMouse
	 */"

	^ self ffiCall: #(SDL_MouseID* SDL_GetMice(int* count))
]

{ #category : 'public' }
LibSDL3 >> getModState [
	"/**
	 * Get the current key modifier state for the keyboard.
	 *
	 * \returns an OR'd combination of the modifier keys for the keyboard. See
	 *          SDL_Keymod for details.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetKeyboardState
	 * \sa SDL_SetModState
	 */"

	^ self ffiCall: #(SDL_Keymod SDL_GetModState())
]

{ #category : 'public' }
LibSDL3 >> getMouseFocus [
	"/**
	 * Get the window which currently has mouse focus.
	 *
	 * \returns the window with mouse focus.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_Window* SDL_GetMouseFocus())
]

{ #category : 'public' }
LibSDL3 >> getMouseNameForID: instance_id [
	"/**
	 * Get the name of a mouse.
	 *
	 * This function returns """" if the mouse doesn't have a name.
	 *
	 * \param instance_id the mouse instance ID.
	 * \returns the name of the selected mouse, or NULL on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetMice
	 */"

	^ self ffiCall: #(const char* SDL_GetMouseNameForID(SDL_MouseID instance_id))
]

{ #category : 'public' }
LibSDL3 >> getMouseStateX: x y: y [
	"/**
	 * Query SDL's cache for the synchronous mouse button state and the
	 * window-relative SDL-cursor position.
	 *
	 * This function returns the cached synchronous state as SDL understands it
	 * from the last pump of the event queue.
	 *
	 * To query the platform for immediate asynchronous state, use
	 * SDL_GetGlobalMouseState.
	 *
	 * Passing non-NULL pointers to `x` or `y` will write the destination with
	 * respective x or y coordinates relative to the focused window.
	 *
	 * In Relative Mode, the SDL-cursor's position usually contradicts the
	 * platform-cursor's position as manually calculated from
	 * SDL_GetGlobalMouseState() and SDL_GetWindowPosition.
	 *
	 * \param x a pointer to receive the SDL-cursor's x-position from the focused
	 *          window's top left corner, can be NULL if unused.
	 * \param y a pointer to receive the SDL-cursor's y-position from the focused
	 *          window's top left corner, can be NULL if unused.
	 * \returns a 32-bit bitmask of the button state that can be bitwise-compared
	 *          against the SDL_BUTTON_MASK(X) macro.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetGlobalMouseState
	 * \sa SDL_GetRelativeMouseState
	 */"

	^ self ffiCall: #(SDL_MouseButtonFlags SDL_GetMouseState(float* x, float* y))
]

{ #category : 'public' }
LibSDL3 >> getNaturalDisplayOrientation: displayID [
	"/**
	 * Get the orientation of a display when it is unrotated.
	 *
	 * \param displayID the instance ID of the display to query.
	 * \returns the SDL_DisplayOrientation enum value of the display, or
	 *          `SDL_ORIENTATION_UNKNOWN` if it isn't available.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetDisplays
	 */"

	^ self ffiCall: #(SDL_DisplayOrientation SDL_GetNaturalDisplayOrientation(SDL_DisplayID displayID))
]

{ #category : 'public' }
LibSDL3 >> getNumAllocations [
	"/**
	 * Get the number of outstanding (unfreed) allocations.
	 *
	 * \returns the number of allocations or -1 if allocation counting is
	 *          disabled.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(int SDL_GetNumAllocations())
]

{ #category : 'public' }
LibSDL3 >> getNumAudioDrivers [
	"/**
	 * Use this function to get the number of built-in audio drivers.
	 *
	 * This function returns a hardcoded number. This never returns a negative
	 * value; if there are no drivers compiled into this build of SDL, this
	 * function returns zero. The presence of a driver in this list does not mean
	 * it will function, it just means SDL is capable of interacting with that
	 * interface. For example, a build of SDL might have esound support, but if
	 * there's no esound server available, SDL's esound driver would fail if used.
	 *
	 * By default, SDL tries all drivers, in its preferred order, until one is
	 * found to be usable.
	 *
	 * \returns the number of built-in audio drivers.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetAudioDriver
	 */"

	^ self ffiCall: #(int SDL_GetNumAudioDrivers())
]

{ #category : 'public' }
LibSDL3 >> getNumCameraDrivers [
	"/**
	 * Use this function to get the number of built-in camera drivers.
	 *
	 * This function returns a hardcoded number. This never returns a negative
	 * value; if there are no drivers compiled into this build of SDL, this
	 * function returns zero. The presence of a driver in this list does not mean
	 * it will function, it just means SDL is capable of interacting with that
	 * interface. For example, a build of SDL might have v4l2 support, but if
	 * there's no kernel support available, SDL's v4l2 driver would fail if used.
	 *
	 * By default, SDL tries all drivers, in its preferred order, until one is
	 * found to be usable.
	 *
	 * \returns the number of built-in camera drivers.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetCameraDriver
	 */"

	^ self ffiCall: #(int SDL_GetNumCameraDrivers())
]

{ #category : 'public' }
LibSDL3 >> getNumGPUDrivers [
	"/**
	 * Get the number of GPU drivers compiled into SDL.
	 *
	 * \returns the number of built in GPU drivers.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetGPUDriver
	 */"

	^ self ffiCall: #(int SDL_GetNumGPUDrivers())
]

{ #category : 'public' }
LibSDL3 >> getNumJoystickAxes: joystick [
	"/**
	 * Get the number of general axis controls on a joystick.
	 *
	 * Often, the directional pad on a game controller will either look like 4
	 * separate buttons or a POV hat, and not axes, but all of this is up to the
	 * device and platform.
	 *
	 * \param joystick an SDL_Joystick structure containing joystick information.
	 * \returns the number of axis controls/number of axes on success or -1 on
	 *          failure; call SDL_GetError() for more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetJoystickAxis
	 * \sa SDL_GetNumJoystickBalls
	 * \sa SDL_GetNumJoystickButtons
	 * \sa SDL_GetNumJoystickHats
	 */"

	^ self ffiCall: #(int SDL_GetNumJoystickAxes(SDL_Joystick* joystick))
]

{ #category : 'public' }
LibSDL3 >> getNumJoystickBalls: joystick [
	"/**
	 * Get the number of trackballs on a joystick.
	 *
	 * Joystick trackballs have only relative motion events associated with them
	 * and their state cannot be polled.
	 *
	 * Most joysticks do not have trackballs.
	 *
	 * \param joystick an SDL_Joystick structure containing joystick information.
	 * \returns the number of trackballs on success or -1 on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetJoystickBall
	 * \sa SDL_GetNumJoystickAxes
	 * \sa SDL_GetNumJoystickButtons
	 * \sa SDL_GetNumJoystickHats
	 */"

	^ self ffiCall: #(int SDL_GetNumJoystickBalls(SDL_Joystick* joystick))
]

{ #category : 'public' }
LibSDL3 >> getNumJoystickButtons: joystick [
	"/**
	 * Get the number of buttons on a joystick.
	 *
	 * \param joystick an SDL_Joystick structure containing joystick information.
	 * \returns the number of buttons on success or -1 on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetJoystickButton
	 * \sa SDL_GetNumJoystickAxes
	 * \sa SDL_GetNumJoystickBalls
	 * \sa SDL_GetNumJoystickHats
	 */"

	^ self ffiCall: #(int SDL_GetNumJoystickButtons(SDL_Joystick* joystick))
]

{ #category : 'public' }
LibSDL3 >> getNumJoystickHats: joystick [
	"/**
	 * Get the number of POV hats on a joystick.
	 *
	 * \param joystick an SDL_Joystick structure containing joystick information.
	 * \returns the number of POV hats on success or -1 on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetJoystickHat
	 * \sa SDL_GetNumJoystickAxes
	 * \sa SDL_GetNumJoystickBalls
	 * \sa SDL_GetNumJoystickButtons
	 */"

	^ self ffiCall: #(int SDL_GetNumJoystickHats(SDL_Joystick* joystick))
]

{ #category : 'public' }
LibSDL3 >> getNumLogicalCPUCores [
	"/**
	 * Get the number of logical CPU cores available.
	 *
	 * \returns the total number of logical CPU cores. On CPUs that include
	 *          technologies such as hyperthreading, the number of logical cores
	 *          may be more than the number of physical cores.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(int SDL_GetNumLogicalCPUCores())
]

{ #category : 'public' }
LibSDL3 >> getNumRenderDrivers [
	"/**
	 * Get the number of 2D rendering drivers available for the current display.
	 *
	 * A render driver is a set of code that handles rendering and texture
	 * management on a particular display. Normally there is only one, but some
	 * drivers may have several available with different capabilities.
	 *
	 * There may be none if SDL was compiled without render support.
	 *
	 * \returns the number of built in render drivers.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateRenderer
	 * \sa SDL_GetRenderDriver
	 */"

	^ self ffiCall: #(int SDL_GetNumRenderDrivers())
]

{ #category : 'public' }
LibSDL3 >> getNumVideoDrivers [
	"/**
	 * Get the number of video drivers compiled into SDL.
	 *
	 * \returns the number of built in video drivers.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetVideoDriver
	 */"

	^ self ffiCall: #(int SDL_GetNumVideoDrivers())
]

{ #category : 'public' }
LibSDL3 >> getNumberPropertyProps: props name: name defaultValue: default_value [
	"/**
	 * Get a number property from a group of properties.
	 *
	 * You can use SDL_GetPropertyType() to query whether the property exists and
	 * is a number property.
	 *
	 * \param props the properties to query.
	 * \param name the name of the property to query.
	 * \param default_value the default value of the property.
	 * \returns the value of the property, or `default_value` if it is not set or
	 *          not a number property.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetPropertyType
	 * \sa SDL_HasProperty
	 * \sa SDL_SetNumberProperty
	 */"

	^ self ffiCall: #(Sint64 SDL_GetNumberProperty(SDL_PropertiesID props, const char* name, Sint64 default_value))
]

{ #category : 'public' }
LibSDL3 >> getOriginalMemoryFunctionsMallocFunc: malloc_func callocFunc: calloc_func reallocFunc: realloc_func freeFunc: free_func [
	"/**
	 * Get the original set of SDL memory functions.
	 *
	 * This is what SDL_malloc and friends will use by default, if there has been
	 * no call to SDL_SetMemoryFunctions. This is not necessarily using the C
	 * runtime's `malloc` functions behind the scenes! Different platforms and
	 * build configurations might do any number of unexpected things.
	 *
	 * \param malloc_func filled with malloc function.
	 * \param calloc_func filled with calloc function.
	 * \param realloc_func filled with realloc function.
	 * \param free_func filled with free function.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_GetOriginalMemoryFunctions(SDL_malloc_func* malloc_func, SDL_calloc_func* calloc_func, SDL_realloc_func* realloc_func, SDL_free_func* free_func))
]

{ #category : 'public' }
LibSDL3 >> getPathInfoPath: path info: info [
	"/**
	 * Get information about a filesystem path.
	 *
	 * \param path the path to query.
	 * \param info a pointer filled in with information about the path, or NULL to
	 *             check for the existence of a file.
	 * \returns true on success or false if the file doesn't exist, or another
	 *          failure; call SDL_GetError() for more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_GetPathInfo(const char* path, SDL_PathInfo* info))
]

{ #category : 'public' }
LibSDL3 >> getPerformanceCounter [
	"/**
	 * Get the current value of the high resolution counter.
	 *
	 * This function is typically used for profiling.
	 *
	 * The counter values are only meaningful relative to each other. Differences
	 * between values can be converted to times by using
	 * SDL_GetPerformanceFrequency().
	 *
	 * \returns the current counter value.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetPerformanceFrequency
	 */"

	^ self ffiCall: #(Uint64 SDL_GetPerformanceCounter())
]

{ #category : 'public' }
LibSDL3 >> getPerformanceFrequency [
	"/**
	 * Get the count per second of the high resolution counter.
	 *
	 * \returns a platform-specific count per second.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetPerformanceCounter
	 */"

	^ self ffiCall: #(Uint64 SDL_GetPerformanceFrequency())
]

{ #category : 'public' }
LibSDL3 >> getPixelFormatDetails: format [
	"/**
	 * Create an SDL_PixelFormatDetails structure corresponding to a pixel format.
	 *
	 * Returned structure may come from a shared global cache (i.e. not newly
	 * allocated), and hence should not be modified, especially the palette. Weird
	 * errors such as `Blit combination not supported` may occur.
	 *
	 * \param format one of the SDL_PixelFormat values.
	 * \returns a pointer to a SDL_PixelFormatDetails structure or NULL on
	 *          failure; call SDL_GetError() for more information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_PixelFormatDetails* SDL_GetPixelFormatDetails(SDL_PixelFormat format))
]

{ #category : 'public' }
LibSDL3 >> getPixelFormatForMasksBpp: bpp Rmask: Rmask Gmask: Gmask Bmask: Bmask Amask: Amask [
	"/**
	 * Convert a bpp value and RGBA masks to an enumerated pixel format.
	 *
	 * This will return `SDL_PIXELFORMAT_UNKNOWN` if the conversion wasn't
	 * possible.
	 *
	 * \param bpp a bits per pixel value; usually 15, 16, or 32.
	 * \param Rmask the red mask for the format.
	 * \param Gmask the green mask for the format.
	 * \param Bmask the blue mask for the format.
	 * \param Amask the alpha mask for the format.
	 * \returns the SDL_PixelFormat value corresponding to the format masks, or
	 *          SDL_PIXELFORMAT_UNKNOWN if there isn't a match.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetMasksForPixelFormat
	 */"

	^ self ffiCall: #(SDL_PixelFormat SDL_GetPixelFormatForMasks(int bpp, Uint32 Rmask, Uint32 Gmask, Uint32 Bmask, Uint32 Amask))
]

{ #category : 'public' }
LibSDL3 >> getPixelFormatName: format [
	"/**
	 * Get the human readable name of a pixel format.
	 *
	 * \param format the pixel format to query.
	 * \returns the human readable name of the specified pixel format or
	 *          ""SDL_PIXELFORMAT_UNKNOWN"" if the format isn't recognized.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(const char* SDL_GetPixelFormatName(SDL_PixelFormat format))
]

{ #category : 'public' }
LibSDL3 >> getPlatform [
	"/**
	 * Get the name of the platform.
	 *
	 * Here are the names returned for some (but not all) supported platforms:
	 *
	 * - ""Windows""
	 * - ""macOS""
	 * - ""Linux""
	 * - ""iOS""
	 * - ""Android""
	 *
	 * \returns the name of the platform. If the correct platform name is not
	 *          available, returns a string beginning with the text ""Unknown"".
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(const char* SDL_GetPlatform())
]

{ #category : 'public' }
LibSDL3 >> getPointerPropertyProps: props name: name defaultValue: default_value [
	"/**
	 * Get a pointer property from a group of properties.
	 *
	 * By convention, the names of properties that SDL exposes on objects will
	 * start with ""SDL."", and properties that SDL uses internally will start with
	 * ""SDL.internal."". These should be considered read-only and should not be
	 * modified by applications.
	 *
	 * \param props the properties to query.
	 * \param name the name of the property to query.
	 * \param default_value the default value of the property.
	 * \returns the value of the property, or `default_value` if it is not set or
	 *          not a pointer property.
	 *
	 * \threadsafety It is safe to call this function from any thread, although
	 *               the data returned is not protected and could potentially be
	 *               freed if you call SDL_SetPointerProperty() or
	 *               SDL_ClearProperty() on these properties from another thread.
	 *               If you need to avoid this, use SDL_LockProperties() and
	 *               SDL_UnlockProperties().
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetBooleanProperty
	 * \sa SDL_GetFloatProperty
	 * \sa SDL_GetNumberProperty
	 * \sa SDL_GetPropertyType
	 * \sa SDL_GetStringProperty
	 * \sa SDL_HasProperty
	 * \sa SDL_SetPointerProperty
	 */"

	^ self ffiCall: #(void* SDL_GetPointerProperty(SDL_PropertiesID props, const char* name, void* default_value))
]

{ #category : 'public' }
LibSDL3 >> getPowerInfoSeconds: seconds percent: percent [
	"/**
	 * Get the current power supply details.
	 *
	 * You should never take a battery status as absolute truth. Batteries
	 * (especially failing batteries) are delicate hardware, and the values
	 * reported here are best estimates based on what that hardware reports. It's
	 * not uncommon for older batteries to lose stored power much faster than it
	 * reports, or completely drain when reporting it has 20 percent left, etc.
	 *
	 * Battery status can change at any time; if you are concerned with power
	 * state, you should call this function frequently, and perhaps ignore changes
	 * until they seem to be stable for a few seconds.
	 *
	 * It's possible a platform can only report battery percentage or time left
	 * but not both.
	 *
	 * On some platforms, retrieving power supply details might be expensive. If
	 * you want to display continuous status you could call this function every
	 * minute or so.
	 *
	 * \param seconds a pointer filled in with the seconds of battery life left,
	 *                or NULL to ignore. This will be filled in with -1 if we
	 *                can't determine a value or there is no battery.
	 * \param percent a pointer filled in with the percentage of battery life
	 *                left, between 0 and 100, or NULL to ignore. This will be
	 *                filled in with -1 we can't determine a value or there is no
	 *                battery.
	 * \returns the current battery state or `SDL_POWERSTATE_ERROR` on failure;
	 *          call SDL_GetError() for more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_PowerState SDL_GetPowerInfo(int* seconds, int* percent))
]

{ #category : 'public' }
LibSDL3 >> getPrefPathOrg: org app: app [
	"/**
	 * Get the user-and-app-specific path where files can be written.
	 *
	 * Get the ""pref dir"". This is meant to be where users can write personal
	 * files (preferences and save games, etc) that are specific to your
	 * application. This directory is unique per user, per application.
	 *
	 * This function will decide the appropriate location in the native
	 * filesystem, create the directory if necessary, and return a string of the
	 * absolute path to the directory in UTF-8 encoding.
	 *
	 * On Windows, the string might look like:
	 *
	 * `C:\\Users\\bob\\AppData\\Roaming\\My Company\\My Program Name\\`
	 *
	 * On Linux, the string might look like:
	 *
	 * `/home/bob/.local/share/My Program Name/`
	 *
	 * On macOS, the string might look like:
	 *
	 * `/Users/bob/Library/Application Support/My Program Name/`
	 *
	 * You should assume the path returned by this function is the only safe place
	 * to write files (and that SDL_GetBasePath(), while it might be writable, or
	 * even the parent of the returned path, isn't where you should be writing
	 * things).
	 *
	 * Both the org and app strings may become part of a directory name, so please
	 * follow these rules:
	 *
	 * - Try to use the same org string (_including case-sensitivity_) for all
	 *   your applications that use this function.
	 * - Always use a unique app string for each one, and make sure it never
	 *   changes for an app once you've decided on it.
	 * - Unicode characters are legal, as long as they are UTF-8 encoded, but...
	 * - ...only use letters, numbers, and spaces. Avoid punctuation like ""Game
	 *   Name 2: Bad Guy's Revenge!"" ... ""Game Name 2"" is sufficient.
	 *
	 * The returned path is guaranteed to end with a path separator ('\\' on
	 * Windows, '/' on most other platforms).
	 *
	 * \param org the name of your organization.
	 * \param app the name of your application.
	 * \returns a UTF-8 string of the user directory in platform-dependent
	 *          notation. NULL if there's a problem (creating directory failed,
	 *          etc.). This should be freed with SDL_free() when it is no longer
	 *          needed.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetBasePath
	 */"

	^ self ffiCall: #(char* SDL_GetPrefPath(const char* org, const char* app))
]

{ #category : 'public' }
LibSDL3 >> getPreferredLocales: count [
	"/**
	 * Report the user's preferred locale.
	 *
	 * Returned language strings are in the format xx, where 'xx' is an ISO-639
	 * language specifier (such as ""en"" for English, ""de"" for German, etc).
	 * Country strings are in the format YY, where ""YY"" is an ISO-3166 country
	 * code (such as ""US"" for the United States, ""CA"" for Canada, etc). Country
	 * might be NULL if there's no specific guidance on them (so you might get {
	 * ""en"", ""US"" } for American English, but { ""en"", NULL } means ""English
	 * language, generically""). Language strings are never NULL, except to
	 * terminate the array.
	 *
	 * Please note that not all of these strings are 2 characters; some are three
	 * or more.
	 *
	 * The returned list of locales are in the order of the user's preference. For
	 * example, a German citizen that is fluent in US English and knows enough
	 * Japanese to navigate around Tokyo might have a list like: { ""de"", ""en_US"",
	 * ""jp"", NULL }. Someone from England might prefer British English (where
	 * ""color"" is spelled ""colour"", etc), but will settle for anything like it: {
	 * ""en_GB"", ""en"", NULL }.
	 *
	 * This function returns NULL on error, including when the platform does not
	 * supply this information at all.
	 *
	 * This might be a ""slow"" call that has to query the operating system. It's
	 * best to ask for this once and save the results. However, this list can
	 * change, usually because the user has changed a system preference outside of
	 * your program; SDL will send an SDL_EVENT_LOCALE_CHANGED event in this case,
	 * if possible, and you can call this function again to get an updated copy of
	 * preferred locales.
	 *
	 * \param count a pointer filled in with the number of locales returned, may
	 *              be NULL.
	 * \returns a NULL terminated array of locale pointers, or NULL on failure;
	 *          call SDL_GetError() for more information. This is a single
	 *          allocation that should be freed with SDL_free() when it is no
	 *          longer needed.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_Locale** SDL_GetPreferredLocales(int* count))
]

{ #category : 'public' }
LibSDL3 >> getPrimaryDisplay [
	"/**
	 * Return the primary display.
	 *
	 * \returns the instance ID of the primary display on success or 0 on failure;
	 *          call SDL_GetError() for more information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetDisplays
	 */"

	^ self ffiCall: #(SDL_DisplayID SDL_GetPrimaryDisplay())
]

{ #category : 'public' }
LibSDL3 >> getPrimarySelectionText [
	"/**
	 * Get UTF-8 text from the primary selection.
	 *
	 * This functions returns an empty string if there was not enough memory left
	 * for a copy of the primary selection's content.
	 *
	 * \returns the primary selection text on success or an empty string on
	 *          failure; call SDL_GetError() for more information. This should be
	 *          freed with SDL_free() when it is no longer needed.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_HasPrimarySelectionText
	 * \sa SDL_SetPrimarySelectionText
	 */"

	^ self ffiCall: #(char* SDL_GetPrimarySelectionText())
]

{ #category : 'public' }
LibSDL3 >> getPropertyTypeProps: props name: name [
	"/**
	 * Get the type of a property in a group of properties.
	 *
	 * \param props the properties to query.
	 * \param name the name of the property to query.
	 * \returns the type of the property, or SDL_PROPERTY_TYPE_INVALID if it is
	 *          not set.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_HasProperty
	 */"

	^ self ffiCall: #(SDL_PropertyType SDL_GetPropertyType(SDL_PropertiesID props, const char* name))
]

{ #category : 'public' }
LibSDL3 >> getRGBAPixel: pixel format: format palette: palette r: r g: g b: b a: a [
	"/**
	 * Get RGBA values from a pixel in the specified format.
	 *
	 * This function uses the entire 8-bit [0..255] range when converting color
	 * components from pixel formats with less than 8-bits per RGB component
	 * (e.g., a completely white pixel in 16-bit RGB565 format would return [0xff,
	 * 0xff, 0xff] not [0xf8, 0xfc, 0xf8]).
	 *
	 * If the surface has no alpha component, the alpha will be returned as 0xff
	 * (100% opaque).
	 *
	 * \param pixel a pixel value.
	 * \param format a pointer to SDL_PixelFormatDetails describing the pixel
	 *               format.
	 * \param palette an optional palette for indexed formats, may be NULL.
	 * \param r a pointer filled in with the red component, may be NULL.
	 * \param g a pointer filled in with the green component, may be NULL.
	 * \param b a pointer filled in with the blue component, may be NULL.
	 * \param a a pointer filled in with the alpha component, may be NULL.
	 *
	 * \threadsafety It is safe to call this function from any thread, as long as
	 *               the palette is not modified.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetPixelFormatDetails
	 * \sa SDL_GetRGB
	 * \sa SDL_MapRGB
	 * \sa SDL_MapRGBA
	 */"

	self ffiCall: #(void SDL_GetRGBA(Uint32 pixel, SDL_PixelFormatDetails* format, SDL_Palette* palette, Uint8* r, Uint8* g, Uint8* b, Uint8* a))
]

{ #category : 'public' }
LibSDL3 >> getRGBPixel: pixel format: format palette: palette r: r g: g b: b [
	"/**
	 * Get RGB values from a pixel in the specified format.
	 *
	 * This function uses the entire 8-bit [0..255] range when converting color
	 * components from pixel formats with less than 8-bits per RGB component
	 * (e.g., a completely white pixel in 16-bit RGB565 format would return [0xff,
	 * 0xff, 0xff] not [0xf8, 0xfc, 0xf8]).
	 *
	 * \param pixel a pixel value.
	 * \param format a pointer to SDL_PixelFormatDetails describing the pixel
	 *               format.
	 * \param palette an optional palette for indexed formats, may be NULL.
	 * \param r a pointer filled in with the red component, may be NULL.
	 * \param g a pointer filled in with the green component, may be NULL.
	 * \param b a pointer filled in with the blue component, may be NULL.
	 *
	 * \threadsafety It is safe to call this function from any thread, as long as
	 *               the palette is not modified.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetPixelFormatDetails
	 * \sa SDL_GetRGBA
	 * \sa SDL_MapRGB
	 * \sa SDL_MapRGBA
	 */"

	self ffiCall: #(void SDL_GetRGB(Uint32 pixel, SDL_PixelFormatDetails* format, SDL_Palette* palette, Uint8* r, Uint8* g, Uint8* b))
]

{ #category : 'public' }
LibSDL3 >> getRectAndLineIntersectionFloatRect: rect X1: X1 Y1: Y1 X2: X2 Y2: Y2 [
	"/**
	 * Calculate the intersection of a rectangle and line segment with float
	 * precision.
	 *
	 * This function is used to clip a line segment to a rectangle. A line segment
	 * contained entirely within the rectangle or that does not intersect will
	 * remain unchanged. A line segment that crosses the rectangle at either or
	 * both ends will be clipped to the boundary of the rectangle and the new
	 * coordinates saved in `X1`, `Y1`, `X2`, and/or `Y2` as necessary.
	 *
	 * \param rect an SDL_FRect structure representing the rectangle to intersect.
	 * \param X1 a pointer to the starting X-coordinate of the line.
	 * \param Y1 a pointer to the starting Y-coordinate of the line.
	 * \param X2 a pointer to the ending X-coordinate of the line.
	 * \param Y2 a pointer to the ending Y-coordinate of the line.
	 * \returns true if there is an intersection, false otherwise.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_GetRectAndLineIntersectionFloat(SDL_FRect* rect, float* X1, float* Y1, float* X2, float* Y2))
]

{ #category : 'public' }
LibSDL3 >> getRectAndLineIntersectionRect: rect X1: X1 Y1: Y1 X2: X2 Y2: Y2 [
	"/**
	 * Calculate the intersection of a rectangle and line segment.
	 *
	 * This function is used to clip a line segment to a rectangle. A line segment
	 * contained entirely within the rectangle or that does not intersect will
	 * remain unchanged. A line segment that crosses the rectangle at either or
	 * both ends will be clipped to the boundary of the rectangle and the new
	 * coordinates saved in `X1`, `Y1`, `X2`, and/or `Y2` as necessary.
	 *
	 * \param rect an SDL_Rect structure representing the rectangle to intersect.
	 * \param X1 a pointer to the starting X-coordinate of the line.
	 * \param Y1 a pointer to the starting Y-coordinate of the line.
	 * \param X2 a pointer to the ending X-coordinate of the line.
	 * \param Y2 a pointer to the ending Y-coordinate of the line.
	 * \returns true if there is an intersection, false otherwise.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_GetRectAndLineIntersection(SDL_Rect* rect, int* X1, int* Y1, int* X2, int* Y2))
]

{ #category : 'public' }
LibSDL3 >> getRectEnclosingPoints: points count: count clip: clip result: result [
	"/**
	 * Calculate a minimal rectangle enclosing a set of points.
	 *
	 * If `clip` is not NULL then only points inside of the clipping rectangle are
	 * considered.
	 *
	 * \param points an array of SDL_Point structures representing points to be
	 *               enclosed.
	 * \param count the number of structures in the `points` array.
	 * \param clip an SDL_Rect used for clipping or NULL to enclose all points.
	 * \param result an SDL_Rect structure filled in with the minimal enclosing
	 *               rectangle.
	 * \returns true if any points were enclosed or false if all the points were
	 *          outside of the clipping rectangle.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_GetRectEnclosingPoints(SDL_Point* points, int count, SDL_Rect* clip, SDL_Rect* result))
]

{ #category : 'public' }
LibSDL3 >> getRectEnclosingPointsFloatPoints: points count: count clip: clip result: result [
	"/**
	 * Calculate a minimal rectangle enclosing a set of points with float
	 * precision.
	 *
	 * If `clip` is not NULL then only points inside of the clipping rectangle are
	 * considered.
	 *
	 * \param points an array of SDL_FPoint structures representing points to be
	 *               enclosed.
	 * \param count the number of structures in the `points` array.
	 * \param clip an SDL_FRect used for clipping or NULL to enclose all points.
	 * \param result an SDL_FRect structure filled in with the minimal enclosing
	 *               rectangle.
	 * \returns true if any points were enclosed or false if all the points were
	 *          outside of the clipping rectangle.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_GetRectEnclosingPointsFloat(SDL_FPoint* points, int count, SDL_FRect* clip, SDL_FRect* result))
]

{ #category : 'public' }
LibSDL3 >> getRectIntersectionA: A B: B result: result [
	"/**
	 * Calculate the intersection of two rectangles.
	 *
	 * If `result` is NULL then this function will return false.
	 *
	 * \param A an SDL_Rect structure representing the first rectangle.
	 * \param B an SDL_Rect structure representing the second rectangle.
	 * \param result an SDL_Rect structure filled in with the intersection of
	 *               rectangles `A` and `B`.
	 * \returns true if there is an intersection, false otherwise.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_HasRectIntersection
	 */"

	^ self ffiCall: #(bool SDL_GetRectIntersection(SDL_Rect* A, SDL_Rect* B, SDL_Rect* result))
]

{ #category : 'public' }
LibSDL3 >> getRectIntersectionFloatA: A B: B result: result [
	"/**
	 * Calculate the intersection of two rectangles with float precision.
	 *
	 * If `result` is NULL then this function will return false.
	 *
	 * \param A an SDL_FRect structure representing the first rectangle.
	 * \param B an SDL_FRect structure representing the second rectangle.
	 * \param result an SDL_FRect structure filled in with the intersection of
	 *               rectangles `A` and `B`.
	 * \returns true if there is an intersection, false otherwise.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_HasRectIntersectionFloat
	 */"

	^ self ffiCall: #(bool SDL_GetRectIntersectionFloat(SDL_FRect* A, SDL_FRect* B, SDL_FRect* result))
]

{ #category : 'public' }
LibSDL3 >> getRectUnionA: A B: B result: result [
	"/**
	 * Calculate the union of two rectangles.
	 *
	 * \param A an SDL_Rect structure representing the first rectangle.
	 * \param B an SDL_Rect structure representing the second rectangle.
	 * \param result an SDL_Rect structure filled in with the union of rectangles
	 *               `A` and `B`.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_GetRectUnion(SDL_Rect* A, SDL_Rect* B, SDL_Rect* result))
]

{ #category : 'public' }
LibSDL3 >> getRectUnionFloatA: A B: B result: result [
	"/**
	 * Calculate the union of two rectangles with float precision.
	 *
	 * \param A an SDL_FRect structure representing the first rectangle.
	 * \param B an SDL_FRect structure representing the second rectangle.
	 * \param result an SDL_FRect structure filled in with the union of rectangles
	 *               `A` and `B`.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_GetRectUnionFloat(SDL_FRect* A, SDL_FRect* B, SDL_FRect* result))
]

{ #category : 'public' }
LibSDL3 >> getRelativeMouseStateX: x y: y [
	"/**
	 * Query SDL's cache for the synchronous mouse button state and accumulated
	 * mouse delta since last call.
	 *
	 * This function returns the cached synchronous state as SDL understands it
	 * from the last pump of the event queue.
	 *
	 * To query the platform for immediate asynchronous state, use
	 * SDL_GetGlobalMouseState.
	 *
	 * Passing non-NULL pointers to `x` or `y` will write the destination with
	 * respective x or y deltas accumulated since the last call to this function
	 * (or since event initialization).
	 *
	 * This function is useful for reducing overhead by processing relative mouse
	 * inputs in one go per-frame instead of individually per-event, at the
	 * expense of losing the order between events within the frame (e.g. quickly
	 * pressing and releasing a button within the same frame).
	 *
	 * \param x a pointer to receive the x mouse delta accumulated since last
	 *          call, can be NULL if unused.
	 * \param y a pointer to receive the y mouse delta accumulated since last
	 *          call, can be NULL if unused.
	 * \returns a 32-bit bitmask of the button state that can be bitwise-compared
	 *          against the SDL_BUTTON_MASK(X) macro.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetMouseState
	 * \sa SDL_GetGlobalMouseState
	 */"

	^ self ffiCall: #(SDL_MouseButtonFlags SDL_GetRelativeMouseState(float* x, float* y))
]

{ #category : 'public' }
LibSDL3 >> getRenderClipRectRenderer: renderer rect: rect [
	"/**
	 * Get the clip rectangle for the current target.
	 *
	 * Each render target has its own clip rectangle. This function gets the
	 * cliprect for the current render target.
	 *
	 * \param renderer the rendering context.
	 * \param rect an SDL_Rect structure filled in with the current clipping area
	 *             or an empty rectangle if clipping is disabled.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_RenderClipEnabled
	 * \sa SDL_SetRenderClipRect
	 */"

	^ self ffiCall: #(bool SDL_GetRenderClipRect(SDL_Renderer* renderer, SDL_Rect* rect))
]

{ #category : 'public' }
LibSDL3 >> getRenderColorScaleRenderer: renderer scale: scale [
	"/**
	 * Get the color scale used for render operations.
	 *
	 * \param renderer the rendering context.
	 * \param scale a pointer filled in with the current color scale value.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetRenderColorScale
	 */"

	^ self ffiCall: #(bool SDL_GetRenderColorScale(SDL_Renderer* renderer, float* scale))
]

{ #category : 'public' }
LibSDL3 >> getRenderDrawBlendModeRenderer: renderer blendMode: blendMode [
	"/**
	 * Get the blend mode used for drawing operations.
	 *
	 * \param renderer the rendering context.
	 * \param blendMode a pointer filled in with the current SDL_BlendMode.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetRenderDrawBlendMode
	 */"

	^ self ffiCall: #(bool SDL_GetRenderDrawBlendMode(SDL_Renderer* renderer, SDL_BlendMode* blendMode))
]

{ #category : 'public' }
LibSDL3 >> getRenderDrawColorFloatRenderer: renderer r: r g: g b: b a: a [
	"/**
	 * Get the color used for drawing operations (Rect, Line and Clear).
	 *
	 * \param renderer the rendering context.
	 * \param r a pointer filled in with the red value used to draw on the
	 *          rendering target.
	 * \param g a pointer filled in with the green value used to draw on the
	 *          rendering target.
	 * \param b a pointer filled in with the blue value used to draw on the
	 *          rendering target.
	 * \param a a pointer filled in with the alpha value used to draw on the
	 *          rendering target.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetRenderDrawColorFloat
	 * \sa SDL_GetRenderDrawColor
	 */"

	^ self ffiCall: #(bool SDL_GetRenderDrawColorFloat(SDL_Renderer* renderer, float* r, float* g, float* b, float* a))
]

{ #category : 'public' }
LibSDL3 >> getRenderDrawColorRenderer: renderer r: r g: g b: b a: a [
	"/**
	 * Get the color used for drawing operations (Rect, Line and Clear).
	 *
	 * \param renderer the rendering context.
	 * \param r a pointer filled in with the red value used to draw on the
	 *          rendering target.
	 * \param g a pointer filled in with the green value used to draw on the
	 *          rendering target.
	 * \param b a pointer filled in with the blue value used to draw on the
	 *          rendering target.
	 * \param a a pointer filled in with the alpha value used to draw on the
	 *          rendering target; usually `SDL_ALPHA_OPAQUE` (255).
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetRenderDrawColorFloat
	 * \sa SDL_SetRenderDrawColor
	 */"

	^ self ffiCall: #(bool SDL_GetRenderDrawColor(SDL_Renderer* renderer, Uint8* r, Uint8* g, Uint8* b, Uint8* a))
]

{ #category : 'public' }
LibSDL3 >> getRenderDriver: index [
	"/**
	 * Use this function to get the name of a built in 2D rendering driver.
	 *
	 * The list of rendering drivers is given in the order that they are normally
	 * initialized by default; the drivers that seem more reasonable to choose
	 * first (as far as the SDL developers believe) are earlier in the list.
	 *
	 * The names of drivers are all simple, low-ASCII identifiers, like ""opengl"",
	 * ""direct3d12"" or ""metal"". These never have Unicode characters, and are not
	 * meant to be proper names.
	 *
	 * \param index the index of the rendering driver; the value ranges from 0 to
	 *              SDL_GetNumRenderDrivers() - 1.
	 * \returns the name of the rendering driver at the requested index, or NULL
	 *          if an invalid index was specified.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetNumRenderDrivers
	 */"

	^ self ffiCall: #(const char* SDL_GetRenderDriver(int index))
]

{ #category : 'public' }
LibSDL3 >> getRenderLogicalPresentationRectRenderer: renderer rect: rect [
	"/**
	 * Get the final presentation rectangle for rendering.
	 *
	 * This function returns the calculated rectangle used for logical
	 * presentation, based on the presentation mode and output size. If logical
	 * presentation is disabled, it will fill the rectangle with the output size,
	 * in pixels.
	 *
	 * Each render target has its own logical presentation state. This function
	 * gets the rectangle for the current render target.
	 *
	 * \param renderer the rendering context.
	 * \param rect a pointer filled in with the final presentation rectangle, may
	 *             be NULL.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetRenderLogicalPresentation
	 */"

	^ self ffiCall: #(bool SDL_GetRenderLogicalPresentationRect(SDL_Renderer* renderer, SDL_FRect* rect))
]

{ #category : 'public' }
LibSDL3 >> getRenderLogicalPresentationRenderer: renderer w: w h: h mode: mode [
	"/**
	 * Get device independent resolution and presentation mode for rendering.
	 *
	 * This function gets the width and height of the logical rendering output, or
	 * the output size in pixels if a logical resolution is not enabled.
	 *
	 * Each render target has its own logical presentation state. This function
	 * gets the state for the current render target.
	 *
	 * \param renderer the rendering context.
	 * \param w an int to be filled with the width.
	 * \param h an int to be filled with the height.
	 * \param mode the presentation mode used.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetRenderLogicalPresentation
	 */"

	^ self ffiCall: #(bool SDL_GetRenderLogicalPresentation(SDL_Renderer* renderer, int* w, int* h, SDL_RendererLogicalPresentation mode))
]

{ #category : 'public' }
LibSDL3 >> getRenderMetalCommandEncoder: renderer [
	"/**
	 * Get the Metal command encoder for the current frame.
	 *
	 * This function returns `void *`, so SDL doesn't have to include Metal's
	 * headers, but it can be safely cast to an `id<MTLRenderCommandEncoder>`.
	 *
	 * This will return NULL if Metal refuses to give SDL a drawable to render to,
	 * which might happen if the window is hidden/minimized/offscreen. This
	 * doesn't apply to command encoders for render targets, just the window's
	 * backbuffer. Check your return values!
	 *
	 * \param renderer the renderer to query.
	 * \returns an `id<MTLRenderCommandEncoder>` on success, or NULL if the
	 *          renderer isn't a Metal renderer or there was an error.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetRenderMetalLayer
	 */"

	^ self ffiCall: #(void* SDL_GetRenderMetalCommandEncoder(SDL_Renderer* renderer))
]

{ #category : 'public' }
LibSDL3 >> getRenderMetalLayer: renderer [
	"/**
	 * Get the CAMetalLayer associated with the given Metal renderer.
	 *
	 * This function returns `void *`, so SDL doesn't have to include Metal's
	 * headers, but it can be safely cast to a `CAMetalLayer *`.
	 *
	 * \param renderer the renderer to query.
	 * \returns a `CAMetalLayer *` on success, or NULL if the renderer isn't a
	 *          Metal renderer.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetRenderMetalCommandEncoder
	 */"

	^ self ffiCall: #(void* SDL_GetRenderMetalLayer(SDL_Renderer* renderer))
]

{ #category : 'public' }
LibSDL3 >> getRenderOutputSizeRenderer: renderer w: w h: h [
	"/**
	 * Get the output size in pixels of a rendering context.
	 *
	 * This returns the true output size in pixels, ignoring any render targets or
	 * logical size and presentation.
	 *
	 * For the output size of the current rendering target, with logical size
	 * adjustments, use SDL_GetCurrentRenderOutputSize() instead.
	 *
	 * \param renderer the rendering context.
	 * \param w a pointer filled in with the width in pixels.
	 * \param h a pointer filled in with the height in pixels.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetCurrentRenderOutputSize
	 */"

	^ self ffiCall: #(bool SDL_GetRenderOutputSize(SDL_Renderer* renderer, int* w, int* h))
]

{ #category : 'public' }
LibSDL3 >> getRenderSafeAreaRenderer: renderer rect: rect [
	"/**
	 * Get the safe area for rendering within the current viewport.
	 *
	 * Some devices have portions of the screen which are partially obscured or
	 * not interactive, possibly due to on-screen controls, curved edges, camera
	 * notches, TV overscan, etc. This function provides the area of the current
	 * viewport which is safe to have interactible content. You should continue
	 * rendering into the rest of the render target, but it should not contain
	 * visually important or interactible content.
	 *
	 * \param renderer the rendering context.
	 * \param rect a pointer filled in with the area that is safe for interactive
	 *             content.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_GetRenderSafeArea(SDL_Renderer* renderer, SDL_Rect* rect))
]

{ #category : 'public' }
LibSDL3 >> getRenderScaleRenderer: renderer scaleX: scaleX scaleY: scaleY [
	"/**
	 * Get the drawing scale for the current target.
	 *
	 * Each render target has its own scale. This function gets the scale for the
	 * current render target.
	 *
	 * \param renderer the rendering context.
	 * \param scaleX a pointer filled in with the horizontal scaling factor.
	 * \param scaleY a pointer filled in with the vertical scaling factor.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetRenderScale
	 */"

	^ self ffiCall: #(bool SDL_GetRenderScale(SDL_Renderer* renderer, float* scaleX, float* scaleY))
]

{ #category : 'public' }
LibSDL3 >> getRenderTarget: renderer [
	"/**
	 * Get the current render target.
	 *
	 * The default render target is the window for which the renderer was created,
	 * and is reported a NULL here.
	 *
	 * \param renderer the rendering context.
	 * \returns the current render target or NULL for the default render target.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetRenderTarget
	 */"

	^ self ffiCall: #(SDL_Texture* SDL_GetRenderTarget(SDL_Renderer* renderer))
]

{ #category : 'public' }
LibSDL3 >> getRenderVSyncRenderer: renderer vsync: vsync [
	"/**
	 * Get VSync of the given renderer.
	 *
	 * \param renderer the renderer to toggle.
	 * \param vsync an int filled with the current vertical refresh sync interval.
	 *              See SDL_SetRenderVSync() for the meaning of the value.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetRenderVSync
	 */"

	^ self ffiCall: #(bool SDL_GetRenderVSync(SDL_Renderer* renderer, int* vsync))
]

{ #category : 'public' }
LibSDL3 >> getRenderViewportRenderer: renderer rect: rect [
	"/**
	 * Get the drawing area for the current target.
	 *
	 * Each render target has its own viewport. This function gets the viewport
	 * for the current render target.
	 *
	 * \param renderer the rendering context.
	 * \param rect an SDL_Rect structure filled in with the current drawing area.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_RenderViewportSet
	 * \sa SDL_SetRenderViewport
	 */"

	^ self ffiCall: #(bool SDL_GetRenderViewport(SDL_Renderer* renderer, SDL_Rect* rect))
]

{ #category : 'public' }
LibSDL3 >> getRenderWindow: renderer [
	"/**
	 * Get the window associated with a renderer.
	 *
	 * \param renderer the renderer to query.
	 * \returns the window on success or NULL on failure; call SDL_GetError() for
	 *          more information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_Window* SDL_GetRenderWindow(SDL_Renderer* renderer))
]

{ #category : 'public' }
LibSDL3 >> getRenderer: window [
	"/**
	 * Get the renderer associated with a window.
	 *
	 * \param window the window to query.
	 * \returns the rendering context on success or NULL on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_Renderer* SDL_GetRenderer(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> getRendererFromTexture: texture [
	"/**
	 * Get the renderer that created an SDL_Texture.
	 *
	 * \param texture the texture to query.
	 * \returns a pointer to the SDL_Renderer that created the texture, or NULL on
	 *          failure; call SDL_GetError() for more information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_Renderer* SDL_GetRendererFromTexture(SDL_Texture* texture))
]

{ #category : 'public' }
LibSDL3 >> getRendererName: renderer [
	"/**
	 * Get the name of a renderer.
	 *
	 * \param renderer the rendering context.
	 * \returns the name of the selected renderer, or NULL on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateRenderer
	 * \sa SDL_CreateRendererWithProperties
	 */"

	^ self ffiCall: #(const char* SDL_GetRendererName(SDL_Renderer* renderer))
]

{ #category : 'public' }
LibSDL3 >> getRendererProperties: renderer [
	"/**
	 * Get the properties associated with a renderer.
	 *
	 * The following read-only properties are provided by SDL:
	 *
	 * - `SDL_PROP_RENDERER_NAME_STRING`: the name of the rendering driver
	 * - `SDL_PROP_RENDERER_WINDOW_POINTER`: the window where rendering is
	 *   displayed, if any
	 * - `SDL_PROP_RENDERER_SURFACE_POINTER`: the surface where rendering is
	 *   displayed, if this is a software renderer without a window
	 * - `SDL_PROP_RENDERER_VSYNC_NUMBER`: the current vsync setting
	 * - `SDL_PROP_RENDERER_MAX_TEXTURE_SIZE_NUMBER`: the maximum texture width
	 *   and height
	 * - `SDL_PROP_RENDERER_TEXTURE_FORMATS_POINTER`: a (const SDL_PixelFormat *)
	 *   array of pixel formats, terminated with SDL_PIXELFORMAT_UNKNOWN,
	 *   representing the available texture formats for this renderer.
	 * - `SDL_PROP_RENDERER_OUTPUT_COLORSPACE_NUMBER`: an SDL_Colorspace value
	 *   describing the colorspace for output to the display, defaults to
	 *   SDL_COLORSPACE_SRGB.
	 * - `SDL_PROP_RENDERER_HDR_ENABLED_BOOLEAN`: true if the output colorspace is
	 *   SDL_COLORSPACE_SRGB_LINEAR and the renderer is showing on a display with
	 *   HDR enabled. This property can change dynamically when
	 *   SDL_EVENT_WINDOW_HDR_STATE_CHANGED is sent.
	 * - `SDL_PROP_RENDERER_SDR_WHITE_POINT_FLOAT`: the value of SDR white in the
	 *   SDL_COLORSPACE_SRGB_LINEAR colorspace. When HDR is enabled, this value is
	 *   automatically multiplied into the color scale. This property can change
	 *   dynamically when SDL_EVENT_WINDOW_HDR_STATE_CHANGED is sent.
	 * - `SDL_PROP_RENDERER_HDR_HEADROOM_FLOAT`: the additional high dynamic range
	 *   that can be displayed, in terms of the SDR white point. When HDR is not
	 *   enabled, this will be 1.0. This property can change dynamically when
	 *   SDL_EVENT_WINDOW_HDR_STATE_CHANGED is sent.
	 *
	 * With the direct3d renderer:
	 *
	 * - `SDL_PROP_RENDERER_D3D9_DEVICE_POINTER`: the IDirect3DDevice9 associated
	 *   with the renderer
	 *
	 * With the direct3d11 renderer:
	 *
	 * - `SDL_PROP_RENDERER_D3D11_DEVICE_POINTER`: the ID3D11Device associated
	 *   with the renderer
	 * - `SDL_PROP_RENDERER_D3D11_SWAPCHAIN_POINTER`: the IDXGISwapChain1
	 *   associated with the renderer. This may change when the window is resized.
	 *
	 * With the direct3d12 renderer:
	 *
	 * - `SDL_PROP_RENDERER_D3D12_DEVICE_POINTER`: the ID3D12Device associated
	 *   with the renderer
	 * - `SDL_PROP_RENDERER_D3D12_SWAPCHAIN_POINTER`: the IDXGISwapChain4
	 *   associated with the renderer.
	 * - `SDL_PROP_RENDERER_D3D12_COMMAND_QUEUE_POINTER`: the ID3D12CommandQueue
	 *   associated with the renderer
	 *
	 * With the vulkan renderer:
	 *
	 * - `SDL_PROP_RENDERER_VULKAN_INSTANCE_POINTER`: the VkInstance associated
	 *   with the renderer
	 * - `SDL_PROP_RENDERER_VULKAN_SURFACE_NUMBER`: the VkSurfaceKHR associated
	 *   with the renderer
	 * - `SDL_PROP_RENDERER_VULKAN_PHYSICAL_DEVICE_POINTER`: the VkPhysicalDevice
	 *   associated with the renderer
	 * - `SDL_PROP_RENDERER_VULKAN_DEVICE_POINTER`: the VkDevice associated with
	 *   the renderer
	 * - `SDL_PROP_RENDERER_VULKAN_GRAPHICS_QUEUE_FAMILY_INDEX_NUMBER`: the queue
	 *   family index used for rendering
	 * - `SDL_PROP_RENDERER_VULKAN_PRESENT_QUEUE_FAMILY_INDEX_NUMBER`: the queue
	 *   family index used for presentation
	 * - `SDL_PROP_RENDERER_VULKAN_SWAPCHAIN_IMAGE_COUNT_NUMBER`: the number of
	 *   swapchain images, or potential frames in flight, used by the Vulkan
	 *   renderer
	 *
	 * With the gpu renderer:
	 *
	 * - `SDL_PROP_RENDERER_GPU_DEVICE_POINTER`: the SDL_GPUDevice associated with
	 *   the renderer
	 *
	 * \param renderer the rendering context.
	 * \returns a valid property ID on success or 0 on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_PropertiesID SDL_GetRendererProperties(SDL_Renderer* renderer))
]

{ #category : 'public' }
LibSDL3 >> getRevision [
	"/**
	 * Get the code revision of SDL that is linked against your program.
	 *
	 * This value is the revision of the code you are linked with and may be
	 * different from the code you are compiling with, which is found in the
	 * constant SDL_REVISION.
	 *
	 * The revision is arbitrary string (a hash value) uniquely identifying the
	 * exact revision of the SDL library in use, and is only useful in comparing
	 * against other revisions. It is NOT an incrementing number.
	 *
	 * If SDL wasn't built from a git repository with the appropriate tools, this
	 * will return an empty string.
	 *
	 * You shouldn't use this function for anything but logging it for debugging
	 * purposes. The string is not intended to be reliable in any way.
	 *
	 * \returns an arbitrary string, uniquely identifying the exact revision of
	 *          the SDL library in use.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetVersion
	 */"

	^ self ffiCall: #(const char* SDL_GetRevision())
]

{ #category : 'public' }
LibSDL3 >> getSIMDAlignment [
	"/**
	 * Report the alignment this system needs for SIMD allocations.
	 *
	 * This will return the minimum number of bytes to which a pointer must be
	 * aligned to be compatible with SIMD instructions on the current machine. For
	 * example, if the machine supports SSE only, it will return 16, but if it
	 * supports AVX-512F, it'll return 64 (etc). This only reports values for
	 * instruction sets SDL knows about, so if your SDL build doesn't have
	 * SDL_HasAVX512F(), then it might return 16 for the SSE support it sees and
	 * not 64 for the AVX-512 instructions that exist but SDL doesn't know about.
	 * Plan accordingly.
	 *
	 * \returns the alignment in bytes needed for available, known SIMD
	 *          instructions.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_aligned_alloc
	 * \sa SDL_aligned_free
	 */"

	^ self ffiCall: #(size_t SDL_GetSIMDAlignment())
]

{ #category : 'public' }
LibSDL3 >> getSandbox [
	"/**
	 * Get the application sandbox environment, if any.
	 *
	 * \returns the application sandbox environment or SDL_SANDBOX_NONE if the
	 *          application is not running in a sandbox environment.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_Sandbox SDL_GetSandbox())
]

{ #category : 'public' }
LibSDL3 >> getScancodeFromKey: key modstate: modstate [
	"/**
	 * Get the scancode corresponding to the given key code according to the
	 * current keyboard layout.
	 *
	 * Note that there may be multiple scancode+modifier states that can generate
	 * this keycode, this will just return the first one found.
	 *
	 * \param key the desired SDL_Keycode to query.
	 * \param modstate a pointer to the modifier state that would be used when the
	 *                 scancode generates this key, may be NULL.
	 * \returns the SDL_Scancode that corresponds to the given SDL_Keycode.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetKeyFromScancode
	 * \sa SDL_GetScancodeName
	 */"

	^ self ffiCall: #(SDL_Scancode SDL_GetScancodeFromKey(SDL_Keycode key, SDL_Keymod* modstate))
]

{ #category : 'public' }
LibSDL3 >> getScancodeFromName: name [
	"/**
	 * Get a scancode from a human-readable name.
	 *
	 * \param name the human-readable scancode name.
	 * \returns the SDL_Scancode, or `SDL_SCANCODE_UNKNOWN` if the name wasn't
	 *          recognized; call SDL_GetError() for more information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetKeyFromName
	 * \sa SDL_GetScancodeFromKey
	 * \sa SDL_GetScancodeName
	 */"

	^ self ffiCall: #(SDL_Scancode SDL_GetScancodeFromName(const char* name))
]

{ #category : 'public' }
LibSDL3 >> getScancodeName: scancode [
	"/**
	 * Get a human-readable name for a scancode.
	 *
	 * **Warning**: The returned name is by design not stable across platforms,
	 * e.g. the name for `SDL_SCANCODE_LGUI` is ""Left GUI"" under Linux but ""Left
	 * Windows"" under Microsoft Windows, and some scancodes like
	 * `SDL_SCANCODE_NONUSBACKSLASH` don't have any name at all. There are even
	 * scancodes that share names, e.g. `SDL_SCANCODE_RETURN` and
	 * `SDL_SCANCODE_RETURN2` (both called ""Return""). This function is therefore
	 * unsuitable for creating a stable cross-platform two-way mapping between
	 * strings and scancodes.
	 *
	 * \param scancode the desired SDL_Scancode to query.
	 * \returns a pointer to the name for the scancode. If the scancode doesn't
	 *          have a name this function returns an empty string ("""").
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetScancodeFromKey
	 * \sa SDL_GetScancodeFromName
	 * \sa SDL_SetScancodeName
	 */"

	^ self ffiCall: #(const char* SDL_GetScancodeName(SDL_Scancode scancode))
]

{ #category : 'public' }
LibSDL3 >> getSemaphoreValue: sem [
	"/**
	 * Get the current value of a semaphore.
	 *
	 * \param sem the semaphore to query.
	 * \returns the current value of the semaphore.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(Uint32 SDL_GetSemaphoreValue(SDL_Semaphore* sem))
]

{ #category : 'public' }
LibSDL3 >> getSensorDataSensor: sensor data: data numValues: num_values [
	"/**
	 * Get the current state of an opened sensor.
	 *
	 * The number of values and interpretation of the data is sensor dependent.
	 *
	 * \param sensor the SDL_Sensor object to query.
	 * \param data a pointer filled with the current sensor state.
	 * \param num_values the number of values to write to data.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_GetSensorData(SDL_Sensor* sensor, float* data, int num_values))
]

{ #category : 'public' }
LibSDL3 >> getSensorFromID: instance_id [
	"/**
	 * Return the SDL_Sensor associated with an instance ID.
	 *
	 * \param instance_id the sensor instance ID.
	 * \returns an SDL_Sensor object or NULL on failure; call SDL_GetError() for
	 *          more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_Sensor* SDL_GetSensorFromID(SDL_SensorID instance_id))
]

{ #category : 'public' }
LibSDL3 >> getSensorID: sensor [
	"/**
	 * Get the instance ID of a sensor.
	 *
	 * \param sensor the SDL_Sensor object to inspect.
	 * \returns the sensor instance ID, or 0 on failure; call SDL_GetError() for
	 *          more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_SensorID SDL_GetSensorID(SDL_Sensor* sensor))
]

{ #category : 'public' }
LibSDL3 >> getSensorName: sensor [
	"/**
	 * Get the implementation dependent name of a sensor.
	 *
	 * \param sensor the SDL_Sensor object.
	 * \returns the sensor name or NULL on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(const char* SDL_GetSensorName(SDL_Sensor* sensor))
]

{ #category : 'public' }
LibSDL3 >> getSensorNameForID: instance_id [
	"/**
	 * Get the implementation dependent name of a sensor.
	 *
	 * This can be called before any sensors are opened.
	 *
	 * \param instance_id the sensor instance ID.
	 * \returns the sensor name, or NULL if `instance_id` is not valid.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(const char* SDL_GetSensorNameForID(SDL_SensorID instance_id))
]

{ #category : 'public' }
LibSDL3 >> getSensorNonPortableType: sensor [
	"/**
	 * Get the platform dependent type of a sensor.
	 *
	 * \param sensor the SDL_Sensor object to inspect.
	 * \returns the sensor platform dependent type, or -1 if `sensor` is NULL.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(int SDL_GetSensorNonPortableType(SDL_Sensor* sensor))
]

{ #category : 'public' }
LibSDL3 >> getSensorNonPortableTypeForID: instance_id [
	"/**
	 * Get the platform dependent type of a sensor.
	 *
	 * This can be called before any sensors are opened.
	 *
	 * \param instance_id the sensor instance ID.
	 * \returns the sensor platform dependent type, or -1 if `instance_id` is not
	 *          valid.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(int SDL_GetSensorNonPortableTypeForID(SDL_SensorID instance_id))
]

{ #category : 'public' }
LibSDL3 >> getSensorProperties: sensor [
	"/**
	 * Get the properties associated with a sensor.
	 *
	 * \param sensor the SDL_Sensor object.
	 * \returns a valid property ID on success or 0 on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_PropertiesID SDL_GetSensorProperties(SDL_Sensor* sensor))
]

{ #category : 'public' }
LibSDL3 >> getSensorType: sensor [
	"/**
	 * Get the type of a sensor.
	 *
	 * \param sensor the SDL_Sensor object to inspect.
	 * \returns the SDL_SensorType type, or `SDL_SENSOR_INVALID` if `sensor` is
	 *          NULL.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_SensorType SDL_GetSensorType(SDL_Sensor* sensor))
]

{ #category : 'public' }
LibSDL3 >> getSensorTypeForID: instance_id [
	"/**
	 * Get the type of a sensor.
	 *
	 * This can be called before any sensors are opened.
	 *
	 * \param instance_id the sensor instance ID.
	 * \returns the SDL_SensorType, or `SDL_SENSOR_INVALID` if `instance_id` is
	 *          not valid.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_SensorType SDL_GetSensorTypeForID(SDL_SensorID instance_id))
]

{ #category : 'public' }
LibSDL3 >> getSensors: count [
	"/**
	 * Get a list of currently connected sensors.
	 *
	 * \param count a pointer filled in with the number of sensors returned, may
	 *              be NULL.
	 * \returns a 0 terminated array of sensor instance IDs or NULL on failure;
	 *          call SDL_GetError() for more information. This should be freed
	 *          with SDL_free() when it is no longer needed.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_SensorID* SDL_GetSensors(int* count))
]

{ #category : 'public' }
LibSDL3 >> getSilenceValueForFormat: format [
	"/**
	 * Get the appropriate memset value for silencing an audio format.
	 *
	 * The value returned by this function can be used as the second argument to
	 * memset (or SDL_memset) to set an audio buffer in a specific format to
	 * silence.
	 *
	 * \param format the audio data format to query.
	 * \returns a byte value that can be passed to memset.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(int SDL_GetSilenceValueForFormat(SDL_AudioFormat format))
]

{ #category : 'public' }
LibSDL3 >> getStringPropertyProps: props name: name defaultValue: default_value [
	"/**
	 * Get a string property from a group of properties.
	 *
	 * \param props the properties to query.
	 * \param name the name of the property to query.
	 * \param default_value the default value of the property.
	 * \returns the value of the property, or `default_value` if it is not set or
	 *          not a string property.
	 *
	 * \threadsafety It is safe to call this function from any thread, although
	 *               the data returned is not protected and could potentially be
	 *               freed if you call SDL_SetStringProperty() or
	 *               SDL_ClearProperty() on these properties from another thread.
	 *               If you need to avoid this, use SDL_LockProperties() and
	 *               SDL_UnlockProperties().
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetPropertyType
	 * \sa SDL_HasProperty
	 * \sa SDL_SetStringProperty
	 */"

	^ self ffiCall: #(const char* SDL_GetStringProperty(SDL_PropertiesID props, const char* name, const char* default_value))
]

{ #category : 'public' }
LibSDL3 >> getSurfaceAlphaModSurface: surface alpha: alpha [
	"/**
	 * Get the additional alpha value used in blit operations.
	 *
	 * \param surface the SDL_Surface structure to query.
	 * \param alpha a pointer filled in with the current alpha value.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetSurfaceColorMod
	 * \sa SDL_SetSurfaceAlphaMod
	 */"

	^ self ffiCall: #(bool SDL_GetSurfaceAlphaMod(SDL_Surface* surface, Uint8* alpha))
]

{ #category : 'public' }
LibSDL3 >> getSurfaceBlendModeSurface: surface blendMode: blendMode [
	"/**
	 * Get the blend mode used for blit operations.
	 *
	 * \param surface the SDL_Surface structure to query.
	 * \param blendMode a pointer filled in with the current SDL_BlendMode.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetSurfaceBlendMode
	 */"

	^ self ffiCall: #(bool SDL_GetSurfaceBlendMode(SDL_Surface* surface, SDL_BlendMode* blendMode))
]

{ #category : 'public' }
LibSDL3 >> getSurfaceClipRectSurface: surface rect: rect [
	"/**
	 * Get the clipping rectangle for a surface.
	 *
	 * When `surface` is the destination of a blit, only the area within the clip
	 * rectangle is drawn into.
	 *
	 * \param surface the SDL_Surface structure representing the surface to be
	 *                clipped.
	 * \param rect an SDL_Rect structure filled in with the clipping rectangle for
	 *             the surface.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetSurfaceClipRect
	 */"

	^ self ffiCall: #(bool SDL_GetSurfaceClipRect(SDL_Surface* surface, SDL_Rect* rect))
]

{ #category : 'public' }
LibSDL3 >> getSurfaceColorKeySurface: surface key: key [
	"/**
	 * Get the color key (transparent pixel) for a surface.
	 *
	 * The color key is a pixel of the format used by the surface, as generated by
	 * SDL_MapRGB().
	 *
	 * If the surface doesn't have color key enabled this function returns false.
	 *
	 * \param surface the SDL_Surface structure to query.
	 * \param key a pointer filled in with the transparent pixel.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetSurfaceColorKey
	 * \sa SDL_SurfaceHasColorKey
	 */"

	^ self ffiCall: #(bool SDL_GetSurfaceColorKey(SDL_Surface* surface, Uint32* key))
]

{ #category : 'public' }
LibSDL3 >> getSurfaceColorModSurface: surface r: r g: g b: b [
	"/**
	 * Get the additional color value multiplied into blit operations.
	 *
	 * \param surface the SDL_Surface structure to query.
	 * \param r a pointer filled in with the current red color value.
	 * \param g a pointer filled in with the current green color value.
	 * \param b a pointer filled in with the current blue color value.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetSurfaceAlphaMod
	 * \sa SDL_SetSurfaceColorMod
	 */"

	^ self ffiCall: #(bool SDL_GetSurfaceColorMod(SDL_Surface* surface, Uint8* r, Uint8* g, Uint8* b))
]

{ #category : 'public' }
LibSDL3 >> getSurfaceColorspace: surface [
	"/**
	 * Get the colorspace used by a surface.
	 *
	 * The colorspace defaults to SDL_COLORSPACE_SRGB_LINEAR for floating point
	 * formats, SDL_COLORSPACE_HDR10 for 10-bit formats, SDL_COLORSPACE_SRGB for
	 * other RGB surfaces and SDL_COLORSPACE_BT709_FULL for YUV textures.
	 *
	 * \param surface the SDL_Surface structure to query.
	 * \returns the colorspace used by the surface, or SDL_COLORSPACE_UNKNOWN if
	 *          the surface is NULL.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetSurfaceColorspace
	 */"

	^ self ffiCall: #(SDL_Colorspace SDL_GetSurfaceColorspace(SDL_Surface* surface))
]

{ #category : 'public' }
LibSDL3 >> getSurfaceImagesSurface: surface count: count [
	"/**
	 * Get an array including all versions of a surface.
	 *
	 * This returns all versions of a surface, with the surface being queried as
	 * the first element in the returned array.
	 *
	 * Freeing the array of surfaces does not affect the surfaces in the array.
	 * They are still referenced by the surface being queried and will be cleaned
	 * up normally.
	 *
	 * \param surface the SDL_Surface structure to query.
	 * \param count a pointer filled in with the number of surface pointers
	 *              returned, may be NULL.
	 * \returns a NULL terminated array of SDL_Surface pointers or NULL on
	 *          failure; call SDL_GetError() for more information. This should be
	 *          freed with SDL_free() when it is no longer needed.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_AddSurfaceAlternateImage
	 * \sa SDL_RemoveSurfaceAlternateImages
	 * \sa SDL_SurfaceHasAlternateImages
	 */"

	^ self ffiCall: #(SDL_Surface** SDL_GetSurfaceImages(SDL_Surface* surface, int* count))
]

{ #category : 'public' }
LibSDL3 >> getSurfacePalette: surface [
	"/**
	 * Get the palette used by a surface.
	 *
	 * \param surface the SDL_Surface structure to query.
	 * \returns a pointer to the palette used by the surface, or NULL if there is
	 *          no palette used.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetSurfacePalette
	 */"

	^ self ffiCall: #(SDL_Palette* SDL_GetSurfacePalette(SDL_Surface* surface))
]

{ #category : 'public' }
LibSDL3 >> getSurfaceProperties: surface [
	"/**
	 * Get the properties associated with a surface.
	 *
	 * The following properties are understood by SDL:
	 *
	 * - `SDL_PROP_SURFACE_SDR_WHITE_POINT_FLOAT`: for HDR10 and floating point
	 *   surfaces, this defines the value of 100% diffuse white, with higher
	 *   values being displayed in the High Dynamic Range headroom. This defaults
	 *   to 203 for HDR10 surfaces and 1.0 for floating point surfaces.
	 * - `SDL_PROP_SURFACE_HDR_HEADROOM_FLOAT`: for HDR10 and floating point
	 *   surfaces, this defines the maximum dynamic range used by the content, in
	 *   terms of the SDR white point. This defaults to 0.0, which disables tone
	 *   mapping.
	 * - `SDL_PROP_SURFACE_TONEMAP_OPERATOR_STRING`: the tone mapping operator
	 *   used when compressing from a surface with high dynamic range to another
	 *   with lower dynamic range. Currently this supports ""chrome"", which uses
	 *   the same tone mapping that Chrome uses for HDR content, the form ""*=N"",
	 *   where N is a floating point scale factor applied in linear space, and
	 *   ""none"", which disables tone mapping. This defaults to ""chrome"".
	 * - `SDL_PROP_SURFACE_HOTSPOT_X_NUMBER`: the hotspot pixel offset from the
	 *   left edge of the image, if this surface is being used as a cursor.
	 * - `SDL_PROP_SURFACE_HOTSPOT_Y_NUMBER`: the hotspot pixel offset from the
	 *   top edge of the image, if this surface is being used as a cursor.
	 *
	 * \param surface the SDL_Surface structure to query.
	 * \returns a valid property ID on success or 0 on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_PropertiesID SDL_GetSurfaceProperties(SDL_Surface* surface))
]

{ #category : 'public' }
LibSDL3 >> getSystemRAM [
	"/**
	 * Get the amount of RAM configured in the system.
	 *
	 * \returns the amount of RAM configured in the system in MiB.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(int SDL_GetSystemRAM())
]

{ #category : 'public' }
LibSDL3 >> getSystemTheme [
	"/**
	 * Get the current system theme.
	 *
	 * \returns the current system theme, light, dark, or unknown.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_SystemTheme SDL_GetSystemTheme())
]

{ #category : 'public' }
LibSDL3 >> getTLS: id [
	"/**
	 * Get the current thread's value associated with a thread local storage ID.
	 *
	 * \param id a pointer to the thread local storage ID, may not be NULL.
	 * \returns the value associated with the ID for the current thread or NULL if
	 *          no value has been set; call SDL_GetError() for more information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetTLS
	 */"

	^ self ffiCall: #(void* SDL_GetTLS(SDL_TLSID* id))
]

{ #category : 'public' }
LibSDL3 >> getTextInputAreaWindow: window rect: rect cursor: cursor [
	"/**
	 * Get the area used to type Unicode text input.
	 *
	 * This returns the values previously set by SDL_SetTextInputArea().
	 *
	 * \param window the window for which to query the text input area.
	 * \param rect a pointer to an SDL_Rect filled in with the text input area,
	 *             may be NULL.
	 * \param cursor a pointer to the offset of the current cursor location
	 *               relative to `rect->x`, may be NULL.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetTextInputArea
	 */"

	^ self ffiCall: #(bool SDL_GetTextInputArea(SDL_Window* window, SDL_Rect* rect, int* cursor))
]

{ #category : 'public' }
LibSDL3 >> getTextureAlphaModFloatTexture: texture alpha: alpha [
	"/**
	 * Get the additional alpha value multiplied into render copy operations.
	 *
	 * \param texture the texture to query.
	 * \param alpha a pointer filled in with the current alpha value.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetTextureAlphaMod
	 * \sa SDL_GetTextureColorModFloat
	 * \sa SDL_SetTextureAlphaModFloat
	 */"

	^ self ffiCall: #(bool SDL_GetTextureAlphaModFloat(SDL_Texture* texture, float* alpha))
]

{ #category : 'public' }
LibSDL3 >> getTextureAlphaModTexture: texture alpha: alpha [
	"/**
	 * Get the additional alpha value multiplied into render copy operations.
	 *
	 * \param texture the texture to query.
	 * \param alpha a pointer filled in with the current alpha value.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetTextureAlphaModFloat
	 * \sa SDL_GetTextureColorMod
	 * \sa SDL_SetTextureAlphaMod
	 */"

	^ self ffiCall: #(bool SDL_GetTextureAlphaMod(SDL_Texture* texture, Uint8* alpha))
]

{ #category : 'public' }
LibSDL3 >> getTextureBlendModeTexture: texture blendMode: blendMode [
	"/**
	 * Get the blend mode used for texture copy operations.
	 *
	 * \param texture the texture to query.
	 * \param blendMode a pointer filled in with the current SDL_BlendMode.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetTextureBlendMode
	 */"

	^ self ffiCall: #(bool SDL_GetTextureBlendMode(SDL_Texture* texture, SDL_BlendMode* blendMode))
]

{ #category : 'public' }
LibSDL3 >> getTextureColorModFloatTexture: texture r: r g: g b: b [
	"/**
	 * Get the additional color value multiplied into render copy operations.
	 *
	 * \param texture the texture to query.
	 * \param r a pointer filled in with the current red color value.
	 * \param g a pointer filled in with the current green color value.
	 * \param b a pointer filled in with the current blue color value.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetTextureAlphaModFloat
	 * \sa SDL_GetTextureColorMod
	 * \sa SDL_SetTextureColorModFloat
	 */"

	^ self ffiCall: #(bool SDL_GetTextureColorModFloat(SDL_Texture* texture, float* r, float* g, float* b))
]

{ #category : 'public' }
LibSDL3 >> getTextureColorModTexture: texture r: r g: g b: b [
	"/**
	 * Get the additional color value multiplied into render copy operations.
	 *
	 * \param texture the texture to query.
	 * \param r a pointer filled in with the current red color value.
	 * \param g a pointer filled in with the current green color value.
	 * \param b a pointer filled in with the current blue color value.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetTextureAlphaMod
	 * \sa SDL_GetTextureColorModFloat
	 * \sa SDL_SetTextureColorMod
	 */"

	^ self ffiCall: #(bool SDL_GetTextureColorMod(SDL_Texture* texture, Uint8* r, Uint8* g, Uint8* b))
]

{ #category : 'public' }
LibSDL3 >> getTextureProperties: texture [
	"/**
	 * Get the properties associated with a texture.
	 *
	 * The following read-only properties are provided by SDL:
	 *
	 * - `SDL_PROP_TEXTURE_COLORSPACE_NUMBER`: an SDL_Colorspace value describing
	 *   the texture colorspace.
	 * - `SDL_PROP_TEXTURE_FORMAT_NUMBER`: one of the enumerated values in
	 *   SDL_PixelFormat.
	 * - `SDL_PROP_TEXTURE_ACCESS_NUMBER`: one of the enumerated values in
	 *   SDL_TextureAccess.
	 * - `SDL_PROP_TEXTURE_WIDTH_NUMBER`: the width of the texture in pixels.
	 * - `SDL_PROP_TEXTURE_HEIGHT_NUMBER`: the height of the texture in pixels.
	 * - `SDL_PROP_TEXTURE_SDR_WHITE_POINT_FLOAT`: for HDR10 and floating point
	 *   textures, this defines the value of 100% diffuse white, with higher
	 *   values being displayed in the High Dynamic Range headroom. This defaults
	 *   to 100 for HDR10 textures and 1.0 for other textures.
	 * - `SDL_PROP_TEXTURE_HDR_HEADROOM_FLOAT`: for HDR10 and floating point
	 *   textures, this defines the maximum dynamic range used by the content, in
	 *   terms of the SDR white point. If this is defined, any values outside the
	 *   range supported by the display will be scaled into the available HDR
	 *   headroom, otherwise they are clipped. This defaults to 1.0 for SDR
	 *   textures, 4.0 for HDR10 textures, and no default for floating point
	 *   textures.
	 *
	 * With the direct3d11 renderer:
	 *
	 * - `SDL_PROP_TEXTURE_D3D11_TEXTURE_POINTER`: the ID3D11Texture2D associated
	 *   with the texture
	 * - `SDL_PROP_TEXTURE_D3D11_TEXTURE_U_POINTER`: the ID3D11Texture2D
	 *   associated with the U plane of a YUV texture
	 * - `SDL_PROP_TEXTURE_D3D11_TEXTURE_V_POINTER`: the ID3D11Texture2D
	 *   associated with the V plane of a YUV texture
	 *
	 * With the direct3d12 renderer:
	 *
	 * - `SDL_PROP_TEXTURE_D3D12_TEXTURE_POINTER`: the ID3D12Resource associated
	 *   with the texture
	 * - `SDL_PROP_TEXTURE_D3D12_TEXTURE_U_POINTER`: the ID3D12Resource associated
	 *   with the U plane of a YUV texture
	 * - `SDL_PROP_TEXTURE_D3D12_TEXTURE_V_POINTER`: the ID3D12Resource associated
	 *   with the V plane of a YUV texture
	 *
	 * With the vulkan renderer:
	 *
	 * - `SDL_PROP_TEXTURE_VULKAN_TEXTURE_NUMBER`: the VkImage associated with the
	 *   texture
	 *
	 * With the opengl renderer:
	 *
	 * - `SDL_PROP_TEXTURE_OPENGL_TEXTURE_NUMBER`: the GLuint texture associated
	 *   with the texture
	 * - `SDL_PROP_TEXTURE_OPENGL_TEXTURE_UV_NUMBER`: the GLuint texture
	 *   associated with the UV plane of an NV12 texture
	 * - `SDL_PROP_TEXTURE_OPENGL_TEXTURE_U_NUMBER`: the GLuint texture associated
	 *   with the U plane of a YUV texture
	 * - `SDL_PROP_TEXTURE_OPENGL_TEXTURE_V_NUMBER`: the GLuint texture associated
	 *   with the V plane of a YUV texture
	 * - `SDL_PROP_TEXTURE_OPENGL_TEXTURE_TARGET_NUMBER`: the GLenum for the
	 *   texture target (`GL_TEXTURE_2D`, `GL_TEXTURE_RECTANGLE_ARB`, etc)
	 * - `SDL_PROP_TEXTURE_OPENGL_TEX_W_FLOAT`: the texture coordinate width of
	 *   the texture (0.0 - 1.0)
	 * - `SDL_PROP_TEXTURE_OPENGL_TEX_H_FLOAT`: the texture coordinate height of
	 *   the texture (0.0 - 1.0)
	 *
	 * With the opengles2 renderer:
	 *
	 * - `SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_NUMBER`: the GLuint texture
	 *   associated with the texture
	 * - `SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_UV_NUMBER`: the GLuint texture
	 *   associated with the UV plane of an NV12 texture
	 * - `SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_U_NUMBER`: the GLuint texture
	 *   associated with the U plane of a YUV texture
	 * - `SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_V_NUMBER`: the GLuint texture
	 *   associated with the V plane of a YUV texture
	 * - `SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_TARGET_NUMBER`: the GLenum for the
	 *   texture target (`GL_TEXTURE_2D`, `GL_TEXTURE_EXTERNAL_OES`, etc)
	 *
	 * \param texture the texture to query.
	 * \returns a valid property ID on success or 0 on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_PropertiesID SDL_GetTextureProperties(SDL_Texture* texture))
]

{ #category : 'public' }
LibSDL3 >> getTextureScaleModeTexture: texture scaleMode: scaleMode [
	"/**
	 * Get the scale mode used for texture scale operations.
	 *
	 * \param texture the texture to query.
	 * \param scaleMode a pointer filled in with the current scale mode.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetTextureScaleMode
	 */"

	^ self ffiCall: #(bool SDL_GetTextureScaleMode(SDL_Texture* texture, SDL_ScaleMode scaleMode))
]

{ #category : 'public' }
LibSDL3 >> getTextureSizeTexture: texture w: w h: h [
	"/**
	 * Get the size of a texture, as floating point values.
	 *
	 * \param texture the texture to query.
	 * \param w a pointer filled in with the width of the texture in pixels. This
	 *          argument can be NULL if you don't need this information.
	 * \param h a pointer filled in with the height of the texture in pixels. This
	 *          argument can be NULL if you don't need this information.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_GetTextureSize(SDL_Texture* texture, float* w, float* h))
]

{ #category : 'public' }
LibSDL3 >> getThreadID: thread [
	"/**
	 * Get the thread identifier for the specified thread.
	 *
	 * This thread identifier is as reported by the underlying operating system.
	 * If SDL is running on a platform that does not support threads the return
	 * value will always be zero.
	 *
	 * \param thread the thread to query.
	 * \returns the ID of the specified thread, or the ID of the current thread if
	 *          `thread` is NULL.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetCurrentThreadID
	 */"

	^ self ffiCall: #(SDL_ThreadID SDL_GetThreadID(SDL_Thread* thread))
]

{ #category : 'public' }
LibSDL3 >> getThreadName: thread [
	"/**
	 * Get the thread name as it was specified in SDL_CreateThread().
	 *
	 * \param thread the thread to query.
	 * \returns a pointer to a UTF-8 string that names the specified thread, or
	 *          NULL if it doesn't have a name.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(const char* SDL_GetThreadName(SDL_Thread* thread))
]

{ #category : 'public' }
LibSDL3 >> getThreadState: thread [
	"/**
	 * Get the current state of a thread.
	 *
	 * \param thread the thread to query.
	 * \returns the current state of a thread, or SDL_THREAD_UNKNOWN if the thread
	 *          isn't valid.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_ThreadState
	 */"

	^ self ffiCall: #(SDL_ThreadState SDL_GetThreadState(SDL_Thread* thread))
]

{ #category : 'public' }
LibSDL3 >> getTicks [
	"/**
	 * Get the number of milliseconds since SDL library initialization.
	 *
	 * \returns an unsigned 64-bit value representing the number of milliseconds
	 *          since the SDL library initialized.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(Uint64 SDL_GetTicks())
]

{ #category : 'public' }
LibSDL3 >> getTicksNS [
	"/**
	 * Get the number of nanoseconds since SDL library initialization.
	 *
	 * \returns an unsigned 64-bit value representing the number of nanoseconds
	 *          since the SDL library initialized.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(Uint64 SDL_GetTicksNS())
]

{ #category : 'public' }
LibSDL3 >> getTouchDeviceName: touchID [
	"/**
	 * Get the touch device name as reported from the driver.
	 *
	 * \param touchID the touch device instance ID.
	 * \returns touch device name, or NULL on failure; call SDL_GetError() for
	 *          more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(const char* SDL_GetTouchDeviceName(SDL_TouchID touchID))
]

{ #category : 'public' }
LibSDL3 >> getTouchDeviceType: touchID [
	"/**
	 * Get the type of the given touch device.
	 *
	 * \param touchID the ID of a touch device.
	 * \returns touch device type.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_TouchDeviceType SDL_GetTouchDeviceType(SDL_TouchID touchID))
]

{ #category : 'public' }
LibSDL3 >> getTouchDevices: count [
	"/**
	 * Get a list of registered touch devices.
	 *
	 * On some platforms SDL first sees the touch device if it was actually used.
	 * Therefore the returned list might be empty, although devices are available.
	 * After using all devices at least once the number will be correct.
	 *
	 * \param count a pointer filled in with the number of devices returned, may
	 *              be NULL.
	 * \returns a 0 terminated array of touch device IDs or NULL on failure; call
	 *          SDL_GetError() for more information. This should be freed with
	 *          SDL_free() when it is no longer needed.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_TouchID* SDL_GetTouchDevices(int* count))
]

{ #category : 'public' }
LibSDL3 >> getTouchFingersTouchID: touchID count: count [
	"/**
	 * Get a list of active fingers for a given touch device.
	 *
	 * \param touchID the ID of a touch device.
	 * \param count a pointer filled in with the number of fingers returned, can
	 *              be NULL.
	 * \returns a NULL terminated array of SDL_Finger pointers or NULL on failure;
	 *          call SDL_GetError() for more information. This is a single
	 *          allocation that should be freed with SDL_free() when it is no
	 *          longer needed.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_Finger** SDL_GetTouchFingers(SDL_TouchID touchID, int* count))
]

{ #category : 'public' }
LibSDL3 >> getTrayEntriesMenu: menu count: count [
	"/**
	 * Returns a list of entries in the menu, in order.
	 *
	 * \param menu The menu to get entries from.
	 * \param count An optional pointer to obtain the number of entries in the
	 *              menu.
	 * \returns a NULL-terminated list of entries within the given menu. The
	 *          pointer becomes invalid when any function that inserts or deletes
	 *          entries in the menu is called.
	 *
	 * \threadsafety This function should be called on the thread that created the
	 *               tray.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_RemoveTrayEntry
	 * \sa SDL_InsertTrayEntryAt
	 */"

	^ self ffiCall: #(SDL_TrayEntry* SDL_GetTrayEntries(SDL_TrayMenu* menu, int* count))
]

{ #category : 'public' }
LibSDL3 >> getTrayEntryChecked: entry [
	"/**
	 * Gets whether or not an entry is checked.
	 *
	 * The entry must have been created with the SDL_TRAYENTRY_CHECKBOX flag.
	 *
	 * \param entry the entry to be read.
	 * \returns true if the entry is checked; false otherwise.
	 *
	 * \threadsafety This function should be called on the thread that created the
	 *               tray.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetTrayEntries
	 * \sa SDL_InsertTrayEntryAt
	 * \sa SDL_SetTrayEntryChecked
	 */"

	^ self ffiCall: #(bool SDL_GetTrayEntryChecked(SDL_TrayEntry* entry))
]

{ #category : 'public' }
LibSDL3 >> getTrayEntryEnabled: entry [
	"/**
	 * Gets whether or not an entry is enabled.
	 *
	 * \param entry the entry to be read.
	 * \returns true if the entry is enabled; false otherwise.
	 *
	 * \threadsafety This function should be called on the thread that created the
	 *               tray.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetTrayEntries
	 * \sa SDL_InsertTrayEntryAt
	 * \sa SDL_SetTrayEntryEnabled
	 */"

	^ self ffiCall: #(bool SDL_GetTrayEntryEnabled(SDL_TrayEntry* entry))
]

{ #category : 'public' }
LibSDL3 >> getTrayEntryLabel: entry [
	"/**
	 * Gets the label of an entry.
	 *
	 * If the returned value is NULL, the entry is a separator.
	 *
	 * \param entry the entry to be read.
	 * \returns the label of the entry in UTF-8 encoding.
	 *
	 * \threadsafety This function should be called on the thread that created the
	 *               tray.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetTrayEntries
	 * \sa SDL_InsertTrayEntryAt
	 * \sa SDL_SetTrayEntryLabel
	 */"

	^ self ffiCall: #(const char* SDL_GetTrayEntryLabel(SDL_TrayEntry* entry))
]

{ #category : 'public' }
LibSDL3 >> getTrayEntryParent: entry [
	"/**
	 * Gets the menu containing a certain tray entry.
	 *
	 * \param entry the entry for which to get the parent menu.
	 * \returns the parent menu.
	 *
	 * \threadsafety This function should be called on the thread that created the
	 *               tray.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_InsertTrayEntryAt
	 */"

	^ self ffiCall: #(SDL_TrayMenu* SDL_GetTrayEntryParent(SDL_TrayEntry* entry))
]

{ #category : 'public' }
LibSDL3 >> getTrayMenu: tray [
	"/**
	 * Gets a previously created tray menu.
	 *
	 * You should have called SDL_CreateTrayMenu() on the tray object. This
	 * function allows you to fetch it again later.
	 *
	 * This function does the same thing as SDL_GetTraySubmenu(), except that it
	 * takes a SDL_Tray instead of a SDL_TrayEntry.
	 *
	 * A menu does not need to be destroyed; it will be destroyed with the tray.
	 *
	 * \param tray the tray entry to bind the menu to.
	 * \returns the newly created menu.
	 *
	 * \threadsafety This function should be called on the thread that created the
	 *               tray.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateTray
	 * \sa SDL_CreateTrayMenu
	 */"

	^ self ffiCall: #(SDL_TrayMenu* SDL_GetTrayMenu(SDL_Tray* tray))
]

{ #category : 'public' }
LibSDL3 >> getTrayMenuParentEntry: menu [
	"/**
	 * Gets the entry for which the menu is a submenu, if the current menu is a
	 * submenu.
	 *
	 * Either this function or SDL_GetTrayMenuParentTray() will return non-NULL
	 * for any given menu.
	 *
	 * \param menu the menu for which to get the parent entry.
	 * \returns the parent entry, or NULL if this menu is not a submenu.
	 *
	 * \threadsafety This function should be called on the thread that created the
	 *               tray.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateTraySubmenu
	 * \sa SDL_GetTrayMenuParentTray
	 */"

	^ self ffiCall: #(SDL_TrayEntry* SDL_GetTrayMenuParentEntry(SDL_TrayMenu* menu))
]

{ #category : 'public' }
LibSDL3 >> getTrayMenuParentTray: menu [
	"/**
	 * Gets the tray for which this menu is the first-level menu, if the current
	 * menu isn't a submenu.
	 *
	 * Either this function or SDL_GetTrayMenuParentEntry() will return non-NULL
	 * for any given menu.
	 *
	 * \param menu the menu for which to get the parent enttrayry.
	 * \returns the parent tray, or NULL if this menu is a submenu.
	 *
	 * \threadsafety This function should be called on the thread that created the
	 *               tray.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateTrayMenu
	 * \sa SDL_GetTrayMenuParentEntry
	 */"

	^ self ffiCall: #(SDL_Tray* SDL_GetTrayMenuParentTray(SDL_TrayMenu* menu))
]

{ #category : 'public' }
LibSDL3 >> getTraySubmenu: entry [
	"/**
	 * Gets a previously created tray entry submenu.
	 *
	 * You should have called SDL_CreateTraySubmenu() on the entry object. This
	 * function allows you to fetch it again later.
	 *
	 * This function does the same thing as SDL_GetTrayMenu(), except that it
	 * takes a SDL_TrayEntry instead of a SDL_Tray.
	 *
	 * A menu does not need to be destroyed; it will be destroyed with the tray.
	 *
	 * \param entry the tray entry to bind the menu to.
	 * \returns the newly created menu.
	 *
	 * \threadsafety This function should be called on the thread that created the
	 *               tray.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_InsertTrayEntryAt
	 * \sa SDL_CreateTraySubmenu
	 */"

	^ self ffiCall: #(SDL_TrayMenu* SDL_GetTraySubmenu(SDL_TrayEntry* entry))
]

{ #category : 'public' }
LibSDL3 >> getUserFolder: folder [
	"/**
	 * Finds the most suitable user folder for a specific purpose.
	 *
	 * Many OSes provide certain standard folders for certain purposes, such as
	 * storing pictures, music or videos for a certain user. This function gives
	 * the path for many of those special locations.
	 *
	 * This function is specifically for _user_ folders, which are meant for the
	 * user to access and manage. For application-specific folders, meant to hold
	 * data for the application to manage, see SDL_GetBasePath() and
	 * SDL_GetPrefPath().
	 *
	 * The returned path is guaranteed to end with a path separator ('\\' on
	 * Windows, '/' on most other platforms).
	 *
	 * If NULL is returned, the error may be obtained with SDL_GetError().
	 *
	 * \param folder the type of folder to find.
	 * \returns either a null-terminated C string containing the full path to the
	 *          folder, or NULL if an error happened.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(const char* SDL_GetUserFolder(SDL_Folder folder))
]

{ #category : 'public' }
LibSDL3 >> getVersion [
	"/**
	 * Get the version of SDL that is linked against your program.
	 *
	 * If you are linking to SDL dynamically, then it is possible that the current
	 * version will be different than the version you compiled against. This
	 * function returns the current version, while SDL_VERSION is the version you
	 * compiled with.
	 *
	 * This function may be called safely at any time, even before SDL_Init().
	 *
	 * \returns the version of the linked library.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetRevision
	 */"

	^ self ffiCall: #(int SDL_GetVersion())
]

{ #category : 'public' }
LibSDL3 >> getVideoDriver: index [
	"/**
	 * Get the name of a built in video driver.
	 *
	 * The video drivers are presented in the order in which they are normally
	 * checked during initialization.
	 *
	 * The names of drivers are all simple, low-ASCII identifiers, like ""cocoa"",
	 * ""x11"" or ""windows"". These never have Unicode characters, and are not meant
	 * to be proper names.
	 *
	 * \param index the index of a video driver.
	 * \returns the name of the video driver with the given **index**.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetNumVideoDrivers
	 */"

	^ self ffiCall: #(const char* SDL_GetVideoDriver(int index))
]

{ #category : 'public' }
LibSDL3 >> getWindowAspectRatioWindow: window minAspect: min_aspect maxAspect: max_aspect [
	"/**
	 * Get the size of a window's client area.
	 *
	 * \param window the window to query the width and height from.
	 * \param min_aspect a pointer filled in with the minimum aspect ratio of the
	 *                   window, may be NULL.
	 * \param max_aspect a pointer filled in with the maximum aspect ratio of the
	 *                   window, may be NULL.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetWindowAspectRatio
	 */"

	^ self ffiCall: #(bool SDL_GetWindowAspectRatio(SDL_Window* window, float* min_aspect, float* max_aspect))
]

{ #category : 'public' }
LibSDL3 >> getWindowBordersSizeWindow: window top: top left: left bottom: bottom right: right [
	"/**
	 * Get the size of a window's borders (decorations) around the client area.
	 *
	 * Note: If this function fails (returns false), the size values will be
	 * initialized to 0, 0, 0, 0 (if a non-NULL pointer is provided), as if the
	 * window in question was borderless.
	 *
	 * Note: This function may fail on systems where the window has not yet been
	 * decorated by the display server (for example, immediately after calling
	 * SDL_CreateWindow). It is recommended that you wait at least until the
	 * window has been presented and composited, so that the window system has a
	 * chance to decorate the window and provide the border dimensions to SDL.
	 *
	 * This function also returns false if getting the information is not
	 * supported.
	 *
	 * \param window the window to query the size values of the border
	 *               (decorations) from.
	 * \param top pointer to variable for storing the size of the top border; NULL
	 *            is permitted.
	 * \param left pointer to variable for storing the size of the left border;
	 *             NULL is permitted.
	 * \param bottom pointer to variable for storing the size of the bottom
	 *               border; NULL is permitted.
	 * \param right pointer to variable for storing the size of the right border;
	 *              NULL is permitted.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetWindowSize
	 */"

	^ self ffiCall: #(bool SDL_GetWindowBordersSize(SDL_Window* window, int* top, int* left, int* bottom, int* right))
]

{ #category : 'public' }
LibSDL3 >> getWindowDisplayScale: window [
	"/**
	 * Get the content display scale relative to a window's pixel size.
	 *
	 * This is a combination of the window pixel density and the display content
	 * scale, and is the expected scale for displaying content in this window. For
	 * example, if a 3840x2160 window had a display scale of 2.0, the user expects
	 * the content to take twice as many pixels and be the same physical size as
	 * if it were being displayed in a 1920x1080 window with a display scale of
	 * 1.0.
	 *
	 * Conceptually this value corresponds to the scale display setting, and is
	 * updated when that setting is changed, or the window moves to a display with
	 * a different scale setting.
	 *
	 * \param window the window to query.
	 * \returns the display scale, or 0.0f on failure; call SDL_GetError() for
	 *          more information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(float SDL_GetWindowDisplayScale(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> getWindowFlags: window [
	"/**
	 * Get the window flags.
	 *
	 * \param window the window to query.
	 * \returns a mask of the SDL_WindowFlags associated with `window`.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateWindow
	 * \sa SDL_HideWindow
	 * \sa SDL_MaximizeWindow
	 * \sa SDL_MinimizeWindow
	 * \sa SDL_SetWindowFullscreen
	 * \sa SDL_SetWindowMouseGrab
	 * \sa SDL_ShowWindow
	 */"

	^ self ffiCall: #(SDL_WindowFlags SDL_GetWindowFlags(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> getWindowFromEvent: event [
	"/**
	 * Get window associated with an event.
	 *
	 * \param event an event containing a `windowID`.
	 * \returns the associated window on success or NULL if there is none.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_PollEvent
	 * \sa SDL_WaitEvent
	 * \sa SDL_WaitEventTimeout
	 */"

	^ self ffiCall: #(SDL_Window* SDL_GetWindowFromEvent(SDL_Event* event))
]

{ #category : 'public' }
LibSDL3 >> getWindowFromID: id [
	"/**
	 * Get a window from a stored ID.
	 *
	 * The numeric ID is what SDL_WindowEvent references, and is necessary to map
	 * these events to specific SDL_Window objects.
	 *
	 * \param id the ID of the window.
	 * \returns the window associated with `id` or NULL if it doesn't exist; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetWindowID
	 */"

	^ self ffiCall: #(SDL_Window* SDL_GetWindowFromID(SDL_WindowID id))
]

{ #category : 'public' }
LibSDL3 >> getWindowFullscreenMode: window [
	"/**
	 * Query the display mode to use when a window is visible at fullscreen.
	 *
	 * \param window the window to query.
	 * \returns a pointer to the exclusive fullscreen mode to use or NULL for
	 *          borderless fullscreen desktop mode.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetWindowFullscreenMode
	 * \sa SDL_SetWindowFullscreen
	 */"

	^ self ffiCall: #(SDL_DisplayMode* SDL_GetWindowFullscreenMode(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> getWindowICCProfileWindow: window size: size [
	"/**
	 * Get the raw ICC profile data for the screen the window is currently on.
	 *
	 * \param window the window to query.
	 * \param size the size of the ICC profile.
	 * \returns the raw ICC profile data on success or NULL on failure; call
	 *          SDL_GetError() for more information. This should be freed with
	 *          SDL_free() when it is no longer needed.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(void* SDL_GetWindowICCProfile(SDL_Window* window, size_t* size))
]

{ #category : 'public' }
LibSDL3 >> getWindowID: window [
	"/**
	 * Get the numeric ID of a window.
	 *
	 * The numeric ID is what SDL_WindowEvent references, and is necessary to map
	 * these events to specific SDL_Window objects.
	 *
	 * \param window the window to query.
	 * \returns the ID of the window on success or 0 on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetWindowFromID
	 */"

	^ self ffiCall: #(SDL_WindowID SDL_GetWindowID(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> getWindowKeyboardGrab: window [
	"/**
	 * Get a window's keyboard grab mode.
	 *
	 * \param window the window to query.
	 * \returns true if keyboard is grabbed, and false otherwise.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetWindowKeyboardGrab
	 */"

	^ self ffiCall: #(bool SDL_GetWindowKeyboardGrab(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> getWindowMaximumSizeWindow: window w: w h: h [
	"/**
	 * Get the maximum size of a window's client area.
	 *
	 * \param window the window to query.
	 * \param w a pointer filled in with the maximum width of the window, may be
	 *          NULL.
	 * \param h a pointer filled in with the maximum height of the window, may be
	 *          NULL.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetWindowMinimumSize
	 * \sa SDL_SetWindowMaximumSize
	 */"

	^ self ffiCall: #(bool SDL_GetWindowMaximumSize(SDL_Window* window, int* w, int* h))
]

{ #category : 'public' }
LibSDL3 >> getWindowMinimumSizeWindow: window w: w h: h [
	"/**
	 * Get the minimum size of a window's client area.
	 *
	 * \param window the window to query.
	 * \param w a pointer filled in with the minimum width of the window, may be
	 *          NULL.
	 * \param h a pointer filled in with the minimum height of the window, may be
	 *          NULL.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetWindowMaximumSize
	 * \sa SDL_SetWindowMinimumSize
	 */"

	^ self ffiCall: #(bool SDL_GetWindowMinimumSize(SDL_Window* window, int* w, int* h))
]

{ #category : 'public' }
LibSDL3 >> getWindowMouseGrab: window [
	"/**
	 * Get a window's mouse grab mode.
	 *
	 * \param window the window to query.
	 * \returns true if mouse is grabbed, and false otherwise.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetWindowMouseRect
	 * \sa SDL_SetWindowMouseRect
	 * \sa SDL_SetWindowMouseGrab
	 * \sa SDL_SetWindowKeyboardGrab
	 */"

	^ self ffiCall: #(bool SDL_GetWindowMouseGrab(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> getWindowMouseRect: window [
	"/**
	 * Get the mouse confinement rectangle of a window.
	 *
	 * \param window the window to query.
	 * \returns a pointer to the mouse confinement rectangle of a window, or NULL
	 *          if there isn't one.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetWindowMouseRect
	 * \sa SDL_GetWindowMouseGrab
	 * \sa SDL_SetWindowMouseGrab
	 */"

	^ self ffiCall: #(SDL_Rect* SDL_GetWindowMouseRect(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> getWindowOpacity: window [
	"/**
	 * Get the opacity of a window.
	 *
	 * If transparency isn't supported on this platform, opacity will be returned
	 * as 1.0f without error.
	 *
	 * \param window the window to get the current opacity value from.
	 * \returns the opacity, (0.0f - transparent, 1.0f - opaque), or -1.0f on
	 *          failure; call SDL_GetError() for more information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetWindowOpacity
	 */"

	^ self ffiCall: #(float SDL_GetWindowOpacity(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> getWindowParent: window [
	"/**
	 * Get parent of a window.
	 *
	 * \param window the window to query.
	 * \returns the parent of the window on success or NULL if the window has no
	 *          parent.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreatePopupWindow
	 */"

	^ self ffiCall: #(SDL_Window* SDL_GetWindowParent(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> getWindowPixelDensity: window [
	"/**
	 * Get the pixel density of a window.
	 *
	 * This is a ratio of pixel size to window size. For example, if the window is
	 * 1920x1080 and it has a high density back buffer of 3840x2160 pixels, it
	 * would have a pixel density of 2.0.
	 *
	 * \param window the window to query.
	 * \returns the pixel density or 0.0f on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetWindowDisplayScale
	 */"

	^ self ffiCall: #(float SDL_GetWindowPixelDensity(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> getWindowPixelFormat: window [
	"/**
	 * Get the pixel format associated with the window.
	 *
	 * \param window the window to query.
	 * \returns the pixel format of the window on success or
	 *          SDL_PIXELFORMAT_UNKNOWN on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_PixelFormat SDL_GetWindowPixelFormat(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> getWindowPositionWindow: window x: x y: y [
	"/**
	 * Get the position of a window.
	 *
	 * This is the current position of the window as last reported by the
	 * windowing system.
	 *
	 * If you do not need the value for one of the positions a NULL may be passed
	 * in the `x` or `y` parameter.
	 *
	 * \param window the window to query.
	 * \param x a pointer filled in with the x position of the window, may be
	 *          NULL.
	 * \param y a pointer filled in with the y position of the window, may be
	 *          NULL.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetWindowPosition
	 */"

	^ self ffiCall: #(bool SDL_GetWindowPosition(SDL_Window* window, int* x, int* y))
]

{ #category : 'public' }
LibSDL3 >> getWindowProperties: window [
	"/**
	 * Get the properties associated with a window.
	 *
	 * The following read-only properties are provided by SDL:
	 *
	 * - `SDL_PROP_WINDOW_SHAPE_POINTER`: the surface associated with a shaped
	 *   window
	 * - `SDL_PROP_WINDOW_HDR_ENABLED_BOOLEAN`: true if the window has HDR
	 *   headroom above the SDR white point. This property can change dynamically
	 *   when SDL_EVENT_WINDOW_HDR_STATE_CHANGED is sent.
	 * - `SDL_PROP_WINDOW_SDR_WHITE_LEVEL_FLOAT`: the value of SDR white in the
	 *   SDL_COLORSPACE_SRGB_LINEAR colorspace. On Windows this corresponds to the
	 *   SDR white level in scRGB colorspace, and on Apple platforms this is
	 *   always 1.0 for EDR content. This property can change dynamically when
	 *   SDL_EVENT_WINDOW_HDR_STATE_CHANGED is sent.
	 * - `SDL_PROP_WINDOW_HDR_HEADROOM_FLOAT`: the additional high dynamic range
	 *   that can be displayed, in terms of the SDR white point. When HDR is not
	 *   enabled, this will be 1.0. This property can change dynamically when
	 *   SDL_EVENT_WINDOW_HDR_STATE_CHANGED is sent.
	 *
	 * On Android:
	 *
	 * - `SDL_PROP_WINDOW_ANDROID_WINDOW_POINTER`: the ANativeWindow associated
	 *   with the window
	 * - `SDL_PROP_WINDOW_ANDROID_SURFACE_POINTER`: the EGLSurface associated with
	 *   the window
	 *
	 * On iOS:
	 *
	 * - `SDL_PROP_WINDOW_UIKIT_WINDOW_POINTER`: the `(__unsafe_unretained)`
	 *   UIWindow associated with the window
	 * - `SDL_PROP_WINDOW_UIKIT_METAL_VIEW_TAG_NUMBER`: the NSInteger tag
	 *   associated with metal views on the window
	 * - `SDL_PROP_WINDOW_UIKIT_OPENGL_FRAMEBUFFER_NUMBER`: the OpenGL view's
	 *   framebuffer object. It must be bound when rendering to the screen using
	 *   OpenGL.
	 * - `SDL_PROP_WINDOW_UIKIT_OPENGL_RENDERBUFFER_NUMBER`: the OpenGL view's
	 *   renderbuffer object. It must be bound when SDL_GL_SwapWindow is called.
	 * - `SDL_PROP_WINDOW_UIKIT_OPENGL_RESOLVE_FRAMEBUFFER_NUMBER`: the OpenGL
	 *   view's resolve framebuffer, when MSAA is used.
	 *
	 * On KMS/DRM:
	 *
	 * - `SDL_PROP_WINDOW_KMSDRM_DEVICE_INDEX_NUMBER`: the device index associated
	 *   with the window (e.g. the X in /dev/dri/cardX)
	 * - `SDL_PROP_WINDOW_KMSDRM_DRM_FD_NUMBER`: the DRM FD associated with the
	 *   window
	 * - `SDL_PROP_WINDOW_KMSDRM_GBM_DEVICE_POINTER`: the GBM device associated
	 *   with the window
	 *
	 * On macOS:
	 *
	 * - `SDL_PROP_WINDOW_COCOA_WINDOW_POINTER`: the `(__unsafe_unretained)`
	 *   NSWindow associated with the window
	 * - `SDL_PROP_WINDOW_COCOA_METAL_VIEW_TAG_NUMBER`: the NSInteger tag
	 *   assocated with metal views on the window
	 *
	 * On OpenVR:
	 *
	 * - `SDL_PROP_WINDOW_OPENVR_OVERLAY_ID`: the OpenVR Overlay Handle ID for the
	 *   associated overlay window.
	 *
	 * On Vivante:
	 *
	 * - `SDL_PROP_WINDOW_VIVANTE_DISPLAY_POINTER`: the EGLNativeDisplayType
	 *   associated with the window
	 * - `SDL_PROP_WINDOW_VIVANTE_WINDOW_POINTER`: the EGLNativeWindowType
	 *   associated with the window
	 * - `SDL_PROP_WINDOW_VIVANTE_SURFACE_POINTER`: the EGLSurface associated with
	 *   the window
	 *
	 * On Windows:
	 *
	 * - `SDL_PROP_WINDOW_WIN32_HWND_POINTER`: the HWND associated with the window
	 * - `SDL_PROP_WINDOW_WIN32_HDC_POINTER`: the HDC associated with the window
	 * - `SDL_PROP_WINDOW_WIN32_INSTANCE_POINTER`: the HINSTANCE associated with
	 *   the window
	 *
	 * On Wayland:
	 *
	 * Note: The `xdg_*` window objects do not internally persist across window
	 * show/hide calls. They will be null if the window is hidden and must be
	 * queried each time it is shown.
	 *
	 * - `SDL_PROP_WINDOW_WAYLAND_DISPLAY_POINTER`: the wl_display associated with
	 *   the window
	 * - `SDL_PROP_WINDOW_WAYLAND_SURFACE_POINTER`: the wl_surface associated with
	 *   the window
	 * - `SDL_PROP_WINDOW_WAYLAND_VIEWPORT_POINTER`: the wp_viewport associated
	 *   with the window
	 * - `SDL_PROP_WINDOW_WAYLAND_EGL_WINDOW_POINTER`: the wl_egl_window
	 *   associated with the window
	 * - `SDL_PROP_WINDOW_WAYLAND_XDG_SURFACE_POINTER`: the xdg_surface associated
	 *   with the window
	 * - `SDL_PROP_WINDOW_WAYLAND_XDG_TOPLEVEL_POINTER`: the xdg_toplevel role
	 *   associated with the window
	 * - 'SDL_PROP_WINDOW_WAYLAND_XDG_TOPLEVEL_EXPORT_HANDLE_STRING': the export
	 *   handle associated with the window
	 * - `SDL_PROP_WINDOW_WAYLAND_XDG_POPUP_POINTER`: the xdg_popup role
	 *   associated with the window
	 * - `SDL_PROP_WINDOW_WAYLAND_XDG_POSITIONER_POINTER`: the xdg_positioner
	 *   associated with the window, in popup mode
	 *
	 * On X11:
	 *
	 * - `SDL_PROP_WINDOW_X11_DISPLAY_POINTER`: the X11 Display associated with
	 *   the window
	 * - `SDL_PROP_WINDOW_X11_SCREEN_NUMBER`: the screen number associated with
	 *   the window
	 * - `SDL_PROP_WINDOW_X11_WINDOW_NUMBER`: the X11 Window associated with the
	 *   window
	 *
	 * \param window the window to query.
	 * \returns a valid property ID on success or 0 on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_PropertiesID SDL_GetWindowProperties(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> getWindowRelativeMouseMode: window [
	"/**
	 * Query whether relative mouse mode is enabled for a window.
	 *
	 * \param window the window to query.
	 * \returns true if relative mode is enabled for a window or false otherwise.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetWindowRelativeMouseMode
	 */"

	^ self ffiCall: #(bool SDL_GetWindowRelativeMouseMode(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> getWindowSafeAreaWindow: window rect: rect [
	"/**
	 * Get the safe area for this window.
	 *
	 * Some devices have portions of the screen which are partially obscured or
	 * not interactive, possibly due to on-screen controls, curved edges, camera
	 * notches, TV overscan, etc. This function provides the area of the window
	 * which is safe to have interactable content. You should continue rendering
	 * into the rest of the window, but it should not contain visually important
	 * or interactible content.
	 *
	 * \param window the window to query.
	 * \param rect a pointer filled in with the client area that is safe for
	 *             interactive content.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_GetWindowSafeArea(SDL_Window* window, SDL_Rect* rect))
]

{ #category : 'public' }
LibSDL3 >> getWindowSizeInPixelsWindow: window w: w h: h [
	"/**
	 * Get the size of a window's client area, in pixels.
	 *
	 * \param window the window from which the drawable size should be queried.
	 * \param w a pointer to variable for storing the width in pixels, may be
	 *          NULL.
	 * \param h a pointer to variable for storing the height in pixels, may be
	 *          NULL.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateWindow
	 * \sa SDL_GetWindowSize
	 */"

	^ self ffiCall: #(bool SDL_GetWindowSizeInPixels(SDL_Window* window, int* w, int* h))
]

{ #category : 'public' }
LibSDL3 >> getWindowSizeWindow: window w: w h: h [
	"/**
	 * Get the size of a window's client area.
	 *
	 * The window pixel size may differ from its window coordinate size if the
	 * window is on a high pixel density display. Use SDL_GetWindowSizeInPixels()
	 * or SDL_GetRenderOutputSize() to get the real client area size in pixels.
	 *
	 * \param window the window to query the width and height from.
	 * \param w a pointer filled in with the width of the window, may be NULL.
	 * \param h a pointer filled in with the height of the window, may be NULL.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetRenderOutputSize
	 * \sa SDL_GetWindowSizeInPixels
	 * \sa SDL_SetWindowSize
	 */"

	^ self ffiCall: #(bool SDL_GetWindowSize(SDL_Window* window, int* w, int* h))
]

{ #category : 'public' }
LibSDL3 >> getWindowSurface: window [
	"/**
	 * Get the SDL surface associated with the window.
	 *
	 * A new surface will be created with the optimal format for the window, if
	 * necessary. This surface will be freed when the window is destroyed. Do not
	 * free this surface.
	 *
	 * This surface will be invalidated if the window is resized. After resizing a
	 * window this function must be called again to return a valid surface.
	 *
	 * You may not combine this with 3D or the rendering API on this window.
	 *
	 * This function is affected by `SDL_HINT_FRAMEBUFFER_ACCELERATION`.
	 *
	 * \param window the window to query.
	 * \returns the surface associated with the window, or NULL on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_DestroyWindowSurface
	 * \sa SDL_WindowHasSurface
	 * \sa SDL_UpdateWindowSurface
	 * \sa SDL_UpdateWindowSurfaceRects
	 */"

	^ self ffiCall: #(SDL_Surface* SDL_GetWindowSurface(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> getWindowSurfaceVSyncWindow: window vsync: vsync [
	"/**
	 * Get VSync for the window surface.
	 *
	 * \param window the window to query.
	 * \param vsync an int filled with the current vertical refresh sync interval.
	 *              See SDL_SetWindowSurfaceVSync() for the meaning of the value.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetWindowSurfaceVSync
	 */"

	^ self ffiCall: #(bool SDL_GetWindowSurfaceVSync(SDL_Window* window, int* vsync))
]

{ #category : 'public' }
LibSDL3 >> getWindowTitle: window [
	"/**
	 * Get the title of a window.
	 *
	 * \param window the window to query.
	 * \returns the title of the window in UTF-8 format or """" if there is no
	 *          title.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetWindowTitle
	 */"

	^ self ffiCall: #(const char* SDL_GetWindowTitle(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> getWindows: count [
	"/**
	 * Get a list of valid windows.
	 *
	 * \param count a pointer filled in with the number of windows returned, may
	 *              be NULL.
	 * \returns a NULL terminated array of SDL_Window pointers or NULL on failure;
	 *          call SDL_GetError() for more information. This is a single
	 *          allocation that should be freed with SDL_free() when it is no
	 *          longer needed.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_Window* SDL_GetWindows(int* count))
]

{ #category : 'public' }
LibSDL3 >> getenv: name [
	"/**
	 * Get the value of a variable in the environment.
	 *
	 * This function uses SDL's cached copy of the environment and is thread-safe.
	 *
	 * \param name the name of the variable to get.
	 * \returns a pointer to the value of the variable or NULL if it can't be
	 *          found.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(const char* SDL_getenv(const char* name))
]

{ #category : 'public' }
LibSDL3 >> getenvUnsafe: name [
	"/**
	 * Get the value of a variable in the environment.
	 *
	 * This function bypasses SDL's cached copy of the environment and is not
	 * thread-safe.
	 *
	 * \param name the name of the variable to get.
	 * \returns a pointer to the value of the variable or NULL if it can't be
	 *          found.
	 *
	 * \threadsafety This function is not thread safe, consider using SDL_getenv()
	 *               instead.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_getenv
	 */"

	^ self ffiCall: #(const char* SDL_getenv_unsafe(const char* name))
]

{ #category : 'public' }
LibSDL3 >> glCreateContext: window [
	"/**
	 * Create an OpenGL context for an OpenGL window, and make it current.
	 *
	 * Windows users new to OpenGL should note that, for historical reasons, GL
	 * functions added after OpenGL version 1.1 are not available by default.
	 * Those functions must be loaded at run-time, either with an OpenGL
	 * extension-handling library or with SDL_GL_GetProcAddress() and its related
	 * functions.
	 *
	 * SDL_GLContext is opaque to the application.
	 *
	 * \param window the window to associate with the context.
	 * \returns the OpenGL context associated with `window` or NULL on failure;
	 *          call SDL_GetError() for more information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GL_DestroyContext
	 * \sa SDL_GL_MakeCurrent
	 */"

	^ self ffiCall: #(SDL_GLContext SDL_GL_CreateContext(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> glDestroyContext: context [
	"/**
	 * Delete an OpenGL context.
	 *
	 * \param context the OpenGL context to be deleted.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GL_CreateContext
	 */"

	^ self ffiCall: #(bool SDL_GL_DestroyContext(SDL_GLContext context))
]

{ #category : 'public' }
LibSDL3 >> glExtensionSupported: extension [
	"/**
	 * Check if an OpenGL extension is supported for the current context.
	 *
	 * This function operates on the current GL context; you must have created a
	 * context and it must be current before calling this function. Do not assume
	 * that all contexts you create will have the same set of extensions
	 * available, or that recreating an existing context will offer the same
	 * extensions again.
	 *
	 * While it's probably not a massive overhead, this function is not an O(1)
	 * operation. Check the extensions you care about after creating the GL
	 * context and save that information somewhere instead of calling the function
	 * every time you need to know.
	 *
	 * \param extension the name of the extension to check.
	 * \returns true if the extension is supported, false otherwise.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_GL_ExtensionSupported(const char* extension))
]

{ #category : 'public' }
LibSDL3 >> glGetAttributeAttr: attr value: value [
	"/**
	 * Get the actual value for an attribute from the current context.
	 *
	 * \param attr an SDL_GLAttr enum value specifying the OpenGL attribute to
	 *             get.
	 * \param value a pointer filled in with the current value of `attr`.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GL_ResetAttributes
	 * \sa SDL_GL_SetAttribute
	 */"

	^ self ffiCall: #(bool SDL_GL_GetAttribute(SDL_GLAttr attr, int* value))
]

{ #category : 'public' }
LibSDL3 >> glGetCurrentContext [
	"/**
	 * Get the currently active OpenGL context.
	 *
	 * \returns the currently active OpenGL context or NULL on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GL_MakeCurrent
	 */"

	^ self ffiCall: #(SDL_GLContext SDL_GL_GetCurrentContext())
]

{ #category : 'public' }
LibSDL3 >> glGetCurrentWindow [
	"/**
	 * Get the currently active OpenGL window.
	 *
	 * \returns the currently active OpenGL window on success or NULL on failure;
	 *          call SDL_GetError() for more information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_Window* SDL_GL_GetCurrentWindow())
]

{ #category : 'public' }
LibSDL3 >> glGetProcAddress: proc [
	"/**
	 * Get an OpenGL function by name.
	 *
	 * If the GL library is loaded at runtime with SDL_GL_LoadLibrary(), then all
	 * GL functions must be retrieved this way. Usually this is used to retrieve
	 * function pointers to OpenGL extensions.
	 *
	 * There are some quirks to looking up OpenGL functions that require some
	 * extra care from the application. If you code carefully, you can handle
	 * these quirks without any platform-specific code, though:
	 *
	 * - On Windows, function pointers are specific to the current GL context;
	 *   this means you need to have created a GL context and made it current
	 *   before calling SDL_GL_GetProcAddress(). If you recreate your context or
	 *   create a second context, you should assume that any existing function
	 *   pointers aren't valid to use with it. This is (currently) a
	 *   Windows-specific limitation, and in practice lots of drivers don't suffer
	 *   this limitation, but it is still the way the wgl API is documented to
	 *   work and you should expect crashes if you don't respect it. Store a copy
	 *   of the function pointers that comes and goes with context lifespan.
	 * - On X11, function pointers returned by this function are valid for any
	 *   context, and can even be looked up before a context is created at all.
	 *   This means that, for at least some common OpenGL implementations, if you
	 *   look up a function that doesn't exist, you'll get a non-NULL result that
	 *   is _NOT_ safe to call. You must always make sure the function is actually
	 *   available for a given GL context before calling it, by checking for the
	 *   existence of the appropriate extension with SDL_GL_ExtensionSupported(),
	 *   or verifying that the version of OpenGL you're using offers the function
	 *   as core functionality.
	 * - Some OpenGL drivers, on all platforms, *will* return NULL if a function
	 *   isn't supported, but you can't count on this behavior. Check for
	 *   extensions you use, and if you get a NULL anyway, act as if that
	 *   extension wasn't available. This is probably a bug in the driver, but you
	 *   can code defensively for this scenario anyhow.
	 * - Just because you're on Linux/Unix, don't assume you'll be using X11.
	 *   Next-gen display servers are waiting to replace it, and may or may not
	 *   make the same promises about function pointers.
	 * - OpenGL function pointers must be declared `APIENTRY` as in the example
	 *   code. This will ensure the proper calling convention is followed on
	 *   platforms where this matters (Win32) thereby avoiding stack corruption.
	 *
	 * \param proc the name of an OpenGL function.
	 * \returns a pointer to the named OpenGL function. The returned pointer
	 *          should be cast to the appropriate function signature.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GL_ExtensionSupported
	 * \sa SDL_GL_LoadLibrary
	 * \sa SDL_GL_UnloadLibrary
	 */"

	^ self ffiCall: #(SDL_FunctionPointer SDL_GL_GetProcAddress(const char* proc))
]

{ #category : 'public' }
LibSDL3 >> glGetSwapInterval: interval [
	"/**
	 * Get the swap interval for the current OpenGL context.
	 *
	 * If the system can't determine the swap interval, or there isn't a valid
	 * current context, this function will set *interval to 0 as a safe default.
	 *
	 * \param interval output interval value. 0 if there is no vertical retrace
	 *                 synchronization, 1 if the buffer swap is synchronized with
	 *                 the vertical retrace, and -1 if late swaps happen
	 *                 immediately instead of waiting for the next retrace.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GL_SetSwapInterval
	 */"

	^ self ffiCall: #(bool SDL_GL_GetSwapInterval(int* interval))
]

{ #category : 'public' }
LibSDL3 >> glLoadLibrary: path [
	"/**
	 * Dynamically load an OpenGL library.
	 *
	 * This should be done after initializing the video driver, but before
	 * creating any OpenGL windows. If no OpenGL library is loaded, the default
	 * library will be loaded upon creation of the first OpenGL window.
	 *
	 * If you do this, you need to retrieve all of the GL functions used in your
	 * program from the dynamic library using SDL_GL_GetProcAddress().
	 *
	 * \param path the platform dependent OpenGL library name, or NULL to open the
	 *             default OpenGL library.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GL_GetProcAddress
	 * \sa SDL_GL_UnloadLibrary
	 */"

	^ self ffiCall: #(bool SDL_GL_LoadLibrary(const char* path))
]

{ #category : 'public' }
LibSDL3 >> glMakeCurrentWindow: window context: context [
	"/**
	 * Set up an OpenGL context for rendering into an OpenGL window.
	 *
	 * The context must have been created with a compatible window.
	 *
	 * \param window the window to associate with the context.
	 * \param context the OpenGL context to associate with the window.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GL_CreateContext
	 */"

	^ self ffiCall: #(bool SDL_GL_MakeCurrent(SDL_Window* window, SDL_GLContext context))
]

{ #category : 'public' }
LibSDL3 >> glResetAttributes [
	"/**
	 * Reset all previously set OpenGL context attributes to their default values.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GL_GetAttribute
	 * \sa SDL_GL_SetAttribute
	 */"

	self ffiCall: #(void SDL_GL_ResetAttributes())
]

{ #category : 'public' }
LibSDL3 >> glSetAttributeAttr: attr value: value [
	"/**
	 * Set an OpenGL window attribute before window creation.
	 *
	 * This function sets the OpenGL attribute `attr` to `value`. The requested
	 * attributes should be set before creating an OpenGL window. You should use
	 * SDL_GL_GetAttribute() to check the values after creating the OpenGL
	 * context, since the values obtained can differ from the requested ones.
	 *
	 * \param attr an SDL_GLAttr enum value specifying the OpenGL attribute to
	 *             set.
	 * \param value the desired value for the attribute.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GL_GetAttribute
	 * \sa SDL_GL_ResetAttributes
	 */"

	^ self ffiCall: #(bool SDL_GL_SetAttribute(SDL_GLAttr attr, int value))
]

{ #category : 'public' }
LibSDL3 >> glSetSwapInterval: interval [
	"/**
	 * Set the swap interval for the current OpenGL context.
	 *
	 * Some systems allow specifying -1 for the interval, to enable adaptive
	 * vsync. Adaptive vsync works the same as vsync, but if you've already missed
	 * the vertical retrace for a given frame, it swaps buffers immediately, which
	 * might be less jarring for the user during occasional framerate drops. If an
	 * application requests adaptive vsync and the system does not support it,
	 * this function will fail and return false. In such a case, you should
	 * probably retry the call with 1 for the interval.
	 *
	 * Adaptive vsync is implemented for some glX drivers with
	 * GLX_EXT_swap_control_tear, and for some Windows drivers with
	 * WGL_EXT_swap_control_tear.
	 *
	 * Read more on the Khronos wiki:
	 * https://www.khronos.org/opengl/wiki/Swap_Interval#Adaptive_Vsync
	 *
	 * \param interval 0 for immediate updates, 1 for updates synchronized with
	 *                 the vertical retrace, -1 for adaptive vsync.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GL_GetSwapInterval
	 */"

	^ self ffiCall: #(bool SDL_GL_SetSwapInterval(int interval))
]

{ #category : 'public' }
LibSDL3 >> glSwapWindow: window [
	"/**
	 * Update a window with OpenGL rendering.
	 *
	 * This is used with double-buffered OpenGL contexts, which are the default.
	 *
	 * On macOS, make sure you bind 0 to the draw framebuffer before swapping the
	 * window, otherwise nothing will happen. If you aren't using
	 * glBindFramebuffer(), this is the default and you won't have to do anything
	 * extra.
	 *
	 * \param window the window to change.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_GL_SwapWindow(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> glUnloadLibrary [
	"/**
	 * Unload the OpenGL library previously loaded by SDL_GL_LoadLibrary().
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GL_LoadLibrary
	 */"

	self ffiCall: #(void SDL_GL_UnloadLibrary())
]

{ #category : 'public' }
LibSDL3 >> globDirectoryPath: path pattern: pattern flags: flags count: count [
	"/**
	 * Enumerate a directory tree, filtered by pattern, and return a list.
	 *
	 * Files are filtered out if they don't match the string in `pattern`, which
	 * may contain wildcard characters '\*' (match everything) and '?' (match one
	 * character). If pattern is NULL, no filtering is done and all results are
	 * returned. Subdirectories are permitted, and are specified with a path
	 * separator of '/'. Wildcard characters '\*' and '?' never match a path
	 * separator.
	 *
	 * `flags` may be set to SDL_GLOB_CASEINSENSITIVE to make the pattern matching
	 * case-insensitive.
	 *
	 * The returned array is always NULL-terminated, for your iterating
	 * convenience, but if `count` is non-NULL, on return it will contain the
	 * number of items in the array, not counting the NULL terminator.
	 *
	 * \param path the path of the directory to enumerate.
	 * \param pattern the pattern that files in the directory must match. Can be
	 *                NULL.
	 * \param flags `SDL_GLOB_*` bitflags that affect this search.
	 * \param count on return, will be set to the number of items in the returned
	 *              array. Can be NULL.
	 * \returns an array of strings on success or NULL on failure; call
	 *          SDL_GetError() for more information. This is a single allocation
	 *          that should be freed with SDL_free() when it is no longer needed.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(char** SDL_GlobDirectory(const char* path, const char* pattern, SDL_GlobFlags flags, int* count))
]

{ #category : 'public' }
LibSDL3 >> gpuSupportsProperties: props [
	"/**
	 * Checks for GPU runtime support.
	 *
	 * \param props the properties to use.
	 * \returns true if supported, false otherwise.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateGPUDeviceWithProperties
	 */"

	^ self ffiCall: #(bool SDL_GPUSupportsProperties(SDL_PropertiesID props))
]

{ #category : 'public' }
LibSDL3 >> gpuSupportsShaderFormatsFormatFlags: format_flags name: name [
	"/**
	 * Checks for GPU runtime support.
	 *
	 * \param format_flags a bitflag indicating which shader formats the app is
	 *                     able to provide.
	 * \param name the preferred GPU driver, or NULL to let SDL pick the optimal
	 *             driver.
	 * \returns true if supported, false otherwise.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateGPUDevice
	 */"

	^ self ffiCall: #(bool SDL_GPUSupportsShaderFormats(SDL_GPUShaderFormat format_flags, const char* name))
]

{ #category : 'public' }
LibSDL3 >> gpuTextureFormatTexelBlockSize: format [
	"/**
	 * Obtains the texel block size for a texture format.
	 *
	 * \param format the texture format you want to know the texel size of.
	 * \returns the texel block size of the texture format.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_UploadToGPUTexture
	 */"

	^ self ffiCall: #(Uint32 SDL_GPUTextureFormatTexelBlockSize(SDL_GPUTextureFormat format))
]

{ #category : 'public' }
LibSDL3 >> gpuTextureSupportsFormatDevice: device format: format type: type usage: usage [
	"/**
	 * Determines whether a texture format is supported for a given type and
	 * usage.
	 *
	 * \param device a GPU context.
	 * \param format the texture format to check.
	 * \param type the type of texture (2D, 3D, Cube).
	 * \param usage a bitmask of all usage scenarios to check.
	 * \returns whether the texture format is supported for this type and usage.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_GPUTextureSupportsFormat(SDL_GPUDevice* device, SDL_GPUTextureFormat format, SDL_GPUTextureType type, SDL_GPUTextureUsageFlags usage))
]

{ #category : 'public' }
LibSDL3 >> gpuTextureSupportsSampleCountDevice: device format: format sampleCount: sample_count [
	"/**
	 * Determines if a sample count for a texture format is supported.
	 *
	 * \param device a GPU context.
	 * \param format the texture format to check.
	 * \param sample_count the sample count to check.
	 * \returns whether the sample count is supported for this texture format.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_GPUTextureSupportsSampleCount(SDL_GPUDevice* device, SDL_GPUTextureFormat format, SDL_GPUSampleCount sample_count))
]

{ #category : 'public' }
LibSDL3 >> guidToStringGuid: guid pszGUID: pszGUID cbGUID: cbGUID [
	"/**
	 * Get an ASCII string representation for a given SDL_GUID.
	 *
	 * \param guid the SDL_GUID you wish to convert to string.
	 * \param pszGUID buffer in which to write the ASCII string.
	 * \param cbGUID the size of pszGUID, should be at least 33 bytes.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_StringToGUID
	 */"

	self ffiCall: #(void SDL_GUIDToString(SDL_GUID guid, char* pszGUID, int cbGUID))
]

{ #category : 'public' }
LibSDL3 >> hasARMSIMD [
	"/**
	 * Determine whether the CPU has ARM SIMD (ARMv6) features.
	 *
	 * This is different from ARM NEON, which is a different instruction set.
	 *
	 * This always returns false on CPUs that aren't using ARM instruction sets.
	 *
	 * \returns true if the CPU has ARM SIMD features or false if not.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_HasNEON
	 */"

	^ self ffiCall: #(bool SDL_HasARMSIMD())
]

{ #category : 'public' }
LibSDL3 >> hasAVX [
	"/**
	 * Determine whether the CPU has AVX features.
	 *
	 * This always returns false on CPUs that aren't using Intel instruction sets.
	 *
	 * \returns true if the CPU has AVX features or false if not.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_HasAVX2
	 * \sa SDL_HasAVX512F
	 */"

	^ self ffiCall: #(bool SDL_HasAVX())
]

{ #category : 'public' }
LibSDL3 >> hasAVX2 [
	"/**
	 * Determine whether the CPU has AVX2 features.
	 *
	 * This always returns false on CPUs that aren't using Intel instruction sets.
	 *
	 * \returns true if the CPU has AVX2 features or false if not.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_HasAVX
	 * \sa SDL_HasAVX512F
	 */"

	^ self ffiCall: #(bool SDL_HasAVX2())
]

{ #category : 'public' }
LibSDL3 >> hasAVX512F [
	"/**
	 * Determine whether the CPU has AVX-512F (foundation) features.
	 *
	 * This always returns false on CPUs that aren't using Intel instruction sets.
	 *
	 * \returns true if the CPU has AVX-512F features or false if not.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_HasAVX
	 * \sa SDL_HasAVX2
	 */"

	^ self ffiCall: #(bool SDL_HasAVX512F())
]

{ #category : 'public' }
LibSDL3 >> hasAltiVec [
	"/**
	 * Determine whether the CPU has AltiVec features.
	 *
	 * This always returns false on CPUs that aren't using PowerPC instruction
	 * sets.
	 *
	 * \returns true if the CPU has AltiVec features or false if not.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_HasAltiVec())
]

{ #category : 'public' }
LibSDL3 >> hasClipboardData: mime_type [
	"/**
	 * Query whether there is data in the clipboard for the provided mime type.
	 *
	 * \param mime_type the mime type to check for data for.
	 * \returns true if there exists data in clipboard for the provided mime type,
	 *          false if it does not.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetClipboardData
	 * \sa SDL_GetClipboardData
	 */"

	^ self ffiCall: #(bool SDL_HasClipboardData(const char* mime_type))
]

{ #category : 'public' }
LibSDL3 >> hasClipboardText [
	"/**
	 * Query whether the clipboard exists and contains a non-empty text string.
	 *
	 * \returns true if the clipboard has text, or false if it does not.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetClipboardText
	 * \sa SDL_SetClipboardText
	 */"

	^ self ffiCall: #(bool SDL_HasClipboardText())
]

{ #category : 'public' }
LibSDL3 >> hasEvent: type [
	"/**
	 * Check for the existence of a certain event type in the event queue.
	 *
	 * If you need to check for a range of event types, use SDL_HasEvents()
	 * instead.
	 *
	 * \param type the type of event to be queried; see SDL_EventType for details.
	 * \returns true if events matching `type` are present, or false if events
	 *          matching `type` are not present.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_HasEvents
	 */"

	^ self ffiCall: #(bool SDL_HasEvent(Uint32 type))
]

{ #category : 'public' }
LibSDL3 >> hasEventsMinType: minType maxType: maxType [
	"/**
	 * Check for the existence of certain event types in the event queue.
	 *
	 * If you need to check for a single event type, use SDL_HasEvent() instead.
	 *
	 * \param minType the low end of event type to be queried, inclusive; see
	 *                SDL_EventType for details.
	 * \param maxType the high end of event type to be queried, inclusive; see
	 *                SDL_EventType for details.
	 * \returns true if events with type >= `minType` and <= `maxType` are
	 *          present, or false if not.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_HasEvents
	 */"

	^ self ffiCall: #(bool SDL_HasEvents(Uint32 minType, Uint32 maxType))
]

{ #category : 'public' }
LibSDL3 >> hasJoystick [
	"/**
	 * Return whether a joystick is currently connected.
	 *
	 * \returns true if a joystick is connected, false otherwise.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetJoysticks
	 */"

	^ self ffiCall: #(bool SDL_HasJoystick())
]

{ #category : 'public' }
LibSDL3 >> hasKeyboard [
	"/**
	 * Return whether a keyboard is currently connected.
	 *
	 * \returns true if a keyboard is connected, false otherwise.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetKeyboards
	 */"

	^ self ffiCall: #(bool SDL_HasKeyboard())
]

{ #category : 'public' }
LibSDL3 >> hasLASX [
	"/**
	 * Determine whether the CPU has LASX (LOONGARCH SIMD) features.
	 *
	 * This always returns false on CPUs that aren't using LOONGARCH instruction
	 * sets.
	 *
	 * \returns true if the CPU has LOONGARCH LASX features or false if not.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_HasLASX())
]

{ #category : 'public' }
LibSDL3 >> hasLSX [
	"/**
	 * Determine whether the CPU has LSX (LOONGARCH SIMD) features.
	 *
	 * This always returns false on CPUs that aren't using LOONGARCH instruction
	 * sets.
	 *
	 * \returns true if the CPU has LOONGARCH LSX features or false if not.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_HasLSX())
]

{ #category : 'public' }
LibSDL3 >> hasMMX [
	"/**
	 * Determine whether the CPU has MMX features.
	 *
	 * This always returns false on CPUs that aren't using Intel instruction sets.
	 *
	 * \returns true if the CPU has MMX features or false if not.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_HasMMX())
]

{ #category : 'public' }
LibSDL3 >> hasMouse [
	"/**
	 * Return whether a mouse is currently connected.
	 *
	 * \returns true if a mouse is connected, false otherwise.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetMice
	 */"

	^ self ffiCall: #(bool SDL_HasMouse())
]

{ #category : 'public' }
LibSDL3 >> hasNEON [
	"/**
	 * Determine whether the CPU has NEON (ARM SIMD) features.
	 *
	 * This always returns false on CPUs that aren't using ARM instruction sets.
	 *
	 * \returns true if the CPU has ARM NEON features or false if not.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_HasNEON())
]

{ #category : 'public' }
LibSDL3 >> hasPrimarySelectionText [
	"/**
	 * Query whether the primary selection exists and contains a non-empty text
	 * string.
	 *
	 * \returns true if the primary selection has text, or false if it does not.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetPrimarySelectionText
	 * \sa SDL_SetPrimarySelectionText
	 */"

	^ self ffiCall: #(bool SDL_HasPrimarySelectionText())
]

{ #category : 'public' }
LibSDL3 >> hasPropertyProps: props name: name [
	"/**
	 * Return whether a property exists in a group of properties.
	 *
	 * \param props the properties to query.
	 * \param name the name of the property to query.
	 * \returns true if the property exists, or false if it doesn't.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetPropertyType
	 */"

	^ self ffiCall: #(bool SDL_HasProperty(SDL_PropertiesID props, const char* name))
]

{ #category : 'public' }
LibSDL3 >> hasRectIntersectionA: A B: B [
	"/**
	 * Determine whether two rectangles intersect.
	 *
	 * If either pointer is NULL the function will return false.
	 *
	 * \param A an SDL_Rect structure representing the first rectangle.
	 * \param B an SDL_Rect structure representing the second rectangle.
	 * \returns true if there is an intersection, false otherwise.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetRectIntersection
	 */"

	^ self ffiCall: #(bool SDL_HasRectIntersection(SDL_Rect* A, SDL_Rect* B))
]

{ #category : 'public' }
LibSDL3 >> hasRectIntersectionFloatA: A B: B [
	"/**
	 * Determine whether two rectangles intersect with float precision.
	 *
	 * If either pointer is NULL the function will return false.
	 *
	 * \param A an SDL_FRect structure representing the first rectangle.
	 * \param B an SDL_FRect structure representing the second rectangle.
	 * \returns true if there is an intersection, false otherwise.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetRectIntersection
	 */"

	^ self ffiCall: #(bool SDL_HasRectIntersectionFloat(SDL_FRect* A, SDL_FRect* B))
]

{ #category : 'public' }
LibSDL3 >> hasSSE [
	"/**
	 * Determine whether the CPU has SSE features.
	 *
	 * This always returns false on CPUs that aren't using Intel instruction sets.
	 *
	 * \returns true if the CPU has SSE features or false if not.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_HasSSE2
	 * \sa SDL_HasSSE3
	 * \sa SDL_HasSSE41
	 * \sa SDL_HasSSE42
	 */"

	^ self ffiCall: #(bool SDL_HasSSE())
]

{ #category : 'public' }
LibSDL3 >> hasSSE2 [
	"/**
	 * Determine whether the CPU has SSE2 features.
	 *
	 * This always returns false on CPUs that aren't using Intel instruction sets.
	 *
	 * \returns true if the CPU has SSE2 features or false if not.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_HasSSE
	 * \sa SDL_HasSSE3
	 * \sa SDL_HasSSE41
	 * \sa SDL_HasSSE42
	 */"

	^ self ffiCall: #(bool SDL_HasSSE2())
]

{ #category : 'public' }
LibSDL3 >> hasSSE3 [
	"/**
	 * Determine whether the CPU has SSE3 features.
	 *
	 * This always returns false on CPUs that aren't using Intel instruction sets.
	 *
	 * \returns true if the CPU has SSE3 features or false if not.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_HasSSE
	 * \sa SDL_HasSSE2
	 * \sa SDL_HasSSE41
	 * \sa SDL_HasSSE42
	 */"

	^ self ffiCall: #(bool SDL_HasSSE3())
]

{ #category : 'public' }
LibSDL3 >> hasSSE41 [
	"/**
	 * Determine whether the CPU has SSE4.1 features.
	 *
	 * This always returns false on CPUs that aren't using Intel instruction sets.
	 *
	 * \returns true if the CPU has SSE4.1 features or false if not.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_HasSSE
	 * \sa SDL_HasSSE2
	 * \sa SDL_HasSSE3
	 * \sa SDL_HasSSE42
	 */"

	^ self ffiCall: #(bool SDL_HasSSE41())
]

{ #category : 'public' }
LibSDL3 >> hasSSE42 [
	"/**
	 * Determine whether the CPU has SSE4.2 features.
	 *
	 * This always returns false on CPUs that aren't using Intel instruction sets.
	 *
	 * \returns true if the CPU has SSE4.2 features or false if not.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_HasSSE
	 * \sa SDL_HasSSE2
	 * \sa SDL_HasSSE3
	 * \sa SDL_HasSSE41
	 */"

	^ self ffiCall: #(bool SDL_HasSSE42())
]

{ #category : 'public' }
LibSDL3 >> hasScreenKeyboardSupport [
	"/**
	 * Check whether the platform has screen keyboard support.
	 *
	 * \returns true if the platform has some screen keyboard support or false if
	 *          not.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_StartTextInput
	 * \sa SDL_ScreenKeyboardShown
	 */"

	^ self ffiCall: #(bool SDL_HasScreenKeyboardSupport())
]

{ #category : 'public' }
LibSDL3 >> hideCursor [
	"/**
	 * Hide the cursor.
	 *
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CursorVisible
	 * \sa SDL_ShowCursor
	 */"

	^ self ffiCall: #(bool SDL_HideCursor())
]

{ #category : 'public' }
LibSDL3 >> hideWindow: window [
	"/**
	 * Hide a window.
	 *
	 * \param window the window to hide.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_ShowWindow
	 * \sa SDL_WINDOW_HIDDEN
	 */"

	^ self ffiCall: #(bool SDL_HideWindow(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> iOFromConstMem: mem size: size [
	"/**
	 * Use this function to prepare a read-only memory buffer for use with
	 * SDL_IOStream.
	 *
	 * This function sets up an SDL_IOStream struct based on a memory area of a
	 * certain size. It assumes the memory area is not writable.
	 *
	 * Attempting to write to this SDL_IOStream stream will report an error
	 * without writing to the memory buffer.
	 *
	 * This memory buffer is not copied by the SDL_IOStream; the pointer you
	 * provide must remain valid until you close the stream. Closing the stream
	 * will not free the original buffer.
	 *
	 * If you need to write to a memory buffer, you should use SDL_IOFromMem()
	 * with a writable buffer of memory instead.
	 *
	 * The following properties will be set at creation time by SDL:
	 *
	 * - `SDL_PROP_IOSTREAM_MEMORY_POINTER`: this will be the `mem` parameter that
	 *   was passed to this function.
	 * - `SDL_PROP_IOSTREAM_MEMORY_SIZE_NUMBER`: this will be the `size` parameter
	 *   that was passed to this function.
	 *
	 * \param mem a pointer to a read-only buffer to feed an SDL_IOStream stream.
	 * \param size the buffer size, in bytes.
	 * \returns a pointer to a new SDL_IOStream structure or NULL on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_IOFromMem
	 * \sa SDL_CloseIO
	 * \sa SDL_ReadIO
	 * \sa SDL_SeekIO
	 * \sa SDL_TellIO
	 */"

	^ self ffiCall: #(SDL_IOStream* SDL_IOFromConstMem(const void* mem, size_t size))
]

{ #category : 'public' }
LibSDL3 >> iOFromDynamicMem [
	"/**
	 * Use this function to create an SDL_IOStream that is backed by dynamically
	 * allocated memory.
	 *
	 * This supports the following properties to provide access to the memory and
	 * control over allocations:
	 *
	 * - `SDL_PROP_IOSTREAM_DYNAMIC_MEMORY_POINTER`: a pointer to the internal
	 *   memory of the stream. This can be set to NULL to transfer ownership of
	 *   the memory to the application, which should free the memory with
	 *   SDL_free(). If this is done, the next operation on the stream must be
	 *   SDL_CloseIO().
	 * - `SDL_PROP_IOSTREAM_DYNAMIC_CHUNKSIZE_NUMBER`: memory will be allocated in
	 *   multiples of this size, defaulting to 1024.
	 *
	 * \returns a pointer to a new SDL_IOStream structure or NULL on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CloseIO
	 * \sa SDL_ReadIO
	 * \sa SDL_SeekIO
	 * \sa SDL_TellIO
	 * \sa SDL_WriteIO
	 */"

	^ self ffiCall: #(SDL_IOStream* SDL_IOFromDynamicMem())
]

{ #category : 'public' }
LibSDL3 >> iOFromFile: file mode: mode [
	"/**
	 * Use this function to create a new SDL_IOStream structure for reading from
	 * and/or writing to a named file.
	 *
	 * The `mode` string is treated roughly the same as in a call to the C
	 * library's fopen(), even if SDL doesn't happen to use fopen() behind the
	 * scenes.
	 *
	 * Available `mode` strings:
	 *
	 * - ""r"": Open a file for reading. The file must exist.
	 * - ""w"": Create an empty file for writing. If a file with the same name
	 *   already exists its content is erased and the file is treated as a new
	 *   empty file.
	 * - ""a"": Append to a file. Writing operations append data at the end of the
	 *   file. The file is created if it does not exist.
	 * - ""r+"": Open a file for update both reading and writing. The file must
	 *   exist.
	 * - ""w+"": Create an empty file for both reading and writing. If a file with
	 *   the same name already exists its content is erased and the file is
	 *   treated as a new empty file.
	 * - ""a+"": Open a file for reading and appending. All writing operations are
	 *   performed at the end of the file, protecting the previous content to be
	 *   overwritten. You can reposition (fseek, rewind) the internal pointer to
	 *   anywhere in the file for reading, but writing operations will move it
	 *   back to the end of file. The file is created if it does not exist.
	 *
	 * **NOTE**: In order to open a file as a binary file, a ""b"" character has to
	 * be included in the `mode` string. This additional ""b"" character can either
	 * be appended at the end of the string (thus making the following compound
	 * modes: ""rb"", ""wb"", ""ab"", ""r+b"", ""w+b"", ""a+b"") or be inserted between the
	 * letter and the ""+"" sign for the mixed modes (""rb+"", ""wb+"", ""ab+"").
	 * Additional characters may follow the sequence, although they should have no
	 * effect. For example, ""t"" is sometimes appended to make explicit the file is
	 * a text file.
	 *
	 * This function supports Unicode filenames, but they must be encoded in UTF-8
	 * format, regardless of the underlying operating system.
	 *
	 * In Android, SDL_IOFromFile() can be used to open content:// URIs. As a
	 * fallback, SDL_IOFromFile() will transparently open a matching filename in
	 * the app's `assets`.
	 *
	 * Closing the SDL_IOStream will close SDL's internal file handle.
	 *
	 * The following properties may be set at creation time by SDL:
	 *
	 * - `SDL_PROP_IOSTREAM_WINDOWS_HANDLE_POINTER`: a pointer, that can be cast
	 *   to a win32 `HANDLE`, that this SDL_IOStream is using to access the
	 *   filesystem. If the program isn't running on Windows, or SDL used some
	 *   other method to access the filesystem, this property will not be set.
	 * - `SDL_PROP_IOSTREAM_STDIO_FILE_POINTER`: a pointer, that can be cast to a
	 *   stdio `FILE *`, that this SDL_IOStream is using to access the filesystem.
	 *   If SDL used some other method to access the filesystem, this property
	 *   will not be set. PLEASE NOTE that if SDL is using a different C runtime
	 *   than your app, trying to use this pointer will almost certainly result in
	 *   a crash! This is mostly a problem on Windows; make sure you build SDL and
	 *   your app with the same compiler and settings to avoid it.
	 * - `SDL_PROP_IOSTREAM_FILE_DESCRIPTOR_NUMBER`: a file descriptor that this
	 *   SDL_IOStream is using to access the filesystem.
	 * - `SDL_PROP_IOSTREAM_ANDROID_AASSET_POINTER`: a pointer, that can be cast
	 *   to an Android NDK `AAsset *`, that this SDL_IOStream is using to access
	 *   the filesystem. If SDL used some other method to access the filesystem,
	 *   this property will not be set.
	 *
	 * \param file a UTF-8 string representing the filename to open.
	 * \param mode an ASCII string representing the mode to be used for opening
	 *             the file.
	 * \returns a pointer to the SDL_IOStream structure that is created or NULL on
	 *          failure; call SDL_GetError() for more information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CloseIO
	 * \sa SDL_FlushIO
	 * \sa SDL_ReadIO
	 * \sa SDL_SeekIO
	 * \sa SDL_TellIO
	 * \sa SDL_WriteIO
	 */"

	^ self ffiCall: #(SDL_IOStream* SDL_IOFromFile(const char* file, const char* mode))
]

{ #category : 'public' }
LibSDL3 >> iOFromMem: mem size: size [
	"/**
	 * Use this function to prepare a read-write memory buffer for use with
	 * SDL_IOStream.
	 *
	 * This function sets up an SDL_IOStream struct based on a memory area of a
	 * certain size, for both read and write access.
	 *
	 * This memory buffer is not copied by the SDL_IOStream; the pointer you
	 * provide must remain valid until you close the stream. Closing the stream
	 * will not free the original buffer.
	 *
	 * If you need to make sure the SDL_IOStream never writes to the memory
	 * buffer, you should use SDL_IOFromConstMem() with a read-only buffer of
	 * memory instead.
	 *
	 * The following properties will be set at creation time by SDL:
	 *
	 * - `SDL_PROP_IOSTREAM_MEMORY_POINTER`: this will be the `mem` parameter that
	 *   was passed to this function.
	 * - `SDL_PROP_IOSTREAM_MEMORY_SIZE_NUMBER`: this will be the `size` parameter
	 *   that was passed to this function.
	 *
	 * \param mem a pointer to a buffer to feed an SDL_IOStream stream.
	 * \param size the buffer size, in bytes.
	 * \returns a pointer to a new SDL_IOStream structure or NULL on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_IOFromConstMem
	 * \sa SDL_CloseIO
	 * \sa SDL_FlushIO
	 * \sa SDL_ReadIO
	 * \sa SDL_SeekIO
	 * \sa SDL_TellIO
	 * \sa SDL_WriteIO
	 */"

	^ self ffiCall: #(SDL_IOStream* SDL_IOFromMem(void* mem, size_t size))
]

{ #category : 'public' }
LibSDL3 >> iconvCd: cd inbuf: inbuf inbytesleft: inbytesleft outbuf: outbuf outbytesleft: outbytesleft [
	"/**
	 * This function converts text between encodings, reading from and writing to
	 * a buffer.
	 *
	 * It returns the number of succesful conversions on success. On error,
	 * SDL_ICONV_E2BIG is returned when the output buffer is too small, or
	 * SDL_ICONV_EILSEQ is returned when an invalid input sequence is encountered,
	 * or SDL_ICONV_EINVAL is returned when an incomplete input sequence is
	 * encountered.
	 *
	 * On exit:
	 *
	 * - inbuf will point to the beginning of the next multibyte sequence. On
	 *   error, this is the location of the problematic input sequence. On
	 *   success, this is the end of the input sequence.
	 * - inbytesleft will be set to the number of bytes left to convert, which
	 *   will be 0 on success.
	 * - outbuf will point to the location where to store the next output byte.
	 * - outbytesleft will be set to the number of bytes left in the output
	 *   buffer.
	 *
	 * \param cd The character set conversion context, created in
	 *           SDL_iconv_open().
	 * \param inbuf Address of variable that points to the first character of the
	 *              input sequence.
	 * \param inbytesleft The number of bytes in the input buffer.
	 * \param outbuf Address of variable that points to the output buffer.
	 * \param outbytesleft The number of bytes in the output buffer.
	 * \returns the number of conversions on success, or a negative error code.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_iconv_open
	 * \sa SDL_iconv_close
	 * \sa SDL_iconv_string
	 */"

	^ self ffiCall: #(size_t SDL_iconv(SDL_iconv_t cd, const char** inbuf, size_t* inbytesleft, char** outbuf, size_t* outbytesleft))
]

{ #category : 'public' }
LibSDL3 >> iconvClose: cd [
	"/**
	 * This function frees a context used for character set conversion.
	 *
	 * \param cd The character set conversion handle.
	 * \returns 0 on success, or -1 on failure.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_iconv
	 * \sa SDL_iconv_open
	 * \sa SDL_iconv_string
	 */"

	^ self ffiCall: #(int SDL_iconv_close(SDL_iconv_t cd))
]

{ #category : 'public' }
LibSDL3 >> iconvOpenTocode: tocode fromcode: fromcode [
	"/**
	 * This function allocates a context for the specified character set
	 * conversion.
	 *
	 * \param tocode The target character encoding, must not be NULL.
	 * \param fromcode The source character encoding, must not be NULL.
	 * \returns a handle that must be freed with SDL_iconv_close, or
	 *          SDL_ICONV_ERROR on failure.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_iconv
	 * \sa SDL_iconv_close
	 * \sa SDL_iconv_string
	 */"

	^ self ffiCall: #(SDL_iconv_t SDL_iconv_open(const char* tocode, const char* fromcode))
]

{ #category : 'public' }
LibSDL3 >> iconvStringTocode: tocode fromcode: fromcode inbuf: inbuf inbytesleft: inbytesleft [
	"/**
	 * Helper function to convert a string's encoding in one call.
	 *
	 * This function converts a buffer or string between encodings in one pass.
	 *
	 * The string does not need to be NULL-terminated; this function operates on
	 * the number of bytes specified in `inbytesleft` whether there is a NULL
	 * character anywhere in the buffer.
	 *
	 * The returned string is owned by the caller, and should be passed to
	 * SDL_free when no longer needed.
	 *
	 * \param tocode the character encoding of the output string. Examples are
	 *               ""UTF-8"", ""UCS-4"", etc.
	 * \param fromcode the character encoding of data in `inbuf`.
	 * \param inbuf the string to convert to a different encoding.
	 * \param inbytesleft the size of the input string _in bytes_.
	 * \returns a new string, converted to the new encoding, or NULL on error.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_iconv_open
	 * \sa SDL_iconv_close
	 * \sa SDL_iconv
	 */"

	^ self ffiCall: #(char* SDL_iconv_string(const char* tocode, const char* fromcode, const char* inbuf, size_t inbytesleft))
]

{ #category : 'public' }
LibSDL3 >> init: flags [
	"/**
	 * Initialize the SDL library.
	 *
	 * SDL_Init() simply forwards to calling SDL_InitSubSystem(). Therefore, the
	 * two may be used interchangeably. Though for readability of your code
	 * SDL_InitSubSystem() might be preferred.
	 *
	 * The file I/O (for example: SDL_IOFromFile) and threading (SDL_CreateThread)
	 * subsystems are initialized by default. Message boxes
	 * (SDL_ShowSimpleMessageBox) also attempt to work without initializing the
	 * video subsystem, in hopes of being useful in showing an error dialog when
	 * SDL_Init fails. You must specifically initialize other subsystems if you
	 * use them in your application.
	 *
	 * Logging (such as SDL_Log) works without initialization, too.
	 *
	 * `flags` may be any of the following OR'd together:
	 *
	 * - `SDL_INIT_AUDIO`: audio subsystem; automatically initializes the events
	 *   subsystem
	 * - `SDL_INIT_VIDEO`: video subsystem; automatically initializes the events
	 *   subsystem, should be initialized on the main thread.
	 * - `SDL_INIT_JOYSTICK`: joystick subsystem; automatically initializes the
	 *   events subsystem
	 * - `SDL_INIT_HAPTIC`: haptic (force feedback) subsystem
	 * - `SDL_INIT_GAMEPAD`: gamepad subsystem; automatically initializes the
	 *   joystick subsystem
	 * - `SDL_INIT_EVENTS`: events subsystem
	 * - `SDL_INIT_SENSOR`: sensor subsystem; automatically initializes the events
	 *   subsystem
	 * - `SDL_INIT_CAMERA`: camera subsystem; automatically initializes the events
	 *   subsystem
	 *
	 * Subsystem initialization is ref-counted, you must call SDL_QuitSubSystem()
	 * for each SDL_InitSubSystem() to correctly shutdown a subsystem manually (or
	 * call SDL_Quit() to force shutdown). If a subsystem is already loaded then
	 * this call will increase the ref-count and return.
	 *
	 * Consider reporting some basic metadata about your application before
	 * calling SDL_Init, using either SDL_SetAppMetadata() or
	 * SDL_SetAppMetadataProperty().
	 *
	 * \param flags subsystem initialization flags.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetAppMetadata
	 * \sa SDL_SetAppMetadataProperty
	 * \sa SDL_InitSubSystem
	 * \sa SDL_Quit
	 * \sa SDL_SetMainReady
	 * \sa SDL_WasInit
	 */"

	^ self ffiCall: #(bool SDL_Init(SDL_InitFlags flags))
]

{ #category : 'public' }
LibSDL3 >> initSubSystem: flags [
	"/**
	 * Compatibility function to initialize the SDL library.
	 *
	 * This function and SDL_Init() are interchangeable.
	 *
	 * \param flags any of the flags used by SDL_Init(); see SDL_Init for details.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_Init
	 * \sa SDL_Quit
	 * \sa SDL_QuitSubSystem
	 */"

	^ self ffiCall: #(bool SDL_InitSubSystem(SDL_InitFlags flags))
]

{ #category : 'public' }
LibSDL3 >> insertGPUDebugLabelCommandBuffer: command_buffer text: text [
	"/**
	 * Inserts an arbitrary string label into the command buffer callstream.
	 *
	 * Useful for debugging.
	 *
	 * \param command_buffer a command buffer.
	 * \param text a UTF-8 string constant to insert as the label.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_InsertGPUDebugLabel(SDL_GPUCommandBuffer* command_buffer, const char* text))
]

{ #category : 'public' }
LibSDL3 >> insertTrayEntryAtMenu: menu pos: pos label: label flags: flags [
	"/**
	 * Insert a tray entry at a given position.
	 *
	 * If label is NULL, the entry will be a separator. Many functions won't work
	 * for an entry that is a separator.
	 *
	 * An entry does not need to be destroyed; it will be destroyed with the tray.
	 *
	 * \param menu the menu to append the entry to.
	 * \param pos the desired position for the new entry. Entries at or following
	 *            this place will be moved. If pos is -1, the entry is appended.
	 * \param label the text to be displayed on the entry, in UTF-8 encoding, or
	 *              NULL for a separator.
	 * \param flags a combination of flags, some of which are mandatory.
	 * \returns the newly created entry, or NULL if pos is out of bounds.
	 *
	 * \threadsafety This function should be called on the thread that created the
	 *               tray.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_TrayEntryFlags
	 * \sa SDL_GetTrayEntries
	 * \sa SDL_RemoveTrayEntry
	 * \sa SDL_GetTrayEntryParent
	 */"

	^ self ffiCall: #(SDL_TrayEntry* SDL_InsertTrayEntryAt(SDL_TrayMenu* menu, int pos, const char* label, SDL_TrayEntryFlags flags))
]

{ #category : 'public' }
LibSDL3 >> isAudioDevicePhysical: devid [
	"/**
	 * Determine if an audio device is physical (instead of logical).
	 *
	 * An SDL_AudioDeviceID that represents physical hardware is a physical
	 * device; there is one for each piece of hardware that SDL can see. Logical
	 * devices are created by calling SDL_OpenAudioDevice or
	 * SDL_OpenAudioDeviceStream, and while each is associated with a physical
	 * device, there can be any number of logical devices on one physical device.
	 *
	 * For the most part, logical and physical IDs are interchangeable--if you try
	 * to open a logical device, SDL understands to assign that effort to the
	 * underlying physical device, etc. However, it might be useful to know if an
	 * arbitrary device ID is physical or logical. This function reports which.
	 *
	 * This function may return either true or false for invalid device IDs.
	 *
	 * \param devid the device ID to query.
	 * \returns true if devid is a physical device, false if it is logical.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_IsAudioDevicePhysical(SDL_AudioDeviceID devid))
]

{ #category : 'public' }
LibSDL3 >> isAudioDevicePlayback: devid [
	"/**
	 * Determine if an audio device is a playback device (instead of recording).
	 *
	 * This function may return either true or false for invalid device IDs.
	 *
	 * \param devid the device ID to query.
	 * \returns true if devid is a playback device, false if it is recording.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_IsAudioDevicePlayback(SDL_AudioDeviceID devid))
]

{ #category : 'public' }
LibSDL3 >> isJoystickVirtual: instance_id [
	"/**
	 * Query whether or not a joystick is virtual.
	 *
	 * \param instance_id the joystick instance ID.
	 * \returns true if the joystick is virtual, false otherwise.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_IsJoystickVirtual(SDL_JoystickID instance_id))
]

{ #category : 'public' }
LibSDL3 >> isMainThread [
	"/**
	 * Return whether this is the main thread.
	 *
	 * On Apple platforms, the main thread is the thread that runs your program's
	 * main() entry point. On other platforms, the main thread is the one that
	 * calls SDL_Init(SDL_INIT_VIDEO), which should usually be the one that runs
	 * your program's main() entry point. If you are using the main callbacks,
	 * SDL_AppInit(), SDL_AppIterate(), and SDL_AppQuit() are all called on the
	 * main thread.
	 *
	 * \returns true if this thread is the main thread, or false otherwise.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_RunOnMainThread
	 */"

	^ self ffiCall: #(bool SDL_IsMainThread())
]

{ #category : 'public' }
LibSDL3 >> isTV [
	"/**
	 * Query if the current device is a TV.
	 *
	 * If SDL can't determine this, it will return false.
	 *
	 * \returns true if the device is a TV, false otherwise.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_IsTV())
]

{ #category : 'public' }
LibSDL3 >> isTablet [
	"/**
	 * Query if the current device is a tablet.
	 *
	 * If SDL can't determine this, it will return false.
	 *
	 * \returns true if the device is a tablet, false otherwise.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_IsTablet())
]

{ #category : 'public' }
LibSDL3 >> isalnum: x [
	"/**
	 * Query if a character is alphabetic (a letter) or a number.
	 *
	 * **WARNING**: Regardless of system locale, this will only treat ASCII values
	 * for English 'a-z', 'A-Z', and '0-9' as true.
	 *
	 * \param x character value to check.
	 * \returns non-zero if x falls within the character class, zero otherwise.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(int SDL_isalnum(int x))
]

{ #category : 'public' }
LibSDL3 >> isalpha: x [
	"/**
	 * Query if a character is alphabetic (a letter).
	 *
	 * **WARNING**: Regardless of system locale, this will only treat ASCII values
	 * for English 'a-z' and 'A-Z' as true.
	 *
	 * \param x character value to check.
	 * \returns non-zero if x falls within the character class, zero otherwise.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(int SDL_isalpha(int x))
]

{ #category : 'public' }
LibSDL3 >> isblank: x [
	"/**
	 * Report if a character is blank (a space or tab).
	 *
	 * **WARNING**: Regardless of system locale, this will only treat ASCII values
	 * 0x20 (space) or 0x9 (tab) as true.
	 *
	 * \param x character value to check.
	 * \returns non-zero if x falls within the character class, zero otherwise.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(int SDL_isblank(int x))
]

{ #category : 'public' }
LibSDL3 >> iscntrl: x [
	"/**
	 * Report if a character is a control character.
	 *
	 * **WARNING**: Regardless of system locale, this will only treat ASCII values
	 * 0 through 0x1F, and 0x7F, as true.
	 *
	 * \param x character value to check.
	 * \returns non-zero if x falls within the character class, zero otherwise.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(int SDL_iscntrl(int x))
]

{ #category : 'public' }
LibSDL3 >> isdigit: x [
	"/**
	 * Report if a character is a numeric digit.
	 *
	 * **WARNING**: Regardless of system locale, this will only treat ASCII values
	 * '0' (0x30) through '9' (0x39), as true.
	 *
	 * \param x character value to check.
	 * \returns non-zero if x falls within the character class, zero otherwise.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(int SDL_isdigit(int x))
]

{ #category : 'public' }
LibSDL3 >> isgraph: x [
	"/**
	 * Report if a character is any ""printable"" except space.
	 *
	 * Be advised that ""printable"" has a definition that goes back to text
	 * terminals from the dawn of computing, making this a sort of special case
	 * function that is not suitable for Unicode (or most any) text management.
	 *
	 * **WARNING**: Regardless of system locale, this is equivalent to
	 * `(SDL_isprint(x)) && ((x) != ' ')`.
	 *
	 * \param x character value to check.
	 * \returns non-zero if x falls within the character class, zero otherwise.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_isprint
	 */"

	^ self ffiCall: #(int SDL_isgraph(int x))
]

{ #category : 'public' }
LibSDL3 >> isinf: x [
	"/**
	 * Return whether the value is infinity.
	 *
	 * \param x double-precision floating point value.
	 * \returns non-zero if the value is infinity, 0 otherwise.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_isinff
	 */"

	^ self ffiCall: #(int SDL_isinf(double x))
]

{ #category : 'public' }
LibSDL3 >> isinff: x [
	"/**
	 * Return whether the value is infinity.
	 *
	 * \param x floating point value.
	 * \returns non-zero if the value is infinity, 0 otherwise.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_isinf
	 */"

	^ self ffiCall: #(int SDL_isinff(float x))
]

{ #category : 'public' }
LibSDL3 >> islower: x [
	"/**
	 * Report if a character is lower case.
	 *
	 * **WARNING**: Regardless of system locale, this will only treat ASCII values
	 * 'a' through 'z' as true.
	 *
	 * \param x character value to check.
	 * \returns non-zero if x falls within the character class, zero otherwise.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(int SDL_islower(int x))
]

{ #category : 'public' }
LibSDL3 >> isnan: x [
	"/**
	 * Return whether the value is NaN.
	 *
	 * \param x double-precision floating point value.
	 * \returns non-zero if the value is NaN, 0 otherwise.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_isnanf
	 */"

	^ self ffiCall: #(int SDL_isnan(double x))
]

{ #category : 'public' }
LibSDL3 >> isnanf: x [
	"/**
	 * Return whether the value is NaN.
	 *
	 * \param x floating point value.
	 * \returns non-zero if the value is NaN, 0 otherwise.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_isnan
	 */"

	^ self ffiCall: #(int SDL_isnanf(float x))
]

{ #category : 'public' }
LibSDL3 >> isprint: x [
	"/**
	 * Report if a character is ""printable"".
	 *
	 * Be advised that ""printable"" has a definition that goes back to text
	 * terminals from the dawn of computing, making this a sort of special case
	 * function that is not suitable for Unicode (or most any) text management.
	 *
	 * **WARNING**: Regardless of system locale, this will only treat ASCII values
	 * ' ' (0x20) through '~' (0x7E) as true.
	 *
	 * \param x character value to check.
	 * \returns non-zero if x falls within the character class, zero otherwise.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(int SDL_isprint(int x))
]

{ #category : 'public' }
LibSDL3 >> ispunct: x [
	"/**
	 * Report if a character is a punctuation mark.
	 *
	 * **WARNING**: Regardless of system locale, this is equivalent to
	 * `((SDL_isgraph(x)) && (!SDL_isalnum(x)))`.
	 *
	 * \param x character value to check.
	 * \returns non-zero if x falls within the character class, zero otherwise.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_isgraph
	 * \sa SDL_isalnum
	 */"

	^ self ffiCall: #(int SDL_ispunct(int x))
]

{ #category : 'public' }
LibSDL3 >> isspace: x [
	"/**
	 * Report if a character is whitespace.
	 *
	 * **WARNING**: Regardless of system locale, this will only treat the
	 * following ASCII values as true:
	 *
	 * - space (0x20)
	 * - tab (0x09)
	 * - newline (0x0A)
	 * - vertical tab (0x0B)
	 * - form feed (0x0C)
	 * - return (0x0D)
	 *
	 * \param x character value to check.
	 * \returns non-zero if x falls within the character class, zero otherwise.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(int SDL_isspace(int x))
]

{ #category : 'public' }
LibSDL3 >> isupper: x [
	"/**
	 * Report if a character is upper case.
	 *
	 * **WARNING**: Regardless of system locale, this will only treat ASCII values
	 * 'A' through 'Z' as true.
	 *
	 * \param x character value to check.
	 * \returns non-zero if x falls within the character class, zero otherwise.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(int SDL_isupper(int x))
]

{ #category : 'public' }
LibSDL3 >> isxdigit: x [
	"/**
	 * Report if a character is a hexadecimal digit.
	 *
	 * **WARNING**: Regardless of system locale, this will only treat ASCII values
	 * 'A' through 'F', 'a' through 'f', and '0' through '9', as true.
	 *
	 * \param x character value to check.
	 * \returns non-zero if x falls within the character class, zero otherwise.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(int SDL_isxdigit(int x))
]

{ #category : 'public' }
LibSDL3 >> itoaValue: value str: str radix: radix [
	"/**
	 * Convert an integer into a string.
	 *
	 * This requires a radix to specified for string format. Specifying 10
	 * produces a decimal number, 16 hexidecimal, etc. Must be in the range of 2
	 * to 36.
	 *
	 * Note that this function will overflow a buffer if `str` is not large enough
	 * to hold the output! It may be safer to use SDL_snprintf to clamp output, or
	 * SDL_asprintf to allocate a buffer. Otherwise, it doesn't hurt to allocate
	 * much more space than you expect to use (and don't forget possible negative
	 * signs, null terminator bytes, etc).
	 *
	 * \param value the integer to convert.
	 * \param str the buffer to write the string into.
	 * \param radix the radix to use for string generation.
	 * \returns `str`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_uitoa
	 * \sa SDL_ltoa
	 * \sa SDL_lltoa
	 */"

	^ self ffiCall: #(char* SDL_itoa(int value, char* str, int radix))
]

{ #category : 'public' }
LibSDL3 >> joystickConnected: joystick [
	"/**
	 * Get the status of a specified joystick.
	 *
	 * \param joystick the joystick to query.
	 * \returns true if the joystick has been opened, false if it has not; call
	 *          SDL_GetError() for more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_JoystickConnected(SDL_Joystick* joystick))
]

{ #category : 'public' }
LibSDL3 >> joystickEventsEnabled [
	"/**
	 * Query the state of joystick event processing.
	 *
	 * If joystick events are disabled, you must call SDL_UpdateJoysticks()
	 * yourself and check the state of the joystick when you want joystick
	 * information.
	 *
	 * \returns true if joystick events are being processed, false otherwise.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetJoystickEventsEnabled
	 */"

	^ self ffiCall: #(bool SDL_JoystickEventsEnabled())
]

{ #category : 'public' }
LibSDL3 >> lltoaValue: value str: str radix: radix [
	"/**
	 * Convert a long long integer into a string.
	 *
	 * This requires a radix to specified for string format. Specifying 10
	 * produces a decimal number, 16 hexidecimal, etc. Must be in the range of 2
	 * to 36.
	 *
	 * Note that this function will overflow a buffer if `str` is not large enough
	 * to hold the output! It may be safer to use SDL_snprintf to clamp output, or
	 * SDL_asprintf to allocate a buffer. Otherwise, it doesn't hurt to allocate
	 * much more space than you expect to use (and don't forget possible negative
	 * signs, null terminator bytes, etc).
	 *
	 * \param value the long long integer to convert.
	 * \param str the buffer to write the string into.
	 * \param radix the radix to use for string generation.
	 * \returns `str`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_ulltoa
	 * \sa SDL_itoa
	 * \sa SDL_ltoa
	 */"

	^ self ffiCall: #(char* SDL_lltoa(long value, char* str, int radix))
]

{ #category : 'public' }
LibSDL3 >> loadBMP: file [
	"/**
	 * Load a BMP image from a file.
	 *
	 * The new surface should be freed with SDL_DestroySurface(). Not doing so
	 * will result in a memory leak.
	 *
	 * \param file the BMP file to load.
	 * \returns a pointer to a new SDL_Surface structure or NULL on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_DestroySurface
	 * \sa SDL_LoadBMP_IO
	 * \sa SDL_SaveBMP
	 */"

	^ self ffiCall: #(SDL_Surface* SDL_LoadBMP(const char* file))
]

{ #category : 'public' }
LibSDL3 >> loadBMPIOSrc: src closeio: closeio [
	"/**
	 * Load a BMP image from a seekable SDL data stream.
	 *
	 * The new surface should be freed with SDL_DestroySurface(). Not doing so
	 * will result in a memory leak.
	 *
	 * \param src the data stream for the surface.
	 * \param closeio if true, calls SDL_CloseIO() on `src` before returning, even
	 *                in the case of an error.
	 * \returns a pointer to a new SDL_Surface structure or NULL on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_DestroySurface
	 * \sa SDL_LoadBMP
	 * \sa SDL_SaveBMP_IO
	 */"

	^ self ffiCall: #(SDL_Surface* SDL_LoadBMP_IO(SDL_IOStream* src, _Bool closeio))
]

{ #category : 'public' }
LibSDL3 >> loadFile: file datasize: datasize [
	"/**
	 * Load all the data from a file path.
	 *
	 * The data is allocated with a zero byte at the end (null terminated) for
	 * convenience. This extra byte is not included in the value reported via
	 * `datasize`.
	 *
	 * The data should be freed with SDL_free().
	 *
	 * \param file the path to read all available data from.
	 * \param datasize if not NULL, will store the number of bytes read.
	 * \returns the data or NULL on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_LoadFile_IO
	 * \sa SDL_SaveFile
	 */"

	^ self ffiCall: #(void* SDL_LoadFile(const char* file, size_t* datasize))
]

{ #category : 'public' }
LibSDL3 >> loadFileAsyncFile: file queue: queue userdata: userdata [
	"/**
	 * Load all the data from a file path, asynchronously.
	 *
	 * This function returns as quickly as possible; it does not wait for the read
	 * to complete. On a successful return, this work will continue in the
	 * background. If the work begins, even failure is asynchronous: a failing
	 * return value from this function only means the work couldn't start at all.
	 *
	 * The data is allocated with a zero byte at the end (null terminated) for
	 * convenience. This extra byte is not included in SDL_AsyncIOOutcome's
	 * bytes_transferred value.
	 *
	 * This function will allocate the buffer to contain the file. It must be
	 * deallocated by calling SDL_free() on SDL_AsyncIOOutcome's buffer field
	 * after completion.
	 *
	 * An SDL_AsyncIOQueue must be specified. The newly-created task will be added
	 * to it when it completes its work.
	 *
	 * \param file the path to read all available data from.
	 * \param queue a queue to add the new SDL_AsyncIO to.
	 * \param userdata an app-defined pointer that will be provided with the task
	 *                 results.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_LoadFile_IO
	 */"

	^ self ffiCall: #(bool SDL_LoadFileAsync(const char* file, SDL_AsyncIOQueue* queue, void* userdata))
]

{ #category : 'public' }
LibSDL3 >> loadFileIOSrc: src datasize: datasize closeio: closeio [
	"/**
	 * Load all the data from an SDL data stream.
	 *
	 * The data is allocated with a zero byte at the end (null terminated) for
	 * convenience. This extra byte is not included in the value reported via
	 * `datasize`.
	 *
	 * The data should be freed with SDL_free().
	 *
	 * \param src the SDL_IOStream to read all available data from.
	 * \param datasize a pointer filled in with the number of bytes read, may be
	 *                 NULL.
	 * \param closeio if true, calls SDL_CloseIO() on `src` before returning, even
	 *                in the case of an error.
	 * \returns the data or NULL on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_LoadFile
	 * \sa SDL_SaveFile_IO
	 */"

	^ self ffiCall: #(void* SDL_LoadFile_IO(SDL_IOStream* src, size_t* datasize, _Bool closeio))
]

{ #category : 'public' }
LibSDL3 >> loadFunctionHandle: handle name: name [
	"/**
	 * Look up the address of the named function in a shared object.
	 *
	 * This function pointer is no longer valid after calling SDL_UnloadObject().
	 *
	 * This function can only look up C function names. Other languages may have
	 * name mangling and intrinsic language support that varies from compiler to
	 * compiler.
	 *
	 * Make sure you declare your function pointers with the same calling
	 * convention as the actual library function. Your code will crash
	 * mysteriously if you do not do this.
	 *
	 * If the requested function doesn't exist, NULL is returned.
	 *
	 * \param handle a valid shared object handle returned by SDL_LoadObject().
	 * \param name the name of the function to look up.
	 * \returns a pointer to the function or NULL on failure; call SDL_GetError()
	 *          for more information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_LoadObject
	 */"

	^ self ffiCall: #(SDL_FunctionPointer SDL_LoadFunction(SDL_SharedObject* handle, const char* name))
]

{ #category : 'public' }
LibSDL3 >> loadObject: sofile [
	"/**
	 * Dynamically load a shared object.
	 *
	 * \param sofile a system-dependent name of the object file.
	 * \returns an opaque pointer to the object handle or NULL on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_LoadFunction
	 * \sa SDL_UnloadObject
	 */"

	^ self ffiCall: #(SDL_SharedObject* SDL_LoadObject(const char* sofile))
]

{ #category : 'public' }
LibSDL3 >> loadWAVIOSrc: src closeio: closeio spec: spec audioBuf: audio_buf audioLen: audio_len [
	"/**
	 * Load the audio data of a WAVE file into memory.
	 *
	 * Loading a WAVE file requires `src`, `spec`, `audio_buf` and `audio_len` to
	 * be valid pointers. The entire data portion of the file is then loaded into
	 * memory and decoded if necessary.
	 *
	 * Supported formats are RIFF WAVE files with the formats PCM (8, 16, 24, and
	 * 32 bits), IEEE Float (32 bits), Microsoft ADPCM and IMA ADPCM (4 bits), and
	 * A-law and mu-law (8 bits). Other formats are currently unsupported and
	 * cause an error.
	 *
	 * If this function succeeds, the return value is zero and the pointer to the
	 * audio data allocated by the function is written to `audio_buf` and its
	 * length in bytes to `audio_len`. The SDL_AudioSpec members `freq`,
	 * `channels`, and `format` are set to the values of the audio data in the
	 * buffer.
	 *
	 * It's necessary to use SDL_free() to free the audio data returned in
	 * `audio_buf` when it is no longer used.
	 *
	 * Because of the underspecification of the .WAV format, there are many
	 * problematic files in the wild that cause issues with strict decoders. To
	 * provide compatibility with these files, this decoder is lenient in regards
	 * to the truncation of the file, the fact chunk, and the size of the RIFF
	 * chunk. The hints `SDL_HINT_WAVE_RIFF_CHUNK_SIZE`,
	 * `SDL_HINT_WAVE_TRUNCATION`, and `SDL_HINT_WAVE_FACT_CHUNK` can be used to
	 * tune the behavior of the loading process.
	 *
	 * Any file that is invalid (due to truncation, corruption, or wrong values in
	 * the headers), too big, or unsupported causes an error. Additionally, any
	 * critical I/O error from the data source will terminate the loading process
	 * with an error. The function returns NULL on error and in all cases (with
	 * the exception of `src` being NULL), an appropriate error message will be
	 * set.
	 *
	 * It is required that the data source supports seeking.
	 *
	 * Example:
	 *
	 * ```c
	 * SDL_LoadWAV_IO(SDL_IOFromFile(""sample.wav"", ""rb""), true, &spec, &buf, &len);
	 * ```
	 *
	 * Note that the SDL_LoadWAV function does this same thing for you, but in a
	 * less messy way:
	 *
	 * ```c
	 * SDL_LoadWAV(""sample.wav"", &spec, &buf, &len);
	 * ```
	 *
	 * \param src the data source for the WAVE data.
	 * \param closeio if true, calls SDL_CloseIO() on `src` before returning, even
	 *                in the case of an error.
	 * \param spec a pointer to an SDL_AudioSpec that will be set to the WAVE
	 *             data's format details on successful return.
	 * \param audio_buf a pointer filled with the audio data, allocated by the
	 *                  function.
	 * \param audio_len a pointer filled with the length of the audio data buffer
	 *                  in bytes.
	 * \returns true on success. `audio_buf` will be filled with a pointer to an
	 *          allocated buffer containing the audio data, and `audio_len` is
	 *          filled with the length of that audio buffer in bytes.
	 *
	 *          This function returns false if the .WAV file cannot be opened,
	 *          uses an unknown data format, or is corrupt; call SDL_GetError()
	 *          for more information.
	 *
	 *          When the application is done with the data returned in
	 *          `audio_buf`, it should call SDL_free() to dispose of it.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_free
	 * \sa SDL_LoadWAV
	 */"

	^ self ffiCall: #(bool SDL_LoadWAV_IO(SDL_IOStream* src, _Bool closeio, SDL_AudioSpec* spec, Uint8** audio_buf, Uint32* audio_len))
]

{ #category : 'public' }
LibSDL3 >> loadWAVPath: path spec: spec audioBuf: audio_buf audioLen: audio_len [
	"/**
	 * Loads a WAV from a file path.
	 *
	 * This is a convenience function that is effectively the same as:
	 *
	 * ```c
	 * SDL_LoadWAV_IO(SDL_IOFromFile(path, ""rb""), true, spec, audio_buf, audio_len);
	 * ```
	 *
	 * \param path the file path of the WAV file to open.
	 * \param spec a pointer to an SDL_AudioSpec that will be set to the WAVE
	 *             data's format details on successful return.
	 * \param audio_buf a pointer filled with the audio data, allocated by the
	 *                  function.
	 * \param audio_len a pointer filled with the length of the audio data buffer
	 *                  in bytes.
	 * \returns true on success. `audio_buf` will be filled with a pointer to an
	 *          allocated buffer containing the audio data, and `audio_len` is
	 *          filled with the length of that audio buffer in bytes.
	 *
	 *          This function returns false if the .WAV file cannot be opened,
	 *          uses an unknown data format, or is corrupt; call SDL_GetError()
	 *          for more information.
	 *
	 *          When the application is done with the data returned in
	 *          `audio_buf`, it should call SDL_free() to dispose of it.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_free
	 * \sa SDL_LoadWAV_IO
	 */"

	^ self ffiCall: #(bool SDL_LoadWAV(const char* path, SDL_AudioSpec* spec, Uint8** audio_buf, Uint32* audio_len))
]

{ #category : 'public' }
LibSDL3 >> lockAudioStream: stream [
	"/**
	 * Lock an audio stream for serialized access.
	 *
	 * Each SDL_AudioStream has an internal mutex it uses to protect its data
	 * structures from threading conflicts. This function allows an app to lock
	 * that mutex, which could be useful if registering callbacks on this stream.
	 *
	 * One does not need to lock a stream to use in it most cases, as the stream
	 * manages this lock internally. However, this lock is held during callbacks,
	 * which may run from arbitrary threads at any time, so if an app needs to
	 * protect shared data during those callbacks, locking the stream guarantees
	 * that the callback is not running while the lock is held.
	 *
	 * As this is just a wrapper over SDL_LockMutex for an internal lock; it has
	 * all the same attributes (recursive locks are allowed, etc).
	 *
	 * \param stream the audio stream to lock.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_UnlockAudioStream
	 */"

	^ self ffiCall: #(bool SDL_LockAudioStream(SDL_AudioStream* stream))
]

{ #category : 'public' }
LibSDL3 >> lockJoysticks [
	"/**
	 * Locking for atomic access to the joystick API.
	 *
	 * The SDL joystick functions are thread-safe, however you can lock the
	 * joysticks while processing to guarantee that the joystick list won't change
	 * and joystick and gamepad events will not be delivered.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_LockJoysticks())
]

{ #category : 'public' }
LibSDL3 >> lockMutex: mutex [
	"/**
	 * Lock the mutex.
	 *
	 * This will block until the mutex is available, which is to say it is in the
	 * unlocked state and the OS has chosen the caller as the next thread to lock
	 * it. Of all threads waiting to lock the mutex, only one may do so at a time.
	 *
	 * It is legal for the owning thread to lock an already-locked mutex. It must
	 * unlock it the same number of times before it is actually made available for
	 * other threads in the system (this is known as a ""recursive mutex"").
	 *
	 * This function does not fail; if mutex is NULL, it will return immediately
	 * having locked nothing. If the mutex is valid, this function will always
	 * block until it can lock the mutex, and return with it locked.
	 *
	 * \param mutex the mutex to lock.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_TryLockMutex
	 * \sa SDL_UnlockMutex
	 */"

	self ffiCall: #(void SDL_LockMutex(SDL_Mutex* mutex))
]

{ #category : 'public' }
LibSDL3 >> lockProperties: props [
	"/**
	 * Lock a group of properties.
	 *
	 * Obtain a multi-threaded lock for these properties. Other threads will wait
	 * while trying to lock these properties until they are unlocked. Properties
	 * must be unlocked before they are destroyed.
	 *
	 * The lock is automatically taken when setting individual properties, this
	 * function is only needed when you want to set several properties atomically
	 * or want to guarantee that properties being queried aren't freed in another
	 * thread.
	 *
	 * \param props the properties to lock.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_UnlockProperties
	 */"

	^ self ffiCall: #(bool SDL_LockProperties(SDL_PropertiesID props))
]

{ #category : 'public' }
LibSDL3 >> lockRWLockForReading: rwlock [
	"/**
	 * Lock the read/write lock for _read only_ operations.
	 *
	 * This will block until the rwlock is available, which is to say it is not
	 * locked for writing by any other thread. Of all threads waiting to lock the
	 * rwlock, all may do so at the same time as long as they are requesting
	 * read-only access; if a thread wants to lock for writing, only one may do so
	 * at a time, and no other threads, read-only or not, may hold the lock at the
	 * same time.
	 *
	 * It is legal for the owning thread to lock an already-locked rwlock for
	 * reading. It must unlock it the same number of times before it is actually
	 * made available for other threads in the system (this is known as a
	 * ""recursive rwlock"").
	 *
	 * Note that locking for writing is not recursive (this is only available to
	 * read-only locks).
	 *
	 * It is illegal to request a read-only lock from a thread that already holds
	 * the write lock. Doing so results in undefined behavior. Unlock the write
	 * lock before requesting a read-only lock. (But, of course, if you have the
	 * write lock, you don't need further locks to read in any case.)
	 *
	 * This function does not fail; if rwlock is NULL, it will return immediately
	 * having locked nothing. If the rwlock is valid, this function will always
	 * block until it can lock the mutex, and return with it locked.
	 *
	 * \param rwlock the read/write lock to lock.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_LockRWLockForWriting
	 * \sa SDL_TryLockRWLockForReading
	 * \sa SDL_UnlockRWLock
	 */"

	self ffiCall: #(void SDL_LockRWLockForReading(SDL_RWLock* rwlock))
]

{ #category : 'public' }
LibSDL3 >> lockRWLockForWriting: rwlock [
	"/**
	 * Lock the read/write lock for _write_ operations.
	 *
	 * This will block until the rwlock is available, which is to say it is not
	 * locked for reading or writing by any other thread. Only one thread may hold
	 * the lock when it requests write access; all other threads, whether they
	 * also want to write or only want read-only access, must wait until the
	 * writer thread has released the lock.
	 *
	 * It is illegal for the owning thread to lock an already-locked rwlock for
	 * writing (read-only may be locked recursively, writing can not). Doing so
	 * results in undefined behavior.
	 *
	 * It is illegal to request a write lock from a thread that already holds a
	 * read-only lock. Doing so results in undefined behavior. Unlock the
	 * read-only lock before requesting a write lock.
	 *
	 * This function does not fail; if rwlock is NULL, it will return immediately
	 * having locked nothing. If the rwlock is valid, this function will always
	 * block until it can lock the mutex, and return with it locked.
	 *
	 * \param rwlock the read/write lock to lock.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_LockRWLockForReading
	 * \sa SDL_TryLockRWLockForWriting
	 * \sa SDL_UnlockRWLock
	 */"

	self ffiCall: #(void SDL_LockRWLockForWriting(SDL_RWLock* rwlock))
]

{ #category : 'public' }
LibSDL3 >> lockSpinlock: lock [
	"/**
	 * Lock a spin lock by setting it to a non-zero value.
	 *
	 * ***Please note that spinlocks are dangerous if you don't know what you're
	 * doing. Please be careful using any sort of spinlock!***
	 *
	 * \param lock a pointer to a lock variable.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_TryLockSpinlock
	 * \sa SDL_UnlockSpinlock
	 */"

	self ffiCall: #(void SDL_LockSpinlock(SDL_SpinLock* lock))
]

{ #category : 'public' }
LibSDL3 >> lockSurface: surface [
	"/**
	 * Set up a surface for directly accessing the pixels.
	 *
	 * Between calls to SDL_LockSurface() / SDL_UnlockSurface(), you can write to
	 * and read from `surface->pixels`, using the pixel format stored in
	 * `surface->format`. Once you are done accessing the surface, you should use
	 * SDL_UnlockSurface() to release it.
	 *
	 * Not all surfaces require locking. If `SDL_MUSTLOCK(surface)` evaluates to
	 * 0, then you can read and write to the surface at any time, and the pixel
	 * format of the surface will not change.
	 *
	 * \param surface the SDL_Surface structure to be locked.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function is not thread safe. The locking referred to by
	 *               this function is making the pixels available for direct
	 *               access, not thread-safe locking.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_MUSTLOCK
	 * \sa SDL_UnlockSurface
	 */"

	^ self ffiCall: #(bool SDL_LockSurface(SDL_Surface* surface))
]

{ #category : 'public' }
LibSDL3 >> lockTexture: texture rect: rect pixels: pixels pitch: pitch [
	"/**
	 * Lock a portion of the texture for **write-only** pixel access.
	 *
	 * As an optimization, the pixels made available for editing don't necessarily
	 * contain the old texture data. This is a write-only operation, and if you
	 * need to keep a copy of the texture data you should do that at the
	 * application level.
	 *
	 * You must use SDL_UnlockTexture() to unlock the pixels and apply any
	 * changes.
	 *
	 * \param texture the texture to lock for access, which was created with
	 *                `SDL_TEXTUREACCESS_STREAMING`.
	 * \param rect an SDL_Rect structure representing the area to lock for access;
	 *             NULL to lock the entire texture.
	 * \param pixels this is filled in with a pointer to the locked pixels,
	 *               appropriately offset by the locked area.
	 * \param pitch this is filled in with the pitch of the locked pixels; the
	 *              pitch is the length of one row in bytes.
	 * \returns true on success or false if the texture is not valid or was not
	 *          created with `SDL_TEXTUREACCESS_STREAMING`; call SDL_GetError()
	 *          for more information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_LockTextureToSurface
	 * \sa SDL_UnlockTexture
	 */"

	^ self ffiCall: #(bool SDL_LockTexture(SDL_Texture* texture, SDL_Rect* rect, void** pixels, int* pitch))
]

{ #category : 'public' }
LibSDL3 >> lockTextureToSurfaceTexture: texture rect: rect surface: surface [
	"/**
	 * Lock a portion of the texture for **write-only** pixel access, and expose
	 * it as a SDL surface.
	 *
	 * Besides providing an SDL_Surface instead of raw pixel data, this function
	 * operates like SDL_LockTexture.
	 *
	 * As an optimization, the pixels made available for editing don't necessarily
	 * contain the old texture data. This is a write-only operation, and if you
	 * need to keep a copy of the texture data you should do that at the
	 * application level.
	 *
	 * You must use SDL_UnlockTexture() to unlock the pixels and apply any
	 * changes.
	 *
	 * The returned surface is freed internally after calling SDL_UnlockTexture()
	 * or SDL_DestroyTexture(). The caller should not free it.
	 *
	 * \param texture the texture to lock for access, which must be created with
	 *                `SDL_TEXTUREACCESS_STREAMING`.
	 * \param rect a pointer to the rectangle to lock for access. If the rect is
	 *             NULL, the entire texture will be locked.
	 * \param surface a pointer to an SDL surface of size **rect**. Don't assume
	 *                any specific pixel content.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_LockTexture
	 * \sa SDL_UnlockTexture
	 */"

	^ self ffiCall: #(bool SDL_LockTextureToSurface(SDL_Texture* texture, SDL_Rect* rect, SDL_Surface** surface))
]

{ #category : 'public' }
LibSDL3 >> log10: x [
	"/**
	 * Compute the base-10 logarithm of `x`.
	 *
	 * Domain: `0 < x <= INF`
	 *
	 * Range: `-INF <= y <= INF`
	 *
	 * It is an error for `x` to be less than or equal to 0.
	 *
	 * This function operates on double-precision floating point values, use
	 * SDL_log10f for single-precision floats.
	 *
	 * This function may use a different approximation across different versions,
	 * platforms and configurations. i.e, it can return a different value given
	 * the same input on different machines or operating systems, or if SDL is
	 * updated.
	 *
	 * \param x floating point value. Must be greater than 0.
	 * \returns the logarithm of `x`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_log10f
	 * \sa SDL_log
	 * \sa SDL_pow
	 */"

	^ self ffiCall: #(double SDL_log10(double x))
]

{ #category : 'public' }
LibSDL3 >> log10f: x [
	"/**
	 * Compute the base-10 logarithm of `x`.
	 *
	 * Domain: `0 < x <= INF`
	 *
	 * Range: `-INF <= y <= INF`
	 *
	 * It is an error for `x` to be less than or equal to 0.
	 *
	 * This function operates on single-precision floating point values, use
	 * SDL_log10 for double-precision floats.
	 *
	 * This function may use a different approximation across different versions,
	 * platforms and configurations. i.e, it can return a different value given
	 * the same input on different machines or operating systems, or if SDL is
	 * updated.
	 *
	 * \param x floating point value. Must be greater than 0.
	 * \returns the logarithm of `x`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_log10
	 * \sa SDL_logf
	 * \sa SDL_powf
	 */"

	^ self ffiCall: #(float SDL_log10f(float x))
]

{ #category : 'public' }
LibSDL3 >> log: x [
	"/**
	 * Compute the natural logarithm of `x`.
	 *
	 * Domain: `0 < x <= INF`
	 *
	 * Range: `-INF <= y <= INF`
	 *
	 * It is an error for `x` to be less than or equal to 0.
	 *
	 * This function operates on double-precision floating point values, use
	 * SDL_logf for single-precision floats.
	 *
	 * This function may use a different approximation across different versions,
	 * platforms and configurations. i.e, it can return a different value given
	 * the same input on different machines or operating systems, or if SDL is
	 * updated.
	 *
	 * \param x floating point value. Must be greater than 0.
	 * \returns the natural logarithm of `x`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_logf
	 * \sa SDL_log10
	 * \sa SDL_exp
	 */"

	^ self ffiCall: #(double SDL_log(double x))
]

{ #category : 'public' }
LibSDL3 >> logf: x [
	"/**
	 * Compute the natural logarithm of `x`.
	 *
	 * Domain: `0 < x <= INF`
	 *
	 * Range: `-INF <= y <= INF`
	 *
	 * It is an error for `x` to be less than or equal to 0.
	 *
	 * This function operates on single-precision floating point values, use
	 * SDL_log for double-precision floats.
	 *
	 * This function may use a different approximation across different versions,
	 * platforms and configurations. i.e, it can return a different value given
	 * the same input on different machines or operating systems, or if SDL is
	 * updated.
	 *
	 * \param x floating point value. Must be greater than 0.
	 * \returns the natural logarithm of `x`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_log
	 * \sa SDL_expf
	 */"

	^ self ffiCall: #(float SDL_logf(float x))
]

{ #category : 'public' }
LibSDL3 >> lround: x [
	"/**
	 * Round `x` to the nearest integer representable as a long
	 *
	 * Rounds `x` to the nearest integer. Values halfway between integers will be
	 * rounded away from zero.
	 *
	 * Domain: `-INF <= x <= INF`
	 *
	 * Range: `MIN_LONG <= y <= MAX_LONG`
	 *
	 * This function operates on double-precision floating point values, use
	 * SDL_lroundf for single-precision floats. To get the result as a
	 * floating-point type, use SDL_round.
	 *
	 * \param x floating point value.
	 * \returns the nearest integer to `x`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_lroundf
	 * \sa SDL_round
	 * \sa SDL_floor
	 * \sa SDL_ceil
	 * \sa SDL_trunc
	 */"

	^ self ffiCall: #(long SDL_lround(double x))
]

{ #category : 'public' }
LibSDL3 >> lroundf: x [
	"/**
	 * Round `x` to the nearest integer representable as a long
	 *
	 * Rounds `x` to the nearest integer. Values halfway between integers will be
	 * rounded away from zero.
	 *
	 * Domain: `-INF <= x <= INF`
	 *
	 * Range: `MIN_LONG <= y <= MAX_LONG`
	 *
	 * This function operates on single-precision floating point values, use
	 * SDL_lround for double-precision floats. To get the result as a
	 * floating-point type, use SDL_roundf.
	 *
	 * \param x floating point value.
	 * \returns the nearest integer to `x`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_lround
	 * \sa SDL_roundf
	 * \sa SDL_floorf
	 * \sa SDL_ceilf
	 * \sa SDL_truncf
	 */"

	^ self ffiCall: #(long SDL_lroundf(float x))
]

{ #category : 'public' }
LibSDL3 >> ltoaValue: value str: str radix: radix [
	"/**
	 * Convert a long integer into a string.
	 *
	 * This requires a radix to specified for string format. Specifying 10
	 * produces a decimal number, 16 hexidecimal, etc. Must be in the range of 2
	 * to 36.
	 *
	 * Note that this function will overflow a buffer if `str` is not large enough
	 * to hold the output! It may be safer to use SDL_snprintf to clamp output, or
	 * SDL_asprintf to allocate a buffer. Otherwise, it doesn't hurt to allocate
	 * much more space than you expect to use (and don't forget possible negative
	 * signs, null terminator bytes, etc).
	 *
	 * \param value the long integer to convert.
	 * \param str the buffer to write the string into.
	 * \param radix the radix to use for string generation.
	 * \returns `str`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_ultoa
	 * \sa SDL_itoa
	 * \sa SDL_lltoa
	 */"

	^ self ffiCall: #(char* SDL_ltoa(long value, char* str, int radix))
]

{ #category : 'accessing - platform' }
LibSDL3 >> macLibraryName [

	^ FFIMacLibraryFinder new
		userPaths: #('./CIG/lib');
		findLibrary: 'libSDL3.dylib'
]

{ #category : 'public' }
LibSDL3 >> malloc: size [
	"/**
	 * Allocate uninitialized memory.
	 *
	 * The allocated memory returned by this function must be freed with
	 * SDL_free().
	 *
	 * If `size` is 0, it will be set to 1.
	 *
	 * If the allocation is successful, the returned pointer is guaranteed to be
	 * aligned to either the *fundamental alignment* (`alignof(max_align_t)` in
	 * C11 and later) or `2 * sizeof(void *)`, whichever is smaller. Use
	 * SDL_aligned_alloc() if you need to allocate memory aligned to an alignment
	 * greater than this guarantee.
	 *
	 * \param size the size to allocate.
	 * \returns a pointer to the allocated memory, or NULL if allocation failed.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_free
	 * \sa SDL_calloc
	 * \sa SDL_realloc
	 * \sa SDL_aligned_alloc
	 */"

	^ self ffiCall: #(void* SDL_malloc(size_t size))
]

{ #category : 'public' }
LibSDL3 >> mapGPUTransferBufferDevice: device transferBuffer: transfer_buffer cycle: cycle [
	"/**
	 * Maps a transfer buffer into application address space.
	 *
	 * You must unmap the transfer buffer before encoding upload commands. The
	 * memory is owned by the graphics driver - do NOT call SDL_free() on the
	 * returned pointer.
	 *
	 * \param device a GPU context.
	 * \param transfer_buffer a transfer buffer.
	 * \param cycle if true, cycles the transfer buffer if it is already bound.
	 * \returns the address of the mapped transfer buffer memory, or NULL on
	 *          failure; call SDL_GetError() for more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(void* SDL_MapGPUTransferBuffer(SDL_GPUDevice* device, SDL_GPUTransferBuffer* transfer_buffer, _Bool cycle))
]

{ #category : 'public' }
LibSDL3 >> mapRGBAFormat: format palette: palette r: r g: g b: b a: a [
	"/**
	 * Map an RGBA quadruple to a pixel value for a given pixel format.
	 *
	 * This function maps the RGBA color value to the specified pixel format and
	 * returns the pixel value best approximating the given RGBA color value for
	 * the given pixel format.
	 *
	 * If the specified pixel format has no alpha component the alpha value will
	 * be ignored (as it will be in formats with a palette).
	 *
	 * If the format has a palette (8-bit) the index of the closest matching color
	 * in the palette will be returned.
	 *
	 * If the pixel format bpp (color depth) is less than 32-bpp then the unused
	 * upper bits of the return value can safely be ignored (e.g., with a 16-bpp
	 * format the return value can be assigned to a Uint16, and similarly a Uint8
	 * for an 8-bpp format).
	 *
	 * \param format a pointer to SDL_PixelFormatDetails describing the pixel
	 *               format.
	 * \param palette an optional palette for indexed formats, may be NULL.
	 * \param r the red component of the pixel in the range 0-255.
	 * \param g the green component of the pixel in the range 0-255.
	 * \param b the blue component of the pixel in the range 0-255.
	 * \param a the alpha component of the pixel in the range 0-255.
	 * \returns a pixel value.
	 *
	 * \threadsafety It is safe to call this function from any thread, as long as
	 *               the palette is not modified.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetPixelFormatDetails
	 * \sa SDL_GetRGBA
	 * \sa SDL_MapRGB
	 * \sa SDL_MapSurfaceRGBA
	 */"

	^ self ffiCall: #(Uint32 SDL_MapRGBA(SDL_PixelFormatDetails* format, SDL_Palette* palette, Uint8 r, Uint8 g, Uint8 b, Uint8 a))
]

{ #category : 'public' }
LibSDL3 >> mapRGBFormat: format palette: palette r: r g: g b: b [
	"/**
	 * Map an RGB triple to an opaque pixel value for a given pixel format.
	 *
	 * This function maps the RGB color value to the specified pixel format and
	 * returns the pixel value best approximating the given RGB color value for
	 * the given pixel format.
	 *
	 * If the format has a palette (8-bit) the index of the closest matching color
	 * in the palette will be returned.
	 *
	 * If the specified pixel format has an alpha component it will be returned as
	 * all 1 bits (fully opaque).
	 *
	 * If the pixel format bpp (color depth) is less than 32-bpp then the unused
	 * upper bits of the return value can safely be ignored (e.g., with a 16-bpp
	 * format the return value can be assigned to a Uint16, and similarly a Uint8
	 * for an 8-bpp format).
	 *
	 * \param format a pointer to SDL_PixelFormatDetails describing the pixel
	 *               format.
	 * \param palette an optional palette for indexed formats, may be NULL.
	 * \param r the red component of the pixel in the range 0-255.
	 * \param g the green component of the pixel in the range 0-255.
	 * \param b the blue component of the pixel in the range 0-255.
	 * \returns a pixel value.
	 *
	 * \threadsafety It is safe to call this function from any thread, as long as
	 *               the palette is not modified.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetPixelFormatDetails
	 * \sa SDL_GetRGB
	 * \sa SDL_MapRGBA
	 * \sa SDL_MapSurfaceRGB
	 */"

	^ self ffiCall: #(Uint32 SDL_MapRGB(SDL_PixelFormatDetails* format, SDL_Palette* palette, Uint8 r, Uint8 g, Uint8 b))
]

{ #category : 'public' }
LibSDL3 >> mapSurfaceRGBASurface: surface r: r g: g b: b a: a [
	"/**
	 * Map an RGBA quadruple to a pixel value for a surface.
	 *
	 * This function maps the RGBA color value to the specified pixel format and
	 * returns the pixel value best approximating the given RGBA color value for
	 * the given pixel format.
	 *
	 * If the surface pixel format has no alpha component the alpha value will be
	 * ignored (as it will be in formats with a palette).
	 *
	 * If the surface has a palette, the index of the closest matching color in
	 * the palette will be returned.
	 *
	 * If the pixel format bpp (color depth) is less than 32-bpp then the unused
	 * upper bits of the return value can safely be ignored (e.g., with a 16-bpp
	 * format the return value can be assigned to a Uint16, and similarly a Uint8
	 * for an 8-bpp format).
	 *
	 * \param surface the surface to use for the pixel format and palette.
	 * \param r the red component of the pixel in the range 0-255.
	 * \param g the green component of the pixel in the range 0-255.
	 * \param b the blue component of the pixel in the range 0-255.
	 * \param a the alpha component of the pixel in the range 0-255.
	 * \returns a pixel value.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_MapSurfaceRGB
	 */"

	^ self ffiCall: #(Uint32 SDL_MapSurfaceRGBA(SDL_Surface* surface, Uint8 r, Uint8 g, Uint8 b, Uint8 a))
]

{ #category : 'public' }
LibSDL3 >> mapSurfaceRGBSurface: surface r: r g: g b: b [
	"/**
	 * Map an RGB triple to an opaque pixel value for a surface.
	 *
	 * This function maps the RGB color value to the specified pixel format and
	 * returns the pixel value best approximating the given RGB color value for
	 * the given pixel format.
	 *
	 * If the surface has a palette, the index of the closest matching color in
	 * the palette will be returned.
	 *
	 * If the surface pixel format has an alpha component it will be returned as
	 * all 1 bits (fully opaque).
	 *
	 * If the pixel format bpp (color depth) is less than 32-bpp then the unused
	 * upper bits of the return value can safely be ignored (e.g., with a 16-bpp
	 * format the return value can be assigned to a Uint16, and similarly a Uint8
	 * for an 8-bpp format).
	 *
	 * \param surface the surface to use for the pixel format and palette.
	 * \param r the red component of the pixel in the range 0-255.
	 * \param g the green component of the pixel in the range 0-255.
	 * \param b the blue component of the pixel in the range 0-255.
	 * \returns a pixel value.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_MapSurfaceRGBA
	 */"

	^ self ffiCall: #(Uint32 SDL_MapSurfaceRGB(SDL_Surface* surface, Uint8 r, Uint8 g, Uint8 b))
]

{ #category : 'public' }
LibSDL3 >> maximizeWindow: window [
	"/**
	 * Request that the window be made as large as possible.
	 *
	 * Non-resizable windows can't be maximized. The window must have the
	 * SDL_WINDOW_RESIZABLE flag set, or this will have no effect.
	 *
	 * On some windowing systems this request is asynchronous and the new window
	 * state may not have have been applied immediately upon the return of this
	 * function. If an immediate change is required, call SDL_SyncWindow() to
	 * block until the changes have taken effect.
	 *
	 * When the window state changes, an SDL_EVENT_WINDOW_MAXIMIZED event will be
	 * emitted. Note that, as this is just a request, the windowing system can
	 * deny the state change.
	 *
	 * When maximizing a window, whether the constraints set via
	 * SDL_SetWindowMaximumSize() are honored depends on the policy of the window
	 * manager. Win32 and macOS enforce the constraints when maximizing, while X11
	 * and Wayland window managers may vary.
	 *
	 * \param window the window to maximize.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_MinimizeWindow
	 * \sa SDL_RestoreWindow
	 * \sa SDL_SyncWindow
	 */"

	^ self ffiCall: #(bool SDL_MaximizeWindow(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> memcmpS1: s1 s2: s2 len: len [
	"/**
	 * Compare two buffers of memory.
	 *
	 * \param s1 the first buffer to compare. NULL is not permitted!
	 * \param s2 the second buffer to compare. NULL is not permitted!
	 * \param len the number of bytes to compare between the buffers.
	 * \returns less than zero if s1 is ""less than"" s2, greater than zero if s1 is
	 *          ""greater than"" s2, and zero if the buffers match exactly for `len`
	 *          bytes.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(int SDL_memcmp(const void* s1, const void* s2, size_t len))
]

{ #category : 'public' }
LibSDL3 >> memcpyDst: dst src: src len: len [
	"/**
	 * Copy non-overlapping memory.
	 *
	 * The memory regions must not overlap. If they do, use SDL_memmove() instead.
	 *
	 * \param dst The destination memory region. Must not be NULL, and must not
	 *            overlap with `src`.
	 * \param src The source memory region. Must not be NULL, and must not overlap
	 *            with `dst`.
	 * \param len The length in bytes of both `dst` and `src`.
	 * \returns `dst`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_memmove
	 */"

	^ self ffiCall: #(void* SDL_memcpy(void* dst, const void* src, size_t len))
]

{ #category : 'public' }
LibSDL3 >> memmoveDst: dst src: src len: len [
	"/**
	 * Copy memory ranges that might overlap.
	 *
	 * It is okay for the memory regions to overlap. If you are confident that the
	 * regions never overlap, using SDL_memcpy() may improve performance.
	 *
	 * \param dst The destination memory region. Must not be NULL.
	 * \param src The source memory region. Must not be NULL.
	 * \param len The length in bytes of both `dst` and `src`.
	 * \returns `dst`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_memcpy
	 */"

	^ self ffiCall: #(void* SDL_memmove(void* dst, const void* src, size_t len))
]

{ #category : 'public' }
LibSDL3 >> memoryBarrierAcquireFunction [
	"/**
	 * Insert a memory acquire barrier (function version).
	 *
	 * Please refer to SDL_MemoryBarrierRelease for details. This is a function
	 * version, which might be useful if you need to use this functionality from a
	 * scripting language, etc. Also, some of the macro versions call this
	 * function behind the scenes, where more heavy lifting can happen inside of
	 * SDL. Generally, though, an app written in C/C++/etc should use the macro
	 * version, as it will be more efficient.
	 *
	 * \threadsafety Obviously this function is safe to use from any thread at any
	 *               time, but if you find yourself needing this, you are probably
	 *               dealing with some very sensitive code; be careful!
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_MemoryBarrierAcquire
	 */"

	self ffiCall: #(void SDL_MemoryBarrierAcquireFunction())
]

{ #category : 'public' }
LibSDL3 >> memoryBarrierReleaseFunction [
	"/**
	 * Insert a memory release barrier (function version).
	 *
	 * Please refer to SDL_MemoryBarrierRelease for details. This is a function
	 * version, which might be useful if you need to use this functionality from a
	 * scripting language, etc. Also, some of the macro versions call this
	 * function behind the scenes, where more heavy lifting can happen inside of
	 * SDL. Generally, though, an app written in C/C++/etc should use the macro
	 * version, as it will be more efficient.
	 *
	 * \threadsafety Obviously this function is safe to use from any thread at any
	 *               time, but if you find yourself needing this, you are probably
	 *               dealing with some very sensitive code; be careful!
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_MemoryBarrierRelease
	 */"

	self ffiCall: #(void SDL_MemoryBarrierReleaseFunction())
]

{ #category : 'public' }
LibSDL3 >> memset4Dst: dst val: val dwords: dwords [
	"/**
	 * Initialize all 32-bit words of buffer of memory to a specific value.
	 *
	 * This function will set a buffer of `dwords` Uint32 values, pointed to by
	 * `dst`, to the value specified in `val`.
	 *
	 * Unlike SDL_memset, this sets 32-bit values, not bytes, so it's not limited
	 * to a range of 0-255.
	 *
	 * \param dst the destination memory region. Must not be NULL.
	 * \param val the Uint32 value to set.
	 * \param dwords the number of Uint32 values to set in `dst`.
	 * \returns `dst`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(void* SDL_memset4(void* dst, Uint32 val, size_t dwords))
]

{ #category : 'public' }
LibSDL3 >> memsetDst: dst c: c len: len [
	"/**
	 * Initialize all bytes of buffer of memory to a specific value.
	 *
	 * This function will set `len` bytes, pointed to by `dst`, to the value
	 * specified in `c`.
	 *
	 * Despite `c` being an `int` instead of a `char`, this only operates on
	 * bytes; `c` must be a value between 0 and 255, inclusive.
	 *
	 * \param dst the destination memory region. Must not be NULL.
	 * \param c the byte value to set.
	 * \param len the length, in bytes, to set in `dst`.
	 * \returns `dst`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(void* SDL_memset(void* dst, int c, size_t len))
]

{ #category : 'public' }
LibSDL3 >> minimizeWindow: window [
	"/**
	 * Request that the window be minimized to an iconic representation.
	 *
	 * If the window is in a fullscreen state, this request has no direct effect.
	 * It may alter the state the window is returned to when leaving fullscreen.
	 *
	 * On some windowing systems this request is asynchronous and the new window
	 * state may not have been applied immediately upon the return of this
	 * function. If an immediate change is required, call SDL_SyncWindow() to
	 * block until the changes have taken effect.
	 *
	 * When the window state changes, an SDL_EVENT_WINDOW_MINIMIZED event will be
	 * emitted. Note that, as this is just a request, the windowing system can
	 * deny the state change.
	 *
	 * \param window the window to minimize.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_MaximizeWindow
	 * \sa SDL_RestoreWindow
	 * \sa SDL_SyncWindow
	 */"

	^ self ffiCall: #(bool SDL_MinimizeWindow(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> mixAudioDst: dst src: src format: format len: len volume: volume [
	"/**
	 * Mix audio data in a specified format.
	 *
	 * This takes an audio buffer `src` of `len` bytes of `format` data and mixes
	 * it into `dst`, performing addition, volume adjustment, and overflow
	 * clipping. The buffer pointed to by `dst` must also be `len` bytes of
	 * `format` data.
	 *
	 * This is provided for convenience -- you can mix your own audio data.
	 *
	 * Do not use this function for mixing together more than two streams of
	 * sample data. The output from repeated application of this function may be
	 * distorted by clipping, because there is no accumulator with greater range
	 * than the input (not to mention this being an inefficient way of doing it).
	 *
	 * It is a common misconception that this function is required to write audio
	 * data to an output stream in an audio callback. While you can do that,
	 * SDL_MixAudio() is really only needed when you're mixing a single audio
	 * stream with a volume adjustment.
	 *
	 * \param dst the destination for the mixed audio.
	 * \param src the source audio buffer to be mixed.
	 * \param format the SDL_AudioFormat structure representing the desired audio
	 *               format.
	 * \param len the length of the audio buffer in bytes.
	 * \param volume ranges from 0.0 - 1.0, and should be set to 1.0 for full
	 *               audio volume.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_MixAudio(Uint8* dst, const Uint8* src, SDL_AudioFormat format, Uint32 len, float volume))
]

{ #category : 'public' }
LibSDL3 >> modfX: x y: y [
	"/**
	 * Split `x` into integer and fractional parts
	 *
	 * This function operates on double-precision floating point values, use
	 * SDL_modff for single-precision floats.
	 *
	 * \param x floating point value.
	 * \param y output pointer to store the integer part of `x`.
	 * \returns the fractional part of `x`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_modff
	 * \sa SDL_trunc
	 * \sa SDL_fmod
	 */"

	^ self ffiCall: #(double SDL_modf(double x, double* y))
]

{ #category : 'public' }
LibSDL3 >> modffX: x y: y [
	"/**
	 * Split `x` into integer and fractional parts
	 *
	 * This function operates on single-precision floating point values, use
	 * SDL_modf for double-precision floats.
	 *
	 * \param x floating point value.
	 * \param y output pointer to store the integer part of `x`.
	 * \returns the fractional part of `x`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_modf
	 * \sa SDL_truncf
	 * \sa SDL_fmodf
	 */"

	^ self ffiCall: #(float SDL_modff(float x, float* y))
]

{ #category : 'public' }
LibSDL3 >> mostSignificantBitIndex32: x [
	"/**
	 * Get the index of the most significant (set) bit in a 32-bit number.
	 *
	 * Result is undefined when called with 0. This operation can also be stated
	 * as ""count leading zeroes"" and ""log base 2"".
	 *
	 * Note that this is a forced-inline function in a header, and not a public
	 * API function available in the SDL library (which is to say, the code is
	 * embedded in the calling program and the linker and dynamic loader will not
	 * be able to find this function inside SDL itself).
	 *
	 * \param x the 32-bit value to examine.
	 * \returns the index of the most significant bit, or -1 if the value is 0.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.1.3.
	 */"

	self ffiCall: #(int SDL_MostSignificantBitIndex32(int x))
]

{ #category : 'public' }
LibSDL3 >> murmur332Data: data len: len seed: seed [
	"/**
	 * Calculate a 32-bit MurmurHash3 value for a block of data.
	 *
	 * https://en.wikipedia.org/wiki/MurmurHash
	 *
	 * A seed may be specified, which changes the final results consistently, but
	 * this does not work like SDL_crc16 and SDL_crc32: you can't feed a previous
	 * result from this function back into itself as the next seed value to
	 * calculate a hash in chunks; it won't produce the same hash as it would if
	 * the same data was provided in a single call.
	 *
	 * If you aren't sure what to provide for a seed, zero is fine. Murmur3 is not
	 * cryptographically secure, so it shouldn't be used for hashing top-secret
	 * data.
	 *
	 * \param data the data to be hashed.
	 * \param len the size of data, in bytes.
	 * \param seed a value that alters the final hash value.
	 * \returns a Murmur3 32-bit hash value.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(Uint32 SDL_murmur3_32(const void* data, size_t len, Uint32 seed))
]

{ #category : 'public' }
LibSDL3 >> newAsyncIOQueue [
	"/**
	 * Create a task queue for tracking multiple I/O operations.
	 *
	 * Async I/O operations are assigned to a queue when started. The queue can be
	 * checked for completed tasks thereafter.
	 *
	 * \returns a new task queue object or NULL if there was an error; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_DestroyAsyncIOQueue
	 * \sa SDL_GetAsyncIOResult
	 * \sa SDL_WaitAsyncIOResult
	 */"

	^ self ffiCall: #(SDL_AsyncIOQueue* SDL_CreateAsyncIOQueue())
]

{ #category : 'public' }
LibSDL3 >> newAudioStreamSrcSpec: src_spec dstSpec: dst_spec [
	"/**
	 * Create a new audio stream.
	 *
	 * \param src_spec the format details of the input audio.
	 * \param dst_spec the format details of the output audio.
	 * \returns a new audio stream on success or NULL on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_PutAudioStreamData
	 * \sa SDL_GetAudioStreamData
	 * \sa SDL_GetAudioStreamAvailable
	 * \sa SDL_FlushAudioStream
	 * \sa SDL_ClearAudioStream
	 * \sa SDL_SetAudioStreamFormat
	 * \sa SDL_DestroyAudioStream
	 */"

	^ self ffiCall: #(SDL_AudioStream* SDL_CreateAudioStream(SDL_AudioSpec* src_spec, SDL_AudioSpec* dst_spec))
]

{ #category : 'public' }
LibSDL3 >> newColorCursorSurface: surface hotX: hot_x hotY: hot_y [
	"/**
	 * Create a color cursor.
	 *
	 * If this function is passed a surface with alternate representations, the
	 * surface will be interpreted as the content to be used for 100% display
	 * scale, and the alternate representations will be used for high DPI
	 * situations. For example, if the original surface is 32x32, then on a 2x
	 * macOS display or 200% display scale on Windows, a 64x64 version of the
	 * image will be used, if available. If a matching version of the image isn't
	 * available, the closest larger size image will be downscaled to the
	 * appropriate size and be used instead, if available. Otherwise, the closest
	 * smaller image will be upscaled and be used instead.
	 *
	 * \param surface an SDL_Surface structure representing the cursor image.
	 * \param hot_x the x position of the cursor hot spot.
	 * \param hot_y the y position of the cursor hot spot.
	 * \returns the new cursor on success or NULL on failure; call SDL_GetError()
	 *          for more information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateCursor
	 * \sa SDL_CreateSystemCursor
	 * \sa SDL_DestroyCursor
	 * \sa SDL_SetCursor
	 */"

	^ self ffiCall: #(SDL_Cursor* SDL_CreateColorCursor(SDL_Surface* surface, int hot_x, int hot_y))
]

{ #category : 'public' }
LibSDL3 >> newCondition [
	"/**
	 * Create a condition variable.
	 *
	 * \returns a new condition variable or NULL on failure; call SDL_GetError()
	 *          for more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_BroadcastCondition
	 * \sa SDL_SignalCondition
	 * \sa SDL_WaitCondition
	 * \sa SDL_WaitConditionTimeout
	 * \sa SDL_DestroyCondition
	 */"

	^ self ffiCall: #(SDL_Condition* SDL_CreateCondition())
]

{ #category : 'public' }
LibSDL3 >> newCursorData: data mask: mask w: w h: h hotX: hot_x hotY: hot_y [
	"/**
	 * Create a cursor using the specified bitmap data and mask (in MSB format).
	 *
	 * `mask` has to be in MSB (Most Significant Bit) format.
	 *
	 * The cursor width (`w`) must be a multiple of 8 bits.
	 *
	 * The cursor is created in black and white according to the following:
	 *
	 * - data=0, mask=1: white
	 * - data=1, mask=1: black
	 * - data=0, mask=0: transparent
	 * - data=1, mask=0: inverted color if possible, black if not.
	 *
	 * Cursors created with this function must be freed with SDL_DestroyCursor().
	 *
	 * If you want to have a color cursor, or create your cursor from an
	 * SDL_Surface, you should use SDL_CreateColorCursor(). Alternately, you can
	 * hide the cursor and draw your own as part of your game's rendering, but it
	 * will be bound to the framerate.
	 *
	 * Also, SDL_CreateSystemCursor() is available, which provides several
	 * readily-available system cursors to pick from.
	 *
	 * \param data the color value for each pixel of the cursor.
	 * \param mask the mask value for each pixel of the cursor.
	 * \param w the width of the cursor.
	 * \param h the height of the cursor.
	 * \param hot_x the x-axis offset from the left of the cursor image to the
	 *              mouse x position, in the range of 0 to `w` - 1.
	 * \param hot_y the y-axis offset from the top of the cursor image to the
	 *              mouse y position, in the range of 0 to `h` - 1.
	 * \returns a new cursor with the specified parameters on success or NULL on
	 *          failure; call SDL_GetError() for more information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateColorCursor
	 * \sa SDL_CreateSystemCursor
	 * \sa SDL_DestroyCursor
	 * \sa SDL_SetCursor
	 */"

	^ self ffiCall: #(SDL_Cursor* SDL_CreateCursor(const Uint8* data, const Uint8* mask, int w, int h, int hot_x, int hot_y))
]

{ #category : 'public' }
LibSDL3 >> newDirectory: path [
	"/**
	 * Create a directory, and any missing parent directories.
	 *
	 * This reports success if `path` already exists as a directory.
	 *
	 * If parent directories are missing, it will also create them. Note that if
	 * this fails, it will not remove any parent directories it already made.
	 *
	 * \param path the path of the directory to create.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_CreateDirectory(const char* path))
]

{ #category : 'public' }
LibSDL3 >> newEnvironment: populated [
	"/**
	 * Create a set of environment variables
	 *
	 * \param populated true to initialize it from the C runtime environment,
	 *                  false to create an empty environment.
	 * \returns a pointer to the new environment or NULL on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety If `populated` is false, it is safe to call this function
	 *               from any thread, otherwise it is safe if no other threads are
	 *               calling setenv() or unsetenv()
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetEnvironmentVariable
	 * \sa SDL_GetEnvironmentVariables
	 * \sa SDL_SetEnvironmentVariable
	 * \sa SDL_UnsetEnvironmentVariable
	 * \sa SDL_DestroyEnvironment
	 */"

	^ self ffiCall: #(SDL_Environment* SDL_CreateEnvironment(_Bool populated))
]

{ #category : 'public' }
LibSDL3 >> newGPUBufferDevice: device createinfo: createinfo [
	"/**
	 * Creates a buffer object to be used in graphics or compute workflows.
	 *
	 * The contents of this buffer are undefined until data is written to the
	 * buffer.
	 *
	 * Note that certain combinations of usage flags are invalid. For example, a
	 * buffer cannot have both the VERTEX and INDEX flags.
	 *
	 * If you use a STORAGE flag, the data in the buffer must respect std140
	 * layout conventions. In practical terms this means you must ensure that vec3
	 * and vec4 fields are 16-byte aligned.
	 *
	 * For better understanding of underlying concepts and memory management with
	 * SDL GPU API, you may refer
	 * [this blog post](https://moonside.games/posts/sdl-gpu-concepts-cycling/)
	 * .
	 *
	 * There are optional properties that can be provided through `props`. These
	 * are the supported properties:
	 *
	 * - `SDL_PROP_GPU_BUFFER_CREATE_NAME_STRING`: a name that can be displayed in
	 *   debugging tools.
	 *
	 * \param device a GPU Context.
	 * \param createinfo a struct describing the state of the buffer to create.
	 * \returns a buffer object on success, or NULL on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_UploadToGPUBuffer
	 * \sa SDL_DownloadFromGPUBuffer
	 * \sa SDL_CopyGPUBufferToBuffer
	 * \sa SDL_BindGPUVertexBuffers
	 * \sa SDL_BindGPUIndexBuffer
	 * \sa SDL_BindGPUVertexStorageBuffers
	 * \sa SDL_BindGPUFragmentStorageBuffers
	 * \sa SDL_DrawGPUPrimitivesIndirect
	 * \sa SDL_DrawGPUIndexedPrimitivesIndirect
	 * \sa SDL_BindGPUComputeStorageBuffers
	 * \sa SDL_DispatchGPUComputeIndirect
	 * \sa SDL_ReleaseGPUBuffer
	 */"

	^ self ffiCall: #(SDL_GPUBuffer* SDL_CreateGPUBuffer(SDL_GPUDevice* device, SDL_GPUBufferCreateInfo* createinfo))
]

{ #category : 'public' }
LibSDL3 >> newGPUComputePipelineDevice: device createinfo: createinfo [
	"/**
	 * Creates a pipeline object to be used in a compute workflow.
	 *
	 * Shader resource bindings must be authored to follow a particular order
	 * depending on the shader format.
	 *
	 * For SPIR-V shaders, use the following resource sets:
	 *
	 * - 0: Sampled textures, followed by read-only storage textures, followed by
	 *   read-only storage buffers
	 * - 1: Read-write storage textures, followed by read-write storage buffers
	 * - 2: Uniform buffers
	 *
	 * For DXBC and DXIL shaders, use the following register order:
	 *
	 * - (t[n], space0): Sampled textures, followed by read-only storage textures,
	 *   followed by read-only storage buffers
	 * - (u[n], space1): Read-write storage textures, followed by read-write
	 *   storage buffers
	 * - (b[n], space2): Uniform buffers
	 *
	 * For MSL/metallib, use the following order:
	 *
	 * - [[buffer]]: Uniform buffers, followed by read-only storage buffers,
	 *   followed by read-write storage buffers
	 * - [[texture]]: Sampled textures, followed by read-only storage textures,
	 *   followed by read-write storage textures
	 *
	 * There are optional properties that can be provided through `props`. These
	 * are the supported properties:
	 *
	 * - `SDL_PROP_GPU_COMPUTEPIPELINE_CREATE_NAME_STRING`: a name that can be
	 *   displayed in debugging tools.
	 *
	 * \param device a GPU Context.
	 * \param createinfo a struct describing the state of the compute pipeline to
	 *                   create.
	 * \returns a compute pipeline object on success, or NULL on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_BindGPUComputePipeline
	 * \sa SDL_ReleaseGPUComputePipeline
	 */"

	^ self ffiCall: #(SDL_GPUComputePipeline* SDL_CreateGPUComputePipeline(SDL_GPUDevice* device, SDL_GPUComputePipelineCreateInfo* createinfo))
]

{ #category : 'public' }
LibSDL3 >> newGPUDeviceFormatFlags: format_flags debugMode: debug_mode name: name [
	"/**
	 * Creates a GPU context.
	 *
	 * \param format_flags a bitflag indicating which shader formats the app is
	 *                     able to provide.
	 * \param debug_mode enable debug mode properties and validations.
	 * \param name the preferred GPU driver, or NULL to let SDL pick the optimal
	 *             driver.
	 * \returns a GPU context on success or NULL on failure; call SDL_GetError()
	 *          for more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetGPUShaderFormats
	 * \sa SDL_GetGPUDeviceDriver
	 * \sa SDL_DestroyGPUDevice
	 * \sa SDL_GPUSupportsShaderFormats
	 */"

	^ self ffiCall: #(SDL_GPUDevice* SDL_CreateGPUDevice(SDL_GPUShaderFormat format_flags, _Bool debug_mode, const char* name))
]

{ #category : 'public' }
LibSDL3 >> newGPUDeviceWithProperties: props [
	"/**
	 * Creates a GPU context.
	 *
	 * These are the supported properties:
	 *
	 * - `SDL_PROP_GPU_DEVICE_CREATE_DEBUGMODE_BOOLEAN`: enable debug mode
	 *   properties and validations, defaults to true.
	 * - `SDL_PROP_GPU_DEVICE_CREATE_PREFERLOWPOWER_BOOLEAN`: enable to prefer
	 *   energy efficiency over maximum GPU performance, defaults to false.
	 * - `SDL_PROP_GPU_DEVICE_CREATE_NAME_STRING`: the name of the GPU driver to
	 *   use, if a specific one is desired.
	 *
	 * These are the current shader format properties:
	 *
	 * - `SDL_PROP_GPU_DEVICE_CREATE_SHADERS_PRIVATE_BOOLEAN`: The app is able to
	 *   provide shaders for an NDA platform.
	 * - `SDL_PROP_GPU_DEVICE_CREATE_SHADERS_SPIRV_BOOLEAN`: The app is able to
	 *   provide SPIR-V shaders if applicable.
	 * - `SDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXBC_BOOLEAN`: The app is able to
	 *   provide DXBC shaders if applicable
	 * - `SDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXIL_BOOLEAN`: The app is able to
	 *   provide DXIL shaders if applicable.
	 * - `SDL_PROP_GPU_DEVICE_CREATE_SHADERS_MSL_BOOLEAN`: The app is able to
	 *   provide MSL shaders if applicable.
	 * - `SDL_PROP_GPU_DEVICE_CREATE_SHADERS_METALLIB_BOOLEAN`: The app is able to
	 *   provide Metal shader libraries if applicable.
	 *
	 * With the D3D12 renderer:
	 *
	 * - `SDL_PROP_GPU_DEVICE_CREATE_D3D12_SEMANTIC_NAME_STRING`: the prefix to
	 *   use for all vertex semantics, default is ""TEXCOORD"".
	 *
	 * \param props the properties to use.
	 * \returns a GPU context on success or NULL on failure; call SDL_GetError()
	 *          for more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetGPUShaderFormats
	 * \sa SDL_GetGPUDeviceDriver
	 * \sa SDL_DestroyGPUDevice
	 * \sa SDL_GPUSupportsProperties
	 */"

	^ self ffiCall: #(SDL_GPUDevice* SDL_CreateGPUDeviceWithProperties(SDL_PropertiesID props))
]

{ #category : 'public' }
LibSDL3 >> newGPUGraphicsPipelineDevice: device createinfo: createinfo [
	"/**
	 * Creates a pipeline object to be used in a graphics workflow.
	 *
	 * There are optional properties that can be provided through `props`. These
	 * are the supported properties:
	 *
	 * - `SDL_PROP_GPU_GRAPHICSPIPELINE_CREATE_NAME_STRING`: a name that can be
	 *   displayed in debugging tools.
	 *
	 * \param device a GPU Context.
	 * \param createinfo a struct describing the state of the graphics pipeline to
	 *                   create.
	 * \returns a graphics pipeline object on success, or NULL on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateGPUShader
	 * \sa SDL_BindGPUGraphicsPipeline
	 * \sa SDL_ReleaseGPUGraphicsPipeline
	 */"

	^ self ffiCall: #(SDL_GPUGraphicsPipeline* SDL_CreateGPUGraphicsPipeline(SDL_GPUDevice* device, SDL_GPUGraphicsPipelineCreateInfo* createinfo))
]

{ #category : 'public' }
LibSDL3 >> newGPUSamplerDevice: device createinfo: createinfo [
	"/**
	 * Creates a sampler object to be used when binding textures in a graphics
	 * workflow.
	 *
	 * There are optional properties that can be provided through `props`. These
	 * are the supported properties:
	 *
	 * - `SDL_PROP_GPU_SAMPLER_CREATE_NAME_STRING`: a name that can be displayed
	 *   in debugging tools.
	 *
	 * \param device a GPU Context.
	 * \param createinfo a struct describing the state of the sampler to create.
	 * \returns a sampler object on success, or NULL on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_BindGPUVertexSamplers
	 * \sa SDL_BindGPUFragmentSamplers
	 * \sa SDL_ReleaseGPUSampler
	 */"

	^ self ffiCall: #(SDL_GPUSampler* SDL_CreateGPUSampler(SDL_GPUDevice* device, SDL_GPUSamplerCreateInfo* createinfo))
]

{ #category : 'public' }
LibSDL3 >> newGPUShaderDevice: device createinfo: createinfo [
	"/**
	 * Creates a shader to be used when creating a graphics pipeline.
	 *
	 * Shader resource bindings must be authored to follow a particular order
	 * depending on the shader format.
	 *
	 * For SPIR-V shaders, use the following resource sets:
	 *
	 * For vertex shaders:
	 *
	 * - 0: Sampled textures, followed by storage textures, followed by storage
	 *   buffers
	 * - 1: Uniform buffers
	 *
	 * For fragment shaders:
	 *
	 * - 2: Sampled textures, followed by storage textures, followed by storage
	 *   buffers
	 * - 3: Uniform buffers
	 *
	 * For DXBC and DXIL shaders, use the following register order:
	 *
	 * For vertex shaders:
	 *
	 * - (t[n], space0): Sampled textures, followed by storage textures, followed
	 *   by storage buffers
	 * - (s[n], space0): Samplers with indices corresponding to the sampled
	 *   textures
	 * - (b[n], space1): Uniform buffers
	 *
	 * For pixel shaders:
	 *
	 * - (t[n], space2): Sampled textures, followed by storage textures, followed
	 *   by storage buffers
	 * - (s[n], space2): Samplers with indices corresponding to the sampled
	 *   textures
	 * - (b[n], space3): Uniform buffers
	 *
	 * For MSL/metallib, use the following order:
	 *
	 * - [[texture]]: Sampled textures, followed by storage textures
	 * - [[sampler]]: Samplers with indices corresponding to the sampled textures
	 * - [[buffer]]: Uniform buffers, followed by storage buffers. Vertex buffer 0
	 *   is bound at [[buffer(14)]], vertex buffer 1 at [[buffer(15)]], and so on.
	 *   Rather than manually authoring vertex buffer indices, use the
	 *   [[stage_in]] attribute which will automatically use the vertex input
	 *   information from the SDL_GPUGraphicsPipeline.
	 *
	 * Shader semantics other than system-value semantics do not matter in D3D12
	 * and for ease of use the SDL implementation assumes that non system-value
	 * semantics will all be TEXCOORD. If you are using HLSL as the shader source
	 * language, your vertex semantics should start at TEXCOORD0 and increment
	 * like so: TEXCOORD1, TEXCOORD2, etc. If you wish to change the semantic
	 * prefix to something other than TEXCOORD you can use
	 * SDL_PROP_GPU_DEVICE_CREATE_D3D12_SEMANTIC_NAME_STRING with
	 * SDL_CreateGPUDeviceWithProperties().
	 *
	 * There are optional properties that can be provided through `props`. These
	 * are the supported properties:
	 *
	 * - `SDL_PROP_GPU_SHADER_CREATE_NAME_STRING`: a name that can be displayed in
	 *   debugging tools.
	 *
	 * \param device a GPU Context.
	 * \param createinfo a struct describing the state of the shader to create.
	 * \returns a shader object on success, or NULL on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateGPUGraphicsPipeline
	 * \sa SDL_ReleaseGPUShader
	 */"

	^ self ffiCall: #(SDL_GPUShader* SDL_CreateGPUShader(SDL_GPUDevice* device, SDL_GPUShaderCreateInfo* createinfo))
]

{ #category : 'public' }
LibSDL3 >> newGPUTextureDevice: device createinfo: createinfo [
	"/**
	 * Creates a texture object to be used in graphics or compute workflows.
	 *
	 * The contents of this texture are undefined until data is written to the
	 * texture.
	 *
	 * Note that certain combinations of usage flags are invalid. For example, a
	 * texture cannot have both the SAMPLER and GRAPHICS_STORAGE_READ flags.
	 *
	 * If you request a sample count higher than the hardware supports, the
	 * implementation will automatically fall back to the highest available sample
	 * count.
	 *
	 * There are optional properties that can be provided through
	 * SDL_GPUTextureCreateInfo's `props`. These are the supported properties:
	 *
	 * - `SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_R_FLOAT`: (Direct3D 12 only) if
	 *   the texture usage is SDL_GPU_TEXTUREUSAGE_COLOR_TARGET, clear the texture
	 *   to a color with this red intensity. Defaults to zero.
	 * - `SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_G_FLOAT`: (Direct3D 12 only) if
	 *   the texture usage is SDL_GPU_TEXTUREUSAGE_COLOR_TARGET, clear the texture
	 *   to a color with this green intensity. Defaults to zero.
	 * - `SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_B_FLOAT`: (Direct3D 12 only) if
	 *   the texture usage is SDL_GPU_TEXTUREUSAGE_COLOR_TARGET, clear the texture
	 *   to a color with this blue intensity. Defaults to zero.
	 * - `SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_A_FLOAT`: (Direct3D 12 only) if
	 *   the texture usage is SDL_GPU_TEXTUREUSAGE_COLOR_TARGET, clear the texture
	 *   to a color with this alpha intensity. Defaults to zero.
	 * - `SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_DEPTH_FLOAT`: (Direct3D 12 only)
	 *   if the texture usage is SDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET, clear
	 *   the texture to a depth of this value. Defaults to zero.
	 * - `SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_STENCIL_UINT8`: (Direct3D 12
	 *   only) if the texture usage is SDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET,
	 *   clear the texture to a stencil of this value. Defaults to zero.
	 * - `SDL_PROP_GPU_TEXTURE_CREATE_NAME_STRING`: a name that can be displayed
	 *   in debugging tools.
	 *
	 * \param device a GPU Context.
	 * \param createinfo a struct describing the state of the texture to create.
	 * \returns a texture object on success, or NULL on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_UploadToGPUTexture
	 * \sa SDL_DownloadFromGPUTexture
	 * \sa SDL_BindGPUVertexSamplers
	 * \sa SDL_BindGPUVertexStorageTextures
	 * \sa SDL_BindGPUFragmentSamplers
	 * \sa SDL_BindGPUFragmentStorageTextures
	 * \sa SDL_BindGPUComputeStorageTextures
	 * \sa SDL_BlitGPUTexture
	 * \sa SDL_ReleaseGPUTexture
	 * \sa SDL_GPUTextureSupportsFormat
	 */"

	^ self ffiCall: #(SDL_GPUTexture* SDL_CreateGPUTexture(SDL_GPUDevice* device, SDL_GPUTextureCreateInfo* createinfo))
]

{ #category : 'public' }
LibSDL3 >> newGPUTransferBufferDevice: device createinfo: createinfo [
	"/**
	 * Creates a transfer buffer to be used when uploading to or downloading from
	 * graphics resources.
	 *
	 * Download buffers can be particularly expensive to create, so it is good
	 * practice to reuse them if data will be downloaded regularly.
	 *
	 * There are optional properties that can be provided through `props`. These
	 * are the supported properties:
	 *
	 * - `SDL_PROP_GPU_TRANSFERBUFFER_CREATE_NAME_STRING`: a name that can be
	 *   displayed in debugging tools.
	 *
	 * \param device a GPU Context.
	 * \param createinfo a struct describing the state of the transfer buffer to
	 *                   create.
	 * \returns a transfer buffer on success, or NULL on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_UploadToGPUBuffer
	 * \sa SDL_DownloadFromGPUBuffer
	 * \sa SDL_UploadToGPUTexture
	 * \sa SDL_DownloadFromGPUTexture
	 * \sa SDL_ReleaseGPUTransferBuffer
	 */"

	^ self ffiCall: #(SDL_GPUTransferBuffer* SDL_CreateGPUTransferBuffer(SDL_GPUDevice* device, SDL_GPUTransferBufferCreateInfo* createinfo))
]

{ #category : 'public' }
LibSDL3 >> newMutex [
	"/**
	 * Create a new mutex.
	 *
	 * All newly-created mutexes begin in the _unlocked_ state.
	 *
	 * Calls to SDL_LockMutex() will not return while the mutex is locked by
	 * another thread. See SDL_TryLockMutex() to attempt to lock without blocking.
	 *
	 * SDL mutexes are reentrant.
	 *
	 * \returns the initialized and unlocked mutex or NULL on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_DestroyMutex
	 * \sa SDL_LockMutex
	 * \sa SDL_TryLockMutex
	 * \sa SDL_UnlockMutex
	 */"

	^ self ffiCall: #(SDL_Mutex* SDL_CreateMutex())
]

{ #category : 'public' }
LibSDL3 >> newPalette: ncolors [
	"/**
	 * Create a palette structure with the specified number of color entries.
	 *
	 * The palette entries are initialized to white.
	 *
	 * \param ncolors represents the number of color entries in the color palette.
	 * \returns a new SDL_Palette structure on success or NULL on failure (e.g. if
	 *          there wasn't enough memory); call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_DestroyPalette
	 * \sa SDL_SetPaletteColors
	 * \sa SDL_SetSurfacePalette
	 */"

	^ self ffiCall: #(SDL_Palette* SDL_CreatePalette(int ncolors))
]

{ #category : 'public' }
LibSDL3 >> newPopupWindowParent: parent offsetX: offset_x offsetY: offset_y w: w h: h flags: flags [
	"/**
	 * Create a child popup window of the specified parent window.
	 *
	 * The flags parameter **must** contain at least one of the following:
	 *
	 * - `SDL_WINDOW_TOOLTIP`: The popup window is a tooltip and will not pass any
	 *   input events.
	 * - `SDL_WINDOW_POPUP_MENU`: The popup window is a popup menu. The topmost
	 *   popup menu will implicitly gain the keyboard focus.
	 *
	 * The following flags are not relevant to popup window creation and will be
	 * ignored:
	 *
	 * - `SDL_WINDOW_MINIMIZED`
	 * - `SDL_WINDOW_MAXIMIZED`
	 * - `SDL_WINDOW_FULLSCREEN`
	 * - `SDL_WINDOW_BORDERLESS`
	 *
	 * The following flags are incompatible with popup window creation and will
	 * cause it to fail:
	 *
	 * - `SDL_WINDOW_UTILITY`
	 * - `SDL_WINDOW_MODAL`
	 *
	 * The parent parameter **must** be non-null and a valid window. The parent of
	 * a popup window can be either a regular, toplevel window, or another popup
	 * window.
	 *
	 * Popup windows cannot be minimized, maximized, made fullscreen, raised,
	 * flash, be made a modal window, be the parent of a toplevel window, or grab
	 * the mouse and/or keyboard. Attempts to do so will fail.
	 *
	 * Popup windows implicitly do not have a border/decorations and do not appear
	 * on the taskbar/dock or in lists of windows such as alt-tab menus.
	 *
	 * If a parent window is hidden or destroyed, any child popup windows will be
	 * recursively hidden or destroyed as well. Child popup windows not explicitly
	 * hidden will be restored when the parent is shown.
	 *
	 * \param parent the parent of the window, must not be NULL.
	 * \param offset_x the x position of the popup window relative to the origin
	 *                 of the parent.
	 * \param offset_y the y position of the popup window relative to the origin
	 *                 of the parent window.
	 * \param w the width of the window.
	 * \param h the height of the window.
	 * \param flags SDL_WINDOW_TOOLTIP or SDL_WINDOW_POPUP_MENU, and zero or more
	 *              additional SDL_WindowFlags OR'd together.
	 * \returns the window that was created or NULL on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateWindow
	 * \sa SDL_CreateWindowWithProperties
	 * \sa SDL_DestroyWindow
	 * \sa SDL_GetWindowParent
	 */"

	^ self ffiCall: #(SDL_Window* SDL_CreatePopupWindow(SDL_Window* parent, int offset_x, int offset_y, int w, int h, SDL_WindowFlags flags))
]

{ #category : 'public' }
LibSDL3 >> newProperties [
	"/**
	 * Create a group of properties.
	 *
	 * All properties are automatically destroyed when SDL_Quit() is called.
	 *
	 * \returns an ID for a new group of properties, or 0 on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_DestroyProperties
	 */"

	^ self ffiCall: #(SDL_PropertiesID SDL_CreateProperties())
]

{ #category : 'public' }
LibSDL3 >> newRWLock [
	"/**
	 * Create a new read/write lock.
	 *
	 * A read/write lock is useful for situations where you have multiple threads
	 * trying to access a resource that is rarely updated. All threads requesting
	 * a read-only lock will be allowed to run in parallel; if a thread requests a
	 * write lock, it will be provided exclusive access. This makes it safe for
	 * multiple threads to use a resource at the same time if they promise not to
	 * change it, and when it has to be changed, the rwlock will serve as a
	 * gateway to make sure those changes can be made safely.
	 *
	 * In the right situation, a rwlock can be more efficient than a mutex, which
	 * only lets a single thread proceed at a time, even if it won't be modifying
	 * the data.
	 *
	 * All newly-created read/write locks begin in the _unlocked_ state.
	 *
	 * Calls to SDL_LockRWLockForReading() and SDL_LockRWLockForWriting will not
	 * return while the rwlock is locked _for writing_ by another thread. See
	 * SDL_TryLockRWLockForReading() and SDL_TryLockRWLockForWriting() to attempt
	 * to lock without blocking.
	 *
	 * SDL read/write locks are only recursive for read-only locks! They are not
	 * guaranteed to be fair, or provide access in a FIFO manner! They are not
	 * guaranteed to favor writers. You may not lock a rwlock for both read-only
	 * and write access at the same time from the same thread (so you can't
	 * promote your read-only lock to a write lock without unlocking first).
	 *
	 * \returns the initialized and unlocked read/write lock or NULL on failure;
	 *          call SDL_GetError() for more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_DestroyRWLock
	 * \sa SDL_LockRWLockForReading
	 * \sa SDL_LockRWLockForWriting
	 * \sa SDL_TryLockRWLockForReading
	 * \sa SDL_TryLockRWLockForWriting
	 * \sa SDL_UnlockRWLock
	 */"

	^ self ffiCall: #(SDL_RWLock* SDL_CreateRWLock())
]

{ #category : 'public' }
LibSDL3 >> newRendererWindow: window name: name [
	"/**
	 * Create a 2D rendering context for a window.
	 *
	 * If you want a specific renderer, you can specify its name here. A list of
	 * available renderers can be obtained by calling SDL_GetRenderDriver()
	 * multiple times, with indices from 0 to SDL_GetNumRenderDrivers()-1. If you
	 * don't need a specific renderer, specify NULL and SDL will attempt to choose
	 * the best option for you, based on what is available on the user's system.
	 *
	 * If `name` is a comma-separated list, SDL will try each name, in the order
	 * listed, until one succeeds or all of them fail.
	 *
	 * By default the rendering size matches the window size in pixels, but you
	 * can call SDL_SetRenderLogicalPresentation() to change the content size and
	 * scaling options.
	 *
	 * \param window the window where rendering is displayed.
	 * \param name the name of the rendering driver to initialize, or NULL to let
	 *             SDL choose one.
	 * \returns a valid rendering context or NULL if there was an error; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateRendererWithProperties
	 * \sa SDL_CreateSoftwareRenderer
	 * \sa SDL_DestroyRenderer
	 * \sa SDL_GetNumRenderDrivers
	 * \sa SDL_GetRenderDriver
	 * \sa SDL_GetRendererName
	 */"

	^ self ffiCall: #(SDL_Renderer* SDL_CreateRenderer(SDL_Window* window, const char* name))
]

{ #category : 'public' }
LibSDL3 >> newRendererWithProperties: props [
	"/**
	 * Create a 2D rendering context for a window, with the specified properties.
	 *
	 * These are the supported properties:
	 *
	 * - `SDL_PROP_RENDERER_CREATE_NAME_STRING`: the name of the rendering driver
	 *   to use, if a specific one is desired
	 * - `SDL_PROP_RENDERER_CREATE_WINDOW_POINTER`: the window where rendering is
	 *   displayed, required if this isn't a software renderer using a surface
	 * - `SDL_PROP_RENDERER_CREATE_SURFACE_POINTER`: the surface where rendering
	 *   is displayed, if you want a software renderer without a window
	 * - `SDL_PROP_RENDERER_CREATE_OUTPUT_COLORSPACE_NUMBER`: an SDL_Colorspace
	 *   value describing the colorspace for output to the display, defaults to
	 *   SDL_COLORSPACE_SRGB. The direct3d11, direct3d12, and metal renderers
	 *   support SDL_COLORSPACE_SRGB_LINEAR, which is a linear color space and
	 *   supports HDR output. If you select SDL_COLORSPACE_SRGB_LINEAR, drawing
	 *   still uses the sRGB colorspace, but values can go beyond 1.0 and float
	 *   (linear) format textures can be used for HDR content.
	 * - `SDL_PROP_RENDERER_CREATE_PRESENT_VSYNC_NUMBER`: non-zero if you want
	 *   present synchronized with the refresh rate. This property can take any
	 *   value that is supported by SDL_SetRenderVSync() for the renderer.
	 *
	 * With the vulkan renderer:
	 *
	 * - `SDL_PROP_RENDERER_CREATE_VULKAN_INSTANCE_POINTER`: the VkInstance to use
	 *   with the renderer, optional.
	 * - `SDL_PROP_RENDERER_CREATE_VULKAN_SURFACE_NUMBER`: the VkSurfaceKHR to use
	 *   with the renderer, optional.
	 * - `SDL_PROP_RENDERER_CREATE_VULKAN_PHYSICAL_DEVICE_POINTER`: the
	 *   VkPhysicalDevice to use with the renderer, optional.
	 * - `SDL_PROP_RENDERER_CREATE_VULKAN_DEVICE_POINTER`: the VkDevice to use
	 *   with the renderer, optional.
	 * - `SDL_PROP_RENDERER_CREATE_VULKAN_GRAPHICS_QUEUE_FAMILY_INDEX_NUMBER`: the
	 *   queue family index used for rendering.
	 * - `SDL_PROP_RENDERER_CREATE_VULKAN_PRESENT_QUEUE_FAMILY_INDEX_NUMBER`: the
	 *   queue family index used for presentation.
	 *
	 * \param props the properties to use.
	 * \returns a valid rendering context or NULL if there was an error; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateProperties
	 * \sa SDL_CreateRenderer
	 * \sa SDL_CreateSoftwareRenderer
	 * \sa SDL_DestroyRenderer
	 * \sa SDL_GetRendererName
	 */"

	^ self ffiCall: #(SDL_Renderer* SDL_CreateRendererWithProperties(SDL_PropertiesID props))
]

{ #category : 'public' }
LibSDL3 >> newSemaphore: initial_value [
	"/**
	 * Create a semaphore.
	 *
	 * This function creates a new semaphore and initializes it with the value
	 * `initial_value`. Each wait operation on the semaphore will atomically
	 * decrement the semaphore value and potentially block if the semaphore value
	 * is 0. Each post operation will atomically increment the semaphore value and
	 * wake waiting threads and allow them to retry the wait operation.
	 *
	 * \param initial_value the starting value of the semaphore.
	 * \returns a new semaphore or NULL on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_DestroySemaphore
	 * \sa SDL_SignalSemaphore
	 * \sa SDL_TryWaitSemaphore
	 * \sa SDL_GetSemaphoreValue
	 * \sa SDL_WaitSemaphore
	 * \sa SDL_WaitSemaphoreTimeout
	 */"

	^ self ffiCall: #(SDL_Semaphore* SDL_CreateSemaphore(Uint32 initial_value))
]

{ #category : 'public' }
LibSDL3 >> newSoftwareRenderer: surface [
	"/**
	 * Create a 2D software rendering context for a surface.
	 *
	 * Two other API which can be used to create SDL_Renderer:
	 * SDL_CreateRenderer() and SDL_CreateWindowAndRenderer(). These can _also_
	 * create a software renderer, but they are intended to be used with an
	 * SDL_Window as the final destination and not an SDL_Surface.
	 *
	 * \param surface the SDL_Surface structure representing the surface where
	 *                rendering is done.
	 * \returns a valid rendering context or NULL if there was an error; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_DestroyRenderer
	 */"

	^ self ffiCall: #(SDL_Renderer* SDL_CreateSoftwareRenderer(SDL_Surface* surface))
]

{ #category : 'public' }
LibSDL3 >> newSurfaceFromWidth: width height: height format: format pixels: pixels pitch: pitch [
	"/**
	 * Allocate a new surface with a specific pixel format and existing pixel
	 * data.
	 *
	 * No copy is made of the pixel data. Pixel data is not managed automatically;
	 * you must free the surface before you free the pixel data.
	 *
	 * Pitch is the offset in bytes from one row of pixels to the next, e.g.
	 * `width*4` for `SDL_PIXELFORMAT_RGBA8888`.
	 *
	 * You may pass NULL for pixels and 0 for pitch to create a surface that you
	 * will fill in with valid values later.
	 *
	 * \param width the width of the surface.
	 * \param height the height of the surface.
	 * \param format the SDL_PixelFormat for the new surface's pixel format.
	 * \param pixels a pointer to existing pixel data.
	 * \param pitch the number of bytes between each row, including padding.
	 * \returns the new SDL_Surface structure that is created or NULL on failure;
	 *          call SDL_GetError() for more information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateSurface
	 * \sa SDL_DestroySurface
	 */"

	^ self ffiCall: #(SDL_Surface* SDL_CreateSurfaceFrom(int width, int height, SDL_PixelFormat format, void* pixels, int pitch))
]

{ #category : 'public' }
LibSDL3 >> newSurfacePalette: surface [
	"/**
	 * Create a palette and associate it with a surface.
	 *
	 * This function creates a palette compatible with the provided surface. The
	 * palette is then returned for you to modify, and the surface will
	 * automatically use the new palette in future operations. You do not need to
	 * destroy the returned palette, it will be freed when the reference count
	 * reaches 0, usually when the surface is destroyed.
	 *
	 * Bitmap surfaces (with format SDL_PIXELFORMAT_INDEX1LSB or
	 * SDL_PIXELFORMAT_INDEX1MSB) will have the palette initialized with 0 as
	 * white and 1 as black. Other surfaces will get a palette initialized with
	 * white in every entry.
	 *
	 * If this function is called for a surface that already has a palette, a new
	 * palette will be created to replace it.
	 *
	 * \param surface the SDL_Surface structure to update.
	 * \returns a new SDL_Palette structure on success or NULL on failure (e.g. if
	 *          the surface didn't have an index format); call SDL_GetError() for
	 *          more information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetPaletteColors
	 */"

	^ self ffiCall: #(SDL_Palette* SDL_CreateSurfacePalette(SDL_Surface* surface))
]

{ #category : 'public' }
LibSDL3 >> newSurfaceWidth: width height: height format: format [
	"/**
	 * Allocate a new surface with a specific pixel format.
	 *
	 * The pixels of the new surface are initialized to zero.
	 *
	 * \param width the width of the surface.
	 * \param height the height of the surface.
	 * \param format the SDL_PixelFormat for the new surface's pixel format.
	 * \returns the new SDL_Surface structure that is created or NULL on failure;
	 *          call SDL_GetError() for more information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateSurfaceFrom
	 * \sa SDL_DestroySurface
	 */"

	^ self ffiCall: #(SDL_Surface* SDL_CreateSurface(int width, int height, SDL_PixelFormat format))
]

{ #category : 'public' }
LibSDL3 >> newSystemCursor: id [
	"/**
	 * Create a system cursor.
	 *
	 * \param id an SDL_SystemCursor enum value.
	 * \returns a cursor on success or NULL on failure; call SDL_GetError() for
	 *          more information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_DestroyCursor
	 */"

	^ self ffiCall: #(SDL_Cursor* SDL_CreateSystemCursor(SDL_SystemCursor id))
]

{ #category : 'public' }
LibSDL3 >> newTextureFromSurfaceRenderer: renderer surface: surface [
	"/**
	 * Create a texture from an existing surface.
	 *
	 * The surface is not modified or freed by this function.
	 *
	 * The SDL_TextureAccess hint for the created texture is
	 * `SDL_TEXTUREACCESS_STATIC`.
	 *
	 * The pixel format of the created texture may be different from the pixel
	 * format of the surface, and can be queried using the
	 * SDL_PROP_TEXTURE_FORMAT_NUMBER property.
	 *
	 * \param renderer the rendering context.
	 * \param surface the SDL_Surface structure containing pixel data used to fill
	 *                the texture.
	 * \returns the created texture or NULL on failure; call SDL_GetError() for
	 *          more information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateTexture
	 * \sa SDL_CreateTextureWithProperties
	 * \sa SDL_DestroyTexture
	 */"

	^ self ffiCall: #(SDL_Texture* SDL_CreateTextureFromSurface(SDL_Renderer* renderer, SDL_Surface* surface))
]

{ #category : 'public' }
LibSDL3 >> newTextureRenderer: renderer format: format access: access w: w h: h [
	"/**
	 * Create a texture for a rendering context.
	 *
	 * The contents of a texture when first created are not defined.
	 *
	 * \param renderer the rendering context.
	 * \param format one of the enumerated values in SDL_PixelFormat.
	 * \param access one of the enumerated values in SDL_TextureAccess.
	 * \param w the width of the texture in pixels.
	 * \param h the height of the texture in pixels.
	 * \returns the created texture or NULL on failure; call SDL_GetError() for
	 *          more information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateTextureFromSurface
	 * \sa SDL_CreateTextureWithProperties
	 * \sa SDL_DestroyTexture
	 * \sa SDL_GetTextureSize
	 * \sa SDL_UpdateTexture
	 */"

	^ self ffiCall: #(SDL_Texture* SDL_CreateTexture(SDL_Renderer* renderer, SDL_PixelFormat format, SDL_TextureAccess access, int w, int h))
]

{ #category : 'public' }
LibSDL3 >> newTextureWithPropertiesRenderer: renderer props: props [
	"/**
	 * Create a texture for a rendering context with the specified properties.
	 *
	 * These are the supported properties:
	 *
	 * - `SDL_PROP_TEXTURE_CREATE_COLORSPACE_NUMBER`: an SDL_Colorspace value
	 *   describing the texture colorspace, defaults to SDL_COLORSPACE_SRGB_LINEAR
	 *   for floating point textures, SDL_COLORSPACE_HDR10 for 10-bit textures,
	 *   SDL_COLORSPACE_SRGB for other RGB textures and SDL_COLORSPACE_JPEG for
	 *   YUV textures.
	 * - `SDL_PROP_TEXTURE_CREATE_FORMAT_NUMBER`: one of the enumerated values in
	 *   SDL_PixelFormat, defaults to the best RGBA format for the renderer
	 * - `SDL_PROP_TEXTURE_CREATE_ACCESS_NUMBER`: one of the enumerated values in
	 *   SDL_TextureAccess, defaults to SDL_TEXTUREACCESS_STATIC
	 * - `SDL_PROP_TEXTURE_CREATE_WIDTH_NUMBER`: the width of the texture in
	 *   pixels, required
	 * - `SDL_PROP_TEXTURE_CREATE_HEIGHT_NUMBER`: the height of the texture in
	 *   pixels, required
	 * - `SDL_PROP_TEXTURE_CREATE_SDR_WHITE_POINT_FLOAT`: for HDR10 and floating
	 *   point textures, this defines the value of 100% diffuse white, with higher
	 *   values being displayed in the High Dynamic Range headroom. This defaults
	 *   to 100 for HDR10 textures and 1.0 for floating point textures.
	 * - `SDL_PROP_TEXTURE_CREATE_HDR_HEADROOM_FLOAT`: for HDR10 and floating
	 *   point textures, this defines the maximum dynamic range used by the
	 *   content, in terms of the SDR white point. This would be equivalent to
	 *   maxCLL / SDL_PROP_TEXTURE_CREATE_SDR_WHITE_POINT_FLOAT for HDR10 content.
	 *   If this is defined, any values outside the range supported by the display
	 *   will be scaled into the available HDR headroom, otherwise they are
	 *   clipped.
	 *
	 * With the direct3d11 renderer:
	 *
	 * - `SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_POINTER`: the ID3D11Texture2D
	 *   associated with the texture, if you want to wrap an existing texture.
	 * - `SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_U_POINTER`: the ID3D11Texture2D
	 *   associated with the U plane of a YUV texture, if you want to wrap an
	 *   existing texture.
	 * - `SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_V_POINTER`: the ID3D11Texture2D
	 *   associated with the V plane of a YUV texture, if you want to wrap an
	 *   existing texture.
	 *
	 * With the direct3d12 renderer:
	 *
	 * - `SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_POINTER`: the ID3D12Resource
	 *   associated with the texture, if you want to wrap an existing texture.
	 * - `SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_U_POINTER`: the ID3D12Resource
	 *   associated with the U plane of a YUV texture, if you want to wrap an
	 *   existing texture.
	 * - `SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_V_POINTER`: the ID3D12Resource
	 *   associated with the V plane of a YUV texture, if you want to wrap an
	 *   existing texture.
	 *
	 * With the metal renderer:
	 *
	 * - `SDL_PROP_TEXTURE_CREATE_METAL_PIXELBUFFER_POINTER`: the CVPixelBufferRef
	 *   associated with the texture, if you want to create a texture from an
	 *   existing pixel buffer.
	 *
	 * With the opengl renderer:
	 *
	 * - `SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_NUMBER`: the GLuint texture
	 *   associated with the texture, if you want to wrap an existing texture.
	 * - `SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_UV_NUMBER`: the GLuint texture
	 *   associated with the UV plane of an NV12 texture, if you want to wrap an
	 *   existing texture.
	 * - `SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_U_NUMBER`: the GLuint texture
	 *   associated with the U plane of a YUV texture, if you want to wrap an
	 *   existing texture.
	 * - `SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_V_NUMBER`: the GLuint texture
	 *   associated with the V plane of a YUV texture, if you want to wrap an
	 *   existing texture.
	 *
	 * With the opengles2 renderer:
	 *
	 * - `SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_NUMBER`: the GLuint texture
	 *   associated with the texture, if you want to wrap an existing texture.
	 * - `SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_NUMBER`: the GLuint texture
	 *   associated with the texture, if you want to wrap an existing texture.
	 * - `SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_UV_NUMBER`: the GLuint texture
	 *   associated with the UV plane of an NV12 texture, if you want to wrap an
	 *   existing texture.
	 * - `SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_U_NUMBER`: the GLuint texture
	 *   associated with the U plane of a YUV texture, if you want to wrap an
	 *   existing texture.
	 * - `SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_V_NUMBER`: the GLuint texture
	 *   associated with the V plane of a YUV texture, if you want to wrap an
	 *   existing texture.
	 *
	 * With the vulkan renderer:
	 *
	 * - `SDL_PROP_TEXTURE_CREATE_VULKAN_TEXTURE_NUMBER`: the VkImage with layout
	 *   VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL associated with the texture, if
	 *   you want to wrap an existing texture.
	 *
	 * \param renderer the rendering context.
	 * \param props the properties to use.
	 * \returns the created texture or NULL on failure; call SDL_GetError() for
	 *          more information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateProperties
	 * \sa SDL_CreateTexture
	 * \sa SDL_CreateTextureFromSurface
	 * \sa SDL_DestroyTexture
	 * \sa SDL_GetTextureSize
	 * \sa SDL_UpdateTexture
	 */"

	^ self ffiCall: #(SDL_Texture* SDL_CreateTextureWithProperties(SDL_Renderer* renderer, SDL_PropertiesID props))
]

{ #category : 'public' }
LibSDL3 >> newThreadRuntimeFn: fn name: name data: data pfnBeginThread: pfnBeginThread pfnEndThread: pfnEndThread [
	"/**
	 * The actual entry point for SDL_CreateThread.
	 *
	 * \param fn the SDL_ThreadFunction function to call in the new thread
	 * \param name the name of the thread
	 * \param data a pointer that is passed to `fn`
	 * \param pfnBeginThread the C runtime's _beginthreadex (or whatnot). Can be NULL.
	 * \param pfnEndThread the C runtime's _endthreadex (or whatnot). Can be NULL.
	 * \returns an opaque pointer to the new thread object on success, NULL if the
	 *          new thread could not be created; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_Thread* SDL_CreateThreadRuntime(SDL_ThreadFunction fn, const char* name, void* data, SDL_FunctionPointer pfnBeginThread, SDL_FunctionPointer pfnEndThread))
]

{ #category : 'public' }
LibSDL3 >> newThreadWithPropertiesRuntimeProps: props pfnBeginThread: pfnBeginThread pfnEndThread: pfnEndThread [
	"/**
	 * The actual entry point for SDL_CreateThreadWithProperties.
	 *
	 * \param props the properties to use
	 * \param pfnBeginThread the C runtime's _beginthreadex (or whatnot). Can be NULL.
	 * \param pfnEndThread the C runtime's _endthreadex (or whatnot). Can be NULL.
	 * \returns an opaque pointer to the new thread object on success, NULL if the
	 *          new thread could not be created; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_Thread* SDL_CreateThreadWithPropertiesRuntime(SDL_PropertiesID props, SDL_FunctionPointer pfnBeginThread, SDL_FunctionPointer pfnEndThread))
]

{ #category : 'public' }
LibSDL3 >> newTrayIcon: icon tooltip: tooltip [
	"/**
	 * Create an icon to be placed in the operating system's tray, or equivalent.
	 *
	 * Many platforms advise not using a system tray unless persistence is a
	 * necessary feature. Avoid needlessly creating a tray icon, as the user may
	 * feel like it clutters their interface.
	 *
	 * Using tray icons require the video subsystem.
	 *
	 * \param icon a surface to be used as icon. May be NULL.
	 * \param tooltip a tooltip to be displayed when the mouse hovers the icon in
	 *                UTF-8 encoding. Not supported on all platforms. May be NULL.
	 * \returns The newly created system tray icon.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateTrayMenu
	 * \sa SDL_GetTrayMenu
	 * \sa SDL_DestroyTray
	 */"

	^ self ffiCall: #(SDL_Tray* SDL_CreateTray(SDL_Surface* icon, const char* tooltip))
]

{ #category : 'public' }
LibSDL3 >> newTrayMenu: tray [
	"/**
	 * Create a menu for a system tray.
	 *
	 * This should be called at most once per tray icon.
	 *
	 * This function does the same thing as SDL_CreateTraySubmenu(), except that
	 * it takes a SDL_Tray instead of a SDL_TrayEntry.
	 *
	 * A menu does not need to be destroyed; it will be destroyed with the tray.
	 *
	 * \param tray the tray to bind the menu to.
	 * \returns the newly created menu.
	 *
	 * \threadsafety This function should be called on the thread that created the
	 *               tray.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateTray
	 * \sa SDL_GetTrayMenu
	 * \sa SDL_GetTrayMenuParentTray
	 */"

	^ self ffiCall: #(SDL_TrayMenu* SDL_CreateTrayMenu(SDL_Tray* tray))
]

{ #category : 'public' }
LibSDL3 >> newTraySubmenu: entry [
	"/**
	 * Create a submenu for a system tray entry.
	 *
	 * This should be called at most once per tray entry.
	 *
	 * This function does the same thing as SDL_CreateTrayMenu, except that it
	 * takes a SDL_TrayEntry instead of a SDL_Tray.
	 *
	 * A menu does not need to be destroyed; it will be destroyed with the tray.
	 *
	 * \param entry the tray entry to bind the menu to.
	 * \returns the newly created menu.
	 *
	 * \threadsafety This function should be called on the thread that created the
	 *               tray.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_InsertTrayEntryAt
	 * \sa SDL_GetTraySubmenu
	 * \sa SDL_GetTrayMenuParentEntry
	 */"

	^ self ffiCall: #(SDL_TrayMenu* SDL_CreateTraySubmenu(SDL_TrayEntry* entry))
]

{ #category : 'public' }
LibSDL3 >> newWindowAndRendererTitle: title width: width height: height windowFlags: window_flags window: window renderer: renderer [
	"/**
	 * Create a window and default renderer.
	 *
	 * \param title the title of the window, in UTF-8 encoding.
	 * \param width the width of the window.
	 * \param height the height of the window.
	 * \param window_flags the flags used to create the window (see
	 *                     SDL_CreateWindow()).
	 * \param window a pointer filled with the window, or NULL on error.
	 * \param renderer a pointer filled with the renderer, or NULL on error.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateRenderer
	 * \sa SDL_CreateWindow
	 */"

	^ self ffiCall: #(bool SDL_CreateWindowAndRenderer(const char* title, int width, int height, SDL_WindowFlags window_flags, SDL_Window* window, SDL_Renderer* renderer))
]

{ #category : 'public' }
LibSDL3 >> newWindowTitle: title w: w h: h flags: flags [
	"/**
	 * Create a window with the specified dimensions and flags.
	 *
	 * `flags` may be any of the following OR'd together:
	 *
	 * - `SDL_WINDOW_FULLSCREEN`: fullscreen window at desktop resolution
	 * - `SDL_WINDOW_OPENGL`: window usable with an OpenGL context
	 * - `SDL_WINDOW_OCCLUDED`: window partially or completely obscured by another
	 *   window
	 * - `SDL_WINDOW_HIDDEN`: window is not visible
	 * - `SDL_WINDOW_BORDERLESS`: no window decoration
	 * - `SDL_WINDOW_RESIZABLE`: window can be resized
	 * - `SDL_WINDOW_MINIMIZED`: window is minimized
	 * - `SDL_WINDOW_MAXIMIZED`: window is maximized
	 * - `SDL_WINDOW_MOUSE_GRABBED`: window has grabbed mouse focus
	 * - `SDL_WINDOW_INPUT_FOCUS`: window has input focus
	 * - `SDL_WINDOW_MOUSE_FOCUS`: window has mouse focus
	 * - `SDL_WINDOW_EXTERNAL`: window not created by SDL
	 * - `SDL_WINDOW_MODAL`: window is modal
	 * - `SDL_WINDOW_HIGH_PIXEL_DENSITY`: window uses high pixel density back
	 *   buffer if possible
	 * - `SDL_WINDOW_MOUSE_CAPTURE`: window has mouse captured (unrelated to
	 *   MOUSE_GRABBED)
	 * - `SDL_WINDOW_ALWAYS_ON_TOP`: window should always be above others
	 * - `SDL_WINDOW_UTILITY`: window should be treated as a utility window, not
	 *   showing in the task bar and window list
	 * - `SDL_WINDOW_TOOLTIP`: window should be treated as a tooltip and does not
	 *   get mouse or keyboard focus, requires a parent window
	 * - `SDL_WINDOW_POPUP_MENU`: window should be treated as a popup menu,
	 *   requires a parent window
	 * - `SDL_WINDOW_KEYBOARD_GRABBED`: window has grabbed keyboard input
	 * - `SDL_WINDOW_VULKAN`: window usable with a Vulkan instance
	 * - `SDL_WINDOW_METAL`: window usable with a Metal instance
	 * - `SDL_WINDOW_TRANSPARENT`: window with transparent buffer
	 * - `SDL_WINDOW_NOT_FOCUSABLE`: window should not be focusable
	 *
	 * The SDL_Window is implicitly shown if SDL_WINDOW_HIDDEN is not set.
	 *
	 * On Apple's macOS, you **must** set the NSHighResolutionCapable Info.plist
	 * property to YES, otherwise you will not receive a High-DPI OpenGL canvas.
	 *
	 * The window pixel size may differ from its window coordinate size if the
	 * window is on a high pixel density display. Use SDL_GetWindowSize() to query
	 * the client area's size in window coordinates, and
	 * SDL_GetWindowSizeInPixels() or SDL_GetRenderOutputSize() to query the
	 * drawable size in pixels. Note that the drawable size can vary after the
	 * window is created and should be queried again if you get an
	 * SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED event.
	 *
	 * If the window is created with any of the SDL_WINDOW_OPENGL or
	 * SDL_WINDOW_VULKAN flags, then the corresponding LoadLibrary function
	 * (SDL_GL_LoadLibrary or SDL_Vulkan_LoadLibrary) is called and the
	 * corresponding UnloadLibrary function is called by SDL_DestroyWindow().
	 *
	 * If SDL_WINDOW_VULKAN is specified and there isn't a working Vulkan driver,
	 * SDL_CreateWindow() will fail, because SDL_Vulkan_LoadLibrary() will fail.
	 *
	 * If SDL_WINDOW_METAL is specified on an OS that does not support Metal,
	 * SDL_CreateWindow() will fail.
	 *
	 * If you intend to use this window with an SDL_Renderer, you should use
	 * SDL_CreateWindowAndRenderer() instead of this function, to avoid window
	 * flicker.
	 *
	 * On non-Apple devices, SDL requires you to either not link to the Vulkan
	 * loader or link to a dynamic library version. This limitation may be removed
	 * in a future version of SDL.
	 *
	 * \param title the title of the window, in UTF-8 encoding.
	 * \param w the width of the window.
	 * \param h the height of the window.
	 * \param flags 0, or one or more SDL_WindowFlags OR'd together.
	 * \returns the window that was created or NULL on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateWindowAndRenderer
	 * \sa SDL_CreatePopupWindow
	 * \sa SDL_CreateWindowWithProperties
	 * \sa SDL_DestroyWindow
	 */"

	^ self ffiCall: #(SDL_Window* SDL_CreateWindow(const char* title, int w, int h, SDL_WindowFlags flags))
]

{ #category : 'public' }
LibSDL3 >> newWindowWithProperties: props [
	"/**
	 * Create a window with the specified properties.
	 *
	 * These are the supported properties:
	 *
	 * - `SDL_PROP_WINDOW_CREATE_ALWAYS_ON_TOP_BOOLEAN`: true if the window should
	 *   be always on top
	 * - `SDL_PROP_WINDOW_CREATE_BORDERLESS_BOOLEAN`: true if the window has no
	 *   window decoration
	 * - `SDL_PROP_WINDOW_CREATE_EXTERNAL_GRAPHICS_CONTEXT_BOOLEAN`: true if the
	 *   window will be used with an externally managed graphics context.
	 * - `SDL_PROP_WINDOW_CREATE_FOCUSABLE_BOOLEAN`: true if the window should
	 *   accept keyboard input (defaults true)
	 * - `SDL_PROP_WINDOW_CREATE_FULLSCREEN_BOOLEAN`: true if the window should
	 *   start in fullscreen mode at desktop resolution
	 * - `SDL_PROP_WINDOW_CREATE_HEIGHT_NUMBER`: the height of the window
	 * - `SDL_PROP_WINDOW_CREATE_HIDDEN_BOOLEAN`: true if the window should start
	 *   hidden
	 * - `SDL_PROP_WINDOW_CREATE_HIGH_PIXEL_DENSITY_BOOLEAN`: true if the window
	 *   uses a high pixel density buffer if possible
	 * - `SDL_PROP_WINDOW_CREATE_MAXIMIZED_BOOLEAN`: true if the window should
	 *   start maximized
	 * - `SDL_PROP_WINDOW_CREATE_MENU_BOOLEAN`: true if the window is a popup menu
	 * - `SDL_PROP_WINDOW_CREATE_METAL_BOOLEAN`: true if the window will be used
	 *   with Metal rendering
	 * - `SDL_PROP_WINDOW_CREATE_MINIMIZED_BOOLEAN`: true if the window should
	 *   start minimized
	 * - `SDL_PROP_WINDOW_CREATE_MODAL_BOOLEAN`: true if the window is modal to
	 *   its parent
	 * - `SDL_PROP_WINDOW_CREATE_MOUSE_GRABBED_BOOLEAN`: true if the window starts
	 *   with grabbed mouse focus
	 * - `SDL_PROP_WINDOW_CREATE_OPENGL_BOOLEAN`: true if the window will be used
	 *   with OpenGL rendering
	 * - `SDL_PROP_WINDOW_CREATE_PARENT_POINTER`: an SDL_Window that will be the
	 *   parent of this window, required for windows with the ""tooltip"", ""menu"",
	 *   and ""modal"" properties
	 * - `SDL_PROP_WINDOW_CREATE_RESIZABLE_BOOLEAN`: true if the window should be
	 *   resizable
	 * - `SDL_PROP_WINDOW_CREATE_TITLE_STRING`: the title of the window, in UTF-8
	 *   encoding
	 * - `SDL_PROP_WINDOW_CREATE_TRANSPARENT_BOOLEAN`: true if the window show
	 *   transparent in the areas with alpha of 0
	 * - `SDL_PROP_WINDOW_CREATE_TOOLTIP_BOOLEAN`: true if the window is a tooltip
	 * - `SDL_PROP_WINDOW_CREATE_UTILITY_BOOLEAN`: true if the window is a utility
	 *   window, not showing in the task bar and window list
	 * - `SDL_PROP_WINDOW_CREATE_VULKAN_BOOLEAN`: true if the window will be used
	 *   with Vulkan rendering
	 * - `SDL_PROP_WINDOW_CREATE_WIDTH_NUMBER`: the width of the window
	 * - `SDL_PROP_WINDOW_CREATE_X_NUMBER`: the x position of the window, or
	 *   `SDL_WINDOWPOS_CENTERED`, defaults to `SDL_WINDOWPOS_UNDEFINED`. This is
	 *   relative to the parent for windows with the ""tooltip"" or ""menu"" property
	 *   set.
	 * - `SDL_PROP_WINDOW_CREATE_Y_NUMBER`: the y position of the window, or
	 *   `SDL_WINDOWPOS_CENTERED`, defaults to `SDL_WINDOWPOS_UNDEFINED`. This is
	 *   relative to the parent for windows with the ""tooltip"" or ""menu"" property
	 *   set.
	 *
	 * These are additional supported properties on macOS:
	 *
	 * - `SDL_PROP_WINDOW_CREATE_COCOA_WINDOW_POINTER`: the
	 *   `(__unsafe_unretained)` NSWindow associated with the window, if you want
	 *   to wrap an existing window.
	 * - `SDL_PROP_WINDOW_CREATE_COCOA_VIEW_POINTER`: the `(__unsafe_unretained)`
	 *   NSView associated with the window, defaults to `[window contentView]`
	 *
	 * These are additional supported properties on Wayland:
	 *
	 * - `SDL_PROP_WINDOW_CREATE_WAYLAND_SURFACE_ROLE_CUSTOM_BOOLEAN` - true if
	 *   the application wants to use the Wayland surface for a custom role and
	 *   does not want it attached to an XDG toplevel window. See
	 *   [README/wayland](README/wayland) for more information on using custom
	 *   surfaces.
	 * - `SDL_PROP_WINDOW_CREATE_WAYLAND_CREATE_EGL_WINDOW_BOOLEAN` - true if the
	 *   application wants an associated `wl_egl_window` object to be created and
	 *   attached to the window, even if the window does not have the OpenGL
	 *   property or `SDL_WINDOW_OPENGL` flag set.
	 * - `SDL_PROP_WINDOW_CREATE_WAYLAND_WL_SURFACE_POINTER` - the wl_surface
	 *   associated with the window, if you want to wrap an existing window. See
	 *   [README/wayland](README/wayland) for more information.
	 *
	 * These are additional supported properties on Windows:
	 *
	 * - `SDL_PROP_WINDOW_CREATE_WIN32_HWND_POINTER`: the HWND associated with the
	 *   window, if you want to wrap an existing window.
	 * - `SDL_PROP_WINDOW_CREATE_WIN32_PIXEL_FORMAT_HWND_POINTER`: optional,
	 *   another window to share pixel format with, useful for OpenGL windows
	 *
	 * These are additional supported properties with X11:
	 *
	 * - `SDL_PROP_WINDOW_CREATE_X11_WINDOW_NUMBER`: the X11 Window associated
	 *   with the window, if you want to wrap an existing window.
	 *
	 * The window is implicitly shown if the ""hidden"" property is not set.
	 *
	 * Windows with the ""tooltip"" and ""menu"" properties are popup windows and have
	 * the behaviors and guidelines outlined in SDL_CreatePopupWindow().
	 *
	 * If this window is being created to be used with an SDL_Renderer, you should
	 * not add a graphics API specific property
	 * (`SDL_PROP_WINDOW_CREATE_OPENGL_BOOLEAN`, etc), as SDL will handle that
	 * internally when it chooses a renderer. However, SDL might need to recreate
	 * your window at that point, which may cause the window to appear briefly,
	 * and then flicker as it is recreated. The correct approach to this is to
	 * create the window with the `SDL_PROP_WINDOW_CREATE_HIDDEN_BOOLEAN` property
	 * set to true, then create the renderer, then show the window with
	 * SDL_ShowWindow().
	 *
	 * \param props the properties to use.
	 * \returns the window that was created or NULL on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateProperties
	 * \sa SDL_CreateWindow
	 * \sa SDL_DestroyWindow
	 */"

	^ self ffiCall: #(SDL_Window* SDL_CreateWindowWithProperties(SDL_PropertiesID props))
]

{ #category : 'public' }
LibSDL3 >> onApplicationDidEnterBackground [
	"/**
	 * Let iOS apps with external event handling report
	 * onApplicationDidEnterBackground.
	 *
	 * This functions allows iOS apps that have their own event handling to hook
	 * into SDL to generate SDL events. This maps directly to an iOS-specific
	 * event, but since it doesn't do anything iOS-specific internally, it is
	 * available on all platforms, in case it might be useful for some specific
	 * paradigm. Most apps do not need to use this directly; SDL's internal event
	 * code will handle all this for windows created by SDL_CreateWindow!
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_OnApplicationDidEnterBackground())
]

{ #category : 'public' }
LibSDL3 >> onApplicationDidEnterForeground [
	"/**
	 * Let iOS apps with external event handling report
	 * onApplicationDidBecomeActive.
	 *
	 * This functions allows iOS apps that have their own event handling to hook
	 * into SDL to generate SDL events. This maps directly to an iOS-specific
	 * event, but since it doesn't do anything iOS-specific internally, it is
	 * available on all platforms, in case it might be useful for some specific
	 * paradigm. Most apps do not need to use this directly; SDL's internal event
	 * code will handle all this for windows created by SDL_CreateWindow!
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_OnApplicationDidEnterForeground())
]

{ #category : 'public' }
LibSDL3 >> onApplicationDidReceiveMemoryWarning [
	"/**
	 * Let iOS apps with external event handling report
	 * onApplicationDidReceiveMemoryWarning.
	 *
	 * This functions allows iOS apps that have their own event handling to hook
	 * into SDL to generate SDL events. This maps directly to an iOS-specific
	 * event, but since it doesn't do anything iOS-specific internally, it is
	 * available on all platforms, in case it might be useful for some specific
	 * paradigm. Most apps do not need to use this directly; SDL's internal event
	 * code will handle all this for windows created by SDL_CreateWindow!
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_OnApplicationDidReceiveMemoryWarning())
]

{ #category : 'public' }
LibSDL3 >> onApplicationWillEnterBackground [
	"/**
	 * Let iOS apps with external event handling report
	 * onApplicationWillResignActive.
	 *
	 * This functions allows iOS apps that have their own event handling to hook
	 * into SDL to generate SDL events. This maps directly to an iOS-specific
	 * event, but since it doesn't do anything iOS-specific internally, it is
	 * available on all platforms, in case it might be useful for some specific
	 * paradigm. Most apps do not need to use this directly; SDL's internal event
	 * code will handle all this for windows created by SDL_CreateWindow!
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_OnApplicationWillEnterBackground())
]

{ #category : 'public' }
LibSDL3 >> onApplicationWillEnterForeground [
	"/**
	 * Let iOS apps with external event handling report
	 * onApplicationWillEnterForeground.
	 *
	 * This functions allows iOS apps that have their own event handling to hook
	 * into SDL to generate SDL events. This maps directly to an iOS-specific
	 * event, but since it doesn't do anything iOS-specific internally, it is
	 * available on all platforms, in case it might be useful for some specific
	 * paradigm. Most apps do not need to use this directly; SDL's internal event
	 * code will handle all this for windows created by SDL_CreateWindow!
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_OnApplicationWillEnterForeground())
]

{ #category : 'public' }
LibSDL3 >> onApplicationWillTerminate [
	"/**
	 * Let iOS apps with external event handling report
	 * onApplicationWillTerminate.
	 *
	 * This functions allows iOS apps that have their own event handling to hook
	 * into SDL to generate SDL events. This maps directly to an iOS-specific
	 * event, but since it doesn't do anything iOS-specific internally, it is
	 * available on all platforms, in case it might be useful for some specific
	 * paradigm. Most apps do not need to use this directly; SDL's internal event
	 * code will handle all this for windows created by SDL_CreateWindow!
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_OnApplicationWillTerminate())
]

{ #category : 'public' }
LibSDL3 >> openAudioDeviceDevid: devid spec: spec [
	"/**
	 * Open a specific audio device.
	 *
	 * You can open both playback and recording devices through this function.
	 * Playback devices will take data from bound audio streams, mix it, and send
	 * it to the hardware. Recording devices will feed any bound audio streams
	 * with a copy of any incoming data.
	 *
	 * An opened audio device starts out with no audio streams bound. To start
	 * audio playing, bind a stream and supply audio data to it. Unlike SDL2,
	 * there is no audio callback; you only bind audio streams and make sure they
	 * have data flowing into them (however, you can simulate SDL2's semantics
	 * fairly closely by using SDL_OpenAudioDeviceStream instead of this
	 * function).
	 *
	 * If you don't care about opening a specific device, pass a `devid` of either
	 * `SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK` or
	 * `SDL_AUDIO_DEVICE_DEFAULT_RECORDING`. In this case, SDL will try to pick
	 * the most reasonable default, and may also switch between physical devices
	 * seamlessly later, if the most reasonable default changes during the
	 * lifetime of this opened device (user changed the default in the OS's system
	 * preferences, the default got unplugged so the system jumped to a new
	 * default, the user plugged in headphones on a mobile device, etc). Unless
	 * you have a good reason to choose a specific device, this is probably what
	 * you want.
	 *
	 * You may request a specific format for the audio device, but there is no
	 * promise the device will honor that request for several reasons. As such,
	 * it's only meant to be a hint as to what data your app will provide. Audio
	 * streams will accept data in whatever format you specify and manage
	 * conversion for you as appropriate. SDL_GetAudioDeviceFormat can tell you
	 * the preferred format for the device before opening and the actual format
	 * the device is using after opening.
	 *
	 * It's legal to open the same device ID more than once; each successful open
	 * will generate a new logical SDL_AudioDeviceID that is managed separately
	 * from others on the same physical device. This allows libraries to open a
	 * device separately from the main app and bind its own streams without
	 * conflicting.
	 *
	 * It is also legal to open a device ID returned by a previous call to this
	 * function; doing so just creates another logical device on the same physical
	 * device. This may be useful for making logical groupings of audio streams.
	 *
	 * This function returns the opened device ID on success. This is a new,
	 * unique SDL_AudioDeviceID that represents a logical device.
	 *
	 * Some backends might offer arbitrary devices (for example, a networked audio
	 * protocol that can connect to an arbitrary server). For these, as a change
	 * from SDL2, you should open a default device ID and use an SDL hint to
	 * specify the target if you care, or otherwise let the backend figure out a
	 * reasonable default. Most backends don't offer anything like this, and often
	 * this would be an end user setting an environment variable for their custom
	 * need, and not something an application should specifically manage.
	 *
	 * When done with an audio device, possibly at the end of the app's life, one
	 * should call SDL_CloseAudioDevice() on the returned device id.
	 *
	 * \param devid the device instance id to open, or
	 *              SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK or
	 *              SDL_AUDIO_DEVICE_DEFAULT_RECORDING for the most reasonable
	 *              default device.
	 * \param spec the requested device configuration. Can be NULL to use
	 *             reasonable defaults.
	 * \returns the device ID on success or 0 on failure; call SDL_GetError() for
	 *          more information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CloseAudioDevice
	 * \sa SDL_GetAudioDeviceFormat
	 */"

	^ self ffiCall: #(SDL_AudioDeviceID SDL_OpenAudioDevice(SDL_AudioDeviceID devid, SDL_AudioSpec* spec))
]

{ #category : 'public' }
LibSDL3 >> openAudioDeviceStreamDevid: devid spec: spec callback: callback userdata: userdata [
	"/**
	 * Convenience function for straightforward audio init for the common case.
	 *
	 * If all your app intends to do is provide a single source of PCM audio, this
	 * function allows you to do all your audio setup in a single call.
	 *
	 * This is also intended to be a clean means to migrate apps from SDL2.
	 *
	 * This function will open an audio device, create a stream and bind it.
	 * Unlike other methods of setup, the audio device will be closed when this
	 * stream is destroyed, so the app can treat the returned SDL_AudioStream as
	 * the only object needed to manage audio playback.
	 *
	 * Also unlike other functions, the audio device begins paused. This is to map
	 * more closely to SDL2-style behavior, since there is no extra step here to
	 * bind a stream to begin audio flowing. The audio device should be resumed
	 * with `SDL_ResumeAudioStreamDevice(stream);`
	 *
	 * This function works with both playback and recording devices.
	 *
	 * The `spec` parameter represents the app's side of the audio stream. That
	 * is, for recording audio, this will be the output format, and for playing
	 * audio, this will be the input format. If spec is NULL, the system will
	 * choose the format, and the app can use SDL_GetAudioStreamFormat() to obtain
	 * this information later.
	 *
	 * If you don't care about opening a specific audio device, you can (and
	 * probably _should_), use SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK for playback and
	 * SDL_AUDIO_DEVICE_DEFAULT_RECORDING for recording.
	 *
	 * One can optionally provide a callback function; if NULL, the app is
	 * expected to queue audio data for playback (or unqueue audio data if
	 * capturing). Otherwise, the callback will begin to fire once the device is
	 * unpaused.
	 *
	 * Destroying the returned stream with SDL_DestroyAudioStream will also close
	 * the audio device associated with this stream.
	 *
	 * \param devid an audio device to open, or SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK
	 *              or SDL_AUDIO_DEVICE_DEFAULT_RECORDING.
	 * \param spec the audio stream's data format. Can be NULL.
	 * \param callback a callback where the app will provide new data for
	 *                 playback, or receive new data for recording. Can be NULL,
	 *                 in which case the app will need to call
	 *                 SDL_PutAudioStreamData or SDL_GetAudioStreamData as
	 *                 necessary.
	 * \param userdata app-controlled pointer passed to callback. Can be NULL.
	 *                 Ignored if callback is NULL.
	 * \returns an audio stream on success, ready to use, or NULL on failure; call
	 *          SDL_GetError() for more information. When done with this stream,
	 *          call SDL_DestroyAudioStream to free resources and close the
	 *          device.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetAudioStreamDevice
	 * \sa SDL_ResumeAudioStreamDevice
	 */"

	^ self ffiCall: #(SDL_AudioStream* SDL_OpenAudioDeviceStream(SDL_AudioDeviceID devid, SDL_AudioSpec* spec, SDL_AudioStreamCallback callback, void* userdata))
]

{ #category : 'public' }
LibSDL3 >> openCameraInstanceId: instance_id spec: spec [
	"/**
	 * Open a video recording device (a ""camera"").
	 *
	 * You can open the device with any reasonable spec, and if the hardware can't
	 * directly support it, it will convert data seamlessly to the requested
	 * format. This might incur overhead, including scaling of image data.
	 *
	 * If you would rather accept whatever format the device offers, you can pass
	 * a NULL spec here and it will choose one for you (and you can use
	 * SDL_Surface's conversion/scaling functions directly if necessary).
	 *
	 * You can call SDL_GetCameraFormat() to get the actual data format if passing
	 * a NULL spec here. You can see the exact specs a device can support without
	 * conversion with SDL_GetCameraSupportedFormats().
	 *
	 * SDL will not attempt to emulate framerate; it will try to set the hardware
	 * to the rate closest to the requested speed, but it won't attempt to limit
	 * or duplicate frames artificially; call SDL_GetCameraFormat() to see the
	 * actual framerate of the opened the device, and check your timestamps if
	 * this is crucial to your app!
	 *
	 * Note that the camera is not usable until the user approves its use! On some
	 * platforms, the operating system will prompt the user to permit access to
	 * the camera, and they can choose Yes or No at that point. Until they do, the
	 * camera will not be usable. The app should either wait for an
	 * SDL_EVENT_CAMERA_DEVICE_APPROVED (or SDL_EVENT_CAMERA_DEVICE_DENIED) event,
	 * or poll SDL_GetCameraPermissionState() occasionally until it returns
	 * non-zero. On platforms that don't require explicit user approval (and
	 * perhaps in places where the user previously permitted access), the approval
	 * event might come immediately, but it might come seconds, minutes, or hours
	 * later!
	 *
	 * \param instance_id the camera device instance ID.
	 * \param spec the desired format for data the device will provide. Can be
	 *             NULL.
	 * \returns an SDL_Camera object or NULL on failure; call SDL_GetError() for
	 *          more information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetCameras
	 * \sa SDL_GetCameraFormat
	 */"

	^ self ffiCall: #(SDL_Camera* SDL_OpenCamera(SDL_CameraID instance_id, SDL_CameraSpec* spec))
]

{ #category : 'public' }
LibSDL3 >> openIOIface: iface userdata: userdata [
	"/**
	 * Create a custom SDL_IOStream.
	 *
	 * Applications do not need to use this function unless they are providing
	 * their own SDL_IOStream implementation. If you just need an SDL_IOStream to
	 * read/write a common data source, you should use the built-in
	 * implementations in SDL, like SDL_IOFromFile() or SDL_IOFromMem(), etc.
	 *
	 * This function makes a copy of `iface` and the caller does not need to keep
	 * it around after this call.
	 *
	 * \param iface the interface that implements this SDL_IOStream, initialized
	 *              using SDL_INIT_INTERFACE().
	 * \param userdata the pointer that will be passed to the interface functions.
	 * \returns a pointer to the allocated memory on success or NULL on failure;
	 *          call SDL_GetError() for more information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CloseIO
	 * \sa SDL_INIT_INTERFACE
	 * \sa SDL_IOFromConstMem
	 * \sa SDL_IOFromFile
	 * \sa SDL_IOFromMem
	 */"

	^ self ffiCall: #(SDL_IOStream* SDL_OpenIO(SDL_IOStreamInterface* iface, void* userdata))
]

{ #category : 'public' }
LibSDL3 >> openJoystick: instance_id [
	"/**
	 * Open a joystick for use.
	 *
	 * The joystick subsystem must be initialized before a joystick can be opened
	 * for use.
	 *
	 * \param instance_id the joystick instance ID.
	 * \returns a joystick identifier or NULL on failure; call SDL_GetError() for
	 *          more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CloseJoystick
	 */"

	^ self ffiCall: #(SDL_Joystick* SDL_OpenJoystick(SDL_JoystickID instance_id))
]

{ #category : 'public' }
LibSDL3 >> openSensor: instance_id [
	"/**
	 * Open a sensor for use.
	 *
	 * \param instance_id the sensor instance ID.
	 * \returns an SDL_Sensor object or NULL on failure; call SDL_GetError() for
	 *          more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_Sensor* SDL_OpenSensor(SDL_SensorID instance_id))
]

{ #category : 'public' }
LibSDL3 >> openURL: url [
	"/**
	 * Open a URL/URI in the browser or other appropriate external application.
	 *
	 * Open a URL in a separate, system-provided application. How this works will
	 * vary wildly depending on the platform. This will likely launch what makes
	 * sense to handle a specific URL's protocol (a web browser for `http://`,
	 * etc), but it might also be able to launch file managers for directories and
	 * other things.
	 *
	 * What happens when you open a URL varies wildly as well: your game window
	 * may lose focus (and may or may not lose focus if your game was fullscreen
	 * or grabbing input at the time). On mobile devices, your app will likely
	 * move to the background or your process might be paused. Any given platform
	 * may or may not handle a given URL.
	 *
	 * If this is unimplemented (or simply unavailable) for a platform, this will
	 * fail with an error. A successful result does not mean the URL loaded, just
	 * that we launched _something_ to handle it (or at least believe we did).
	 *
	 * All this to say: this function can be useful, but you should definitely
	 * test it on every platform you target.
	 *
	 * \param url a valid URL/URI to open. Use `file:///full/path/to/file` for
	 *            local files, if supported.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_OpenURL(const char* url))
]

{ #category : 'public' }
LibSDL3 >> outOfMemory [
	"/**
	 * Set an error indicating that memory allocation failed.
	 *
	 * This function does not do any memory allocation.
	 *
	 * \returns false.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_OutOfMemory())
]

{ #category : 'public' }
LibSDL3 >> pauseAudioDevice: devid [
	"/**
	 * Use this function to pause audio playback on a specified device.
	 *
	 * This function pauses audio processing for a given device. Any bound audio
	 * streams will not progress, and no audio will be generated. Pausing one
	 * device does not prevent other unpaused devices from running.
	 *
	 * Unlike in SDL2, audio devices start in an _unpaused_ state, since an app
	 * has to bind a stream before any audio will flow. Pausing a paused device is
	 * a legal no-op.
	 *
	 * Pausing a device can be useful to halt all audio without unbinding all the
	 * audio streams. This might be useful while a game is paused, or a level is
	 * loading, etc.
	 *
	 * Physical devices can not be paused or unpaused, only logical devices
	 * created through SDL_OpenAudioDevice() can be.
	 *
	 * \param devid a device opened by SDL_OpenAudioDevice().
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_ResumeAudioDevice
	 * \sa SDL_AudioDevicePaused
	 */"

	^ self ffiCall: #(bool SDL_PauseAudioDevice(SDL_AudioDeviceID devid))
]

{ #category : 'public' }
LibSDL3 >> pauseAudioStreamDevice: stream [
	"/**
	 * Use this function to pause audio playback on the audio device associated
	 * with an audio stream.
	 *
	 * This function pauses audio processing for a given device. Any bound audio
	 * streams will not progress, and no audio will be generated. Pausing one
	 * device does not prevent other unpaused devices from running.
	 *
	 * Pausing a device can be useful to halt all audio without unbinding all the
	 * audio streams. This might be useful while a game is paused, or a level is
	 * loading, etc.
	 *
	 * \param stream the audio stream associated with the audio device to pause.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_ResumeAudioStreamDevice
	 */"

	^ self ffiCall: #(bool SDL_PauseAudioStreamDevice(SDL_AudioStream* stream))
]

{ #category : 'public' }
LibSDL3 >> peepEvents: events numevents: numevents action: action minType: minType maxType: maxType [
	"/**
	 * Check the event queue for messages and optionally return them.
	 *
	 * `action` may be any of the following:
	 *
	 * - `SDL_ADDEVENT`: up to `numevents` events will be added to the back of the
	 *   event queue.
	 * - `SDL_PEEKEVENT`: `numevents` events at the front of the event queue,
	 *   within the specified minimum and maximum type, will be returned to the
	 *   caller and will _not_ be removed from the queue. If you pass NULL for
	 *   `events`, then `numevents` is ignored and the total number of matching
	 *   events will be returned.
	 * - `SDL_GETEVENT`: up to `numevents` events at the front of the event queue,
	 *   within the specified minimum and maximum type, will be returned to the
	 *   caller and will be removed from the queue.
	 *
	 * You may have to call SDL_PumpEvents() before calling this function.
	 * Otherwise, the events may not be ready to be filtered when you call
	 * SDL_PeepEvents().
	 *
	 * \param events destination buffer for the retrieved events, may be NULL to
	 *               leave the events in the queue and return the number of events
	 *               that would have been stored.
	 * \param numevents if action is SDL_ADDEVENT, the number of events to add
	 *                  back to the event queue; if action is SDL_PEEKEVENT or
	 *                  SDL_GETEVENT, the maximum number of events to retrieve.
	 * \param action action to take; see [Remarks](#remarks) for details.
	 * \param minType minimum value of the event type to be considered;
	 *                SDL_EVENT_FIRST is a safe choice.
	 * \param maxType maximum value of the event type to be considered;
	 *                SDL_EVENT_LAST is a safe choice.
	 * \returns the number of events actually stored or -1 on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_PollEvent
	 * \sa SDL_PumpEvents
	 * \sa SDL_PushEvent
	 */"

	^ self ffiCall: #(int SDL_PeepEvents(SDL_Event* events, int numevents, SDL_EventAction action, Uint32 minType, Uint32 maxType))
]

{ #category : 'public' }
LibSDL3 >> pointInRectFloatP: p r: r [
	"/**
	 * Determine whether a point resides inside a floating point rectangle.
	 *
	 * A point is considered part of a rectangle if both `p` and `r` are not NULL,
	 * and `p`'s x and y coordinates are >= to the rectangle's top left corner,
	 * and <= the rectangle's x+w and y+h. So a 1x1 rectangle considers point
	 * (0,0) and (0,1) as ""inside"" and (0,2) as not.
	 *
	 * Note that this is a forced-inline function in a header, and not a public
	 * API function available in the SDL library (which is to say, the code is
	 * embedded in the calling program and the linker and dynamic loader will not
	 * be able to find this function inside SDL itself).
	 *
	 * \param p the point to test.
	 * \param r the rectangle to test.
	 * \returns true if `p` is contained by `r`, false otherwise.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_PointInRectFloat(SDL_FPoint* p, SDL_FRect* r))
]

{ #category : 'public' }
LibSDL3 >> pointInRectP: p r: r [
	"/**
	 * Determine whether a point resides inside a rectangle.
	 *
	 * A point is considered part of a rectangle if both `p` and `r` are not NULL,
	 * and `p`'s x and y coordinates are >= to the rectangle's top left corner,
	 * and < the rectangle's x+w and y+h. So a 1x1 rectangle considers point (0,0)
	 * as ""inside"" and (0,1) as not.
	 *
	 * Note that this is a forced-inline function in a header, and not a public
	 * API function available in the SDL library (which is to say, the code is
	 * embedded in the calling program and the linker and dynamic loader will not
	 * be able to find this function inside SDL itself).
	 *
	 * \param p the point to test.
	 * \param r the rectangle to test.
	 * \returns true if `p` is contained by `r`, false otherwise.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_PointInRect(SDL_Point* p, SDL_Rect* r))
]

{ #category : 'public' }
LibSDL3 >> pollEvent: event [
	"/**
	 * Poll for currently pending events.
	 *
	 * If `event` is not NULL, the next event is removed from the queue and stored
	 * in the SDL_Event structure pointed to by `event`. The 1 returned refers to
	 * this event, immediately stored in the SDL Event structure -- not an event
	 * to follow.
	 *
	 * If `event` is NULL, it simply returns 1 if there is an event in the queue,
	 * but will not remove it from the queue.
	 *
	 * As this function may implicitly call SDL_PumpEvents(), you can only call
	 * this function in the thread that set the video mode.
	 *
	 * SDL_PollEvent() is the favored way of receiving system events since it can
	 * be done from the main loop and does not suspend the main loop while waiting
	 * on an event to be posted.
	 *
	 * The common practice is to fully process the event queue once every frame,
	 * usually as a first step before updating the game's state:
	 *
	 * ```c
	 * while (game_is_still_running) {
	 *     SDL_Event event;
	 *     while (SDL_PollEvent(&event)) {  // poll until all events are handled!
	 *         // decide what to do with this event.
	 *     }
	 *
	 *     // update game state, draw the current frame
	 * }
	 * ```
	 *
	 * \param event the SDL_Event structure to be filled with the next event from
	 *              the queue, or NULL.
	 * \returns true if this got an event or false if there are none available.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_PushEvent
	 * \sa SDL_WaitEvent
	 * \sa SDL_WaitEventTimeout
	 */"

	^ self ffiCall: #(bool SDL_PollEvent(SDL_Event* event))
]

{ #category : 'public' }
LibSDL3 >> popGPUDebugGroup: command_buffer [
	"/**
	 * Ends the most-recently pushed debug group.
	 *
	 * \param command_buffer a command buffer.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_PushGPUDebugGroup
	 */"

	self ffiCall: #(void SDL_PopGPUDebugGroup(SDL_GPUCommandBuffer* command_buffer))
]

{ #category : 'public' }
LibSDL3 >> powX: x y: y [
	"/**
	 * Raise `x` to the power `y`
	 *
	 * Domain: `-INF <= x <= INF`, `-INF <= y <= INF`
	 *
	 * Range: `-INF <= z <= INF`
	 *
	 * If `y` is the base of the natural logarithm (e), consider using SDL_exp
	 * instead.
	 *
	 * This function operates on double-precision floating point values, use
	 * SDL_powf for single-precision floats.
	 *
	 * This function may use a different approximation across different versions,
	 * platforms and configurations. i.e, it can return a different value given
	 * the same input on different machines or operating systems, or if SDL is
	 * updated.
	 *
	 * \param x the base.
	 * \param y the exponent.
	 * \returns `x` raised to the power `y`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_powf
	 * \sa SDL_exp
	 * \sa SDL_log
	 */"

	^ self ffiCall: #(double SDL_pow(double x, double y))
]

{ #category : 'public' }
LibSDL3 >> powfX: x y: y [
	"/**
	 * Raise `x` to the power `y`
	 *
	 * Domain: `-INF <= x <= INF`, `-INF <= y <= INF`
	 *
	 * Range: `-INF <= z <= INF`
	 *
	 * If `y` is the base of the natural logarithm (e), consider using SDL_exp
	 * instead.
	 *
	 * This function operates on single-precision floating point values, use
	 * SDL_pow for double-precision floats.
	 *
	 * This function may use a different approximation across different versions,
	 * platforms and configurations. i.e, it can return a different value given
	 * the same input on different machines or operating systems, or if SDL is
	 * updated.
	 *
	 * \param x the base.
	 * \param y the exponent.
	 * \returns `x` raised to the power `y`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_pow
	 * \sa SDL_expf
	 * \sa SDL_logf
	 */"

	^ self ffiCall: #(float SDL_powf(float x, float y))
]

{ #category : 'public' }
LibSDL3 >> premultiplyAlphaWidth: width height: height srcFormat: src_format src: src srcPitch: src_pitch dstFormat: dst_format dst: dst dstPitch: dst_pitch linear: linear [
	"/**
	 * Premultiply the alpha on a block of pixels.
	 *
	 * This is safe to use with src == dst, but not for other overlapping areas.
	 *
	 * \param width the width of the block to convert, in pixels.
	 * \param height the height of the block to convert, in pixels.
	 * \param src_format an SDL_PixelFormat value of the `src` pixels format.
	 * \param src a pointer to the source pixels.
	 * \param src_pitch the pitch of the source pixels, in bytes.
	 * \param dst_format an SDL_PixelFormat value of the `dst` pixels format.
	 * \param dst a pointer to be filled in with premultiplied pixel data.
	 * \param dst_pitch the pitch of the destination pixels, in bytes.
	 * \param linear true to convert from sRGB to linear space for the alpha
	 *               multiplication, false to do multiplication in sRGB space.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety The same destination pixels should not be used from two
	 *               threads at once. It is safe to use the same source pixels
	 *               from multiple threads.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_PremultiplyAlpha(int width, int height, SDL_PixelFormat src_format, const void* src, int src_pitch, SDL_PixelFormat dst_format, void* dst, int dst_pitch, _Bool linear))
]

{ #category : 'public' }
LibSDL3 >> premultiplySurfaceAlphaSurface: surface linear: linear [
	"/**
	 * Premultiply the alpha in a surface.
	 *
	 * This is safe to use with src == dst, but not for other overlapping areas.
	 *
	 * \param surface the surface to modify.
	 * \param linear true to convert from sRGB to linear space for the alpha
	 *               multiplication, false to do multiplication in sRGB space.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_PremultiplySurfaceAlpha(SDL_Surface* surface, _Bool linear))
]

{ #category : 'public' }
LibSDL3 >> pumpEvents [
	"/**
	 * Pump the event loop, gathering events from the input devices.
	 *
	 * This function updates the event queue and internal input device state.
	 *
	 * SDL_PumpEvents() gathers all the pending input information from devices and
	 * places it in the event queue. Without calls to SDL_PumpEvents() no events
	 * would ever be placed on the queue. Often the need for calls to
	 * SDL_PumpEvents() is hidden from the user since SDL_PollEvent() and
	 * SDL_WaitEvent() implicitly call SDL_PumpEvents(). However, if you are not
	 * polling or waiting for events (e.g. you are filtering them), then you must
	 * call SDL_PumpEvents() to force an event queue update.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_PollEvent
	 * \sa SDL_WaitEvent
	 */"

	self ffiCall: #(void SDL_PumpEvents())
]

{ #category : 'public' }
LibSDL3 >> pushEvent: event [
	"/**
	 * Add an event to the event queue.
	 *
	 * The event queue can actually be used as a two way communication channel.
	 * Not only can events be read from the queue, but the user can also push
	 * their own events onto it. `event` is a pointer to the event structure you
	 * wish to push onto the queue. The event is copied into the queue, and the
	 * caller may dispose of the memory pointed to after SDL_PushEvent() returns.
	 *
	 * Note: Pushing device input events onto the queue doesn't modify the state
	 * of the device within SDL.
	 *
	 * Note: Events pushed onto the queue with SDL_PushEvent() get passed through
	 * the event filter but events added with SDL_PeepEvents() do not.
	 *
	 * For pushing application-specific events, please use SDL_RegisterEvents() to
	 * get an event type that does not conflict with other code that also wants
	 * its own custom event types.
	 *
	 * \param event the SDL_Event to be added to the queue.
	 * \returns true on success, false if the event was filtered or on failure;
	 *          call SDL_GetError() for more information. A common reason for
	 *          error is the event queue being full.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_PeepEvents
	 * \sa SDL_PollEvent
	 * \sa SDL_RegisterEvents
	 */"

	^ self ffiCall: #(bool SDL_PushEvent(SDL_Event* event))
]

{ #category : 'public' }
LibSDL3 >> pushGPUComputeUniformDataCommandBuffer: command_buffer slotIndex: slot_index data: data length: length [
	"/**
	 * Pushes data to a uniform slot on the command buffer.
	 *
	 * Subsequent draw calls will use this uniform data.
	 *
	 * The data being pushed must respect std140 layout conventions. In practical
	 * terms this means you must ensure that vec3 and vec4 fields are 16-byte
	 * aligned.
	 *
	 * \param command_buffer a command buffer.
	 * \param slot_index the uniform slot to push data to.
	 * \param data client data to write.
	 * \param length the length of the data to write.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_PushGPUComputeUniformData(SDL_GPUCommandBuffer* command_buffer, Uint32 slot_index, const void* data, Uint32 length))
]

{ #category : 'public' }
LibSDL3 >> pushGPUDebugGroupCommandBuffer: command_buffer name: name [
	"/**
	 * Begins a debug group with an arbitary name.
	 *
	 * Used for denoting groups of calls when viewing the command buffer
	 * callstream in a graphics debugging tool.
	 *
	 * Each call to SDL_PushGPUDebugGroup must have a corresponding call to
	 * SDL_PopGPUDebugGroup.
	 *
	 * On some backends (e.g. Metal), pushing a debug group during a
	 * render/blit/compute pass will create a group that is scoped to the native
	 * pass rather than the command buffer. For best results, if you push a debug
	 * group during a pass, always pop it in the same pass.
	 *
	 * \param command_buffer a command buffer.
	 * \param name a UTF-8 string constant that names the group.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_PopGPUDebugGroup
	 */"

	self ffiCall: #(void SDL_PushGPUDebugGroup(SDL_GPUCommandBuffer* command_buffer, const char* name))
]

{ #category : 'public' }
LibSDL3 >> pushGPUFragmentUniformDataCommandBuffer: command_buffer slotIndex: slot_index data: data length: length [
	"/**
	 * Pushes data to a fragment uniform slot on the command buffer.
	 *
	 * Subsequent draw calls will use this uniform data.
	 *
	 * The data being pushed must respect std140 layout conventions. In practical
	 * terms this means you must ensure that vec3 and vec4 fields are 16-byte
	 * aligned.
	 *
	 * \param command_buffer a command buffer.
	 * \param slot_index the fragment uniform slot to push data to.
	 * \param data client data to write.
	 * \param length the length of the data to write.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_PushGPUFragmentUniformData(SDL_GPUCommandBuffer* command_buffer, Uint32 slot_index, const void* data, Uint32 length))
]

{ #category : 'public' }
LibSDL3 >> pushGPUVertexUniformDataCommandBuffer: command_buffer slotIndex: slot_index data: data length: length [
	"/**
	 * Pushes data to a vertex uniform slot on the command buffer.
	 *
	 * Subsequent draw calls will use this uniform data.
	 *
	 * The data being pushed must respect std140 layout conventions. In practical
	 * terms this means you must ensure that vec3 and vec4 fields are 16-byte
	 * aligned.
	 *
	 * \param command_buffer a command buffer.
	 * \param slot_index the vertex uniform slot to push data to.
	 * \param data client data to write.
	 * \param length the length of the data to write.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_PushGPUVertexUniformData(SDL_GPUCommandBuffer* command_buffer, Uint32 slot_index, const void* data, Uint32 length))
]

{ #category : 'public' }
LibSDL3 >> putAudioStreamDataStream: stream buf: buf len: len [
	"/**
	 * Add data to the stream.
	 *
	 * This data must match the format/channels/samplerate specified in the latest
	 * call to SDL_SetAudioStreamFormat, or the format specified when creating the
	 * stream if it hasn't been changed.
	 *
	 * Note that this call simply copies the unconverted data for later. This is
	 * different than SDL2, where data was converted during the Put call and the
	 * Get call would just dequeue the previously-converted data.
	 *
	 * \param stream the stream the audio data is being added to.
	 * \param buf a pointer to the audio data to add.
	 * \param len the number of bytes to write to the stream.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread, but if the
	 *               stream has a callback set, the caller might need to manage
	 *               extra locking.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_ClearAudioStream
	 * \sa SDL_FlushAudioStream
	 * \sa SDL_GetAudioStreamData
	 * \sa SDL_GetAudioStreamQueued
	 */"

	^ self ffiCall: #(bool SDL_PutAudioStreamData(SDL_AudioStream* stream, const void* buf, int len))
]

{ #category : 'public' }
LibSDL3 >> qsortBase: base nmemb: nmemb size: size compare: compare [
	"/**
	 * Sort an array.
	 *
	 * For example:
	 *
	 * ```c
	 * typedef struct {
	 *     int key;
	 *     const char *string;
	 * } data;
	 *
	 * int SDLCALL compare(const void *a, const void *b)
	 * {
	 *     const data *A = (const data *)a;
	 *     const data *B = (const data *)b;
	 *
	 *     if (A->n < B->n) {
	 *         return -1;
	 *     } else if (B->n < A->n) {
	 *         return 1;
	 *     } else {
	 *         return 0;
	 *     }
	 * }
	 *
	 * data values[] = {
	 *     { 3, ""third"" }, { 1, ""first"" }, { 2, ""second"" }
	 * };
	 *
	 * SDL_qsort(values, SDL_arraysize(values), sizeof(values[0]), compare);
	 * ```
	 *
	 * \param base a pointer to the start of the array.
	 * \param nmemb the number of elements in the array.
	 * \param size the size of the elements in the array.
	 * \param compare a function used to compare elements in the array.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_bsearch
	 * \sa SDL_qsort_r
	 */"

	self ffiCall: #(void SDL_qsort(void* base, size_t nmemb, size_t size, SDL_CompareCallback compare))
]

{ #category : 'public' }
LibSDL3 >> qsortRBase: base nmemb: nmemb size: size compare: compare userdata: userdata [
	"/**
	 * Sort an array, passing a userdata pointer to the compare function.
	 *
	 * For example:
	 *
	 * ```c
	 * typedef enum {
	 *     sort_increasing,
	 *     sort_decreasing,
	 * } sort_method;
	 *
	 * typedef struct {
	 *     int key;
	 *     const char *string;
	 * } data;
	 *
	 * int SDLCALL compare(const void *userdata, const void *a, const void *b)
	 * {
	 *     sort_method method = (sort_method)(uintptr_t)userdata;
	 *     const data *A = (const data *)a;
	 *     const data *B = (const data *)b;
	 *
	 *     if (A->key < B->key) {
	 *         return (method == sort_increasing) ? -1 : 1;
	 *     } else if (B->key < A->key) {
	 *         return (method == sort_increasing) ? 1 : -1;
	 *     } else {
	 *         return 0;
	 *     }
	 * }
	 *
	 * data values[] = {
	 *     { 3, ""third"" }, { 1, ""first"" }, { 2, ""second"" }
	 * };
	 *
	 * SDL_qsort_r(values, SDL_arraysize(values), sizeof(values[0]), compare, (const void *)(uintptr_t)sort_increasing);
	 * ```
	 *
	 * \param base a pointer to the start of the array.
	 * \param nmemb the number of elements in the array.
	 * \param size the size of the elements in the array.
	 * \param compare a function used to compare elements in the array.
	 * \param userdata a pointer to pass to the compare function.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_bsearch_r
	 * \sa SDL_qsort
	 */"

	self ffiCall: #(void SDL_qsort_r(void* base, size_t nmemb, size_t size, SDL_CompareCallback_r compare, void* userdata))
]

{ #category : 'public' }
LibSDL3 >> queryGPUFenceDevice: device fence: fence [
	"/**
	 * Checks the status of a fence.
	 *
	 * \param device a GPU context.
	 * \param fence a fence.
	 * \returns true if the fence is signaled, false if it is not.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SubmitGPUCommandBufferAndAcquireFence
	 */"

	^ self ffiCall: #(bool SDL_QueryGPUFence(SDL_GPUDevice* device, SDL_GPUFence* fence))
]

{ #category : 'public' }
LibSDL3 >> quit [
	"/**
	 * Clean up all initialized subsystems.
	 *
	 * You should call this function even if you have already shutdown each
	 * initialized subsystem with SDL_QuitSubSystem(). It is safe to call this
	 * function even in the case of errors in initialization.
	 *
	 * You can use this function with atexit() to ensure that it is run when your
	 * application is shutdown, but it is not wise to do this from a library or
	 * other dynamically loaded code.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_Init
	 * \sa SDL_QuitSubSystem
	 */"

	self ffiCall: #(void SDL_Quit())
]

{ #category : 'public' }
LibSDL3 >> quitSubSystem: flags [
	"/**
	 * Shut down specific SDL subsystems.
	 *
	 * You still need to call SDL_Quit() even if you close all open subsystems
	 * with SDL_QuitSubSystem().
	 *
	 * \param flags any of the flags used by SDL_Init(); see SDL_Init for details.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_InitSubSystem
	 * \sa SDL_Quit
	 */"

	self ffiCall: #(void SDL_QuitSubSystem(SDL_InitFlags flags))
]

{ #category : 'public' }
LibSDL3 >> raiseWindow: window [
	"/**
	 * Request that a window be raised above other windows and gain the input
	 * focus.
	 *
	 * The result of this request is subject to desktop window manager policy,
	 * particularly if raising the requested window would result in stealing focus
	 * from another application. If the window is successfully raised and gains
	 * input focus, an SDL_EVENT_WINDOW_FOCUS_GAINED event will be emitted, and
	 * the window will have the SDL_WINDOW_INPUT_FOCUS flag set.
	 *
	 * \param window the window to raise.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_RaiseWindow(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> rand: n [
	"/**
	 * Generate a pseudo-random number less than n for positive n
	 *
	 * The method used is faster and of better quality than `rand() % n`. Odds are
	 * roughly 99.9% even for n = 1 million. Evenness is better for smaller n, and
	 * much worse as n gets bigger.
	 *
	 * Example: to simulate a d6 use `SDL_rand(6) + 1` The +1 converts 0..5 to
	 * 1..6
	 *
	 * If you want to generate a pseudo-random number in the full range of Sint32,
	 * you should use: (Sint32)SDL_rand_bits()
	 *
	 * If you want reproducible output, be sure to initialize with SDL_srand()
	 * first.
	 *
	 * There are no guarantees as to the quality of the random sequence produced,
	 * and this should not be used for security (cryptography, passwords) or where
	 * money is on the line (loot-boxes, casinos). There are many random number
	 * libraries available with different characteristics and you should pick one
	 * of those to meet any serious needs.
	 *
	 * \param n the number of possible outcomes. n must be positive.
	 * \returns a random value in the range of [0 .. n-1].
	 *
	 * \threadsafety All calls should be made from a single thread
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_srand
	 * \sa SDL_randf
	 */"

	^ self ffiCall: #(Sint32 SDL_rand(Sint32 n))
]

{ #category : 'public' }
LibSDL3 >> randBits [
	"/**
	 * Generate 32 pseudo-random bits.
	 *
	 * You likely want to use SDL_rand() to get a psuedo-random number instead.
	 *
	 * There are no guarantees as to the quality of the random sequence produced,
	 * and this should not be used for security (cryptography, passwords) or where
	 * money is on the line (loot-boxes, casinos). There are many random number
	 * libraries available with different characteristics and you should pick one
	 * of those to meet any serious needs.
	 *
	 * \returns a random value in the range of [0-SDL_MAX_UINT32].
	 *
	 * \threadsafety All calls should be made from a single thread
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_rand
	 * \sa SDL_randf
	 * \sa SDL_srand
	 */"

	^ self ffiCall: #(Uint32 SDL_rand_bits())
]

{ #category : 'public' }
LibSDL3 >> randBitsR: state [
	"/**
	 * Generate 32 pseudo-random bits.
	 *
	 * You likely want to use SDL_rand_r() to get a psuedo-random number instead.
	 *
	 * There are no guarantees as to the quality of the random sequence produced,
	 * and this should not be used for security (cryptography, passwords) or where
	 * money is on the line (loot-boxes, casinos). There are many random number
	 * libraries available with different characteristics and you should pick one
	 * of those to meet any serious needs.
	 *
	 * \param state a pointer to the current random number state, this may not be
	 *              NULL.
	 * \returns a random value in the range of [0-SDL_MAX_UINT32].
	 *
	 * \threadsafety This function is thread-safe, as long as the state pointer
	 *               isn't shared between threads.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_rand_r
	 * \sa SDL_randf_r
	 */"

	^ self ffiCall: #(Uint32 SDL_rand_bits_r(Uint64* state))
]

{ #category : 'public' }
LibSDL3 >> randRState: state n: n [
	"/**
	 * Generate a pseudo-random number less than n for positive n
	 *
	 * The method used is faster and of better quality than `rand() % n`. Odds are
	 * roughly 99.9% even for n = 1 million. Evenness is better for smaller n, and
	 * much worse as n gets bigger.
	 *
	 * Example: to simulate a d6 use `SDL_rand_r(state, 6) + 1` The +1 converts
	 * 0..5 to 1..6
	 *
	 * If you want to generate a pseudo-random number in the full range of Sint32,
	 * you should use: (Sint32)SDL_rand_bits_r(state)
	 *
	 * There are no guarantees as to the quality of the random sequence produced,
	 * and this should not be used for security (cryptography, passwords) or where
	 * money is on the line (loot-boxes, casinos). There are many random number
	 * libraries available with different characteristics and you should pick one
	 * of those to meet any serious needs.
	 *
	 * \param state a pointer to the current random number state, this may not be
	 *              NULL.
	 * \param n the number of possible outcomes. n must be positive.
	 * \returns a random value in the range of [0 .. n-1].
	 *
	 * \threadsafety This function is thread-safe, as long as the state pointer
	 *               isn't shared between threads.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_rand
	 * \sa SDL_rand_bits_r
	 * \sa SDL_randf_r
	 */"

	^ self ffiCall: #(Sint32 SDL_rand_r(Uint64* state, Sint32 n))
]

{ #category : 'public' }
LibSDL3 >> randf [
	"/**
	 * Generate a uniform pseudo-random floating point number less than 1.0
	 *
	 * If you want reproducible output, be sure to initialize with SDL_srand()
	 * first.
	 *
	 * There are no guarantees as to the quality of the random sequence produced,
	 * and this should not be used for security (cryptography, passwords) or where
	 * money is on the line (loot-boxes, casinos). There are many random number
	 * libraries available with different characteristics and you should pick one
	 * of those to meet any serious needs.
	 *
	 * \returns a random value in the range of [0.0, 1.0).
	 *
	 * \threadsafety All calls should be made from a single thread
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_srand
	 * \sa SDL_rand
	 */"

	^ self ffiCall: #(float SDL_randf())
]

{ #category : 'public' }
LibSDL3 >> randfR: state [
	"/**
	 * Generate a uniform pseudo-random floating point number less than 1.0
	 *
	 * If you want reproducible output, be sure to initialize with SDL_srand()
	 * first.
	 *
	 * There are no guarantees as to the quality of the random sequence produced,
	 * and this should not be used for security (cryptography, passwords) or where
	 * money is on the line (loot-boxes, casinos). There are many random number
	 * libraries available with different characteristics and you should pick one
	 * of those to meet any serious needs.
	 *
	 * \param state a pointer to the current random number state, this may not be
	 *              NULL.
	 * \returns a random value in the range of [0.0, 1.0).
	 *
	 * \threadsafety This function is thread-safe, as long as the state pointer
	 *               isn't shared between threads.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_rand_bits_r
	 * \sa SDL_rand_r
	 * \sa SDL_randf
	 */"

	^ self ffiCall: #(float SDL_randf_r(Uint64* state))
]

{ #category : 'public' }
LibSDL3 >> readAsyncIO: asyncio ptr: ptr offset: offset size: size queue: queue userdata: userdata [
	"/**
	 * Start an async read.
	 *
	 * This function reads up to `size` bytes from `offset` position in the data
	 * source to the area pointed at by `ptr`. This function may read less bytes
	 * than requested.
	 *
	 * This function returns as quickly as possible; it does not wait for the read
	 * to complete. On a successful return, this work will continue in the
	 * background. If the work begins, even failure is asynchronous: a failing
	 * return value from this function only means the work couldn't start at all.
	 *
	 * `ptr` must remain available until the work is done, and may be accessed by
	 * the system at any time until then. Do not allocate it on the stack, as this
	 * might take longer than the life of the calling function to complete!
	 *
	 * An SDL_AsyncIOQueue must be specified. The newly-created task will be added
	 * to it when it completes its work.
	 *
	 * \param asyncio a pointer to an SDL_AsyncIO structure.
	 * \param ptr a pointer to a buffer to read data into.
	 * \param offset the position to start reading in the data source.
	 * \param size the number of bytes to read from the data source.
	 * \param queue a queue to add the new SDL_AsyncIO to.
	 * \param userdata an app-defined pointer that will be provided with the task
	 *                 results.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_WriteAsyncIO
	 * \sa SDL_CreateAsyncIOQueue
	 */"

	^ self ffiCall: #(bool SDL_ReadAsyncIO(SDL_AsyncIO* asyncio, void* ptr, Uint64 offset, Uint64 size, SDL_AsyncIOQueue* queue, void* userdata))
]

{ #category : 'public' }
LibSDL3 >> readIOContext: context ptr: ptr size: size [
	"/**
	 * Read from a data source.
	 *
	 * This function reads up `size` bytes from the data source to the area
	 * pointed at by `ptr`. This function may read less bytes than requested.
	 *
	 * This function will return zero when the data stream is completely read, and
	 * SDL_GetIOStatus() will return SDL_IO_STATUS_EOF. If zero is returned and
	 * the stream is not at EOF, SDL_GetIOStatus() will return a different error
	 * value and SDL_GetError() will offer a human-readable message.
	 *
	 * \param context a pointer to an SDL_IOStream structure.
	 * \param ptr a pointer to a buffer to read data into.
	 * \param size the number of bytes to read from the data source.
	 * \returns the number of bytes read, or 0 on end of file or other failure;
	 *          call SDL_GetError() for more information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_WriteIO
	 * \sa SDL_GetIOStatus
	 */"

	^ self ffiCall: #(size_t SDL_ReadIO(SDL_IOStream* context, void* ptr, size_t size))
]

{ #category : 'public' }
LibSDL3 >> readS16BESrc: src value: value [
	"/**
	 * Use this function to read 16 bits of big-endian data from an SDL_IOStream
	 * and return in native format.
	 *
	 * SDL byteswaps the data only if necessary, so the data returned will be in
	 * the native byte order.
	 *
	 * This function will return false when the data stream is completely read,
	 * and SDL_GetIOStatus() will return SDL_IO_STATUS_EOF. If false is returned
	 * and the stream is not at EOF, SDL_GetIOStatus() will return a different
	 * error value and SDL_GetError() will offer a human-readable message.
	 *
	 * \param src the stream from which to read data.
	 * \param value a pointer filled in with the data read.
	 * \returns true on successful write or false on failure; call SDL_GetError()
	 *          for more information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_ReadS16BE(SDL_IOStream* src, Sint16* value))
]

{ #category : 'public' }
LibSDL3 >> readS16LESrc: src value: value [
	"/**
	 * Use this function to read 16 bits of little-endian data from an
	 * SDL_IOStream and return in native format.
	 *
	 * SDL byteswaps the data only if necessary, so the data returned will be in
	 * the native byte order.
	 *
	 * This function will return false when the data stream is completely read,
	 * and SDL_GetIOStatus() will return SDL_IO_STATUS_EOF. If false is returned
	 * and the stream is not at EOF, SDL_GetIOStatus() will return a different
	 * error value and SDL_GetError() will offer a human-readable message.
	 *
	 * \param src the stream from which to read data.
	 * \param value a pointer filled in with the data read.
	 * \returns true on successful write or false on failure; call SDL_GetError()
	 *          for more information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_ReadS16LE(SDL_IOStream* src, Sint16* value))
]

{ #category : 'public' }
LibSDL3 >> readS32BESrc: src value: value [
	"/**
	 * Use this function to read 32 bits of big-endian data from an SDL_IOStream
	 * and return in native format.
	 *
	 * SDL byteswaps the data only if necessary, so the data returned will be in
	 * the native byte order.
	 *
	 * This function will return false when the data stream is completely read,
	 * and SDL_GetIOStatus() will return SDL_IO_STATUS_EOF. If false is returned
	 * and the stream is not at EOF, SDL_GetIOStatus() will return a different
	 * error value and SDL_GetError() will offer a human-readable message.
	 *
	 * \param src the stream from which to read data.
	 * \param value a pointer filled in with the data read.
	 * \returns true on successful write or false on failure; call SDL_GetError()
	 *          for more information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_ReadS32BE(SDL_IOStream* src, Sint32* value))
]

{ #category : 'public' }
LibSDL3 >> readS32LESrc: src value: value [
	"/**
	 * Use this function to read 32 bits of little-endian data from an
	 * SDL_IOStream and return in native format.
	 *
	 * SDL byteswaps the data only if necessary, so the data returned will be in
	 * the native byte order.
	 *
	 * This function will return false when the data stream is completely read,
	 * and SDL_GetIOStatus() will return SDL_IO_STATUS_EOF. If false is returned
	 * and the stream is not at EOF, SDL_GetIOStatus() will return a different
	 * error value and SDL_GetError() will offer a human-readable message.
	 *
	 * \param src the stream from which to read data.
	 * \param value a pointer filled in with the data read.
	 * \returns true on successful write or false on failure; call SDL_GetError()
	 *          for more information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_ReadS32LE(SDL_IOStream* src, Sint32* value))
]

{ #category : 'public' }
LibSDL3 >> readS64BESrc: src value: value [
	"/**
	 * Use this function to read 64 bits of big-endian data from an SDL_IOStream
	 * and return in native format.
	 *
	 * SDL byteswaps the data only if necessary, so the data returned will be in
	 * the native byte order.
	 *
	 * This function will return false when the data stream is completely read,
	 * and SDL_GetIOStatus() will return SDL_IO_STATUS_EOF. If false is returned
	 * and the stream is not at EOF, SDL_GetIOStatus() will return a different
	 * error value and SDL_GetError() will offer a human-readable message.
	 *
	 * \param src the stream from which to read data.
	 * \param value a pointer filled in with the data read.
	 * \returns true on successful write or false on failure; call SDL_GetError()
	 *          for more information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_ReadS64BE(SDL_IOStream* src, Sint64* value))
]

{ #category : 'public' }
LibSDL3 >> readS64LESrc: src value: value [
	"/**
	 * Use this function to read 64 bits of little-endian data from an
	 * SDL_IOStream and return in native format.
	 *
	 * SDL byteswaps the data only if necessary, so the data returned will be in
	 * the native byte order.
	 *
	 * This function will return false when the data stream is completely read,
	 * and SDL_GetIOStatus() will return SDL_IO_STATUS_EOF. If false is returned
	 * and the stream is not at EOF, SDL_GetIOStatus() will return a different
	 * error value and SDL_GetError() will offer a human-readable message.
	 *
	 * \param src the stream from which to read data.
	 * \param value a pointer filled in with the data read.
	 * \returns true on successful write or false on failure; call SDL_GetError()
	 *          for more information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_ReadS64LE(SDL_IOStream* src, Sint64* value))
]

{ #category : 'public' }
LibSDL3 >> readS8Src: src value: value [
	"/**
	 * Use this function to read a signed byte from an SDL_IOStream.
	 *
	 * This function will return false when the data stream is completely read,
	 * and SDL_GetIOStatus() will return SDL_IO_STATUS_EOF. If false is returned
	 * and the stream is not at EOF, SDL_GetIOStatus() will return a different
	 * error value and SDL_GetError() will offer a human-readable message.
	 *
	 * \param src the SDL_IOStream to read from.
	 * \param value a pointer filled in with the data read.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_ReadS8(SDL_IOStream* src, Sint8* value))
]

{ #category : 'public' }
LibSDL3 >> readSurfacePixelFloatSurface: surface x: x y: y r: r g: g b: b a: a [
	"/**
	 * Retrieves a single pixel from a surface.
	 *
	 * This function prioritizes correctness over speed: it is suitable for unit
	 * tests, but is not intended for use in a game engine.
	 *
	 * \param surface the surface to read.
	 * \param x the horizontal coordinate, 0 <= x < width.
	 * \param y the vertical coordinate, 0 <= y < height.
	 * \param r a pointer filled in with the red channel, normally in the range
	 *          0-1, or NULL to ignore this channel.
	 * \param g a pointer filled in with the green channel, normally in the range
	 *          0-1, or NULL to ignore this channel.
	 * \param b a pointer filled in with the blue channel, normally in the range
	 *          0-1, or NULL to ignore this channel.
	 * \param a a pointer filled in with the alpha channel, normally in the range
	 *          0-1, or NULL to ignore this channel.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_ReadSurfacePixelFloat(SDL_Surface* surface, int x, int y, float* r, float* g, float* b, float* a))
]

{ #category : 'public' }
LibSDL3 >> readSurfacePixelSurface: surface x: x y: y r: r g: g b: b a: a [
	"/**
	 * Retrieves a single pixel from a surface.
	 *
	 * This function prioritizes correctness over speed: it is suitable for unit
	 * tests, but is not intended for use in a game engine.
	 *
	 * Like SDL_GetRGBA, this uses the entire 0..255 range when converting color
	 * components from pixel formats with less than 8 bits per RGB component.
	 *
	 * \param surface the surface to read.
	 * \param x the horizontal coordinate, 0 <= x < width.
	 * \param y the vertical coordinate, 0 <= y < height.
	 * \param r a pointer filled in with the red channel, 0-255, or NULL to ignore
	 *          this channel.
	 * \param g a pointer filled in with the green channel, 0-255, or NULL to
	 *          ignore this channel.
	 * \param b a pointer filled in with the blue channel, 0-255, or NULL to
	 *          ignore this channel.
	 * \param a a pointer filled in with the alpha channel, 0-255, or NULL to
	 *          ignore this channel.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_ReadSurfacePixel(SDL_Surface* surface, int x, int y, Uint8* r, Uint8* g, Uint8* b, Uint8* a))
]

{ #category : 'public' }
LibSDL3 >> readU16BESrc: src value: value [
	"/**
	 * Use this function to read 16 bits of big-endian data from an SDL_IOStream
	 * and return in native format.
	 *
	 * SDL byteswaps the data only if necessary, so the data returned will be in
	 * the native byte order.
	 *
	 * This function will return false when the data stream is completely read,
	 * and SDL_GetIOStatus() will return SDL_IO_STATUS_EOF. If false is returned
	 * and the stream is not at EOF, SDL_GetIOStatus() will return a different
	 * error value and SDL_GetError() will offer a human-readable message.
	 *
	 * \param src the stream from which to read data.
	 * \param value a pointer filled in with the data read.
	 * \returns true on successful write or false on failure; call SDL_GetError()
	 *          for more information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_ReadU16BE(SDL_IOStream* src, Uint16* value))
]

{ #category : 'public' }
LibSDL3 >> readU16LESrc: src value: value [
	"/**
	 * Use this function to read 16 bits of little-endian data from an
	 * SDL_IOStream and return in native format.
	 *
	 * SDL byteswaps the data only if necessary, so the data returned will be in
	 * the native byte order.
	 *
	 * This function will return false when the data stream is completely read,
	 * and SDL_GetIOStatus() will return SDL_IO_STATUS_EOF. If false is returned
	 * and the stream is not at EOF, SDL_GetIOStatus() will return a different
	 * error value and SDL_GetError() will offer a human-readable message.
	 *
	 * \param src the stream from which to read data.
	 * \param value a pointer filled in with the data read.
	 * \returns true on successful write or false on failure; call SDL_GetError()
	 *          for more information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_ReadU16LE(SDL_IOStream* src, Uint16* value))
]

{ #category : 'public' }
LibSDL3 >> readU32BESrc: src value: value [
	"/**
	 * Use this function to read 32 bits of big-endian data from an SDL_IOStream
	 * and return in native format.
	 *
	 * SDL byteswaps the data only if necessary, so the data returned will be in
	 * the native byte order.
	 *
	 * This function will return false when the data stream is completely read,
	 * and SDL_GetIOStatus() will return SDL_IO_STATUS_EOF. If false is returned
	 * and the stream is not at EOF, SDL_GetIOStatus() will return a different
	 * error value and SDL_GetError() will offer a human-readable message.
	 *
	 * \param src the stream from which to read data.
	 * \param value a pointer filled in with the data read.
	 * \returns true on successful write or false on failure; call SDL_GetError()
	 *          for more information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_ReadU32BE(SDL_IOStream* src, Uint32* value))
]

{ #category : 'public' }
LibSDL3 >> readU32LESrc: src value: value [
	"/**
	 * Use this function to read 32 bits of little-endian data from an
	 * SDL_IOStream and return in native format.
	 *
	 * SDL byteswaps the data only if necessary, so the data returned will be in
	 * the native byte order.
	 *
	 * This function will return false when the data stream is completely read,
	 * and SDL_GetIOStatus() will return SDL_IO_STATUS_EOF. If false is returned
	 * and the stream is not at EOF, SDL_GetIOStatus() will return a different
	 * error value and SDL_GetError() will offer a human-readable message.
	 *
	 * \param src the stream from which to read data.
	 * \param value a pointer filled in with the data read.
	 * \returns true on successful write or false on failure; call SDL_GetError()
	 *          for more information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_ReadU32LE(SDL_IOStream* src, Uint32* value))
]

{ #category : 'public' }
LibSDL3 >> readU64BESrc: src value: value [
	"/**
	 * Use this function to read 64 bits of big-endian data from an SDL_IOStream
	 * and return in native format.
	 *
	 * SDL byteswaps the data only if necessary, so the data returned will be in
	 * the native byte order.
	 *
	 * This function will return false when the data stream is completely read,
	 * and SDL_GetIOStatus() will return SDL_IO_STATUS_EOF. If false is returned
	 * and the stream is not at EOF, SDL_GetIOStatus() will return a different
	 * error value and SDL_GetError() will offer a human-readable message.
	 *
	 * \param src the stream from which to read data.
	 * \param value a pointer filled in with the data read.
	 * \returns true on successful write or false on failure; call SDL_GetError()
	 *          for more information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_ReadU64BE(SDL_IOStream* src, Uint64* value))
]

{ #category : 'public' }
LibSDL3 >> readU64LESrc: src value: value [
	"/**
	 * Use this function to read 64 bits of little-endian data from an
	 * SDL_IOStream and return in native format.
	 *
	 * SDL byteswaps the data only if necessary, so the data returned will be in
	 * the native byte order.
	 *
	 * This function will return false when the data stream is completely read,
	 * and SDL_GetIOStatus() will return SDL_IO_STATUS_EOF. If false is returned
	 * and the stream is not at EOF, SDL_GetIOStatus() will return a different
	 * error value and SDL_GetError() will offer a human-readable message.
	 *
	 * \param src the stream from which to read data.
	 * \param value a pointer filled in with the data read.
	 * \returns true on successful write or false on failure; call SDL_GetError()
	 *          for more information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_ReadU64LE(SDL_IOStream* src, Uint64* value))
]

{ #category : 'public' }
LibSDL3 >> readU8Src: src value: value [
	"/**
	 * Use this function to read a byte from an SDL_IOStream.
	 *
	 * This function will return false when the data stream is completely read,
	 * and SDL_GetIOStatus() will return SDL_IO_STATUS_EOF. If false is returned
	 * and the stream is not at EOF, SDL_GetIOStatus() will return a different
	 * error value and SDL_GetError() will offer a human-readable message.
	 *
	 * \param src the SDL_IOStream to read from.
	 * \param value a pointer filled in with the data read.
	 * \returns true on success or false on failure or EOF; call SDL_GetError()
	 *          for more information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_ReadU8(SDL_IOStream* src, Uint8* value))
]

{ #category : 'public' }
LibSDL3 >> reallocMem: mem size: size [
	"/**
	 * Change the size of allocated memory.
	 *
	 * The memory returned by this function must be freed with SDL_free().
	 *
	 * If `size` is 0, it will be set to 1. Note that this is unlike some other C
	 * runtime `realloc` implementations, which may treat `realloc(mem, 0)` the
	 * same way as `free(mem)`.
	 *
	 * If `mem` is NULL, the behavior of this function is equivalent to
	 * SDL_malloc(). Otherwise, the function can have one of three possible
	 * outcomes:
	 *
	 * - If it returns the same pointer as `mem`, it means that `mem` was resized
	 *   in place without freeing.
	 * - If it returns a different non-NULL pointer, it means that `mem` was freed
	 *   and cannot be dereferenced anymore.
	 * - If it returns NULL (indicating failure), then `mem` will remain valid and
	 *   must still be freed with SDL_free().
	 *
	 * If the allocation is successfully resized, the returned pointer is
	 * guaranteed to be aligned to either the *fundamental alignment*
	 * (`alignof(max_align_t)` in C11 and later) or `2 * sizeof(void *)`,
	 * whichever is smaller.
	 *
	 * \param mem a pointer to allocated memory to reallocate, or NULL.
	 * \param size the new size of the memory.
	 * \returns a pointer to the newly allocated memory, or NULL if allocation
	 *          failed.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_free
	 * \sa SDL_malloc
	 * \sa SDL_calloc
	 */"

	^ self ffiCall: #(void* SDL_realloc(void* mem, size_t size))
]

{ #category : 'public' }
LibSDL3 >> rectEmpty: r [
	"/**
	 * Determine whether a rectangle has no area.
	 *
	 * A rectangle is considered ""empty"" for this function if `r` is NULL, or if
	 * `r`'s width and/or height are <= 0.
	 *
	 * Note that this is a forced-inline function in a header, and not a public
	 * API function available in the SDL library (which is to say, the code is
	 * embedded in the calling program and the linker and dynamic loader will not
	 * be able to find this function inside SDL itself).
	 *
	 * \param r the rectangle to test.
	 * \returns true if the rectangle is ""empty"", false otherwise.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_RectEmpty(SDL_Rect* r))
]

{ #category : 'public' }
LibSDL3 >> rectEmptyFloat: r [
	"/**
	 * Determine whether a floating point rectangle can contain any point.
	 *
	 * A rectangle is considered ""empty"" for this function if `r` is NULL, or if
	 * `r`'s width and/or height are < 0.0f.
	 *
	 * Note that this is a forced-inline function in a header, and not a public
	 * API function available in the SDL library (which is to say, the code is
	 * embedded in the calling program and the linker and dynamic loader will not
	 * be able to find this function inside SDL itself).
	 *
	 * \param r the rectangle to test.
	 * \returns true if the rectangle is ""empty"", false otherwise.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_RectEmptyFloat(SDL_FRect* r))
]

{ #category : 'public' }
LibSDL3 >> rectToFRect: rect frect: frect [
	"/**
	 * Convert an SDL_Rect to SDL_FRect
	 *
	 * \param rect a pointer to an SDL_Rect.
	 * \param frect a pointer filled in with the floating point representation of
	 *              `rect`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_RectToFRect(SDL_Rect* rect, SDL_FRect* frect))
]

{ #category : 'public' }
LibSDL3 >> rectsEqualA: a b: b [
	"/**
	 * Determine whether two rectangles are equal.
	 *
	 * Rectangles are considered equal if both are not NULL and each of their x,
	 * y, width and height match.
	 *
	 * Note that this is a forced-inline function in a header, and not a public
	 * API function available in the SDL library (which is to say, the code is
	 * embedded in the calling program and the linker and dynamic loader will not
	 * be able to find this function inside SDL itself).
	 *
	 * \param a the first rectangle to test.
	 * \param b the second rectangle to test.
	 * \returns true if the rectangles are equal, false otherwise.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_RectsEqual(SDL_Rect* a, SDL_Rect* b))
]

{ #category : 'public' }
LibSDL3 >> rectsEqualEpsilonA: a b: b epsilon: epsilon [
	"/**
	 * Determine whether two floating point rectangles are equal, within some
	 * given epsilon.
	 *
	 * Rectangles are considered equal if both are not NULL and each of their x,
	 * y, width and height are within `epsilon` of each other. If you don't know
	 * what value to use for `epsilon`, you should call the SDL_RectsEqualFloat
	 * function instead.
	 *
	 * Note that this is a forced-inline function in a header, and not a public
	 * API function available in the SDL library (which is to say, the code is
	 * embedded in the calling program and the linker and dynamic loader will not
	 * be able to find this function inside SDL itself).
	 *
	 * \param a the first rectangle to test.
	 * \param b the second rectangle to test.
	 * \param epsilon the epsilon value for comparison.
	 * \returns true if the rectangles are equal, false otherwise.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_RectsEqualFloat
	 */"

	^ self ffiCall: #(bool SDL_RectsEqualEpsilon(SDL_FRect* a, SDL_FRect* b, float epsilon))
]

{ #category : 'public' }
LibSDL3 >> rectsEqualFloatA: a b: b [
	"/**
	 * Determine whether two floating point rectangles are equal, within a default
	 * epsilon.
	 *
	 * Rectangles are considered equal if both are not NULL and each of their x,
	 * y, width and height are within SDL_FLT_EPSILON of each other. This is often
	 * a reasonable way to compare two floating point rectangles and deal with the
	 * slight precision variations in floating point calculations that tend to pop
	 * up.
	 *
	 * Note that this is a forced-inline function in a header, and not a public
	 * API function available in the SDL library (which is to say, the code is
	 * embedded in the calling program and the linker and dynamic loader will not
	 * be able to find this function inside SDL itself).
	 *
	 * \param a the first rectangle to test.
	 * \param b the second rectangle to test.
	 * \returns true if the rectangles are equal, false otherwise.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_RectsEqualEpsilon
	 */"

	^ self ffiCall: #(bool SDL_RectsEqualFloat(SDL_FRect* a, SDL_FRect* b))
]

{ #category : 'public' }
LibSDL3 >> registerEvents: numevents [
	"/**
	 * Allocate a set of user-defined events, and return the beginning event
	 * number for that set of events.
	 *
	 * \param numevents the number of events to be allocated.
	 * \returns the beginning event number, or 0 if numevents is invalid or if
	 *          there are not enough user-defined events left.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_PushEvent
	 */"

	^ self ffiCall: #(Uint32 SDL_RegisterEvents(int numevents))
]

{ #category : 'public' }
LibSDL3 >> releaseCameraFrameCamera: camera frame: frame [
	"/**
	 * Release a frame of video acquired from a camera.
	 *
	 * Let the back-end re-use the internal buffer for camera.
	 *
	 * This function _must_ be called only on surface objects returned by
	 * SDL_AcquireCameraFrame(). This function should be called as quickly as
	 * possible after acquisition, as SDL keeps a small FIFO queue of surfaces for
	 * video frames; if surfaces aren't released in a timely manner, SDL may drop
	 * upcoming video frames from the camera.
	 *
	 * If the app needs to keep the surface for a significant time, they should
	 * make a copy of it and release the original.
	 *
	 * The app should not use the surface again after calling this function;
	 * assume the surface is freed and the pointer is invalid.
	 *
	 * \param camera opened camera device.
	 * \param frame the video frame surface to release.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_AcquireCameraFrame
	 */"

	self ffiCall: #(void SDL_ReleaseCameraFrame(SDL_Camera* camera, SDL_Surface* frame))
]

{ #category : 'public' }
LibSDL3 >> releaseGPUBufferDevice: device buffer: buffer [
	"/**
	 * Frees the given buffer as soon as it is safe to do so.
	 *
	 * You must not reference the buffer after calling this function.
	 *
	 * \param device a GPU context.
	 * \param buffer a buffer to be destroyed.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_ReleaseGPUBuffer(SDL_GPUDevice* device, SDL_GPUBuffer* buffer))
]

{ #category : 'public' }
LibSDL3 >> releaseGPUComputePipelineDevice: device computePipeline: compute_pipeline [
	"/**
	 * Frees the given compute pipeline as soon as it is safe to do so.
	 *
	 * You must not reference the compute pipeline after calling this function.
	 *
	 * \param device a GPU context.
	 * \param compute_pipeline a compute pipeline to be destroyed.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_ReleaseGPUComputePipeline(SDL_GPUDevice* device, SDL_GPUComputePipeline* compute_pipeline))
]

{ #category : 'public' }
LibSDL3 >> releaseGPUFenceDevice: device fence: fence [
	"/**
	 * Releases a fence obtained from SDL_SubmitGPUCommandBufferAndAcquireFence.
	 *
	 * You must not reference the fence after calling this function.
	 *
	 * \param device a GPU context.
	 * \param fence a fence.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SubmitGPUCommandBufferAndAcquireFence
	 */"

	self ffiCall: #(void SDL_ReleaseGPUFence(SDL_GPUDevice* device, SDL_GPUFence* fence))
]

{ #category : 'public' }
LibSDL3 >> releaseGPUGraphicsPipelineDevice: device graphicsPipeline: graphics_pipeline [
	"/**
	 * Frees the given graphics pipeline as soon as it is safe to do so.
	 *
	 * You must not reference the graphics pipeline after calling this function.
	 *
	 * \param device a GPU context.
	 * \param graphics_pipeline a graphics pipeline to be destroyed.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_ReleaseGPUGraphicsPipeline(SDL_GPUDevice* device, SDL_GPUGraphicsPipeline* graphics_pipeline))
]

{ #category : 'public' }
LibSDL3 >> releaseGPUSamplerDevice: device sampler: sampler [
	"/**
	 * Frees the given sampler as soon as it is safe to do so.
	 *
	 * You must not reference the sampler after calling this function.
	 *
	 * \param device a GPU context.
	 * \param sampler a sampler to be destroyed.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_ReleaseGPUSampler(SDL_GPUDevice* device, SDL_GPUSampler* sampler))
]

{ #category : 'public' }
LibSDL3 >> releaseGPUShaderDevice: device shader: shader [
	"/**
	 * Frees the given shader as soon as it is safe to do so.
	 *
	 * You must not reference the shader after calling this function.
	 *
	 * \param device a GPU context.
	 * \param shader a shader to be destroyed.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_ReleaseGPUShader(SDL_GPUDevice* device, SDL_GPUShader* shader))
]

{ #category : 'public' }
LibSDL3 >> releaseGPUTextureDevice: device texture: texture [
	"/**
	 * Frees the given texture as soon as it is safe to do so.
	 *
	 * You must not reference the texture after calling this function.
	 *
	 * \param device a GPU context.
	 * \param texture a texture to be destroyed.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_ReleaseGPUTexture(SDL_GPUDevice* device, SDL_GPUTexture* texture))
]

{ #category : 'public' }
LibSDL3 >> releaseGPUTransferBufferDevice: device transferBuffer: transfer_buffer [
	"/**
	 * Frees the given transfer buffer as soon as it is safe to do so.
	 *
	 * You must not reference the transfer buffer after calling this function.
	 *
	 * \param device a GPU context.
	 * \param transfer_buffer a transfer buffer to be destroyed.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_ReleaseGPUTransferBuffer(SDL_GPUDevice* device, SDL_GPUTransferBuffer* transfer_buffer))
]

{ #category : 'public' }
LibSDL3 >> releaseWindowFromGPUDevice: device window: window [
	"/**
	 * Unclaims a window, destroying its swapchain structure.
	 *
	 * \param device a GPU context.
	 * \param window an SDL_Window that has been claimed.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_ClaimWindowForGPUDevice
	 */"

	self ffiCall: #(void SDL_ReleaseWindowFromGPUDevice(SDL_GPUDevice* device, SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> removeEventWatchFilter: filter userdata: userdata [
	"/**
	 * Remove an event watch callback added with SDL_AddEventWatch().
	 *
	 * This function takes the same input as SDL_AddEventWatch() to identify and
	 * delete the corresponding callback.
	 *
	 * \param filter the function originally passed to SDL_AddEventWatch().
	 * \param userdata the pointer originally passed to SDL_AddEventWatch().
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_AddEventWatch
	 */"

	self ffiCall: #(void SDL_RemoveEventWatch(SDL_EventFilter filter, void* userdata))
]

{ #category : 'public' }
LibSDL3 >> removePath: path [
	"/**
	 * Remove a file or an empty directory.
	 *
	 * Directories that are not empty will fail; this function will not recursely
	 * delete directory trees.
	 *
	 * \param path the path to remove from the filesystem.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_RemovePath(const char* path))
]

{ #category : 'public' }
LibSDL3 >> removeSurfaceAlternateImages: surface [
	"/**
	 * Remove all alternate versions of a surface.
	 *
	 * This function removes a reference from all the alternative versions,
	 * destroying them if this is the last reference to them.
	 *
	 * \param surface the SDL_Surface structure to update.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_AddSurfaceAlternateImage
	 * \sa SDL_GetSurfaceImages
	 * \sa SDL_SurfaceHasAlternateImages
	 */"

	self ffiCall: #(void SDL_RemoveSurfaceAlternateImages(SDL_Surface* surface))
]

{ #category : 'public' }
LibSDL3 >> removeTimer: id [
	"/**
	 * Remove a timer created with SDL_AddTimer().
	 *
	 * \param id the ID of the timer to remove.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_AddTimer
	 */"

	^ self ffiCall: #(bool SDL_RemoveTimer(SDL_TimerID id))
]

{ #category : 'public' }
LibSDL3 >> removeTrayEntry: entry [
	"/**
	 * Removes a tray entry.
	 *
	 * \param entry The entry to be deleted.
	 *
	 * \threadsafety This function should be called on the thread that created the
	 *               tray.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetTrayEntries
	 * \sa SDL_InsertTrayEntryAt
	 */"

	self ffiCall: #(void SDL_RemoveTrayEntry(SDL_TrayEntry* entry))
]

{ #category : 'public' }
LibSDL3 >> renamePathOldpath: oldpath newpath: newpath [
	"/**
	 * Rename a file or directory.
	 *
	 * If the file at `newpath` already exists, it will replaced.
	 *
	 * Note that this will not copy files across filesystems/drives/volumes, as
	 * that is a much more complicated (and possibly time-consuming) operation.
	 *
	 * Which is to say, if this function fails, SDL_CopyFile() to a temporary file
	 * in the same directory as `newpath`, then SDL_RenamePath() from the
	 * temporary file to `newpath` and SDL_RemovePath() on `oldpath` might work
	 * for files. Renaming a non-empty directory across filesystems is
	 * dramatically more complex, however.
	 *
	 * \param oldpath the old path.
	 * \param newpath the new path.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_RenamePath(const char* oldpath, const char* newpath))
]

{ #category : 'public' }
LibSDL3 >> renderClear: renderer [
	"/**
	 * Clear the current rendering target with the drawing color.
	 *
	 * This function clears the entire rendering target, ignoring the viewport and
	 * the clip rectangle. Note, that clearing will also set/fill all pixels of
	 * the rendering target to current renderer draw color, so make sure to invoke
	 * SDL_SetRenderDrawColor() when needed.
	 *
	 * \param renderer the rendering context.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetRenderDrawColor
	 */"

	^ self ffiCall: #(bool SDL_RenderClear(SDL_Renderer* renderer))
]

{ #category : 'public' }
LibSDL3 >> renderClipEnabled: renderer [
	"/**
	 * Get whether clipping is enabled on the given render target.
	 *
	 * Each render target has its own clip rectangle. This function checks the
	 * cliprect for the current render target.
	 *
	 * \param renderer the rendering context.
	 * \returns true if clipping is enabled or false if not; call SDL_GetError()
	 *          for more information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetRenderClipRect
	 * \sa SDL_SetRenderClipRect
	 */"

	^ self ffiCall: #(bool SDL_RenderClipEnabled(SDL_Renderer* renderer))
]

{ #category : 'public' }
LibSDL3 >> renderCoordinatesFromWindowRenderer: renderer windowX: window_x windowY: window_y x: x y: y [
	"/**
	 * Get a point in render coordinates when given a point in window coordinates.
	 *
	 * This takes into account several states:
	 *
	 * - The window dimensions.
	 * - The logical presentation settings (SDL_SetRenderLogicalPresentation)
	 * - The scale (SDL_SetRenderScale)
	 * - The viewport (SDL_SetRenderViewport)
	 *
	 * \param renderer the rendering context.
	 * \param window_x the x coordinate in window coordinates.
	 * \param window_y the y coordinate in window coordinates.
	 * \param x a pointer filled with the x coordinate in render coordinates.
	 * \param y a pointer filled with the y coordinate in render coordinates.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetRenderLogicalPresentation
	 * \sa SDL_SetRenderScale
	 */"

	^ self ffiCall: #(bool SDL_RenderCoordinatesFromWindow(SDL_Renderer* renderer, float window_x, float window_y, float* x, float* y))
]

{ #category : 'public' }
LibSDL3 >> renderCoordinatesToWindowRenderer: renderer x: x y: y windowX: window_x windowY: window_y [
	"/**
	 * Get a point in window coordinates when given a point in render coordinates.
	 *
	 * This takes into account several states:
	 *
	 * - The window dimensions.
	 * - The logical presentation settings (SDL_SetRenderLogicalPresentation)
	 * - The scale (SDL_SetRenderScale)
	 * - The viewport (SDL_SetRenderViewport)
	 *
	 * \param renderer the rendering context.
	 * \param x the x coordinate in render coordinates.
	 * \param y the y coordinate in render coordinates.
	 * \param window_x a pointer filled with the x coordinate in window
	 *                 coordinates.
	 * \param window_y a pointer filled with the y coordinate in window
	 *                 coordinates.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetRenderLogicalPresentation
	 * \sa SDL_SetRenderScale
	 * \sa SDL_SetRenderViewport
	 */"

	^ self ffiCall: #(bool SDL_RenderCoordinatesToWindow(SDL_Renderer* renderer, float x, float y, float* window_x, float* window_y))
]

{ #category : 'public' }
LibSDL3 >> renderDebugTextRenderer: renderer x: x y: y str: str [
	"/**
	 * Draw debug text to an SDL_Renderer.
	 *
	 * This function will render a string of text to an SDL_Renderer. Note that
	 * this is a convenience function for debugging, with severe limitations, and
	 * not intended to be used for production apps and games.
	 *
	 * Among these limitations:
	 *
	 * - It accepts UTF-8 strings, but will only renders ASCII characters.
	 * - It has a single, tiny size (8x8 pixels). One can use logical presentation
	 *   or scaling to adjust it, but it will be blurry.
	 * - It uses a simple, hardcoded bitmap font. It does not allow different font
	 *   selections and it does not support truetype, for proper scaling.
	 * - It does no word-wrapping and does not treat newline characters as a line
	 *   break. If the text goes out of the window, it's gone.
	 *
	 * For serious text rendering, there are several good options, such as
	 * SDL_ttf, stb_truetype, or other external libraries.
	 *
	 * On first use, this will create an internal texture for rendering glyphs.
	 * This texture will live until the renderer is destroyed.
	 *
	 * The text is drawn in the color specified by SDL_SetRenderDrawColor().
	 *
	 * \param renderer the renderer which should draw a line of text.
	 * \param x the x coordinate where the top-left corner of the text will draw.
	 * \param y the y coordinate where the top-left corner of the text will draw.
	 * \param str the string to render.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_RenderDebugTextFormat
	 * \sa SDL_DEBUG_TEXT_FONT_CHARACTER_SIZE
	 */"

	^ self ffiCall: #(bool SDL_RenderDebugText(SDL_Renderer* renderer, float x, float y, const char* str))
]

{ #category : 'public' }
LibSDL3 >> renderFillRectRenderer: renderer rect: rect [
	"/**
	 * Fill a rectangle on the current rendering target with the drawing color at
	 * subpixel precision.
	 *
	 * \param renderer the renderer which should fill a rectangle.
	 * \param rect a pointer to the destination rectangle, or NULL for the entire
	 *             rendering target.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_RenderFillRects
	 */"

	^ self ffiCall: #(bool SDL_RenderFillRect(SDL_Renderer* renderer, SDL_FRect* rect))
]

{ #category : 'public' }
LibSDL3 >> renderFillRectsRenderer: renderer rects: rects count: count [
	"/**
	 * Fill some number of rectangles on the current rendering target with the
	 * drawing color at subpixel precision.
	 *
	 * \param renderer the renderer which should fill multiple rectangles.
	 * \param rects a pointer to an array of destination rectangles.
	 * \param count the number of rectangles.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_RenderFillRect
	 */"

	^ self ffiCall: #(bool SDL_RenderFillRects(SDL_Renderer* renderer, SDL_FRect* rects, int count))
]

{ #category : 'public' }
LibSDL3 >> renderGeometryRawRenderer: renderer texture: texture xy: xy xyStride: xy_stride color: color colorStride: color_stride uv: uv uvStride: uv_stride numVertices: num_vertices indices: indices numIndices: num_indices sizeIndices: size_indices [
	"/**
	 * Render a list of triangles, optionally using a texture and indices into the
	 * vertex arrays Color and alpha modulation is done per vertex
	 * (SDL_SetTextureColorMod and SDL_SetTextureAlphaMod are ignored).
	 *
	 * \param renderer the rendering context.
	 * \param texture (optional) The SDL texture to use.
	 * \param xy vertex positions.
	 * \param xy_stride byte size to move from one element to the next element.
	 * \param color vertex colors (as SDL_FColor).
	 * \param color_stride byte size to move from one element to the next element.
	 * \param uv vertex normalized texture coordinates.
	 * \param uv_stride byte size to move from one element to the next element.
	 * \param num_vertices number of vertices.
	 * \param indices (optional) An array of indices into the 'vertices' arrays,
	 *                if NULL all vertices will be rendered in sequential order.
	 * \param num_indices number of indices.
	 * \param size_indices index size: 1 (byte), 2 (short), 4 (int).
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_RenderGeometry
	 */"

	^ self ffiCall: #(bool SDL_RenderGeometryRaw(SDL_Renderer* renderer, SDL_Texture* texture, const float* xy, int xy_stride, SDL_FColor* color, int color_stride, const float* uv, int uv_stride, int num_vertices, const void* indices, int num_indices, int size_indices))
]

{ #category : 'public' }
LibSDL3 >> renderGeometryRenderer: renderer texture: texture vertices: vertices numVertices: num_vertices indices: indices numIndices: num_indices [
	"/**
	 * Render a list of triangles, optionally using a texture and indices into the
	 * vertex array Color and alpha modulation is done per vertex
	 * (SDL_SetTextureColorMod and SDL_SetTextureAlphaMod are ignored).
	 *
	 * \param renderer the rendering context.
	 * \param texture (optional) The SDL texture to use.
	 * \param vertices vertices.
	 * \param num_vertices number of vertices.
	 * \param indices (optional) An array of integer indices into the 'vertices'
	 *                array, if NULL all vertices will be rendered in sequential
	 *                order.
	 * \param num_indices number of indices.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_RenderGeometryRaw
	 */"

	^ self ffiCall: #(bool SDL_RenderGeometry(SDL_Renderer* renderer, SDL_Texture* texture, SDL_Vertex* vertices, int num_vertices, const int* indices, int num_indices))
]

{ #category : 'public' }
LibSDL3 >> renderLineRenderer: renderer x1: x1 y1: y1 x2: x2 y2: y2 [
	"/**
	 * Draw a line on the current rendering target at subpixel precision.
	 *
	 * \param renderer the renderer which should draw a line.
	 * \param x1 the x coordinate of the start point.
	 * \param y1 the y coordinate of the start point.
	 * \param x2 the x coordinate of the end point.
	 * \param y2 the y coordinate of the end point.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_RenderLines
	 */"

	^ self ffiCall: #(bool SDL_RenderLine(SDL_Renderer* renderer, float x1, float y1, float x2, float y2))
]

{ #category : 'public' }
LibSDL3 >> renderLinesRenderer: renderer points: points count: count [
	"/**
	 * Draw a series of connected lines on the current rendering target at
	 * subpixel precision.
	 *
	 * \param renderer the renderer which should draw multiple lines.
	 * \param points the points along the lines.
	 * \param count the number of points, drawing count-1 lines.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_RenderLine
	 */"

	^ self ffiCall: #(bool SDL_RenderLines(SDL_Renderer* renderer, SDL_FPoint* points, int count))
]

{ #category : 'public' }
LibSDL3 >> renderPointRenderer: renderer x: x y: y [
	"/**
	 * Draw a point on the current rendering target at subpixel precision.
	 *
	 * \param renderer the renderer which should draw a point.
	 * \param x the x coordinate of the point.
	 * \param y the y coordinate of the point.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_RenderPoints
	 */"

	^ self ffiCall: #(bool SDL_RenderPoint(SDL_Renderer* renderer, float x, float y))
]

{ #category : 'public' }
LibSDL3 >> renderPointsRenderer: renderer points: points count: count [
	"/**
	 * Draw multiple points on the current rendering target at subpixel precision.
	 *
	 * \param renderer the renderer which should draw multiple points.
	 * \param points the points to draw.
	 * \param count the number of points to draw.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_RenderPoint
	 */"

	^ self ffiCall: #(bool SDL_RenderPoints(SDL_Renderer* renderer, SDL_FPoint* points, int count))
]

{ #category : 'public' }
LibSDL3 >> renderPresent: renderer [
	"/**
	 * Update the screen with any rendering performed since the previous call.
	 *
	 * SDL's rendering functions operate on a backbuffer; that is, calling a
	 * rendering function such as SDL_RenderLine() does not directly put a line on
	 * the screen, but rather updates the backbuffer. As such, you compose your
	 * entire scene and *present* the composed backbuffer to the screen as a
	 * complete picture.
	 *
	 * Therefore, when using SDL's rendering API, one does all drawing intended
	 * for the frame, and then calls this function once per frame to present the
	 * final drawing to the user.
	 *
	 * The backbuffer should be considered invalidated after each present; do not
	 * assume that previous contents will exist between frames. You are strongly
	 * encouraged to call SDL_RenderClear() to initialize the backbuffer before
	 * starting each new frame's drawing, even if you plan to overwrite every
	 * pixel.
	 *
	 * Please note, that in case of rendering to a texture - there is **no need**
	 * to call `SDL_RenderPresent` after drawing needed objects to a texture, and
	 * should not be done; you are only required to change back the rendering
	 * target to default via `SDL_SetRenderTarget(renderer, NULL)` afterwards, as
	 * textures by themselves do not have a concept of backbuffers. Calling
	 * SDL_RenderPresent while rendering to a texture will still update the screen
	 * with any current drawing that has been done _to the window itself_.
	 *
	 * \param renderer the rendering context.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateRenderer
	 * \sa SDL_RenderClear
	 * \sa SDL_RenderFillRect
	 * \sa SDL_RenderFillRects
	 * \sa SDL_RenderLine
	 * \sa SDL_RenderLines
	 * \sa SDL_RenderPoint
	 * \sa SDL_RenderPoints
	 * \sa SDL_RenderRect
	 * \sa SDL_RenderRects
	 * \sa SDL_SetRenderDrawBlendMode
	 * \sa SDL_SetRenderDrawColor
	 */"

	^ self ffiCall: #(bool SDL_RenderPresent(SDL_Renderer* renderer))
]

{ #category : 'public' }
LibSDL3 >> renderReadPixelsRenderer: renderer rect: rect [
	"/**
	 * Read pixels from the current rendering target.
	 *
	 * The returned surface contains pixels inside the desired area clipped to the
	 * current viewport, and should be freed with SDL_DestroySurface().
	 *
	 * Note that this returns the actual pixels on the screen, so if you are using
	 * logical presentation you should use SDL_GetRenderLogicalPresentationRect()
	 * to get the area containing your content.
	 *
	 * **WARNING**: This is a very slow operation, and should not be used
	 * frequently. If you're using this on the main rendering target, it should be
	 * called after rendering and before SDL_RenderPresent().
	 *
	 * \param renderer the rendering context.
	 * \param rect an SDL_Rect structure representing the area to read, which will
	 *             be clipped to the current viewport, or NULL for the entire
	 *             viewport.
	 * \returns a new SDL_Surface on success or NULL on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_Surface* SDL_RenderReadPixels(SDL_Renderer* renderer, SDL_Rect* rect))
]

{ #category : 'public' }
LibSDL3 >> renderRectRenderer: renderer rect: rect [
	"/**
	 * Draw a rectangle on the current rendering target at subpixel precision.
	 *
	 * \param renderer the renderer which should draw a rectangle.
	 * \param rect a pointer to the destination rectangle, or NULL to outline the
	 *             entire rendering target.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_RenderRects
	 */"

	^ self ffiCall: #(bool SDL_RenderRect(SDL_Renderer* renderer, SDL_FRect* rect))
]

{ #category : 'public' }
LibSDL3 >> renderRectsRenderer: renderer rects: rects count: count [
	"/**
	 * Draw some number of rectangles on the current rendering target at subpixel
	 * precision.
	 *
	 * \param renderer the renderer which should draw multiple rectangles.
	 * \param rects a pointer to an array of destination rectangles.
	 * \param count the number of rectangles.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_RenderRect
	 */"

	^ self ffiCall: #(bool SDL_RenderRects(SDL_Renderer* renderer, SDL_FRect* rects, int count))
]

{ #category : 'public' }
LibSDL3 >> renderTexture9GridRenderer: renderer texture: texture srcrect: srcrect leftWidth: left_width rightWidth: right_width topHeight: top_height bottomHeight: bottom_height scale: scale dstrect: dstrect [
	"/**
	 * Perform a scaled copy using the 9-grid algorithm to the current rendering
	 * target at subpixel precision.
	 *
	 * The pixels in the texture are split into a 3x3 grid, using the different
	 * corner sizes for each corner, and the sides and center making up the
	 * remaining pixels. The corners are then scaled using `scale` and fit into
	 * the corners of the destination rectangle. The sides and center are then
	 * stretched into place to cover the remaining destination rectangle.
	 *
	 * \param renderer the renderer which should copy parts of a texture.
	 * \param texture the source texture.
	 * \param srcrect the SDL_Rect structure representing the rectangle to be used
	 *                for the 9-grid, or NULL to use the entire texture.
	 * \param left_width the width, in pixels, of the left corners in `srcrect`.
	 * \param right_width the width, in pixels, of the right corners in `srcrect`.
	 * \param top_height the height, in pixels, of the top corners in `srcrect`.
	 * \param bottom_height the height, in pixels, of the bottom corners in
	 *                      `srcrect`.
	 * \param scale the scale used to transform the corner of `srcrect` into the
	 *              corner of `dstrect`, or 0.0f for an unscaled copy.
	 * \param dstrect a pointer to the destination rectangle, or NULL for the
	 *                entire rendering target.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_RenderTexture
	 */"

	^ self ffiCall: #(bool SDL_RenderTexture9Grid(SDL_Renderer* renderer, SDL_Texture* texture, SDL_FRect* srcrect, float left_width, float right_width, float top_height, float bottom_height, float scale, SDL_FRect* dstrect))
]

{ #category : 'public' }
LibSDL3 >> renderTextureAffineRenderer: renderer texture: texture srcrect: srcrect origin: origin right: right down: down [
	"/**
	 * Copy a portion of the source texture to the current rendering target, with
	 * affine transform, at subpixel precision.
	 *
	 * \param renderer the renderer which should copy parts of a texture.
	 * \param texture the source texture.
	 * \param srcrect a pointer to the source rectangle, or NULL for the entire
	 *                texture.
	 * \param origin a pointer to a point indicating where the top-left corner of
	 *               srcrect should be mapped to, or NULL for the rendering
	 *               target's origin.
	 * \param right a pointer to a point indicating where the top-right corner of
	 *              srcrect should be mapped to, or NULL for the rendering
	 *              target's top-right corner.
	 * \param down a pointer to a point indicating where the bottom-left corner of
	 *             srcrect should be mapped to, or NULL for the rendering target's
	 *             bottom-left corner.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety You may only call this function from the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_RenderTexture
	 */"

	^ self ffiCall: #(bool SDL_RenderTextureAffine(SDL_Renderer* renderer, SDL_Texture* texture, SDL_FRect* srcrect, SDL_FPoint* origin, SDL_FPoint* right, SDL_FPoint* down))
]

{ #category : 'public' }
LibSDL3 >> renderTextureRenderer: renderer texture: texture srcrect: srcrect dstrect: dstrect [
	"/**
	 * Copy a portion of the texture to the current rendering target at subpixel
	 * precision.
	 *
	 * \param renderer the renderer which should copy parts of a texture.
	 * \param texture the source texture.
	 * \param srcrect a pointer to the source rectangle, or NULL for the entire
	 *                texture.
	 * \param dstrect a pointer to the destination rectangle, or NULL for the
	 *                entire rendering target.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_RenderTextureRotated
	 * \sa SDL_RenderTextureTiled
	 */"

	^ self ffiCall: #(bool SDL_RenderTexture(SDL_Renderer* renderer, SDL_Texture* texture, SDL_FRect* srcrect, SDL_FRect* dstrect))
]

{ #category : 'public' }
LibSDL3 >> renderTextureRotatedRenderer: renderer texture: texture srcrect: srcrect dstrect: dstrect angle: angle center: center flip: flip [
	"/**
	 * Copy a portion of the source texture to the current rendering target, with
	 * rotation and flipping, at subpixel precision.
	 *
	 * \param renderer the renderer which should copy parts of a texture.
	 * \param texture the source texture.
	 * \param srcrect a pointer to the source rectangle, or NULL for the entire
	 *                texture.
	 * \param dstrect a pointer to the destination rectangle, or NULL for the
	 *                entire rendering target.
	 * \param angle an angle in degrees that indicates the rotation that will be
	 *              applied to dstrect, rotating it in a clockwise direction.
	 * \param center a pointer to a point indicating the point around which
	 *               dstrect will be rotated (if NULL, rotation will be done
	 *               around dstrect.w/2, dstrect.h/2).
	 * \param flip an SDL_FlipMode value stating which flipping actions should be
	 *             performed on the texture.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_RenderTexture
	 */"

	^ self ffiCall: #(bool SDL_RenderTextureRotated(SDL_Renderer* renderer, SDL_Texture* texture, SDL_FRect* srcrect, SDL_FRect* dstrect, double angle, SDL_FPoint* center, SDL_FlipMode flip))
]

{ #category : 'public' }
LibSDL3 >> renderTextureTiledRenderer: renderer texture: texture srcrect: srcrect scale: scale dstrect: dstrect [
	"/**
	 * Tile a portion of the texture to the current rendering target at subpixel
	 * precision.
	 *
	 * The pixels in `srcrect` will be repeated as many times as needed to
	 * completely fill `dstrect`.
	 *
	 * \param renderer the renderer which should copy parts of a texture.
	 * \param texture the source texture.
	 * \param srcrect a pointer to the source rectangle, or NULL for the entire
	 *                texture.
	 * \param scale the scale used to transform srcrect into the destination
	 *              rectangle, e.g. a 32x32 texture with a scale of 2 would fill
	 *              64x64 tiles.
	 * \param dstrect a pointer to the destination rectangle, or NULL for the
	 *                entire rendering target.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_RenderTexture
	 */"

	^ self ffiCall: #(bool SDL_RenderTextureTiled(SDL_Renderer* renderer, SDL_Texture* texture, SDL_FRect* srcrect, float scale, SDL_FRect* dstrect))
]

{ #category : 'public' }
LibSDL3 >> renderViewportSet: renderer [
	"/**
	 * Return whether an explicit rectangle was set as the viewport.
	 *
	 * This is useful if you're saving and restoring the viewport and want to know
	 * whether you should restore a specific rectangle or NULL. Note that the
	 * viewport is always reset when changing rendering targets.
	 *
	 * Each render target has its own viewport. This function checks the viewport
	 * for the current render target.
	 *
	 * \param renderer the rendering context.
	 * \returns true if the viewport was set to a specific rectangle, or false if
	 *          it was set to NULL (the entire target).
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetRenderViewport
	 * \sa SDL_SetRenderViewport
	 */"

	^ self ffiCall: #(bool SDL_RenderViewportSet(SDL_Renderer* renderer))
]

{ #category : 'public' }
LibSDL3 >> reportAssertionData: data func: func file: file line: line [
	"/**
	 * Never call this directly.
	 *
	 * Use the SDL_assert macros instead.
	 *
	 * \param data assert data structure.
	 * \param func function name.
	 * \param file file name.
	 * \param line line number.
	 * \returns assert state.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_AssertState SDL_ReportAssertion(SDL_AssertData* data, const char* func, const char* file, int line))
]

{ #category : 'public' }
LibSDL3 >> resetAssertionReport [
	"/**
	 * Clear the list of all assertion failures.
	 *
	 * This function will clear the list of all assertions triggered up to that
	 * point. Immediately following this call, SDL_GetAssertionReport will return
	 * no items. In addition, any previously-triggered assertions will be reset to
	 * a trigger_count of zero, and their always_ignore state will be false.
	 *
	 * \threadsafety This function is not thread safe. Other threads triggering an
	 *               assertion, or simultaneously calling this function may cause
	 *               memory leaks or crashes.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetAssertionReport
	 */"

	self ffiCall: #(void SDL_ResetAssertionReport())
]

{ #category : 'public' }
LibSDL3 >> resetKeyboard [
	"/**
	 * Clear the state of the keyboard.
	 *
	 * This function will generate key up events for all pressed keys.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetKeyboardState
	 */"

	self ffiCall: #(void SDL_ResetKeyboard())
]

{ #category : 'public' }
LibSDL3 >> restoreWindow: window [
	"/**
	 * Request that the size and position of a minimized or maximized window be
	 * restored.
	 *
	 * If the window is in a fullscreen state, this request has no direct effect.
	 * It may alter the state the window is returned to when leaving fullscreen.
	 *
	 * On some windowing systems this request is asynchronous and the new window
	 * state may not have have been applied immediately upon the return of this
	 * function. If an immediate change is required, call SDL_SyncWindow() to
	 * block until the changes have taken effect.
	 *
	 * When the window state changes, an SDL_EVENT_WINDOW_RESTORED event will be
	 * emitted. Note that, as this is just a request, the windowing system can
	 * deny the state change.
	 *
	 * \param window the window to restore.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_MaximizeWindow
	 * \sa SDL_MinimizeWindow
	 * \sa SDL_SyncWindow
	 */"

	^ self ffiCall: #(bool SDL_RestoreWindow(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> resumeAudioDevice: devid [
	"/**
	 * Use this function to unpause audio playback on a specified device.
	 *
	 * This function unpauses audio processing for a given device that has
	 * previously been paused with SDL_PauseAudioDevice(). Once unpaused, any
	 * bound audio streams will begin to progress again, and audio can be
	 * generated.
	 *
	 * Unlike in SDL2, audio devices start in an _unpaused_ state, since an app
	 * has to bind a stream before any audio will flow. Unpausing an unpaused
	 * device is a legal no-op.
	 *
	 * Physical devices can not be paused or unpaused, only logical devices
	 * created through SDL_OpenAudioDevice() can be.
	 *
	 * \param devid a device opened by SDL_OpenAudioDevice().
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_AudioDevicePaused
	 * \sa SDL_PauseAudioDevice
	 */"

	^ self ffiCall: #(bool SDL_ResumeAudioDevice(SDL_AudioDeviceID devid))
]

{ #category : 'public' }
LibSDL3 >> resumeAudioStreamDevice: stream [
	"/**
	 * Use this function to unpause audio playback on the audio device associated
	 * with an audio stream.
	 *
	 * This function unpauses audio processing for a given device that has
	 * previously been paused. Once unpaused, any bound audio streams will begin
	 * to progress again, and audio can be generated.
	 *
	 * Remember, SDL_OpenAudioDeviceStream opens device in a paused state, so this
	 * function call is required for audio playback to begin on such device.
	 *
	 * \param stream the audio stream associated with the audio device to resume.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_PauseAudioStreamDevice
	 */"

	^ self ffiCall: #(bool SDL_ResumeAudioStreamDevice(SDL_AudioStream* stream))
]

{ #category : 'public' }
LibSDL3 >> round: x [
	"/**
	 * Round `x` to the nearest integer.
	 *
	 * Rounds `x` to the nearest integer. Values halfway between integers will be
	 * rounded away from zero.
	 *
	 * Domain: `-INF <= x <= INF`
	 *
	 * Range: `-INF <= y <= INF`, y integer
	 *
	 * This function operates on double-precision floating point values, use
	 * SDL_roundf for single-precision floats. To get the result as an integer
	 * type, use SDL_lround.
	 *
	 * \param x floating point value.
	 * \returns the nearest integer to `x`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_roundf
	 * \sa SDL_lround
	 * \sa SDL_floor
	 * \sa SDL_ceil
	 * \sa SDL_trunc
	 */"

	^ self ffiCall: #(double SDL_round(double x))
]

{ #category : 'public' }
LibSDL3 >> roundf: x [
	"/**
	 * Round `x` to the nearest integer.
	 *
	 * Rounds `x` to the nearest integer. Values halfway between integers will be
	 * rounded away from zero.
	 *
	 * Domain: `-INF <= x <= INF`
	 *
	 * Range: `-INF <= y <= INF`, y integer
	 *
	 * This function operates on single-precision floating point values, use
	 * SDL_round for double-precision floats. To get the result as an integer
	 * type, use SDL_lroundf.
	 *
	 * \param x floating point value.
	 * \returns the nearest integer to `x`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_round
	 * \sa SDL_lroundf
	 * \sa SDL_floorf
	 * \sa SDL_ceilf
	 * \sa SDL_truncf
	 */"

	^ self ffiCall: #(float SDL_roundf(float x))
]

{ #category : 'public' }
LibSDL3 >> rumbleJoystick: joystick lowFrequencyRumble: low_frequency_rumble highFrequencyRumble: high_frequency_rumble durationMs: duration_ms [
	"/**
	 * Start a rumble effect.
	 *
	 * Each call to this function cancels any previous rumble effect, and calling
	 * it with 0 intensity stops any rumbling.
	 *
	 * This function requires you to process SDL events or call
	 * SDL_UpdateJoysticks() to update rumble state.
	 *
	 * \param joystick the joystick to vibrate.
	 * \param low_frequency_rumble the intensity of the low frequency (left)
	 *                             rumble motor, from 0 to 0xFFFF.
	 * \param high_frequency_rumble the intensity of the high frequency (right)
	 *                              rumble motor, from 0 to 0xFFFF.
	 * \param duration_ms the duration of the rumble effect, in milliseconds.
	 * \returns true, or false if rumble isn't supported on this joystick.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_RumbleJoystick(SDL_Joystick* joystick, Uint16 low_frequency_rumble, Uint16 high_frequency_rumble, Uint32 duration_ms))
]

{ #category : 'public' }
LibSDL3 >> rumbleJoystickTriggersJoystick: joystick leftRumble: left_rumble rightRumble: right_rumble durationMs: duration_ms [
	"/**
	 * Start a rumble effect in the joystick's triggers.
	 *
	 * Each call to this function cancels any previous trigger rumble effect, and
	 * calling it with 0 intensity stops any rumbling.
	 *
	 * Note that this is rumbling of the _triggers_ and not the game controller as
	 * a whole. This is currently only supported on Xbox One controllers. If you
	 * want the (more common) whole-controller rumble, use SDL_RumbleJoystick()
	 * instead.
	 *
	 * This function requires you to process SDL events or call
	 * SDL_UpdateJoysticks() to update rumble state.
	 *
	 * \param joystick the joystick to vibrate.
	 * \param left_rumble the intensity of the left trigger rumble motor, from 0
	 *                    to 0xFFFF.
	 * \param right_rumble the intensity of the right trigger rumble motor, from 0
	 *                     to 0xFFFF.
	 * \param duration_ms the duration of the rumble effect, in milliseconds.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_RumbleJoystick
	 */"

	^ self ffiCall: #(bool SDL_RumbleJoystickTriggers(SDL_Joystick* joystick, Uint16 left_rumble, Uint16 right_rumble, Uint32 duration_ms))
]

{ #category : 'public' }
LibSDL3 >> runOnMainThreadCallback: callback userdata: userdata waitComplete: wait_complete [
	"/**
	 * Call a function on the main thread during event processing.
	 *
	 * If this is called on the main thread, the callback is executed immediately.
	 * If this is called on another thread, this callback is queued for execution
	 * on the main thread during event processing.
	 *
	 * Be careful of deadlocks when using this functionality. You should not have
	 * the main thread wait for the current thread while this function is being
	 * called with `wait_complete` true.
	 *
	 * \param callback the callback to call on the main thread.
	 * \param userdata a pointer that is passed to `callback`.
	 * \param wait_complete true to wait for the callback to complete, false to
	 *                      return immediately.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_IsMainThread
	 */"

	^ self ffiCall: #(bool SDL_RunOnMainThread(SDL_MainThreadCallback callback, void* userdata, _Bool wait_complete))
]

{ #category : 'accessing' }
LibSDL3 >> runner [
	
	^ TFProcessLocalWorker new 
		defaultWorker: TFSameThreadRunner uniqueInstance;
		yourself
]

{ #category : 'public' }
LibSDL3 >> saveBMPIOSurface: surface dst: dst closeio: closeio [
	"/**
	 * Save a surface to a seekable SDL data stream in BMP format.
	 *
	 * Surfaces with a 24-bit, 32-bit and paletted 8-bit format get saved in the
	 * BMP directly. Other RGB formats with 8-bit or higher get converted to a
	 * 24-bit surface or, if they have an alpha mask or a colorkey, to a 32-bit
	 * surface before they are saved. YUV and paletted 1-bit and 4-bit formats are
	 * not supported.
	 *
	 * \param surface the SDL_Surface structure containing the image to be saved.
	 * \param dst a data stream to save to.
	 * \param closeio if true, calls SDL_CloseIO() on `dst` before returning, even
	 *                in the case of an error.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_LoadBMP_IO
	 * \sa SDL_SaveBMP
	 */"

	^ self ffiCall: #(bool SDL_SaveBMP_IO(SDL_Surface* surface, SDL_IOStream* dst, _Bool closeio))
]

{ #category : 'public' }
LibSDL3 >> saveBMPSurface: surface file: file [
	"/**
	 * Save a surface to a file.
	 *
	 * Surfaces with a 24-bit, 32-bit and paletted 8-bit format get saved in the
	 * BMP directly. Other RGB formats with 8-bit or higher get converted to a
	 * 24-bit surface or, if they have an alpha mask or a colorkey, to a 32-bit
	 * surface before they are saved. YUV and paletted 1-bit and 4-bit formats are
	 * not supported.
	 *
	 * \param surface the SDL_Surface structure containing the image to be saved.
	 * \param file a file to save to.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_LoadBMP
	 * \sa SDL_SaveBMP_IO
	 */"

	^ self ffiCall: #(bool SDL_SaveBMP(SDL_Surface* surface, const char* file))
]

{ #category : 'public' }
LibSDL3 >> saveFile: file data: data datasize: datasize [
	"/**
	 * Save all the data into a file path.
	 *
	 * \param file the path to write all available data into.
	 * \param data the data to be written. If datasize is 0, may be NULL or a
	 *             invalid pointer.
	 * \param datasize the number of bytes to be written.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SaveFile_IO
	 * \sa SDL_LoadFile
	 */"

	^ self ffiCall: #(bool SDL_SaveFile(const char* file, const void* data, size_t datasize))
]

{ #category : 'public' }
LibSDL3 >> saveFileIOSrc: src data: data datasize: datasize closeio: closeio [
	"/**
	 * Save all the data into an SDL data stream.
	 *
	 * \param src the SDL_IOStream to write all data to.
	 * \param data the data to be written. If datasize is 0, may be NULL or a
	 *             invalid pointer.
	 * \param datasize the number of bytes to be written.
	 * \param closeio if true, calls SDL_CloseIO() on `src` before returning, even
	 *                in the case of an error.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SaveFile
	 * \sa SDL_LoadFile_IO
	 */"

	^ self ffiCall: #(bool SDL_SaveFile_IO(SDL_IOStream* src, const void* data, size_t datasize, _Bool closeio))
]

{ #category : 'public' }
LibSDL3 >> scalbnX: x n: n [
	"/**
	 * Scale `x` by an integer power of two.
	 *
	 * Multiplies `x` by the `n`th power of the floating point radix (always 2).
	 *
	 * Domain: `-INF <= x <= INF`, `n` integer
	 *
	 * Range: `-INF <= y <= INF`
	 *
	 * This function operates on double-precision floating point values, use
	 * SDL_scalbnf for single-precision floats.
	 *
	 * \param x floating point value to be scaled.
	 * \param n integer exponent.
	 * \returns `x * 2^n`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_scalbnf
	 * \sa SDL_pow
	 */"

	^ self ffiCall: #(double SDL_scalbn(double x, int n))
]

{ #category : 'public' }
LibSDL3 >> scalbnfX: x n: n [
	"/**
	 * Scale `x` by an integer power of two.
	 *
	 * Multiplies `x` by the `n`th power of the floating point radix (always 2).
	 *
	 * Domain: `-INF <= x <= INF`, `n` integer
	 *
	 * Range: `-INF <= y <= INF`
	 *
	 * This function operates on single-precision floating point values, use
	 * SDL_scalbn for double-precision floats.
	 *
	 * \param x floating point value to be scaled.
	 * \param n integer exponent.
	 * \returns `x * 2^n`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_scalbn
	 * \sa SDL_powf
	 */"

	^ self ffiCall: #(float SDL_scalbnf(float x, int n))
]

{ #category : 'public' }
LibSDL3 >> scaleSurface: surface width: width height: height scaleMode: scaleMode [
	"/**
	 * Creates a new surface identical to the existing surface, scaled to the
	 * desired size.
	 *
	 * The returned surface should be freed with SDL_DestroySurface().
	 *
	 * \param surface the surface to duplicate and scale.
	 * \param width the width of the new surface.
	 * \param height the height of the new surface.
	 * \param scaleMode the SDL_ScaleMode to be used.
	 * \returns a copy of the surface or NULL on failure; call SDL_GetError() for
	 *          more information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_DestroySurface
	 */"

	^ self ffiCall: #(SDL_Surface* SDL_ScaleSurface(SDL_Surface* surface, int width, int height, SDL_ScaleMode scaleMode))
]

{ #category : 'public' }
LibSDL3 >> screenKeyboardShown: window [
	"/**
	 * Check whether the screen keyboard is shown for given window.
	 *
	 * \param window the window for which screen keyboard should be queried.
	 * \returns true if screen keyboard is shown or false if not.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_HasScreenKeyboardSupport
	 */"

	^ self ffiCall: #(bool SDL_ScreenKeyboardShown(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> screenSaverEnabled [
	"/**
	 * Check whether the screensaver is currently enabled.
	 *
	 * The screensaver is disabled by default.
	 *
	 * The default can also be changed using `SDL_HINT_VIDEO_ALLOW_SCREENSAVER`.
	 *
	 * \returns true if the screensaver is enabled, false if it is disabled.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_DisableScreenSaver
	 * \sa SDL_EnableScreenSaver
	 */"

	^ self ffiCall: #(bool SDL_ScreenSaverEnabled())
]

{ #category : 'public' }
LibSDL3 >> seekIOContext: context offset: offset whence: whence [
	"/**
	 * Seek within an SDL_IOStream data stream.
	 *
	 * This function seeks to byte `offset`, relative to `whence`.
	 *
	 * `whence` may be any of the following values:
	 *
	 * - `SDL_IO_SEEK_SET`: seek from the beginning of data
	 * - `SDL_IO_SEEK_CUR`: seek relative to current read point
	 * - `SDL_IO_SEEK_END`: seek relative to the end of data
	 *
	 * If this stream can not seek, it will return -1.
	 *
	 * \param context a pointer to an SDL_IOStream structure.
	 * \param offset an offset in bytes, relative to `whence` location; can be
	 *               negative.
	 * \param whence any of `SDL_IO_SEEK_SET`, `SDL_IO_SEEK_CUR`,
	 *               `SDL_IO_SEEK_END`.
	 * \returns the final offset in the data stream after the seek or -1 on
	 *          failure; call SDL_GetError() for more information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_TellIO
	 */"

	^ self ffiCall: #(Sint64 SDL_SeekIO(SDL_IOStream* context, Sint64 offset, SDL_IOWhence whence))
]

{ #category : 'public' }
LibSDL3 >> sendJoystickEffectJoystick: joystick data: data size: size [
	"/**
	 * Send a joystick specific effect packet.
	 *
	 * \param joystick the joystick to affect.
	 * \param data the data to send to the joystick.
	 * \param size the size of the data to send to the joystick.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_SendJoystickEffect(SDL_Joystick* joystick, const void* data, int size))
]

{ #category : 'public' }
LibSDL3 >> sendJoystickVirtualSensorDataJoystick: joystick type: type sensorTimestamp: sensor_timestamp data: data numValues: num_values [
	"/**
	 * Send a sensor update for an opened virtual joystick.
	 *
	 * Please note that values set here will not be applied until the next call to
	 * SDL_UpdateJoysticks, which can either be called directly, or can be called
	 * indirectly through various other SDL APIs, including, but not limited to
	 * the following: SDL_PollEvent, SDL_PumpEvents, SDL_WaitEventTimeout,
	 * SDL_WaitEvent.
	 *
	 * \param joystick the virtual joystick on which to set state.
	 * \param type the type of the sensor on the virtual joystick to update.
	 * \param sensor_timestamp a 64-bit timestamp in nanoseconds associated with
	 *                         the sensor reading.
	 * \param data the data associated with the sensor reading.
	 * \param num_values the number of values pointed to by `data`.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_SendJoystickVirtualSensorData(SDL_Joystick* joystick, SDL_SensorType type, Uint64 sensor_timestamp, const float* data, int num_values))
]

{ #category : 'public' }
LibSDL3 >> setAppMetadataAppname: appname appversion: appversion appidentifier: appidentifier [
	"/**
	 * Specify basic metadata about your app.
	 *
	 * You can optionally provide metadata about your app to SDL. This is not
	 * required, but strongly encouraged.
	 *
	 * There are several locations where SDL can make use of metadata (an ""About""
	 * box in the macOS menu bar, the name of the app can be shown on some audio
	 * mixers, etc). Any piece of metadata can be left as NULL, if a specific
	 * detail doesn't make sense for the app.
	 *
	 * This function should be called as early as possible, before SDL_Init.
	 * Multiple calls to this function are allowed, but various state might not
	 * change once it has been set up with a previous call to this function.
	 *
	 * Passing a NULL removes any previous metadata.
	 *
	 * This is a simplified interface for the most important information. You can
	 * supply significantly more detailed metadata with
	 * SDL_SetAppMetadataProperty().
	 *
	 * \param appname The name of the application (""My Game 2: Bad Guy's
	 *                Revenge!"").
	 * \param appversion The version of the application (""1.0.0beta5"" or a git
	 *                   hash, or whatever makes sense).
	 * \param appidentifier A unique string in reverse-domain format that
	 *                      identifies this app (""com.example.mygame2"").
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetAppMetadataProperty
	 */"

	^ self ffiCall: #(bool SDL_SetAppMetadata(const char* appname, const char* appversion, const char* appidentifier))
]

{ #category : 'public' }
LibSDL3 >> setAppMetadataPropertyName: name value: value [
	"/**
	 * Specify metadata about your app through a set of properties.
	 *
	 * You can optionally provide metadata about your app to SDL. This is not
	 * required, but strongly encouraged.
	 *
	 * There are several locations where SDL can make use of metadata (an ""About""
	 * box in the macOS menu bar, the name of the app can be shown on some audio
	 * mixers, etc). Any piece of metadata can be left out, if a specific detail
	 * doesn't make sense for the app.
	 *
	 * This function should be called as early as possible, before SDL_Init.
	 * Multiple calls to this function are allowed, but various state might not
	 * change once it has been set up with a previous call to this function.
	 *
	 * Once set, this metadata can be read using SDL_GetAppMetadataProperty().
	 *
	 * These are the supported properties:
	 *
	 * - `SDL_PROP_APP_METADATA_NAME_STRING`: The human-readable name of the
	 *   application, like ""My Game 2: Bad Guy's Revenge!"". This will show up
	 *   anywhere the OS shows the name of the application separately from window
	 *   titles, such as volume control applets, etc. This defaults to ""SDL
	 *   Application"".
	 * - `SDL_PROP_APP_METADATA_VERSION_STRING`: The version of the app that is
	 *   running; there are no rules on format, so ""1.0.3beta2"" and ""April 22nd,
	 *   2024"" and a git hash are all valid options. This has no default.
	 * - `SDL_PROP_APP_METADATA_IDENTIFIER_STRING`: A unique string that
	 *   identifies this app. This must be in reverse-domain format, like
	 *   ""com.example.mygame2"". This string is used by desktop compositors to
	 *   identify and group windows together, as well as match applications with
	 *   associated desktop settings and icons. If you plan to package your
	 *   application in a container such as Flatpak, the app ID should match the
	 *   name of your Flatpak container as well. This has no default.
	 * - `SDL_PROP_APP_METADATA_CREATOR_STRING`: The human-readable name of the
	 *   creator/developer/maker of this app, like ""MojoWorkshop, LLC""
	 * - `SDL_PROP_APP_METADATA_COPYRIGHT_STRING`: The human-readable copyright
	 *   notice, like ""Copyright (c) 2024 MojoWorkshop, LLC"" or whatnot. Keep this
	 *   to one line, don't paste a copy of a whole software license in here. This
	 *   has no default.
	 * - `SDL_PROP_APP_METADATA_URL_STRING`: A URL to the app on the web. Maybe a
	 *   product page, or a storefront, or even a GitHub repository, for user's
	 *   further information This has no default.
	 * - `SDL_PROP_APP_METADATA_TYPE_STRING`: The type of application this is.
	 *   Currently this string can be ""game"" for a video game, ""mediaplayer"" for a
	 *   media player, or generically ""application"" if nothing else applies.
	 *   Future versions of SDL might add new types. This defaults to
	 *   ""application"".
	 *
	 * \param name the name of the metadata property to set.
	 * \param value the value of the property, or NULL to remove that property.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetAppMetadataProperty
	 * \sa SDL_SetAppMetadata
	 */"

	^ self ffiCall: #(bool SDL_SetAppMetadataProperty(const char* name, const char* value))
]

{ #category : 'public' }
LibSDL3 >> setAssertionHandler: handler userdata: userdata [
	"/**
	 * Set an application-defined assertion handler.
	 *
	 * This function allows an application to show its own assertion UI and/or
	 * force the response to an assertion failure. If the application doesn't
	 * provide this, SDL will try to do the right thing, popping up a
	 * system-specific GUI dialog, and probably minimizing any fullscreen windows.
	 *
	 * This callback may fire from any thread, but it runs wrapped in a mutex, so
	 * it will only fire from one thread at a time.
	 *
	 * This callback is NOT reset to SDL's internal handler upon SDL_Quit()!
	 *
	 * \param handler the SDL_AssertionHandler function to call when an assertion
	 *                fails or NULL for the default handler.
	 * \param userdata a pointer that is passed to `handler`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetAssertionHandler
	 */"

	self ffiCall: #(void SDL_SetAssertionHandler(SDL_AssertionHandler handler, void* userdata))
]

{ #category : 'public' }
LibSDL3 >> setAtomicIntA: a v: v [
	"/**
	 * Set an atomic variable to a value.
	 *
	 * This function also acts as a full memory barrier.
	 *
	 * ***Note: If you don't know what this function is for, you shouldn't use
	 * it!***
	 *
	 * \param a a pointer to an SDL_AtomicInt variable to be modified.
	 * \param v the desired value.
	 * \returns the previous value of the atomic variable.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetAtomicInt
	 */"

	^ self ffiCall: #(int SDL_SetAtomicInt(SDL_AtomicInt* a, int v))
]

{ #category : 'public' }
LibSDL3 >> setAtomicPointerA: a v: v [
	"/**
	 * Set a pointer to a value atomically.
	 *
	 * ***Note: If you don't know what this function is for, you shouldn't use
	 * it!***
	 *
	 * \param a a pointer to a pointer.
	 * \param v the desired pointer value.
	 * \returns the previous value of the pointer.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CompareAndSwapAtomicPointer
	 * \sa SDL_GetAtomicPointer
	 */"

	^ self ffiCall: #(void* SDL_SetAtomicPointer(void** a, void* v))
]

{ #category : 'public' }
LibSDL3 >> setAtomicU32A: a v: v [
	"/**
	 * Set an atomic variable to a value.
	 *
	 * This function also acts as a full memory barrier.
	 *
	 * ***Note: If you don't know what this function is for, you shouldn't use
	 * it!***
	 *
	 * \param a a pointer to an SDL_AtomicU32 variable to be modified.
	 * \param v the desired value.
	 * \returns the previous value of the atomic variable.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetAtomicU32
	 */"

	^ self ffiCall: #(Uint32 SDL_SetAtomicU32(SDL_AtomicU32* a, Uint32 v))
]

{ #category : 'public' }
LibSDL3 >> setAudioDeviceGainDevid: devid gain: gain [
	"/**
	 * Change the gain of an audio device.
	 *
	 * The gain of a device is its volume; a larger gain means a louder output,
	 * with a gain of zero being silence.
	 *
	 * Audio devices default to a gain of 1.0f (no change in output).
	 *
	 * Physical devices may not have their gain changed, only logical devices, and
	 * this function will always return false when used on physical devices. While
	 * it might seem attractive to adjust several logical devices at once in this
	 * way, it would allow an app or library to interfere with another portion of
	 * the program's otherwise-isolated devices.
	 *
	 * This is applied, along with any per-audiostream gain, during playback to
	 * the hardware, and can be continuously changed to create various effects. On
	 * recording devices, this will adjust the gain before passing the data into
	 * an audiostream; that recording audiostream can then adjust its gain further
	 * when outputting the data elsewhere, if it likes, but that second gain is
	 * not applied until the data leaves the audiostream again.
	 *
	 * \param devid the audio device on which to change gain.
	 * \param gain the gain. 1.0f is no change, 0.0f is silence.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread, as it holds
	 *               a stream-specific mutex while running.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetAudioDeviceGain
	 */"

	^ self ffiCall: #(bool SDL_SetAudioDeviceGain(SDL_AudioDeviceID devid, float gain))
]

{ #category : 'public' }
LibSDL3 >> setAudioPostmixCallbackDevid: devid callback: callback userdata: userdata [
	"/**
	 * Set a callback that fires when data is about to be fed to an audio device.
	 *
	 * This is useful for accessing the final mix, perhaps for writing a
	 * visualizer or applying a final effect to the audio data before playback.
	 *
	 * The buffer is the final mix of all bound audio streams on an opened device;
	 * this callback will fire regularly for any device that is both opened and
	 * unpaused. If there is no new data to mix, either because no streams are
	 * bound to the device or all the streams are empty, this callback will still
	 * fire with the entire buffer set to silence.
	 *
	 * This callback is allowed to make changes to the data; the contents of the
	 * buffer after this call is what is ultimately passed along to the hardware.
	 *
	 * The callback is always provided the data in float format (values from -1.0f
	 * to 1.0f), but the number of channels or sample rate may be different than
	 * the format the app requested when opening the device; SDL might have had to
	 * manage a conversion behind the scenes, or the playback might have jumped to
	 * new physical hardware when a system default changed, etc. These details may
	 * change between calls. Accordingly, the size of the buffer might change
	 * between calls as well.
	 *
	 * This callback can run at any time, and from any thread; if you need to
	 * serialize access to your app's data, you should provide and use a mutex or
	 * other synchronization device.
	 *
	 * All of this to say: there are specific needs this callback can fulfill, but
	 * it is not the simplest interface. Apps should generally provide audio in
	 * their preferred format through an SDL_AudioStream and let SDL handle the
	 * difference.
	 *
	 * This function is extremely time-sensitive; the callback should do the least
	 * amount of work possible and return as quickly as it can. The longer the
	 * callback runs, the higher the risk of audio dropouts or other problems.
	 *
	 * This function will block until the audio device is in between iterations,
	 * so any existing callback that might be running will finish before this
	 * function sets the new callback and returns.
	 *
	 * Setting a NULL callback function disables any previously-set callback.
	 *
	 * \param devid the ID of an opened audio device.
	 * \param callback a callback function to be called. Can be NULL.
	 * \param userdata app-controlled pointer passed to callback. Can be NULL.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_SetAudioPostmixCallback(SDL_AudioDeviceID devid, SDL_AudioPostmixCallback callback, void* userdata))
]

{ #category : 'public' }
LibSDL3 >> setAudioStreamFormatStream: stream srcSpec: src_spec dstSpec: dst_spec [
	"/**
	 * Change the input and output formats of an audio stream.
	 *
	 * Future calls to and SDL_GetAudioStreamAvailable and SDL_GetAudioStreamData
	 * will reflect the new format, and future calls to SDL_PutAudioStreamData
	 * must provide data in the new input formats.
	 *
	 * Data that was previously queued in the stream will still be operated on in
	 * the format that was current when it was added, which is to say you can put
	 * the end of a sound file in one format to a stream, change formats for the
	 * next sound file, and start putting that new data while the previous sound
	 * file is still queued, and everything will still play back correctly.
	 *
	 * If a stream is bound to a device, then the format of the side of the stream
	 * bound to a device cannot be changed (src_spec for recording devices,
	 * dst_spec for playback devices). Attempts to make a change to this side will
	 * be ignored, but this will not report an error. The other side's format can
	 * be changed.
	 *
	 * \param stream the stream the format is being changed.
	 * \param src_spec the new format of the audio input; if NULL, it is not
	 *                 changed.
	 * \param dst_spec the new format of the audio output; if NULL, it is not
	 *                 changed.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread, as it holds
	 *               a stream-specific mutex while running.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetAudioStreamFormat
	 * \sa SDL_SetAudioStreamFrequencyRatio
	 */"

	^ self ffiCall: #(bool SDL_SetAudioStreamFormat(SDL_AudioStream* stream, SDL_AudioSpec* src_spec, SDL_AudioSpec* dst_spec))
]

{ #category : 'public' }
LibSDL3 >> setAudioStreamFrequencyRatioStream: stream ratio: ratio [
	"/**
	 * Change the frequency ratio of an audio stream.
	 *
	 * The frequency ratio is used to adjust the rate at which input data is
	 * consumed. Changing this effectively modifies the speed and pitch of the
	 * audio. A value greater than 1.0 will play the audio faster, and at a higher
	 * pitch. A value less than 1.0 will play the audio slower, and at a lower
	 * pitch.
	 *
	 * This is applied during SDL_GetAudioStreamData, and can be continuously
	 * changed to create various effects.
	 *
	 * \param stream the stream the frequency ratio is being changed.
	 * \param ratio the frequency ratio. 1.0 is normal speed. Must be between 0.01
	 *              and 100.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread, as it holds
	 *               a stream-specific mutex while running.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetAudioStreamFrequencyRatio
	 * \sa SDL_SetAudioStreamFormat
	 */"

	^ self ffiCall: #(bool SDL_SetAudioStreamFrequencyRatio(SDL_AudioStream* stream, float ratio))
]

{ #category : 'public' }
LibSDL3 >> setAudioStreamGainStream: stream gain: gain [
	"/**
	 * Change the gain of an audio stream.
	 *
	 * The gain of a stream is its volume; a larger gain means a louder output,
	 * with a gain of zero being silence.
	 *
	 * Audio streams default to a gain of 1.0f (no change in output).
	 *
	 * This is applied during SDL_GetAudioStreamData, and can be continuously
	 * changed to create various effects.
	 *
	 * \param stream the stream on which the gain is being changed.
	 * \param gain the gain. 1.0f is no change, 0.0f is silence.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread, as it holds
	 *               a stream-specific mutex while running.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetAudioStreamGain
	 */"

	^ self ffiCall: #(bool SDL_SetAudioStreamGain(SDL_AudioStream* stream, float gain))
]

{ #category : 'public' }
LibSDL3 >> setAudioStreamGetCallbackStream: stream callback: callback userdata: userdata [
	"/**
	 * Set a callback that runs when data is requested from an audio stream.
	 *
	 * This callback is called _before_ data is obtained from the stream, giving
	 * the callback the chance to add more on-demand.
	 *
	 * The callback can (optionally) call SDL_PutAudioStreamData() to add more
	 * audio to the stream during this call; if needed, the request that triggered
	 * this callback will obtain the new data immediately.
	 *
	 * The callback's `additional_amount` argument is roughly how many bytes of
	 * _unconverted_ data (in the stream's input format) is needed by the caller,
	 * although this may overestimate a little for safety. This takes into account
	 * how much is already in the stream and only asks for any extra necessary to
	 * resolve the request, which means the callback may be asked for zero bytes,
	 * and a different amount on each call.
	 *
	 * The callback is not required to supply exact amounts; it is allowed to
	 * supply too much or too little or none at all. The caller will get what's
	 * available, up to the amount they requested, regardless of this callback's
	 * outcome.
	 *
	 * Clearing or flushing an audio stream does not call this callback.
	 *
	 * This function obtains the stream's lock, which means any existing callback
	 * (get or put) in progress will finish running before setting the new
	 * callback.
	 *
	 * Setting a NULL function turns off the callback.
	 *
	 * \param stream the audio stream to set the new callback on.
	 * \param callback the new callback function to call when data is requested
	 *                 from the stream.
	 * \param userdata an opaque pointer provided to the callback for its own
	 *                 personal use.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information. This only fails if `stream` is NULL.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetAudioStreamPutCallback
	 */"

	^ self ffiCall: #(bool SDL_SetAudioStreamGetCallback(SDL_AudioStream* stream, SDL_AudioStreamCallback callback, void* userdata))
]

{ #category : 'public' }
LibSDL3 >> setAudioStreamInputChannelMapStream: stream chmap: chmap count: count [
	"/**
	 * Set the current input channel map of an audio stream.
	 *
	 * Channel maps are optional; most things do not need them, instead passing
	 * data in the [order that SDL expects](CategoryAudio#channel-layouts).
	 *
	 * The input channel map reorders data that is added to a stream via
	 * SDL_PutAudioStreamData. Future calls to SDL_PutAudioStreamData must provide
	 * data in the new channel order.
	 *
	 * Each item in the array represents an input channel, and its value is the
	 * channel that it should be remapped to. To reverse a stereo signal's left
	 * and right values, you'd have an array of `{ 1, 0 }`. It is legal to remap
	 * multiple channels to the same thing, so `{ 1, 1 }` would duplicate the
	 * right channel to both channels of a stereo signal. An element in the
	 * channel map set to -1 instead of a valid channel will mute that channel,
	 * setting it to a silence value.
	 *
	 * You cannot change the number of channels through a channel map, just
	 * reorder/mute them.
	 *
	 * Data that was previously queued in the stream will still be operated on in
	 * the order that was current when it was added, which is to say you can put
	 * the end of a sound file in one order to a stream, change orders for the
	 * next sound file, and start putting that new data while the previous sound
	 * file is still queued, and everything will still play back correctly.
	 *
	 * Audio streams default to no remapping applied. Passing a NULL channel map
	 * is legal, and turns off remapping.
	 *
	 * SDL will copy the channel map; the caller does not have to save this array
	 * after this call.
	 *
	 * If `count` is not equal to the current number of channels in the audio
	 * stream's format, this will fail. This is a safety measure to make sure a
	 * race condition hasn't changed the format while this call is setting the
	 * channel map.
	 *
	 * Unlike attempting to change the stream's format, the input channel map on a
	 * stream bound to a recording device is permitted to change at any time; any
	 * data added to the stream from the device after this call will have the new
	 * mapping, but previously-added data will still have the prior mapping.
	 *
	 * \param stream the SDL_AudioStream to change.
	 * \param chmap the new channel map, NULL to reset to default.
	 * \param count The number of channels in the map.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread, as it holds
	 *               a stream-specific mutex while running. Don't change the
	 *               stream's format to have a different number of channels from a
	 *               a different thread at the same time, though!
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetAudioStreamInputChannelMap
	 */"

	^ self ffiCall: #(bool SDL_SetAudioStreamInputChannelMap(SDL_AudioStream* stream, const int* chmap, int count))
]

{ #category : 'public' }
LibSDL3 >> setAudioStreamOutputChannelMapStream: stream chmap: chmap count: count [
	"/**
	 * Set the current output channel map of an audio stream.
	 *
	 * Channel maps are optional; most things do not need them, instead passing
	 * data in the [order that SDL expects](CategoryAudio#channel-layouts).
	 *
	 * The output channel map reorders data that leaving a stream via
	 * SDL_GetAudioStreamData.
	 *
	 * Each item in the array represents an input channel, and its value is the
	 * channel that it should be remapped to. To reverse a stereo signal's left
	 * and right values, you'd have an array of `{ 1, 0 }`. It is legal to remap
	 * multiple channels to the same thing, so `{ 1, 1 }` would duplicate the
	 * right channel to both channels of a stereo signal. An element in the
	 * channel map set to -1 instead of a valid channel will mute that channel,
	 * setting it to a silence value.
	 *
	 * You cannot change the number of channels through a channel map, just
	 * reorder/mute them.
	 *
	 * The output channel map can be changed at any time, as output remapping is
	 * applied during SDL_GetAudioStreamData.
	 *
	 * Audio streams default to no remapping applied. Passing a NULL channel map
	 * is legal, and turns off remapping.
	 *
	 * SDL will copy the channel map; the caller does not have to save this array
	 * after this call.
	 *
	 * If `count` is not equal to the current number of channels in the audio
	 * stream's format, this will fail. This is a safety measure to make sure a
	 * race condition hasn't changed the format while this call is setting the
	 * channel map.
	 *
	 * Unlike attempting to change the stream's format, the output channel map on
	 * a stream bound to a recording device is permitted to change at any time;
	 * any data added to the stream after this call will have the new mapping, but
	 * previously-added data will still have the prior mapping. When the channel
	 * map doesn't match the hardware's channel layout, SDL will convert the data
	 * before feeding it to the device for playback.
	 *
	 * \param stream the SDL_AudioStream to change.
	 * \param chmap the new channel map, NULL to reset to default.
	 * \param count The number of channels in the map.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread, as it holds
	 *               a stream-specific mutex while running. Don't change the
	 *               stream's format to have a different number of channels from a
	 *               a different thread at the same time, though!
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetAudioStreamInputChannelMap
	 */"

	^ self ffiCall: #(bool SDL_SetAudioStreamOutputChannelMap(SDL_AudioStream* stream, const int* chmap, int count))
]

{ #category : 'public' }
LibSDL3 >> setAudioStreamPutCallbackStream: stream callback: callback userdata: userdata [
	"/**
	 * Set a callback that runs when data is added to an audio stream.
	 *
	 * This callback is called _after_ the data is added to the stream, giving the
	 * callback the chance to obtain it immediately.
	 *
	 * The callback can (optionally) call SDL_GetAudioStreamData() to obtain audio
	 * from the stream during this call.
	 *
	 * The callback's `additional_amount` argument is how many bytes of
	 * _converted_ data (in the stream's output format) was provided by the
	 * caller, although this may underestimate a little for safety. This value
	 * might be less than what is currently available in the stream, if data was
	 * already there, and might be less than the caller provided if the stream
	 * needs to keep a buffer to aid in resampling. Which means the callback may
	 * be provided with zero bytes, and a different amount on each call.
	 *
	 * The callback may call SDL_GetAudioStreamAvailable to see the total amount
	 * currently available to read from the stream, instead of the total provided
	 * by the current call.
	 *
	 * The callback is not required to obtain all data. It is allowed to read less
	 * or none at all. Anything not read now simply remains in the stream for
	 * later access.
	 *
	 * Clearing or flushing an audio stream does not call this callback.
	 *
	 * This function obtains the stream's lock, which means any existing callback
	 * (get or put) in progress will finish running before setting the new
	 * callback.
	 *
	 * Setting a NULL function turns off the callback.
	 *
	 * \param stream the audio stream to set the new callback on.
	 * \param callback the new callback function to call when data is added to the
	 *                 stream.
	 * \param userdata an opaque pointer provided to the callback for its own
	 *                 personal use.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information. This only fails if `stream` is NULL.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetAudioStreamGetCallback
	 */"

	^ self ffiCall: #(bool SDL_SetAudioStreamPutCallback(SDL_AudioStream* stream, SDL_AudioStreamCallback callback, void* userdata))
]

{ #category : 'public' }
LibSDL3 >> setBooleanPropertyProps: props name: name value: value [
	"/**
	 * Set a boolean property in a group of properties.
	 *
	 * \param props the properties to modify.
	 * \param name the name of the property to modify.
	 * \param value the new value of the property.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetBooleanProperty
	 */"

	^ self ffiCall: #(bool SDL_SetBooleanProperty(SDL_PropertiesID props, const char* name, _Bool value))
]

{ #category : 'public' }
LibSDL3 >> setClipboardDataCallback: callback cleanup: cleanup userdata: userdata mimeTypes: mime_types numMimeTypes: num_mime_types [
	"/**
	 * Offer clipboard data to the OS.
	 *
	 * Tell the operating system that the application is offering clipboard data
	 * for each of the provided mime-types. Once another application requests the
	 * data the callback function will be called, allowing it to generate and
	 * respond with the data for the requested mime-type.
	 *
	 * The size of text data does not include any terminator, and the text does
	 * not need to be null terminated (e.g. you can directly copy a portion of a
	 * document).
	 *
	 * \param callback a function pointer to the function that provides the
	 *                 clipboard data.
	 * \param cleanup a function pointer to the function that cleans up the
	 *                clipboard data.
	 * \param userdata an opaque pointer that will be forwarded to the callbacks.
	 * \param mime_types a list of mime-types that are being offered.
	 * \param num_mime_types the number of mime-types in the mime_types list.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_ClearClipboardData
	 * \sa SDL_GetClipboardData
	 * \sa SDL_HasClipboardData
	 */"

	^ self ffiCall: #(bool SDL_SetClipboardData(SDL_ClipboardDataCallback callback, SDL_ClipboardCleanupCallback cleanup, void* userdata, const char** mime_types, size_t num_mime_types))
]

{ #category : 'public' }
LibSDL3 >> setClipboardText: text [
	"/**
	 * Put UTF-8 text into the clipboard.
	 *
	 * \param text the text to store in the clipboard.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetClipboardText
	 * \sa SDL_HasClipboardText
	 */"

	^ self ffiCall: #(bool SDL_SetClipboardText(const char* text))
]

{ #category : 'public' }
LibSDL3 >> setCurrentThreadPriority: priority [
	"/**
	 * Set the priority for the current thread.
	 *
	 * Note that some platforms will not let you alter the priority (or at least,
	 * promote the thread to a higher priority) at all, and some require you to be
	 * an administrator account. Be prepared for this to fail.
	 *
	 * \param priority the SDL_ThreadPriority to set.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_SetCurrentThreadPriority(SDL_ThreadPriority priority))
]

{ #category : 'public' }
LibSDL3 >> setCursor: cursor [
	"/**
	 * Set the active cursor.
	 *
	 * This function sets the currently active cursor to the specified one. If the
	 * cursor is currently visible, the change will be immediately represented on
	 * the display. SDL_SetCursor(NULL) can be used to force cursor redraw, if
	 * this is desired for any reason.
	 *
	 * \param cursor a cursor to make active.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetCursor
	 */"

	^ self ffiCall: #(bool SDL_SetCursor(SDL_Cursor* cursor))
]

{ #category : 'public' }
LibSDL3 >> setEnvironmentVariableEnv: env name: name value: value overwrite: overwrite [
	"/**
	 * Set the value of a variable in the environment.
	 *
	 * \param env the environment to modify.
	 * \param name the name of the variable to set.
	 * \param value the value of the variable to set.
	 * \param overwrite true to overwrite the variable if it exists, false to
	 *                  return success without setting the variable if it already
	 *                  exists.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetEnvironment
	 * \sa SDL_CreateEnvironment
	 * \sa SDL_GetEnvironmentVariable
	 * \sa SDL_GetEnvironmentVariables
	 * \sa SDL_UnsetEnvironmentVariable
	 */"

	^ self ffiCall: #(bool SDL_SetEnvironmentVariable(SDL_Environment* env, const char* name, const char* value, _Bool overwrite))
]

{ #category : 'public' }
LibSDL3 >> setEventEnabledType: type enabled: enabled [
	"/**
	 * Set the state of processing events by type.
	 *
	 * \param type the type of event; see SDL_EventType for details.
	 * \param enabled whether to process the event or not.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_EventEnabled
	 */"

	self ffiCall: #(void SDL_SetEventEnabled(Uint32 type, _Bool enabled))
]

{ #category : 'public' }
LibSDL3 >> setEventFilter: filter userdata: userdata [
	"/**
	 * Set up a filter to process all events before they are added to the internal
	 * event queue.
	 *
	 * If you just want to see events without modifying them or preventing them
	 * from being queued, you should use SDL_AddEventWatch() instead.
	 *
	 * If the filter function returns true when called, then the event will be
	 * added to the internal queue. If it returns false, then the event will be
	 * dropped from the queue, but the internal state will still be updated. This
	 * allows selective filtering of dynamically arriving events.
	 *
	 * **WARNING**: Be very careful of what you do in the event filter function,
	 * as it may run in a different thread!
	 *
	 * On platforms that support it, if the quit event is generated by an
	 * interrupt signal (e.g. pressing Ctrl-C), it will be delivered to the
	 * application at the next event poll.
	 *
	 * Note: Disabled events never make it to the event filter function; see
	 * SDL_SetEventEnabled().
	 *
	 * Note: Events pushed onto the queue with SDL_PushEvent() get passed through
	 * the event filter, but events pushed onto the queue with SDL_PeepEvents() do
	 * not.
	 *
	 * \param filter an SDL_EventFilter function to call when an event happens.
	 * \param userdata a pointer that is passed to `filter`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_AddEventWatch
	 * \sa SDL_SetEventEnabled
	 * \sa SDL_GetEventFilter
	 * \sa SDL_PeepEvents
	 * \sa SDL_PushEvent
	 */"

	self ffiCall: #(void SDL_SetEventFilter(SDL_EventFilter filter, void* userdata))
]

{ #category : 'public' }
LibSDL3 >> setFloatPropertyProps: props name: name value: value [
	"/**
	 * Set a floating point property in a group of properties.
	 *
	 * \param props the properties to modify.
	 * \param name the name of the property to modify.
	 * \param value the new value of the property.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetFloatProperty
	 */"

	^ self ffiCall: #(bool SDL_SetFloatProperty(SDL_PropertiesID props, const char* name, float value))
]

{ #category : 'public' }
LibSDL3 >> setGPUAllowedFramesInFlightDevice: device allowedFramesInFlight: allowed_frames_in_flight [
	"/**
	 * Configures the maximum allowed number of frames in flight.
	 *
	 * The default value when the device is created is 2. This means that after
	 * you have submitted 2 frames for presentation, if the GPU has not finished
	 * working on the first frame, SDL_AcquireGPUSwapchainTexture() will fill the
	 * swapchain texture pointer with NULL, and
	 * SDL_WaitAndAcquireGPUSwapchainTexture() will block.
	 *
	 * Higher values increase throughput at the expense of visual latency. Lower
	 * values decrease visual latency at the expense of throughput.
	 *
	 * Note that calling this function will stall and flush the command queue to
	 * prevent synchronization issues.
	 *
	 * The minimum value of allowed frames in flight is 1, and the maximum is 3.
	 *
	 * \param device a GPU context.
	 * \param allowed_frames_in_flight the maximum number of frames that can be
	 *                                 pending on the GPU.
	 * \returns true if successful, false on error; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_SetGPUAllowedFramesInFlight(SDL_GPUDevice* device, Uint32 allowed_frames_in_flight))
]

{ #category : 'public' }
LibSDL3 >> setGPUBlendConstantsRenderPass: render_pass blendConstants: blend_constants [
	"/**
	 * Sets the current blend constants on a command buffer.
	 *
	 * \param render_pass a render pass handle.
	 * \param blend_constants the blend constant color.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GPU_BLENDFACTOR_CONSTANT_COLOR
	 * \sa SDL_GPU_BLENDFACTOR_ONE_MINUS_CONSTANT_COLOR
	 */"

	self ffiCall: #(void SDL_SetGPUBlendConstants(SDL_GPURenderPass* render_pass, SDL_FColor blend_constants))
]

{ #category : 'public' }
LibSDL3 >> setGPUBufferNameDevice: device buffer: buffer text: text [
	"/**
	 * Sets an arbitrary string constant to label a buffer.
	 *
	 * You should use SDL_PROP_GPU_BUFFER_CREATE_NAME_STRING with
	 * SDL_CreateGPUBuffer instead of this function to avoid thread safety issues.
	 *
	 * \param device a GPU Context.
	 * \param buffer a buffer to attach the name to.
	 * \param text a UTF-8 string constant to mark as the name of the buffer.
	 *
	 * \threadsafety This function is not thread safe, you must make sure the
	 *               buffer is not simultaneously used by any other thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateGPUBuffer
	 */"

	self ffiCall: #(void SDL_SetGPUBufferName(SDL_GPUDevice* device, SDL_GPUBuffer* buffer, const char* text))
]

{ #category : 'public' }
LibSDL3 >> setGPUScissorRenderPass: render_pass scissor: scissor [
	"/**
	 * Sets the current scissor state on a command buffer.
	 *
	 * \param render_pass a render pass handle.
	 * \param scissor the scissor area to set.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_SetGPUScissor(SDL_GPURenderPass* render_pass, SDL_Rect* scissor))
]

{ #category : 'public' }
LibSDL3 >> setGPUStencilReferenceRenderPass: render_pass reference: reference [
	"/**
	 * Sets the current stencil reference value on a command buffer.
	 *
	 * \param render_pass a render pass handle.
	 * \param reference the stencil reference value to set.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_SetGPUStencilReference(SDL_GPURenderPass* render_pass, Uint8 reference))
]

{ #category : 'public' }
LibSDL3 >> setGPUSwapchainParametersDevice: device window: window swapchainComposition: swapchain_composition presentMode: present_mode [
	"/**
	 * Changes the swapchain parameters for the given claimed window.
	 *
	 * This function will fail if the requested present mode or swapchain
	 * composition are unsupported by the device. Check if the parameters are
	 * supported via SDL_WindowSupportsGPUPresentMode /
	 * SDL_WindowSupportsGPUSwapchainComposition prior to calling this function.
	 *
	 * SDL_GPU_PRESENTMODE_VSYNC and SDL_GPU_SWAPCHAINCOMPOSITION_SDR are always
	 * supported.
	 *
	 * \param device a GPU context.
	 * \param window an SDL_Window that has been claimed.
	 * \param swapchain_composition the desired composition of the swapchain.
	 * \param present_mode the desired present mode for the swapchain.
	 * \returns true if successful, false on error; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_WindowSupportsGPUPresentMode
	 * \sa SDL_WindowSupportsGPUSwapchainComposition
	 */"

	^ self ffiCall: #(bool SDL_SetGPUSwapchainParameters(SDL_GPUDevice* device, SDL_Window* window, SDL_GPUSwapchainComposition swapchain_composition, SDL_GPUPresentMode present_mode))
]

{ #category : 'public' }
LibSDL3 >> setGPUTextureNameDevice: device texture: texture text: text [
	"/**
	 * Sets an arbitrary string constant to label a texture.
	 *
	 * You should use SDL_PROP_GPU_TEXTURE_CREATE_NAME_STRING with
	 * SDL_CreateGPUTexture instead of this function to avoid thread safety
	 * issues.
	 *
	 * \param device a GPU Context.
	 * \param texture a texture to attach the name to.
	 * \param text a UTF-8 string constant to mark as the name of the texture.
	 *
	 * \threadsafety This function is not thread safe, you must make sure the
	 *               texture is not simultaneously used by any other thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateGPUTexture
	 */"

	self ffiCall: #(void SDL_SetGPUTextureName(SDL_GPUDevice* device, SDL_GPUTexture* texture, const char* text))
]

{ #category : 'public' }
LibSDL3 >> setGPUViewportRenderPass: render_pass viewport: viewport [
	"/**
	 * Sets the current viewport state on a command buffer.
	 *
	 * \param render_pass a render pass handle.
	 * \param viewport the viewport to set.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_SetGPUViewport(SDL_GPURenderPass* render_pass, SDL_GPUViewport* viewport))
]

{ #category : 'public' }
LibSDL3 >> setInitializedState: state initialized: initialized [
	"/**
	 * Finish an initialization state transition.
	 *
	 * This function sets the status of the passed in state to
	 * `SDL_INIT_STATUS_INITIALIZED` or `SDL_INIT_STATUS_UNINITIALIZED` and allows
	 * any threads waiting for the status to proceed.
	 *
	 * \param state the initialization state to check.
	 * \param initialized the new initialization state.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_ShouldInit
	 * \sa SDL_ShouldQuit
	 */"

	self ffiCall: #(void SDL_SetInitialized(SDL_InitState* state, _Bool initialized))
]

{ #category : 'public' }
LibSDL3 >> setJoystickEventsEnabled: enabled [
	"/**
	 * Set the state of joystick event processing.
	 *
	 * If joystick events are disabled, you must call SDL_UpdateJoysticks()
	 * yourself and check the state of the joystick when you want joystick
	 * information.
	 *
	 * \param enabled whether to process joystick events or not.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_JoystickEventsEnabled
	 * \sa SDL_UpdateJoysticks
	 */"

	self ffiCall: #(void SDL_SetJoystickEventsEnabled(_Bool enabled))
]

{ #category : 'public' }
LibSDL3 >> setJoystickLEDJoystick: joystick red: red green: green blue: blue [
	"/**
	 * Update a joystick's LED color.
	 *
	 * An example of a joystick LED is the light on the back of a PlayStation 4's
	 * DualShock 4 controller.
	 *
	 * For joysticks with a single color LED, the maximum of the RGB values will
	 * be used as the LED brightness.
	 *
	 * \param joystick the joystick to update.
	 * \param red the intensity of the red LED.
	 * \param green the intensity of the green LED.
	 * \param blue the intensity of the blue LED.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_SetJoystickLED(SDL_Joystick* joystick, Uint8 red, Uint8 green, Uint8 blue))
]

{ #category : 'public' }
LibSDL3 >> setJoystickPlayerIndexJoystick: joystick playerIndex: player_index [
	"/**
	 * Set the player index of an opened joystick.
	 *
	 * \param joystick the SDL_Joystick obtained from SDL_OpenJoystick().
	 * \param player_index player index to assign to this joystick, or -1 to clear
	 *                     the player index and turn off player LEDs.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetJoystickPlayerIndex
	 */"

	^ self ffiCall: #(bool SDL_SetJoystickPlayerIndex(SDL_Joystick* joystick, int player_index))
]

{ #category : 'public' }
LibSDL3 >> setJoystickVirtualAxisJoystick: joystick axis: axis value: value [
	"/**
	 * Set the state of an axis on an opened virtual joystick.
	 *
	 * Please note that values set here will not be applied until the next call to
	 * SDL_UpdateJoysticks, which can either be called directly, or can be called
	 * indirectly through various other SDL APIs, including, but not limited to
	 * the following: SDL_PollEvent, SDL_PumpEvents, SDL_WaitEventTimeout,
	 * SDL_WaitEvent.
	 *
	 * Note that when sending trigger axes, you should scale the value to the full
	 * range of Sint16. For example, a trigger at rest would have the value of
	 * `SDL_JOYSTICK_AXIS_MIN`.
	 *
	 * \param joystick the virtual joystick on which to set state.
	 * \param axis the index of the axis on the virtual joystick to update.
	 * \param value the new value for the specified axis.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_SetJoystickVirtualAxis(SDL_Joystick* joystick, int axis, Sint16 value))
]

{ #category : 'public' }
LibSDL3 >> setJoystickVirtualBallJoystick: joystick ball: ball xrel: xrel yrel: yrel [
	"/**
	 * Generate ball motion on an opened virtual joystick.
	 *
	 * Please note that values set here will not be applied until the next call to
	 * SDL_UpdateJoysticks, which can either be called directly, or can be called
	 * indirectly through various other SDL APIs, including, but not limited to
	 * the following: SDL_PollEvent, SDL_PumpEvents, SDL_WaitEventTimeout,
	 * SDL_WaitEvent.
	 *
	 * \param joystick the virtual joystick on which to set state.
	 * \param ball the index of the ball on the virtual joystick to update.
	 * \param xrel the relative motion on the X axis.
	 * \param yrel the relative motion on the Y axis.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_SetJoystickVirtualBall(SDL_Joystick* joystick, int ball, Sint16 xrel, Sint16 yrel))
]

{ #category : 'public' }
LibSDL3 >> setJoystickVirtualButtonJoystick: joystick button: button down: down [
	"/**
	 * Set the state of a button on an opened virtual joystick.
	 *
	 * Please note that values set here will not be applied until the next call to
	 * SDL_UpdateJoysticks, which can either be called directly, or can be called
	 * indirectly through various other SDL APIs, including, but not limited to
	 * the following: SDL_PollEvent, SDL_PumpEvents, SDL_WaitEventTimeout,
	 * SDL_WaitEvent.
	 *
	 * \param joystick the virtual joystick on which to set state.
	 * \param button the index of the button on the virtual joystick to update.
	 * \param down true if the button is pressed, false otherwise.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_SetJoystickVirtualButton(SDL_Joystick* joystick, int button, _Bool down))
]

{ #category : 'public' }
LibSDL3 >> setJoystickVirtualHatJoystick: joystick hat: hat value: value [
	"/**
	 * Set the state of a hat on an opened virtual joystick.
	 *
	 * Please note that values set here will not be applied until the next call to
	 * SDL_UpdateJoysticks, which can either be called directly, or can be called
	 * indirectly through various other SDL APIs, including, but not limited to
	 * the following: SDL_PollEvent, SDL_PumpEvents, SDL_WaitEventTimeout,
	 * SDL_WaitEvent.
	 *
	 * \param joystick the virtual joystick on which to set state.
	 * \param hat the index of the hat on the virtual joystick to update.
	 * \param value the new value for the specified hat.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_SetJoystickVirtualHat(SDL_Joystick* joystick, int hat, Uint8 value))
]

{ #category : 'public' }
LibSDL3 >> setJoystickVirtualTouchpadJoystick: joystick touchpad: touchpad finger: finger down: down x: x y: y pressure: pressure [
	"/**
	 * Set touchpad finger state on an opened virtual joystick.
	 *
	 * Please note that values set here will not be applied until the next call to
	 * SDL_UpdateJoysticks, which can either be called directly, or can be called
	 * indirectly through various other SDL APIs, including, but not limited to
	 * the following: SDL_PollEvent, SDL_PumpEvents, SDL_WaitEventTimeout,
	 * SDL_WaitEvent.
	 *
	 * \param joystick the virtual joystick on which to set state.
	 * \param touchpad the index of the touchpad on the virtual joystick to
	 *                 update.
	 * \param finger the index of the finger on the touchpad to set.
	 * \param down true if the finger is pressed, false if the finger is released.
	 * \param x the x coordinate of the finger on the touchpad, normalized 0 to 1,
	 *          with the origin in the upper left.
	 * \param y the y coordinate of the finger on the touchpad, normalized 0 to 1,
	 *          with the origin in the upper left.
	 * \param pressure the pressure of the finger.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_SetJoystickVirtualTouchpad(SDL_Joystick* joystick, int touchpad, int finger, _Bool down, float x, float y, float pressure))
]

{ #category : 'public' }
LibSDL3 >> setLinuxThreadPriorityAndPolicyThreadID: threadID sdlPriority: sdlPriority schedPolicy: schedPolicy [
	"/**
	 * Sets the priority (not nice level) and scheduling policy for a thread.
	 *
	 * This uses setpriority() if possible, and RealtimeKit if available.
	 *
	 * \param threadID the Unix thread ID to change priority of.
	 * \param sdlPriority the new SDL_ThreadPriority value.
	 * \param schedPolicy the new scheduling policy (SCHED_FIFO, SCHED_RR,
	 *                    SCHED_OTHER, etc...).
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_SetLinuxThreadPriorityAndPolicy(Sint64 threadID, int sdlPriority, int schedPolicy))
]

{ #category : 'public' }
LibSDL3 >> setLinuxThreadPriorityThreadID: threadID priority: priority [
	"/**
	 * Sets the UNIX nice value for a thread.
	 *
	 * This uses setpriority() if possible, and RealtimeKit if available.
	 *
	 * \param threadID the Unix thread ID to change priority of.
	 * \param priority the new, Unix-specific, priority value.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_SetLinuxThreadPriority(Sint64 threadID, int priority))
]

{ #category : 'public' }
LibSDL3 >> setMemoryFunctionsMallocFunc: malloc_func callocFunc: calloc_func reallocFunc: realloc_func freeFunc: free_func [
	"/**
	 * Replace SDL's memory allocation functions with a custom set.
	 *
	 * It is not safe to call this function once any allocations have been made,
	 * as future calls to SDL_free will use the new allocator, even if they came
	 * from an SDL_malloc made with the old one!
	 *
	 * If used, usually this needs to be the first call made into the SDL library,
	 * if not the very first thing done at program startup time.
	 *
	 * \param malloc_func custom malloc function.
	 * \param calloc_func custom calloc function.
	 * \param realloc_func custom realloc function.
	 * \param free_func custom free function.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread, but one
	 *               should not replace the memory functions once any allocations
	 *               are made!
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetMemoryFunctions
	 * \sa SDL_GetOriginalMemoryFunctions
	 */"

	^ self ffiCall: #(bool SDL_SetMemoryFunctions(SDL_malloc_func malloc_func, SDL_calloc_func calloc_func, SDL_realloc_func realloc_func, SDL_free_func free_func))
]

{ #category : 'public' }
LibSDL3 >> setModState: modstate [
	"/**
	 * Set the current key modifier state for the keyboard.
	 *
	 * The inverse of SDL_GetModState(), SDL_SetModState() allows you to impose
	 * modifier key states on your application. Simply pass your desired modifier
	 * states into `modstate`. This value may be a bitwise, OR'd combination of
	 * SDL_Keymod values.
	 *
	 * This does not change the keyboard state, only the key modifier flags that
	 * SDL reports.
	 *
	 * \param modstate the desired SDL_Keymod for the keyboard.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetModState
	 */"

	self ffiCall: #(void SDL_SetModState(SDL_Keymod modstate))
]

{ #category : 'public' }
LibSDL3 >> setNumberPropertyProps: props name: name value: value [
	"/**
	 * Set an integer property in a group of properties.
	 *
	 * \param props the properties to modify.
	 * \param name the name of the property to modify.
	 * \param value the new value of the property.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetNumberProperty
	 */"

	^ self ffiCall: #(bool SDL_SetNumberProperty(SDL_PropertiesID props, const char* name, Sint64 value))
]

{ #category : 'public' }
LibSDL3 >> setPaletteColorsPalette: palette colors: colors firstcolor: firstcolor ncolors: ncolors [
	"/**
	 * Set a range of colors in a palette.
	 *
	 * \param palette the SDL_Palette structure to modify.
	 * \param colors an array of SDL_Color structures to copy into the palette.
	 * \param firstcolor the index of the first palette entry to modify.
	 * \param ncolors the number of entries to modify.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread, as long as
	 *               the palette is not modified or destroyed in another thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_SetPaletteColors(SDL_Palette* palette, SDL_Color* colors, int firstcolor, int ncolors))
]

{ #category : 'public' }
LibSDL3 >> setPointerPropertyProps: props name: name value: value [
	"/**
	 * Set a pointer property in a group of properties.
	 *
	 * \param props the properties to modify.
	 * \param name the name of the property to modify.
	 * \param value the new value of the property, or NULL to delete the property.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetPointerProperty
	 * \sa SDL_HasProperty
	 * \sa SDL_SetBooleanProperty
	 * \sa SDL_SetFloatProperty
	 * \sa SDL_SetNumberProperty
	 * \sa SDL_SetPointerPropertyWithCleanup
	 * \sa SDL_SetStringProperty
	 */"

	^ self ffiCall: #(bool SDL_SetPointerProperty(SDL_PropertiesID props, const char* name, void* value))
]

{ #category : 'public' }
LibSDL3 >> setPointerPropertyWithCleanupProps: props name: name value: value cleanup: cleanup userdata: userdata [
	"/**
	 * Set a pointer property in a group of properties with a cleanup function
	 * that is called when the property is deleted.
	 *
	 * The cleanup function is also called if setting the property fails for any
	 * reason.
	 *
	 * For simply setting basic data types, like numbers, bools, or strings, use
	 * SDL_SetNumberProperty, SDL_SetBooleanProperty, or SDL_SetStringProperty
	 * instead, as those functions will handle cleanup on your behalf. This
	 * function is only for more complex, custom data.
	 *
	 * \param props the properties to modify.
	 * \param name the name of the property to modify.
	 * \param value the new value of the property, or NULL to delete the property.
	 * \param cleanup the function to call when this property is deleted, or NULL
	 *                if no cleanup is necessary.
	 * \param userdata a pointer that is passed to the cleanup function.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetPointerProperty
	 * \sa SDL_SetPointerProperty
	 * \sa SDL_CleanupPropertyCallback
	 */"

	^ self ffiCall: #(bool SDL_SetPointerPropertyWithCleanup(SDL_PropertiesID props, const char* name, void* value, SDL_CleanupPropertyCallback cleanup, void* userdata))
]

{ #category : 'public' }
LibSDL3 >> setPrimarySelectionText: text [
	"/**
	 * Put UTF-8 text into the primary selection.
	 *
	 * \param text the text to store in the primary selection.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetPrimarySelectionText
	 * \sa SDL_HasPrimarySelectionText
	 */"

	^ self ffiCall: #(bool SDL_SetPrimarySelectionText(const char* text))
]

{ #category : 'public' }
LibSDL3 >> setRenderClipRectRenderer: renderer rect: rect [
	"/**
	 * Set the clip rectangle for rendering on the specified target.
	 *
	 * Each render target has its own clip rectangle. This function sets the
	 * cliprect for the current render target.
	 *
	 * \param renderer the rendering context.
	 * \param rect an SDL_Rect structure representing the clip area, relative to
	 *             the viewport, or NULL to disable clipping.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetRenderClipRect
	 * \sa SDL_RenderClipEnabled
	 */"

	^ self ffiCall: #(bool SDL_SetRenderClipRect(SDL_Renderer* renderer, SDL_Rect* rect))
]

{ #category : 'public' }
LibSDL3 >> setRenderColorScaleRenderer: renderer scale: scale [
	"/**
	 * Set the color scale used for render operations.
	 *
	 * The color scale is an additional scale multiplied into the pixel color
	 * value while rendering. This can be used to adjust the brightness of colors
	 * during HDR rendering, or changing HDR video brightness when playing on an
	 * SDR display.
	 *
	 * The color scale does not affect the alpha channel, only the color
	 * brightness.
	 *
	 * \param renderer the rendering context.
	 * \param scale the color scale value.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetRenderColorScale
	 */"

	^ self ffiCall: #(bool SDL_SetRenderColorScale(SDL_Renderer* renderer, float scale))
]

{ #category : 'public' }
LibSDL3 >> setRenderDrawBlendModeRenderer: renderer blendMode: blendMode [
	"/**
	 * Set the blend mode used for drawing operations (Fill and Line).
	 *
	 * If the blend mode is not supported, the closest supported mode is chosen.
	 *
	 * \param renderer the rendering context.
	 * \param blendMode the SDL_BlendMode to use for blending.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetRenderDrawBlendMode
	 */"

	^ self ffiCall: #(bool SDL_SetRenderDrawBlendMode(SDL_Renderer* renderer, SDL_BlendMode blendMode))
]

{ #category : 'public' }
LibSDL3 >> setRenderDrawColorFloatRenderer: renderer r: r g: g b: b a: a [
	"/**
	 * Set the color used for drawing operations (Rect, Line and Clear).
	 *
	 * Set the color for drawing or filling rectangles, lines, and points, and for
	 * SDL_RenderClear().
	 *
	 * \param renderer the rendering context.
	 * \param r the red value used to draw on the rendering target.
	 * \param g the green value used to draw on the rendering target.
	 * \param b the blue value used to draw on the rendering target.
	 * \param a the alpha value used to draw on the rendering target. Use
	 *          SDL_SetRenderDrawBlendMode to specify how the alpha channel is
	 *          used.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetRenderDrawColorFloat
	 * \sa SDL_SetRenderDrawColor
	 */"

	^ self ffiCall: #(bool SDL_SetRenderDrawColorFloat(SDL_Renderer* renderer, float r, float g, float b, float a))
]

{ #category : 'public' }
LibSDL3 >> setRenderDrawColorRenderer: renderer r: r g: g b: b a: a [
	"/**
	 * Set the color used for drawing operations.
	 *
	 * Set the color for drawing or filling rectangles, lines, and points, and for
	 * SDL_RenderClear().
	 *
	 * \param renderer the rendering context.
	 * \param r the red value used to draw on the rendering target.
	 * \param g the green value used to draw on the rendering target.
	 * \param b the blue value used to draw on the rendering target.
	 * \param a the alpha value used to draw on the rendering target; usually
	 *          `SDL_ALPHA_OPAQUE` (255). Use SDL_SetRenderDrawBlendMode to
	 *          specify how the alpha channel is used.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetRenderDrawColor
	 * \sa SDL_SetRenderDrawColorFloat
	 */"

	^ self ffiCall: #(bool SDL_SetRenderDrawColor(SDL_Renderer* renderer, Uint8 r, Uint8 g, Uint8 b, Uint8 a))
]

{ #category : 'public' }
LibSDL3 >> setRenderLogicalPresentationRenderer: renderer w: w h: h mode: mode [
	"/**
	 * Set a device-independent resolution and presentation mode for rendering.
	 *
	 * This function sets the width and height of the logical rendering output.
	 * The renderer will act as if the current render target is always the
	 * requested dimensions, scaling to the actual resolution as necessary.
	 *
	 * This can be useful for games that expect a fixed size, but would like to
	 * scale the output to whatever is available, regardless of how a user resizes
	 * a window, or if the display is high DPI.
	 *
	 * Logical presentation can be used with both render target textures and the
	 * renderer's window; the state is unique to each render target, and this
	 * function sets the state for the current render target. It might be useful
	 * to draw to a texture that matches the window dimensions with logical
	 * presentation enabled, and then draw that texture across the entire window
	 * with logical presentation disabled. Be careful not to render both with
	 * logical presentation enabled, however, as this could produce
	 * double-letterboxing, etc.
	 *
	 * You can disable logical coordinates by setting the mode to
	 * SDL_LOGICAL_PRESENTATION_DISABLED, and in that case you get the full pixel
	 * resolution of the render target; it is safe to toggle logical presentation
	 * during the rendering of a frame: perhaps most of the rendering is done to
	 * specific dimensions but to make fonts look sharp, the app turns off logical
	 * presentation while drawing text, for example.
	 *
	 * For the renderer's window, letterboxing is drawn into the framebuffer if
	 * logical presentation is enabled during SDL_RenderPresent; be sure to
	 * reenable it before presenting if you were toggling it, otherwise the
	 * letterbox areas might have artifacts from previous frames (or artifacts
	 * from external overlays, etc). Letterboxing is never drawn into texture
	 * render targets; be sure to call SDL_RenderClear() before drawing into the
	 * texture so the letterboxing areas are cleared, if appropriate.
	 *
	 * You can convert coordinates in an event into rendering coordinates using
	 * SDL_ConvertEventToRenderCoordinates().
	 *
	 * \param renderer the rendering context.
	 * \param w the width of the logical resolution.
	 * \param h the height of the logical resolution.
	 * \param mode the presentation mode used.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_ConvertEventToRenderCoordinates
	 * \sa SDL_GetRenderLogicalPresentation
	 * \sa SDL_GetRenderLogicalPresentationRect
	 */"

	^ self ffiCall: #(bool SDL_SetRenderLogicalPresentation(SDL_Renderer* renderer, int w, int h, SDL_RendererLogicalPresentation mode))
]

{ #category : 'public' }
LibSDL3 >> setRenderScaleRenderer: renderer scaleX: scaleX scaleY: scaleY [
	"/**
	 * Set the drawing scale for rendering on the current target.
	 *
	 * The drawing coordinates are scaled by the x/y scaling factors before they
	 * are used by the renderer. This allows resolution independent drawing with a
	 * single coordinate system.
	 *
	 * If this results in scaling or subpixel drawing by the rendering backend, it
	 * will be handled using the appropriate quality hints. For best results use
	 * integer scaling factors.
	 *
	 * Each render target has its own scale. This function sets the scale for the
	 * current render target.
	 *
	 * \param renderer the rendering context.
	 * \param scaleX the horizontal scaling factor.
	 * \param scaleY the vertical scaling factor.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetRenderScale
	 */"

	^ self ffiCall: #(bool SDL_SetRenderScale(SDL_Renderer* renderer, float scaleX, float scaleY))
]

{ #category : 'public' }
LibSDL3 >> setRenderTargetRenderer: renderer texture: texture [
	"/**
	 * Set a texture as the current rendering target.
	 *
	 * The default render target is the window for which the renderer was created.
	 * To stop rendering to a texture and render to the window again, call this
	 * function with a NULL `texture`.
	 *
	 * Viewport, cliprect, scale, and logical presentation are unique to each
	 * render target. Get and set functions for these states apply to the current
	 * render target set by this function, and those states persist on each target
	 * when the current render target changes.
	 *
	 * \param renderer the rendering context.
	 * \param texture the targeted texture, which must be created with the
	 *                `SDL_TEXTUREACCESS_TARGET` flag, or NULL to render to the
	 *                window instead of a texture.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetRenderTarget
	 */"

	^ self ffiCall: #(bool SDL_SetRenderTarget(SDL_Renderer* renderer, SDL_Texture* texture))
]

{ #category : 'public' }
LibSDL3 >> setRenderVSyncRenderer: renderer vsync: vsync [
	"/**
	 * Toggle VSync of the given renderer.
	 *
	 * When a renderer is created, vsync defaults to SDL_RENDERER_VSYNC_DISABLED.
	 *
	 * The `vsync` parameter can be 1 to synchronize present with every vertical
	 * refresh, 2 to synchronize present with every second vertical refresh, etc.,
	 * SDL_RENDERER_VSYNC_ADAPTIVE for late swap tearing (adaptive vsync), or
	 * SDL_RENDERER_VSYNC_DISABLED to disable. Not every value is supported by
	 * every driver, so you should check the return value to see whether the
	 * requested setting is supported.
	 *
	 * \param renderer the renderer to toggle.
	 * \param vsync the vertical refresh sync interval.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetRenderVSync
	 */"

	^ self ffiCall: #(bool SDL_SetRenderVSync(SDL_Renderer* renderer, int vsync))
]

{ #category : 'public' }
LibSDL3 >> setRenderViewportRenderer: renderer rect: rect [
	"/**
	 * Set the drawing area for rendering on the current target.
	 *
	 * Drawing will clip to this area (separately from any clipping done with
	 * SDL_SetRenderClipRect), and the top left of the area will become coordinate
	 * (0, 0) for future drawing commands.
	 *
	 * The area's width and height must be >= 0.
	 *
	 * Each render target has its own viewport. This function sets the viewport
	 * for the current render target.
	 *
	 * \param renderer the rendering context.
	 * \param rect the SDL_Rect structure representing the drawing area, or NULL
	 *             to set the viewport to the entire target.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetRenderViewport
	 * \sa SDL_RenderViewportSet
	 */"

	^ self ffiCall: #(bool SDL_SetRenderViewport(SDL_Renderer* renderer, SDL_Rect* rect))
]

{ #category : 'public' }
LibSDL3 >> setScancodeNameScancode: scancode name: name [
	"/**
	 * Set a human-readable name for a scancode.
	 *
	 * \param scancode the desired SDL_Scancode.
	 * \param name the name to use for the scancode, encoded as UTF-8. The string
	 *             is not copied, so the pointer given to this function must stay
	 *             valid while SDL is being used.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetScancodeName
	 */"

	^ self ffiCall: #(bool SDL_SetScancodeName(SDL_Scancode scancode, const char* name))
]

{ #category : 'public' }
LibSDL3 >> setStringPropertyProps: props name: name value: value [
	"/**
	 * Set a string property in a group of properties.
	 *
	 * This function makes a copy of the string; the caller does not have to
	 * preserve the data after this call completes.
	 *
	 * \param props the properties to modify.
	 * \param name the name of the property to modify.
	 * \param value the new value of the property, or NULL to delete the property.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetStringProperty
	 */"

	^ self ffiCall: #(bool SDL_SetStringProperty(SDL_PropertiesID props, const char* name, const char* value))
]

{ #category : 'public' }
LibSDL3 >> setSurfaceAlphaModSurface: surface alpha: alpha [
	"/**
	 * Set an additional alpha value used in blit operations.
	 *
	 * When this surface is blitted, during the blit operation the source alpha
	 * value is modulated by this alpha value according to the following formula:
	 *
	 * `srcA = srcA * (alpha / 255)`
	 *
	 * \param surface the SDL_Surface structure to update.
	 * \param alpha the alpha value multiplied into blit operations.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetSurfaceAlphaMod
	 * \sa SDL_SetSurfaceColorMod
	 */"

	^ self ffiCall: #(bool SDL_SetSurfaceAlphaMod(SDL_Surface* surface, Uint8 alpha))
]

{ #category : 'public' }
LibSDL3 >> setSurfaceBlendModeSurface: surface blendMode: blendMode [
	"/**
	 * Set the blend mode used for blit operations.
	 *
	 * To copy a surface to another surface (or texture) without blending with the
	 * existing data, the blendmode of the SOURCE surface should be set to
	 * `SDL_BLENDMODE_NONE`.
	 *
	 * \param surface the SDL_Surface structure to update.
	 * \param blendMode the SDL_BlendMode to use for blit blending.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetSurfaceBlendMode
	 */"

	^ self ffiCall: #(bool SDL_SetSurfaceBlendMode(SDL_Surface* surface, SDL_BlendMode blendMode))
]

{ #category : 'public' }
LibSDL3 >> setSurfaceClipRectSurface: surface rect: rect [
	"/**
	 * Set the clipping rectangle for a surface.
	 *
	 * When `surface` is the destination of a blit, only the area within the clip
	 * rectangle is drawn into.
	 *
	 * Note that blits are automatically clipped to the edges of the source and
	 * destination surfaces.
	 *
	 * \param surface the SDL_Surface structure to be clipped.
	 * \param rect the SDL_Rect structure representing the clipping rectangle, or
	 *             NULL to disable clipping.
	 * \returns true if the rectangle intersects the surface, otherwise false and
	 *          blits will be completely clipped.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetSurfaceClipRect
	 */"

	^ self ffiCall: #(bool SDL_SetSurfaceClipRect(SDL_Surface* surface, SDL_Rect* rect))
]

{ #category : 'public' }
LibSDL3 >> setSurfaceColorKeySurface: surface enabled: enabled key: key [
	"/**
	 * Set the color key (transparent pixel) in a surface.
	 *
	 * The color key defines a pixel value that will be treated as transparent in
	 * a blit. For example, one can use this to specify that cyan pixels should be
	 * considered transparent, and therefore not rendered.
	 *
	 * It is a pixel of the format used by the surface, as generated by
	 * SDL_MapRGB().
	 *
	 * \param surface the SDL_Surface structure to update.
	 * \param enabled true to enable color key, false to disable color key.
	 * \param key the transparent pixel.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetSurfaceColorKey
	 * \sa SDL_SetSurfaceRLE
	 * \sa SDL_SurfaceHasColorKey
	 */"

	^ self ffiCall: #(bool SDL_SetSurfaceColorKey(SDL_Surface* surface, _Bool enabled, Uint32 key))
]

{ #category : 'public' }
LibSDL3 >> setSurfaceColorModSurface: surface r: r g: g b: b [
	"/**
	 * Set an additional color value multiplied into blit operations.
	 *
	 * When this surface is blitted, during the blit operation each source color
	 * channel is modulated by the appropriate color value according to the
	 * following formula:
	 *
	 * `srcC = srcC * (color / 255)`
	 *
	 * \param surface the SDL_Surface structure to update.
	 * \param r the red color value multiplied into blit operations.
	 * \param g the green color value multiplied into blit operations.
	 * \param b the blue color value multiplied into blit operations.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetSurfaceColorMod
	 * \sa SDL_SetSurfaceAlphaMod
	 */"

	^ self ffiCall: #(bool SDL_SetSurfaceColorMod(SDL_Surface* surface, Uint8 r, Uint8 g, Uint8 b))
]

{ #category : 'public' }
LibSDL3 >> setSurfaceColorspaceSurface: surface colorspace: colorspace [
	"/**
	 * Set the colorspace used by a surface.
	 *
	 * Setting the colorspace doesn't change the pixels, only how they are
	 * interpreted in color operations.
	 *
	 * \param surface the SDL_Surface structure to update.
	 * \param colorspace an SDL_Colorspace value describing the surface
	 *                   colorspace.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetSurfaceColorspace
	 */"

	^ self ffiCall: #(bool SDL_SetSurfaceColorspace(SDL_Surface* surface, SDL_Colorspace colorspace))
]

{ #category : 'public' }
LibSDL3 >> setSurfacePaletteSurface: surface palette: palette [
	"/**
	 * Set the palette used by a surface.
	 *
	 * A single palette can be shared with many surfaces.
	 *
	 * \param surface the SDL_Surface structure to update.
	 * \param palette the SDL_Palette structure to use.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreatePalette
	 * \sa SDL_GetSurfacePalette
	 */"

	^ self ffiCall: #(bool SDL_SetSurfacePalette(SDL_Surface* surface, SDL_Palette* palette))
]

{ #category : 'public' }
LibSDL3 >> setSurfaceRLESurface: surface enabled: enabled [
	"/**
	 * Set the RLE acceleration hint for a surface.
	 *
	 * If RLE is enabled, color key and alpha blending blits are much faster, but
	 * the surface must be locked before directly accessing the pixels.
	 *
	 * \param surface the SDL_Surface structure to optimize.
	 * \param enabled true to enable RLE acceleration, false to disable it.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_BlitSurface
	 * \sa SDL_LockSurface
	 * \sa SDL_UnlockSurface
	 */"

	^ self ffiCall: #(bool SDL_SetSurfaceRLE(SDL_Surface* surface, _Bool enabled))
]

{ #category : 'public' }
LibSDL3 >> setTLSId: id value: value destructor: destructor [
	"/**
	 * Set the current thread's value associated with a thread local storage ID.
	 *
	 * If the thread local storage ID is not initialized (the value is 0), a new
	 * ID will be created in a thread-safe way, so all calls using a pointer to
	 * the same ID will refer to the same local storage.
	 *
	 * Note that replacing a value from a previous call to this function on the
	 * same thread does _not_ call the previous value's destructor!
	 *
	 * `destructor` can be NULL; it is assumed that `value` does not need to be
	 * cleaned up if so.
	 *
	 * \param id a pointer to the thread local storage ID, may not be NULL.
	 * \param value the value to associate with the ID for the current thread.
	 * \param destructor a function called when the thread exits, to free the
	 *                   value, may be NULL.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetTLS
	 */"

	^ self ffiCall: #(bool SDL_SetTLS(SDL_TLSID* id, const void* value, SDL_TLSDestructorCallback destructor))
]

{ #category : 'public' }
LibSDL3 >> setTextInputAreaWindow: window rect: rect cursor: cursor [
	"/**
	 * Set the area used to type Unicode text input.
	 *
	 * Native input methods may place a window with word suggestions near the
	 * cursor, without covering the text being entered.
	 *
	 * \param window the window for which to set the text input area.
	 * \param rect the SDL_Rect representing the text input area, in window
	 *             coordinates, or NULL to clear it.
	 * \param cursor the offset of the current cursor location relative to
	 *               `rect->x`, in window coordinates.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetTextInputArea
	 * \sa SDL_StartTextInput
	 */"

	^ self ffiCall: #(bool SDL_SetTextInputArea(SDL_Window* window, SDL_Rect* rect, int cursor))
]

{ #category : 'public' }
LibSDL3 >> setTextureAlphaModFloatTexture: texture alpha: alpha [
	"/**
	 * Set an additional alpha value multiplied into render copy operations.
	 *
	 * When this texture is rendered, during the copy operation the source alpha
	 * value is modulated by this alpha value according to the following formula:
	 *
	 * `srcA = srcA * alpha`
	 *
	 * Alpha modulation is not always supported by the renderer; it will return
	 * false if alpha modulation is not supported.
	 *
	 * \param texture the texture to update.
	 * \param alpha the source alpha value multiplied into copy operations.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetTextureAlphaModFloat
	 * \sa SDL_SetTextureAlphaMod
	 * \sa SDL_SetTextureColorModFloat
	 */"

	^ self ffiCall: #(bool SDL_SetTextureAlphaModFloat(SDL_Texture* texture, float alpha))
]

{ #category : 'public' }
LibSDL3 >> setTextureAlphaModTexture: texture alpha: alpha [
	"/**
	 * Set an additional alpha value multiplied into render copy operations.
	 *
	 * When this texture is rendered, during the copy operation the source alpha
	 * value is modulated by this alpha value according to the following formula:
	 *
	 * `srcA = srcA * (alpha / 255)`
	 *
	 * Alpha modulation is not always supported by the renderer; it will return
	 * false if alpha modulation is not supported.
	 *
	 * \param texture the texture to update.
	 * \param alpha the source alpha value multiplied into copy operations.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetTextureAlphaMod
	 * \sa SDL_SetTextureAlphaModFloat
	 * \sa SDL_SetTextureColorMod
	 */"

	^ self ffiCall: #(bool SDL_SetTextureAlphaMod(SDL_Texture* texture, Uint8 alpha))
]

{ #category : 'public' }
LibSDL3 >> setTextureBlendModeTexture: texture blendMode: blendMode [
	"/**
	 * Set the blend mode for a texture, used by SDL_RenderTexture().
	 *
	 * If the blend mode is not supported, the closest supported mode is chosen
	 * and this function returns false.
	 *
	 * \param texture the texture to update.
	 * \param blendMode the SDL_BlendMode to use for texture blending.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetTextureBlendMode
	 */"

	^ self ffiCall: #(bool SDL_SetTextureBlendMode(SDL_Texture* texture, SDL_BlendMode blendMode))
]

{ #category : 'public' }
LibSDL3 >> setTextureColorModFloatTexture: texture r: r g: g b: b [
	"/**
	 * Set an additional color value multiplied into render copy operations.
	 *
	 * When this texture is rendered, during the copy operation each source color
	 * channel is modulated by the appropriate color value according to the
	 * following formula:
	 *
	 * `srcC = srcC * color`
	 *
	 * Color modulation is not always supported by the renderer; it will return
	 * false if color modulation is not supported.
	 *
	 * \param texture the texture to update.
	 * \param r the red color value multiplied into copy operations.
	 * \param g the green color value multiplied into copy operations.
	 * \param b the blue color value multiplied into copy operations.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetTextureColorModFloat
	 * \sa SDL_SetTextureAlphaModFloat
	 * \sa SDL_SetTextureColorMod
	 */"

	^ self ffiCall: #(bool SDL_SetTextureColorModFloat(SDL_Texture* texture, float r, float g, float b))
]

{ #category : 'public' }
LibSDL3 >> setTextureColorModTexture: texture r: r g: g b: b [
	"/**
	 * Set an additional color value multiplied into render copy operations.
	 *
	 * When this texture is rendered, during the copy operation each source color
	 * channel is modulated by the appropriate color value according to the
	 * following formula:
	 *
	 * `srcC = srcC * (color / 255)`
	 *
	 * Color modulation is not always supported by the renderer; it will return
	 * false if color modulation is not supported.
	 *
	 * \param texture the texture to update.
	 * \param r the red color value multiplied into copy operations.
	 * \param g the green color value multiplied into copy operations.
	 * \param b the blue color value multiplied into copy operations.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetTextureColorMod
	 * \sa SDL_SetTextureAlphaMod
	 * \sa SDL_SetTextureColorModFloat
	 */"

	^ self ffiCall: #(bool SDL_SetTextureColorMod(SDL_Texture* texture, Uint8 r, Uint8 g, Uint8 b))
]

{ #category : 'public' }
LibSDL3 >> setTextureScaleModeTexture: texture scaleMode: scaleMode [
	"/**
	 * Set the scale mode used for texture scale operations.
	 *
	 * The default texture scale mode is SDL_SCALEMODE_LINEAR.
	 *
	 * If the scale mode is not supported, the closest supported mode is chosen.
	 *
	 * \param texture the texture to update.
	 * \param scaleMode the SDL_ScaleMode to use for texture scaling.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetTextureScaleMode
	 */"

	^ self ffiCall: #(bool SDL_SetTextureScaleMode(SDL_Texture* texture, SDL_ScaleMode scaleMode))
]

{ #category : 'public' }
LibSDL3 >> setTrayEntryCallbackEntry: entry callback: callback userdata: userdata [
	"/**
	 * Sets a callback to be invoked when the entry is selected.
	 *
	 * \param entry the entry to be updated.
	 * \param callback a callback to be invoked when the entry is selected.
	 * \param userdata an optional pointer to pass extra data to the callback when
	 *                 it will be invoked.
	 *
	 * \threadsafety This function should be called on the thread that created the
	 *               tray.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetTrayEntries
	 * \sa SDL_InsertTrayEntryAt
	 */"

	self ffiCall: #(void SDL_SetTrayEntryCallback(SDL_TrayEntry* entry, SDL_TrayCallback callback, void* userdata))
]

{ #category : 'public' }
LibSDL3 >> setTrayEntryCheckedEntry: entry checked: checked [
	"/**
	 * Sets whether or not an entry is checked.
	 *
	 * The entry must have been created with the SDL_TRAYENTRY_CHECKBOX flag.
	 *
	 * \param entry the entry to be updated.
	 * \param checked true if the entry should be checked; false otherwise.
	 *
	 * \threadsafety This function should be called on the thread that created the
	 *               tray.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetTrayEntries
	 * \sa SDL_InsertTrayEntryAt
	 * \sa SDL_GetTrayEntryChecked
	 */"

	self ffiCall: #(void SDL_SetTrayEntryChecked(SDL_TrayEntry* entry, _Bool checked))
]

{ #category : 'public' }
LibSDL3 >> setTrayEntryEnabledEntry: entry enabled: enabled [
	"/**
	 * Sets whether or not an entry is enabled.
	 *
	 * \param entry the entry to be updated.
	 * \param enabled true if the entry should be enabled; false otherwise.
	 *
	 * \threadsafety This function should be called on the thread that created the
	 *               tray.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetTrayEntries
	 * \sa SDL_InsertTrayEntryAt
	 * \sa SDL_GetTrayEntryEnabled
	 */"

	self ffiCall: #(void SDL_SetTrayEntryEnabled(SDL_TrayEntry* entry, _Bool enabled))
]

{ #category : 'public' }
LibSDL3 >> setTrayEntryLabelEntry: entry label: label [
	"/**
	 * Sets the label of an entry.
	 *
	 * An entry cannot change between a separator and an ordinary entry; that is,
	 * it is not possible to set a non-NULL label on an entry that has a NULL
	 * label (separators), or to set a NULL label to an entry that has a non-NULL
	 * label. The function will silently fail if that happens.
	 *
	 * \param entry the entry to be updated.
	 * \param label the new label for the entry in UTF-8 encoding.
	 *
	 * \threadsafety This function should be called on the thread that created the
	 *               tray.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetTrayEntries
	 * \sa SDL_InsertTrayEntryAt
	 * \sa SDL_GetTrayEntryLabel
	 */"

	self ffiCall: #(void SDL_SetTrayEntryLabel(SDL_TrayEntry* entry, const char* label))
]

{ #category : 'public' }
LibSDL3 >> setTrayIconTray: tray icon: icon [
	"/**
	 * Updates the system tray icon's icon.
	 *
	 * \param tray the tray icon to be updated.
	 * \param icon the new icon. May be NULL.
	 *
	 * \threadsafety This function should be called on the thread that created the
	 *               tray.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateTray
	 */"

	self ffiCall: #(void SDL_SetTrayIcon(SDL_Tray* tray, SDL_Surface* icon))
]

{ #category : 'public' }
LibSDL3 >> setTrayTooltipTray: tray tooltip: tooltip [
	"/**
	 * Updates the system tray icon's tooltip.
	 *
	 * \param tray the tray icon to be updated.
	 * \param tooltip the new tooltip in UTF-8 encoding. May be NULL.
	 *
	 * \threadsafety This function should be called on the thread that created the
	 *               tray.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateTray
	 */"

	self ffiCall: #(void SDL_SetTrayTooltip(SDL_Tray* tray, const char* tooltip))
]

{ #category : 'public' }
LibSDL3 >> setWindowAlwaysOnTopWindow: window onTop: on_top [
	"/**
	 * Set the window to always be above the others.
	 *
	 * This will add or remove the window's `SDL_WINDOW_ALWAYS_ON_TOP` flag. This
	 * will bring the window to the front and keep the window above the rest.
	 *
	 * \param window the window of which to change the always on top state.
	 * \param on_top true to set the window always on top, false to disable.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetWindowFlags
	 */"

	^ self ffiCall: #(bool SDL_SetWindowAlwaysOnTop(SDL_Window* window, _Bool on_top))
]

{ #category : 'public' }
LibSDL3 >> setWindowAspectRatioWindow: window minAspect: min_aspect maxAspect: max_aspect [
	"/**
	 * Request that the aspect ratio of a window's client area be set.
	 *
	 * The aspect ratio is the ratio of width divided by height, e.g. 2560x1600
	 * would be 1.6. Larger aspect ratios are wider and smaller aspect ratios are
	 * narrower.
	 *
	 * If, at the time of this request, the window in a fixed-size state, such as
	 * maximized or fullscreen, the request will be deferred until the window
	 * exits this state and becomes resizable again.
	 *
	 * On some windowing systems, this request is asynchronous and the new window
	 * aspect ratio may not have have been applied immediately upon the return of
	 * this function. If an immediate change is required, call SDL_SyncWindow() to
	 * block until the changes have taken effect.
	 *
	 * When the window size changes, an SDL_EVENT_WINDOW_RESIZED event will be
	 * emitted with the new window dimensions. Note that the new dimensions may
	 * not match the exact aspect ratio requested, as some windowing systems can
	 * restrict the window size in certain scenarios (e.g. constraining the size
	 * of the content area to remain within the usable desktop bounds).
	 * Additionally, as this is just a request, it can be denied by the windowing
	 * system.
	 *
	 * \param window the window to change.
	 * \param min_aspect the minimum aspect ratio of the window, or 0.0f for no
	 *                   limit.
	 * \param max_aspect the maximum aspect ratio of the window, or 0.0f for no
	 *                   limit.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetWindowAspectRatio
	 * \sa SDL_SyncWindow
	 */"

	^ self ffiCall: #(bool SDL_SetWindowAspectRatio(SDL_Window* window, float min_aspect, float max_aspect))
]

{ #category : 'public' }
LibSDL3 >> setWindowBorderedWindow: window bordered: bordered [
	"/**
	 * Set the border state of a window.
	 *
	 * This will add or remove the window's `SDL_WINDOW_BORDERLESS` flag and add
	 * or remove the border from the actual window. This is a no-op if the
	 * window's border already matches the requested state.
	 *
	 * You can't change the border state of a fullscreen window.
	 *
	 * \param window the window of which to change the border state.
	 * \param bordered false to remove border, true to add border.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetWindowFlags
	 */"

	^ self ffiCall: #(bool SDL_SetWindowBordered(SDL_Window* window, _Bool bordered))
]

{ #category : 'public' }
LibSDL3 >> setWindowFocusableWindow: window focusable: focusable [
	"/**
	 * Set whether the window may have input focus.
	 *
	 * \param window the window to set focusable state.
	 * \param focusable true to allow input focus, false to not allow input focus.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_SetWindowFocusable(SDL_Window* window, _Bool focusable))
]

{ #category : 'public' }
LibSDL3 >> setWindowFullscreenModeWindow: window mode: mode [
	"/**
	 * Set the display mode to use when a window is visible and fullscreen.
	 *
	 * This only affects the display mode used when the window is fullscreen. To
	 * change the window size when the window is not fullscreen, use
	 * SDL_SetWindowSize().
	 *
	 * If the window is currently in the fullscreen state, this request is
	 * asynchronous on some windowing systems and the new mode dimensions may not
	 * be applied immediately upon the return of this function. If an immediate
	 * change is required, call SDL_SyncWindow() to block until the changes have
	 * taken effect.
	 *
	 * When the new mode takes effect, an SDL_EVENT_WINDOW_RESIZED and/or an
	 * SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED event will be emitted with the new mode
	 * dimensions.
	 *
	 * \param window the window to affect.
	 * \param mode a pointer to the display mode to use, which can be NULL for
	 *             borderless fullscreen desktop mode, or one of the fullscreen
	 *             modes returned by SDL_GetFullscreenDisplayModes() to set an
	 *             exclusive fullscreen mode.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetWindowFullscreenMode
	 * \sa SDL_SetWindowFullscreen
	 * \sa SDL_SyncWindow
	 */"

	^ self ffiCall: #(bool SDL_SetWindowFullscreenMode(SDL_Window* window, SDL_DisplayMode* mode))
]

{ #category : 'public' }
LibSDL3 >> setWindowFullscreenWindow: window fullscreen: fullscreen [
	"/**
	 * Request that the window's fullscreen state be changed.
	 *
	 * By default a window in fullscreen state uses borderless fullscreen desktop
	 * mode, but a specific exclusive display mode can be set using
	 * SDL_SetWindowFullscreenMode().
	 *
	 * On some windowing systems this request is asynchronous and the new
	 * fullscreen state may not have have been applied immediately upon the return
	 * of this function. If an immediate change is required, call SDL_SyncWindow()
	 * to block until the changes have taken effect.
	 *
	 * When the window state changes, an SDL_EVENT_WINDOW_ENTER_FULLSCREEN or
	 * SDL_EVENT_WINDOW_LEAVE_FULLSCREEN event will be emitted. Note that, as this
	 * is just a request, it can be denied by the windowing system.
	 *
	 * \param window the window to change.
	 * \param fullscreen true for fullscreen mode, false for windowed mode.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetWindowFullscreenMode
	 * \sa SDL_SetWindowFullscreenMode
	 * \sa SDL_SyncWindow
	 * \sa SDL_WINDOW_FULLSCREEN
	 */"

	^ self ffiCall: #(bool SDL_SetWindowFullscreen(SDL_Window* window, _Bool fullscreen))
]

{ #category : 'public' }
LibSDL3 >> setWindowHitTestWindow: window callback: callback callbackData: callback_data [
	"/**
	 * Provide a callback that decides if a window region has special properties.
	 *
	 * Normally windows are dragged and resized by decorations provided by the
	 * system window manager (a title bar, borders, etc), but for some apps, it
	 * makes sense to drag them from somewhere else inside the window itself; for
	 * example, one might have a borderless window that wants to be draggable from
	 * any part, or simulate its own title bar, etc.
	 *
	 * This function lets the app provide a callback that designates pieces of a
	 * given window as special. This callback is run during event processing if we
	 * need to tell the OS to treat a region of the window specially; the use of
	 * this callback is known as ""hit testing.""
	 *
	 * Mouse input may not be delivered to your application if it is within a
	 * special area; the OS will often apply that input to moving the window or
	 * resizing the window and not deliver it to the application.
	 *
	 * Specifying NULL for a callback disables hit-testing. Hit-testing is
	 * disabled by default.
	 *
	 * Platforms that don't support this functionality will return false
	 * unconditionally, even if you're attempting to disable hit-testing.
	 *
	 * Your callback may fire at any time, and its firing does not indicate any
	 * specific behavior (for example, on Windows, this certainly might fire when
	 * the OS is deciding whether to drag your window, but it fires for lots of
	 * other reasons, too, some unrelated to anything you probably care about _and
	 * when the mouse isn't actually at the location it is testing_). Since this
	 * can fire at any time, you should try to keep your callback efficient,
	 * devoid of allocations, etc.
	 *
	 * \param window the window to set hit-testing on.
	 * \param callback the function to call when doing a hit-test.
	 * \param callback_data an app-defined void pointer passed to **callback**.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_SetWindowHitTest(SDL_Window* window, SDL_HitTest callback, void* callback_data))
]

{ #category : 'public' }
LibSDL3 >> setWindowIconWindow: window icon: icon [
	"/**
	 * Set the icon for a window.
	 *
	 * If this function is passed a surface with alternate representations, the
	 * surface will be interpreted as the content to be used for 100% display
	 * scale, and the alternate representations will be used for high DPI
	 * situations. For example, if the original surface is 32x32, then on a 2x
	 * macOS display or 200% display scale on Windows, a 64x64 version of the
	 * image will be used, if available. If a matching version of the image isn't
	 * available, the closest larger size image will be downscaled to the
	 * appropriate size and be used instead, if available. Otherwise, the closest
	 * smaller image will be upscaled and be used instead.
	 *
	 * \param window the window to change.
	 * \param icon an SDL_Surface structure containing the icon for the window.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_SetWindowIcon(SDL_Window* window, SDL_Surface* icon))
]

{ #category : 'public' }
LibSDL3 >> setWindowKeyboardGrabWindow: window grabbed: grabbed [
	"/**
	 * Set a window's keyboard grab mode.
	 *
	 * Keyboard grab enables capture of system keyboard shortcuts like Alt+Tab or
	 * the Meta/Super key. Note that not all system keyboard shortcuts can be
	 * captured by applications (one example is Ctrl+Alt+Del on Windows).
	 *
	 * This is primarily intended for specialized applications such as VNC clients
	 * or VM frontends. Normal games should not use keyboard grab.
	 *
	 * When keyboard grab is enabled, SDL will continue to handle Alt+Tab when the
	 * window is full-screen to ensure the user is not trapped in your
	 * application. If you have a custom keyboard shortcut to exit fullscreen
	 * mode, you may suppress this behavior with
	 * `SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED`.
	 *
	 * If the caller enables a grab while another window is currently grabbed, the
	 * other window loses its grab in favor of the caller's window.
	 *
	 * \param window the window for which the keyboard grab mode should be set.
	 * \param grabbed this is true to grab keyboard, and false to release.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetWindowKeyboardGrab
	 * \sa SDL_SetWindowMouseGrab
	 */"

	^ self ffiCall: #(bool SDL_SetWindowKeyboardGrab(SDL_Window* window, _Bool grabbed))
]

{ #category : 'public' }
LibSDL3 >> setWindowMaximumSizeWindow: window maxW: max_w maxH: max_h [
	"/**
	 * Set the maximum size of a window's client area.
	 *
	 * \param window the window to change.
	 * \param max_w the maximum width of the window, or 0 for no limit.
	 * \param max_h the maximum height of the window, or 0 for no limit.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetWindowMaximumSize
	 * \sa SDL_SetWindowMinimumSize
	 */"

	^ self ffiCall: #(bool SDL_SetWindowMaximumSize(SDL_Window* window, int max_w, int max_h))
]

{ #category : 'public' }
LibSDL3 >> setWindowMinimumSizeWindow: window minW: min_w minH: min_h [
	"/**
	 * Set the minimum size of a window's client area.
	 *
	 * \param window the window to change.
	 * \param min_w the minimum width of the window, or 0 for no limit.
	 * \param min_h the minimum height of the window, or 0 for no limit.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetWindowMinimumSize
	 * \sa SDL_SetWindowMaximumSize
	 */"

	^ self ffiCall: #(bool SDL_SetWindowMinimumSize(SDL_Window* window, int min_w, int min_h))
]

{ #category : 'public' }
LibSDL3 >> setWindowModalWindow: window modal: modal [
	"/**
	 * Toggle the state of the window as modal.
	 *
	 * To enable modal status on a window, the window must currently be the child
	 * window of a parent, or toggling modal status on will fail.
	 *
	 * \param window the window on which to set the modal state.
	 * \param modal true to toggle modal status on, false to toggle it off.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetWindowParent
	 * \sa SDL_WINDOW_MODAL
	 */"

	^ self ffiCall: #(bool SDL_SetWindowModal(SDL_Window* window, _Bool modal))
]

{ #category : 'public' }
LibSDL3 >> setWindowMouseGrabWindow: window grabbed: grabbed [
	"/**
	 * Set a window's mouse grab mode.
	 *
	 * Mouse grab confines the mouse cursor to the window.
	 *
	 * \param window the window for which the mouse grab mode should be set.
	 * \param grabbed this is true to grab mouse, and false to release.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetWindowMouseRect
	 * \sa SDL_SetWindowMouseRect
	 * \sa SDL_SetWindowMouseGrab
	 * \sa SDL_SetWindowKeyboardGrab
	 */"

	^ self ffiCall: #(bool SDL_SetWindowMouseGrab(SDL_Window* window, _Bool grabbed))
]

{ #category : 'public' }
LibSDL3 >> setWindowMouseRectWindow: window rect: rect [
	"/**
	 * Confines the cursor to the specified area of a window.
	 *
	 * Note that this does NOT grab the cursor, it only defines the area a cursor
	 * is restricted to when the window has mouse focus.
	 *
	 * \param window the window that will be associated with the barrier.
	 * \param rect a rectangle area in window-relative coordinates. If NULL the
	 *             barrier for the specified window will be destroyed.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetWindowMouseRect
	 * \sa SDL_GetWindowMouseGrab
	 * \sa SDL_SetWindowMouseGrab
	 */"

	^ self ffiCall: #(bool SDL_SetWindowMouseRect(SDL_Window* window, SDL_Rect* rect))
]

{ #category : 'public' }
LibSDL3 >> setWindowOpacityWindow: window opacity: opacity [
	"/**
	 * Set the opacity for a window.
	 *
	 * The parameter `opacity` will be clamped internally between 0.0f
	 * (transparent) and 1.0f (opaque).
	 *
	 * This function also returns false if setting the opacity isn't supported.
	 *
	 * \param window the window which will be made transparent or opaque.
	 * \param opacity the opacity value (0.0f - transparent, 1.0f - opaque).
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetWindowOpacity
	 */"

	^ self ffiCall: #(bool SDL_SetWindowOpacity(SDL_Window* window, float opacity))
]

{ #category : 'public' }
LibSDL3 >> setWindowParentWindow: window parent: parent [
	"/**
	 * Set the window as a child of a parent window.
	 *
	 * If the window is already the child of an existing window, it will be
	 * reparented to the new owner. Setting the parent window to NULL unparents
	 * the window and removes child window status.
	 *
	 * If a parent window is hidden or destroyed, the operation will be
	 * recursively applied to child windows. Child windows hidden with the parent
	 * that did not have their hidden status explicitly set will be restored when
	 * the parent is shown.
	 *
	 * Attempting to set the parent of a window that is currently in the modal
	 * state will fail. Use SDL_SetWindowModal() to cancel the modal status before
	 * attempting to change the parent.
	 *
	 * Popup windows cannot change parents and attempts to do so will fail.
	 *
	 * Setting a parent window that is currently the sibling or descendent of the
	 * child window results in undefined behavior.
	 *
	 * \param window the window that should become the child of a parent.
	 * \param parent the new parent window for the child window.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetWindowModal
	 */"

	^ self ffiCall: #(bool SDL_SetWindowParent(SDL_Window* window, SDL_Window* parent))
]

{ #category : 'public' }
LibSDL3 >> setWindowPositionWindow: window x: x y: y [
	"/**
	 * Request that the window's position be set.
	 *
	 * If the window is in an exclusive fullscreen or maximized state, this
	 * request has no effect.
	 *
	 * This can be used to reposition fullscreen-desktop windows onto a different
	 * display, however, as exclusive fullscreen windows are locked to a specific
	 * display, they can only be repositioned programmatically via
	 * SDL_SetWindowFullscreenMode().
	 *
	 * On some windowing systems this request is asynchronous and the new
	 * coordinates may not have have been applied immediately upon the return of
	 * this function. If an immediate change is required, call SDL_SyncWindow() to
	 * block until the changes have taken effect.
	 *
	 * When the window position changes, an SDL_EVENT_WINDOW_MOVED event will be
	 * emitted with the window's new coordinates. Note that the new coordinates
	 * may not match the exact coordinates requested, as some windowing systems
	 * can restrict the position of the window in certain scenarios (e.g.
	 * constraining the position so the window is always within desktop bounds).
	 * Additionally, as this is just a request, it can be denied by the windowing
	 * system.
	 *
	 * \param window the window to reposition.
	 * \param x the x coordinate of the window, or `SDL_WINDOWPOS_CENTERED` or
	 *          `SDL_WINDOWPOS_UNDEFINED`.
	 * \param y the y coordinate of the window, or `SDL_WINDOWPOS_CENTERED` or
	 *          `SDL_WINDOWPOS_UNDEFINED`.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetWindowPosition
	 * \sa SDL_SyncWindow
	 */"

	^ self ffiCall: #(bool SDL_SetWindowPosition(SDL_Window* window, int x, int y))
]

{ #category : 'public' }
LibSDL3 >> setWindowRelativeMouseModeWindow: window enabled: enabled [
	"/**
	 * Set relative mouse mode for a window.
	 *
	 * While the window has focus and relative mouse mode is enabled, the cursor
	 * is hidden, the mouse position is constrained to the window, and SDL will
	 * report continuous relative mouse motion even if the mouse is at the edge of
	 * the window.
	 *
	 * If you'd like to keep the mouse position fixed while in relative mode you
	 * can use SDL_SetWindowMouseRect(). If you'd like the cursor to be at a
	 * specific location when relative mode ends, you should use
	 * SDL_WarpMouseInWindow() before disabling relative mode.
	 *
	 * This function will flush any pending mouse motion for this window.
	 *
	 * \param window the window to change.
	 * \param enabled true to enable relative mode, false to disable.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetWindowRelativeMouseMode
	 */"

	^ self ffiCall: #(bool SDL_SetWindowRelativeMouseMode(SDL_Window* window, _Bool enabled))
]

{ #category : 'public' }
LibSDL3 >> setWindowResizableWindow: window resizable: resizable [
	"/**
	 * Set the user-resizable state of a window.
	 *
	 * This will add or remove the window's `SDL_WINDOW_RESIZABLE` flag and
	 * allow/disallow user resizing of the window. This is a no-op if the window's
	 * resizable state already matches the requested state.
	 *
	 * You can't change the resizable state of a fullscreen window.
	 *
	 * \param window the window of which to change the resizable state.
	 * \param resizable true to allow resizing, false to disallow.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetWindowFlags
	 */"

	^ self ffiCall: #(bool SDL_SetWindowResizable(SDL_Window* window, _Bool resizable))
]

{ #category : 'public' }
LibSDL3 >> setWindowShapeWindow: window shape: shape [
	"/**
	 * Set the shape of a transparent window.
	 *
	 * This sets the alpha channel of a transparent window and any fully
	 * transparent areas are also transparent to mouse clicks. If you are using
	 * something besides the SDL render API, then you are responsible for drawing
	 * the alpha channel of the window to match the shape alpha channel to get
	 * consistent cross-platform results.
	 *
	 * The shape is copied inside this function, so you can free it afterwards. If
	 * your shape surface changes, you should call SDL_SetWindowShape() again to
	 * update the window. This is an expensive operation, so should be done
	 * sparingly.
	 *
	 * The window must have been created with the SDL_WINDOW_TRANSPARENT flag.
	 *
	 * \param window the window.
	 * \param shape the surface representing the shape of the window, or NULL to
	 *              remove any current shape.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_SetWindowShape(SDL_Window* window, SDL_Surface* shape))
]

{ #category : 'public' }
LibSDL3 >> setWindowSizeWindow: window w: w h: h [
	"/**
	 * Request that the size of a window's client area be set.
	 *
	 * If the window is in a fullscreen or maximized state, this request has no
	 * effect.
	 *
	 * To change the exclusive fullscreen mode of a window, use
	 * SDL_SetWindowFullscreenMode().
	 *
	 * On some windowing systems, this request is asynchronous and the new window
	 * size may not have have been applied immediately upon the return of this
	 * function. If an immediate change is required, call SDL_SyncWindow() to
	 * block until the changes have taken effect.
	 *
	 * When the window size changes, an SDL_EVENT_WINDOW_RESIZED event will be
	 * emitted with the new window dimensions. Note that the new dimensions may
	 * not match the exact size requested, as some windowing systems can restrict
	 * the window size in certain scenarios (e.g. constraining the size of the
	 * content area to remain within the usable desktop bounds). Additionally, as
	 * this is just a request, it can be denied by the windowing system.
	 *
	 * \param window the window to change.
	 * \param w the width of the window, must be > 0.
	 * \param h the height of the window, must be > 0.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetWindowSize
	 * \sa SDL_SetWindowFullscreenMode
	 * \sa SDL_SyncWindow
	 */"

	^ self ffiCall: #(bool SDL_SetWindowSize(SDL_Window* window, int w, int h))
]

{ #category : 'public' }
LibSDL3 >> setWindowSurfaceVSyncWindow: window vsync: vsync [
	"/**
	 * Toggle VSync for the window surface.
	 *
	 * When a window surface is created, vsync defaults to
	 * SDL_WINDOW_SURFACE_VSYNC_DISABLED.
	 *
	 * The `vsync` parameter can be 1 to synchronize present with every vertical
	 * refresh, 2 to synchronize present with every second vertical refresh, etc.,
	 * SDL_WINDOW_SURFACE_VSYNC_ADAPTIVE for late swap tearing (adaptive vsync),
	 * or SDL_WINDOW_SURFACE_VSYNC_DISABLED to disable. Not every value is
	 * supported by every driver, so you should check the return value to see
	 * whether the requested setting is supported.
	 *
	 * \param window the window.
	 * \param vsync the vertical refresh sync interval.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetWindowSurfaceVSync
	 */"

	^ self ffiCall: #(bool SDL_SetWindowSurfaceVSync(SDL_Window* window, int vsync))
]

{ #category : 'public' }
LibSDL3 >> setWindowTitleWindow: window title: title [
	"/**
	 * Set the title of a window.
	 *
	 * This string is expected to be in UTF-8 encoding.
	 *
	 * \param window the window to change.
	 * \param title the desired window title in UTF-8 format.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetWindowTitle
	 */"

	^ self ffiCall: #(bool SDL_SetWindowTitle(SDL_Window* window, const char* title))
]

{ #category : 'public' }
LibSDL3 >> setX11EventHookCallback: callback userdata: userdata [
	"/**
	 * Set a callback for every X11 event.
	 *
	 * The callback may modify the event, and should return true if the event
	 * should continue to be processed, or false to prevent further processing.
	 *
	 * \param callback the SDL_X11EventHook function to call.
	 * \param userdata a pointer to pass to every iteration of `callback`.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_SetX11EventHook(SDL_X11EventHook callback, void* userdata))
]

{ #category : 'public' }
LibSDL3 >> setenvUnsafeName: name value: value overwrite: overwrite [
	"/**
	 * Set the value of a variable in the environment.
	 *
	 * \param name the name of the variable to set.
	 * \param value the value of the variable to set.
	 * \param overwrite 1 to overwrite the variable if it exists, 0 to return
	 *                  success without setting the variable if it already exists.
	 * \returns 0 on success, -1 on error.
	 *
	 * \threadsafety This function is not thread safe, consider using
	 *               SDL_SetEnvironmentVariable() instead.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetEnvironmentVariable
	 */"

	^ self ffiCall: #(int SDL_setenv_unsafe(const char* name, const char* value, int overwrite))
]

{ #category : 'public' }
LibSDL3 >> shouldInit: state [
	"/**
	 * Return whether initialization should be done.
	 *
	 * This function checks the passed in state and if initialization should be
	 * done, sets the status to `SDL_INIT_STATUS_INITIALIZING` and returns true.
	 * If another thread is already modifying this state, it will wait until
	 * that's done before returning.
	 *
	 * If this function returns true, the calling code must call
	 * SDL_SetInitialized() to complete the initialization.
	 *
	 * \param state the initialization state to check.
	 * \returns true if initialization needs to be done, false otherwise.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetInitialized
	 * \sa SDL_ShouldQuit
	 */"

	^ self ffiCall: #(bool SDL_ShouldInit(SDL_InitState* state))
]

{ #category : 'public' }
LibSDL3 >> shouldQuit: state [
	"/**
	 * Return whether cleanup should be done.
	 *
	 * This function checks the passed in state and if cleanup should be done,
	 * sets the status to `SDL_INIT_STATUS_UNINITIALIZING` and returns true.
	 *
	 * If this function returns true, the calling code must call
	 * SDL_SetInitialized() to complete the cleanup.
	 *
	 * \param state the initialization state to check.
	 * \returns true if cleanup needs to be done, false otherwise.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetInitialized
	 * \sa SDL_ShouldInit
	 */"

	^ self ffiCall: #(bool SDL_ShouldQuit(SDL_InitState* state))
]

{ #category : 'public' }
LibSDL3 >> showCursor [
	"/**
	 * Show the cursor.
	 *
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CursorVisible
	 * \sa SDL_HideCursor
	 */"

	^ self ffiCall: #(bool SDL_ShowCursor())
]

{ #category : 'public' }
LibSDL3 >> showFileDialogWithPropertiesType: type callback: callback userdata: userdata props: props [
	"/**
	 * Create and launch a file dialog with the specified properties.
	 *
	 * These are the supported properties:
	 *
	 * - `SDL_PROP_FILE_DIALOG_FILTERS_POINTER`: a pointer to a list of
	 *   SDL_DialogFileFilter structs, which will be used as filters for
	 *   file-based selections. Ignored if the dialog is an ""Open Folder"" dialog.
	 *   If non-NULL, the array of filters must remain valid at least until the
	 *   callback is invoked.
	 * - `SDL_PROP_FILE_DIALOG_NFILTERS_NUMBER`: the number of filters in the
	 *   array of filters, if it exists.
	 * - `SDL_PROP_FILE_DIALOG_WINDOW_POINTER`: the window that the dialog should
	 *   be modal for.
	 * - `SDL_PROP_FILE_DIALOG_LOCATION_STRING`: the default folder or file to
	 *   start the dialog at.
	 * - `SDL_PROP_FILE_DIALOG_MANY_BOOLEAN`: true to allow the user to select
	 *   more than one entry.
	 * - `SDL_PROP_FILE_DIALOG_TITLE_STRING`: the title for the dialog.
	 * - `SDL_PROP_FILE_DIALOG_ACCEPT_STRING`: the label that the accept button
	 *   should have.
	 * - `SDL_PROP_FILE_DIALOG_CANCEL_STRING`: the label that the cancel button
	 *   should have.
	 *
	 * Note that each platform may or may not support any of the properties.
	 *
	 * \param type the type of file dialog.
	 * \param callback a function pointer to be invoked when the user selects a
	 *                 file and accepts, or cancels the dialog, or an error
	 *                 occurs.
	 * \param userdata an optional pointer to pass extra data to the callback when
	 *                 it will be invoked.
	 * \param props the properties to use.
	 *
	 * \threadsafety This function should be called only from the main thread. The
	 *               callback may be invoked from the same thread or from a
	 *               different one, depending on the OS's constraints.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_FileDialogType
	 * \sa SDL_DialogFileCallback
	 * \sa SDL_DialogFileFilter
	 * \sa SDL_ShowOpenFileDialog
	 * \sa SDL_ShowSaveFileDialog
	 * \sa SDL_ShowOpenFolderDialog
	 */"

	self ffiCall: #(void SDL_ShowFileDialogWithProperties(SDL_FileDialogType type, SDL_DialogFileCallback callback, void* userdata, SDL_PropertiesID props))
]

{ #category : 'public' }
LibSDL3 >> showMessageBoxMessageboxdata: messageboxdata buttonid: buttonid [
	"/**
	 * Create a modal message box.
	 *
	 * If your needs aren't complex, it might be easier to use
	 * SDL_ShowSimpleMessageBox.
	 *
	 * This function should be called on the thread that created the parent
	 * window, or on the main thread if the messagebox has no parent. It will
	 * block execution of that thread until the user clicks a button or closes the
	 * messagebox.
	 *
	 * This function may be called at any time, even before SDL_Init(). This makes
	 * it useful for reporting errors like a failure to create a renderer or
	 * OpenGL context.
	 *
	 * On X11, SDL rolls its own dialog box with X11 primitives instead of a
	 * formal toolkit like GTK+ or Qt.
	 *
	 * Note that if SDL_Init() would fail because there isn't any available video
	 * target, this function is likely to fail for the same reasons. If this is a
	 * concern, check the return value from this function and fall back to writing
	 * to stderr if you can.
	 *
	 * \param messageboxdata the SDL_MessageBoxData structure with title, text and
	 *                       other options.
	 * \param buttonid the pointer to which user id of hit button should be
	 *                 copied.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_ShowSimpleMessageBox
	 */"

	^ self ffiCall: #(bool SDL_ShowMessageBox(SDL_MessageBoxData* messageboxdata, int* buttonid))
]

{ #category : 'public' }
LibSDL3 >> showOpenFileDialogCallback: callback userdata: userdata window: window filters: filters nfilters: nfilters defaultLocation: default_location allowMany: allow_many [
	"/**
	 * Displays a dialog that lets the user select a file on their filesystem.
	 *
	 * This is an asynchronous function; it will return immediately, and the
	 * result will be passed to the callback.
	 *
	 * The callback will be invoked with a null-terminated list of files the user
	 * chose. The list will be empty if the user canceled the dialog, and it will
	 * be NULL if an error occurred.
	 *
	 * Note that the callback may be called from a different thread than the one
	 * the function was invoked on.
	 *
	 * Depending on the platform, the user may be allowed to input paths that
	 * don't yet exist.
	 *
	 * On Linux, dialogs may require XDG Portals, which requires DBus, which
	 * requires an event-handling loop. Apps that do not use SDL to handle events
	 * should add a call to SDL_PumpEvents in their main loop.
	 *
	 * \param callback a function pointer to be invoked when the user selects a
	 *                 file and accepts, or cancels the dialog, or an error
	 *                 occurs.
	 * \param userdata an optional pointer to pass extra data to the callback when
	 *                 it will be invoked.
	 * \param window the window that the dialog should be modal for, may be NULL.
	 *               Not all platforms support this option.
	 * \param filters a list of filters, may be NULL. Not all platforms support
	 *                this option, and platforms that do support it may allow the
	 *                user to ignore the filters. If non-NULL, it must remain
	 *                valid at least until the callback is invoked.
	 * \param nfilters the number of filters. Ignored if filters is NULL.
	 * \param default_location the default folder or file to start the dialog at,
	 *                         may be NULL. Not all platforms support this option.
	 * \param allow_many if non-zero, the user will be allowed to select multiple
	 *                   entries. Not all platforms support this option.
	 *
	 * \threadsafety This function should be called only from the main thread. The
	 *               callback may be invoked from the same thread or from a
	 *               different one, depending on the OS's constraints.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_DialogFileCallback
	 * \sa SDL_DialogFileFilter
	 * \sa SDL_ShowSaveFileDialog
	 * \sa SDL_ShowOpenFolderDialog
	 * \sa SDL_ShowFileDialogWithProperties
	 */"

	self ffiCall: #(void SDL_ShowOpenFileDialog(SDL_DialogFileCallback callback, void* userdata, SDL_Window* window, SDL_DialogFileFilter* filters, int nfilters, const char* default_location, _Bool allow_many))
]

{ #category : 'public' }
LibSDL3 >> showOpenFolderDialogCallback: callback userdata: userdata window: window defaultLocation: default_location allowMany: allow_many [
	"/**
	 * Displays a dialog that lets the user select a folder on their filesystem.
	 *
	 * This is an asynchronous function; it will return immediately, and the
	 * result will be passed to the callback.
	 *
	 * The callback will be invoked with a null-terminated list of files the user
	 * chose. The list will be empty if the user canceled the dialog, and it will
	 * be NULL if an error occurred.
	 *
	 * Note that the callback may be called from a different thread than the one
	 * the function was invoked on.
	 *
	 * Depending on the platform, the user may be allowed to input paths that
	 * don't yet exist.
	 *
	 * On Linux, dialogs may require XDG Portals, which requires DBus, which
	 * requires an event-handling loop. Apps that do not use SDL to handle events
	 * should add a call to SDL_PumpEvents in their main loop.
	 *
	 * \param callback a function pointer to be invoked when the user selects a
	 *                 file and accepts, or cancels the dialog, or an error
	 *                 occurs.
	 * \param userdata an optional pointer to pass extra data to the callback when
	 *                 it will be invoked.
	 * \param window the window that the dialog should be modal for, may be NULL.
	 *               Not all platforms support this option.
	 * \param default_location the default folder or file to start the dialog at,
	 *                         may be NULL. Not all platforms support this option.
	 * \param allow_many if non-zero, the user will be allowed to select multiple
	 *                   entries. Not all platforms support this option.
	 *
	 * \threadsafety This function should be called only from the main thread. The
	 *               callback may be invoked from the same thread or from a
	 *               different one, depending on the OS's constraints.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_DialogFileCallback
	 * \sa SDL_ShowOpenFileDialog
	 * \sa SDL_ShowSaveFileDialog
	 * \sa SDL_ShowFileDialogWithProperties
	 */"

	self ffiCall: #(void SDL_ShowOpenFolderDialog(SDL_DialogFileCallback callback, void* userdata, SDL_Window* window, const char* default_location, _Bool allow_many))
]

{ #category : 'public' }
LibSDL3 >> showSaveFileDialogCallback: callback userdata: userdata window: window filters: filters nfilters: nfilters defaultLocation: default_location [
	"/**
	 * Displays a dialog that lets the user choose a new or existing file on their
	 * filesystem.
	 *
	 * This is an asynchronous function; it will return immediately, and the
	 * result will be passed to the callback.
	 *
	 * The callback will be invoked with a null-terminated list of files the user
	 * chose. The list will be empty if the user canceled the dialog, and it will
	 * be NULL if an error occurred.
	 *
	 * Note that the callback may be called from a different thread than the one
	 * the function was invoked on.
	 *
	 * The chosen file may or may not already exist.
	 *
	 * On Linux, dialogs may require XDG Portals, which requires DBus, which
	 * requires an event-handling loop. Apps that do not use SDL to handle events
	 * should add a call to SDL_PumpEvents in their main loop.
	 *
	 * \param callback a function pointer to be invoked when the user selects a
	 *                 file and accepts, or cancels the dialog, or an error
	 *                 occurs.
	 * \param userdata an optional pointer to pass extra data to the callback when
	 *                 it will be invoked.
	 * \param window the window that the dialog should be modal for, may be NULL.
	 *               Not all platforms support this option.
	 * \param filters a list of filters, may be NULL. Not all platforms support
	 *                this option, and platforms that do support it may allow the
	 *                user to ignore the filters. If non-NULL, it must remain
	 *                valid at least until the callback is invoked.
	 * \param nfilters the number of filters. Ignored if filters is NULL.
	 * \param default_location the default folder or file to start the dialog at,
	 *                         may be NULL. Not all platforms support this option.
	 *
	 * \threadsafety This function should be called only from the main thread. The
	 *               callback may be invoked from the same thread or from a
	 *               different one, depending on the OS's constraints.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_DialogFileCallback
	 * \sa SDL_DialogFileFilter
	 * \sa SDL_ShowOpenFileDialog
	 * \sa SDL_ShowOpenFolderDialog
	 * \sa SDL_ShowFileDialogWithProperties
	 */"

	self ffiCall: #(void SDL_ShowSaveFileDialog(SDL_DialogFileCallback callback, void* userdata, SDL_Window* window, SDL_DialogFileFilter* filters, int nfilters, const char* default_location))
]

{ #category : 'public' }
LibSDL3 >> showSimpleMessageBoxFlags: flags title: title message: message window: window [
	"/**
	 * Display a simple modal message box.
	 *
	 * If your needs aren't complex, this function is preferred over
	 * SDL_ShowMessageBox.
	 *
	 * `flags` may be any of the following:
	 *
	 * - `SDL_MESSAGEBOX_ERROR`: error dialog
	 * - `SDL_MESSAGEBOX_WARNING`: warning dialog
	 * - `SDL_MESSAGEBOX_INFORMATION`: informational dialog
	 *
	 * This function should be called on the thread that created the parent
	 * window, or on the main thread if the messagebox has no parent. It will
	 * block execution of that thread until the user clicks a button or closes the
	 * messagebox.
	 *
	 * This function may be called at any time, even before SDL_Init(). This makes
	 * it useful for reporting errors like a failure to create a renderer or
	 * OpenGL context.
	 *
	 * On X11, SDL rolls its own dialog box with X11 primitives instead of a
	 * formal toolkit like GTK+ or Qt.
	 *
	 * Note that if SDL_Init() would fail because there isn't any available video
	 * target, this function is likely to fail for the same reasons. If this is a
	 * concern, check the return value from this function and fall back to writing
	 * to stderr if you can.
	 *
	 * \param flags an SDL_MessageBoxFlags value.
	 * \param title UTF-8 title text.
	 * \param message UTF-8 message text.
	 * \param window the parent window, or NULL for no parent.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_ShowMessageBox
	 */"

	^ self ffiCall: #(bool SDL_ShowSimpleMessageBox(SDL_MessageBoxFlags flags, const char* title, const char* message, SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> showWindow: window [
	"/**
	 * Show a window.
	 *
	 * \param window the window to show.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_HideWindow
	 * \sa SDL_RaiseWindow
	 */"

	^ self ffiCall: #(bool SDL_ShowWindow(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> showWindowSystemMenuWindow: window x: x y: y [
	"/**
	 * Display the system-level window menu.
	 *
	 * This default window menu is provided by the system and on some platforms
	 * provides functionality for setting or changing privileged state on the
	 * window, such as moving it between workspaces or displays, or toggling the
	 * always-on-top property.
	 *
	 * On platforms or desktops where this is unsupported, this function does
	 * nothing.
	 *
	 * \param window the window for which the menu will be displayed.
	 * \param x the x coordinate of the menu, relative to the origin (top-left) of
	 *          the client area.
	 * \param y the y coordinate of the menu, relative to the origin (top-left) of
	 *          the client area.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_ShowWindowSystemMenu(SDL_Window* window, int x, int y))
]

{ #category : 'public' }
LibSDL3 >> signalAsyncIOQueue: queue [
	"/**
	 * Wake up any threads that are blocking in SDL_WaitAsyncIOResult().
	 *
	 * This will unblock any threads that are sleeping in a call to
	 * SDL_WaitAsyncIOResult for the specified queue, and cause them to return
	 * from that function.
	 *
	 * This can be useful when destroying a queue to make sure nothing is touching
	 * it indefinitely. In this case, once this call completes, the caller should
	 * take measures to make sure any previously-blocked threads have returned
	 * from their wait and will not touch the queue again (perhaps by setting a
	 * flag to tell the threads to terminate and then using SDL_WaitThread() to
	 * make sure they've done so).
	 *
	 * \param queue the async I/O task queue to signal.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_WaitAsyncIOResult
	 */"

	self ffiCall: #(void SDL_SignalAsyncIOQueue(SDL_AsyncIOQueue* queue))
]

{ #category : 'public' }
LibSDL3 >> signalCondition: cond [
	"/**
	 * Restart one of the threads that are waiting on the condition variable.
	 *
	 * \param cond the condition variable to signal.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_BroadcastCondition
	 * \sa SDL_WaitCondition
	 * \sa SDL_WaitConditionTimeout
	 */"

	self ffiCall: #(void SDL_SignalCondition(SDL_Condition* cond))
]

{ #category : 'public' }
LibSDL3 >> signalSemaphore: sem [
	"/**
	 * Atomically increment a semaphore's value and wake waiting threads.
	 *
	 * \param sem the semaphore to increment.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_TryWaitSemaphore
	 * \sa SDL_WaitSemaphore
	 * \sa SDL_WaitSemaphoreTimeout
	 */"

	self ffiCall: #(void SDL_SignalSemaphore(SDL_Semaphore* sem))
]

{ #category : 'public' }
LibSDL3 >> sin: x [
	"/**
	 * Compute the sine of `x`.
	 *
	 * Domain: `-INF <= x <= INF`
	 *
	 * Range: `-1 <= y <= 1`
	 *
	 * This function operates on double-precision floating point values, use
	 * SDL_sinf for single-precision floats.
	 *
	 * This function may use a different approximation across different versions,
	 * platforms and configurations. i.e, it can return a different value given
	 * the same input on different machines or operating systems, or if SDL is
	 * updated.
	 *
	 * \param x floating point value, in radians.
	 * \returns sine of `x`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_sinf
	 * \sa SDL_asin
	 * \sa SDL_cos
	 */"

	^ self ffiCall: #(double SDL_sin(double x))
]

{ #category : 'public' }
LibSDL3 >> sinf: x [
	"/**
	 * Compute the sine of `x`.
	 *
	 * Domain: `-INF <= x <= INF`
	 *
	 * Range: `-1 <= y <= 1`
	 *
	 * This function operates on single-precision floating point values, use
	 * SDL_sin for double-precision floats.
	 *
	 * This function may use a different approximation across different versions,
	 * platforms and configurations. i.e, it can return a different value given
	 * the same input on different machines or operating systems, or if SDL is
	 * updated.
	 *
	 * \param x floating point value, in radians.
	 * \returns sine of `x`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_sin
	 * \sa SDL_asinf
	 * \sa SDL_cosf
	 */"

	^ self ffiCall: #(float SDL_sinf(float x))
]

{ #category : 'public' }
LibSDL3 >> sizeAddCheckOverflowA: a b: b ret: ret [
	"/**
	 * Add two integers, checking for overflow.
	 *
	 * If `a + b` would overflow, return false.
	 *
	 * Otherwise store `a + b` via ret and return true.
	 *
	 * \param a the first addend.
	 * \param b the second addend.
	 * \param ret on non-overflow output, stores the addition result, may not be
	 *            NULL.
	 * \returns false on overflow, true if result is added without overflow.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_size_add_check_overflow(size_t a, size_t b, size_t* ret))
]

{ #category : 'public' }
LibSDL3 >> sizeAddCheckOverflowBuiltinA: a b: b ret: ret [

	^ self ffiCall: #(bool SDL_size_add_check_overflow_builtin(size_t a, size_t b, size_t* ret))
]

{ #category : 'public' }
LibSDL3 >> sizeMulCheckOverflowA: a b: b ret: ret [
	"/**
	 * Multiply two integers, checking for overflow.
	 *
	 * If `a * b` would overflow, return false.
	 *
	 * Otherwise store `a * b` via ret and return true.
	 *
	 * \param a the multiplicand.
	 * \param b the multiplier.
	 * \param ret on non-overflow output, stores the multiplication result, may
	 *            not be NULL.
	 * \returns false on overflow, true if result is multiplied without overflow.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_size_mul_check_overflow(size_t a, size_t b, size_t* ret))
]

{ #category : 'public' }
LibSDL3 >> sizeMulCheckOverflowBuiltinA: a b: b ret: ret [

	^ self ffiCall: #(bool SDL_size_mul_check_overflow_builtin(size_t a, size_t b, size_t* ret))
]

{ #category : 'public' }
LibSDL3 >> sqrt: x [
	"/**
	 * Compute the square root of `x`.
	 *
	 * Domain: `0 <= x <= INF`
	 *
	 * Range: `0 <= y <= INF`
	 *
	 * This function operates on double-precision floating point values, use
	 * SDL_sqrtf for single-precision floats.
	 *
	 * This function may use a different approximation across different versions,
	 * platforms and configurations. i.e, it can return a different value given
	 * the same input on different machines or operating systems, or if SDL is
	 * updated.
	 *
	 * \param x floating point value. Must be greater than or equal to 0.
	 * \returns square root of `x`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_sqrtf
	 */"

	^ self ffiCall: #(double SDL_sqrt(double x))
]

{ #category : 'public' }
LibSDL3 >> sqrtf: x [
	"/**
	 * Compute the square root of `x`.
	 *
	 * Domain: `0 <= x <= INF`
	 *
	 * Range: `0 <= y <= INF`
	 *
	 * This function operates on single-precision floating point values, use
	 * SDL_sqrt for double-precision floats.
	 *
	 * This function may use a different approximation across different versions,
	 * platforms and configurations. i.e, it can return a different value given
	 * the same input on different machines or operating systems, or if SDL is
	 * updated.
	 *
	 * \param x floating point value. Must be greater than or equal to 0.
	 * \returns square root of `x`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_sqrt
	 */"

	^ self ffiCall: #(float SDL_sqrtf(float x))
]

{ #category : 'public' }
LibSDL3 >> srand: seed [
	"/**
	 * Seeds the pseudo-random number generator.
	 *
	 * Reusing the seed number will cause SDL_rand() to repeat the same stream of
	 * 'random' numbers.
	 *
	 * \param seed the value to use as a random number seed, or 0 to use
	 *             SDL_GetPerformanceCounter().
	 *
	 * \threadsafety This should be called on the same thread that calls
	 *               SDL_rand()
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_rand
	 * \sa SDL_rand_bits
	 * \sa SDL_randf
	 */"

	self ffiCall: #(void SDL_srand(Uint64 seed))
]

{ #category : 'public' }
LibSDL3 >> startTextInput: window [
	"/**
	 * Start accepting Unicode text input events in a window.
	 *
	 * This function will enable text input (SDL_EVENT_TEXT_INPUT and
	 * SDL_EVENT_TEXT_EDITING events) in the specified window. Please use this
	 * function paired with SDL_StopTextInput().
	 *
	 * Text input events are not received by default.
	 *
	 * On some platforms using this function shows the screen keyboard and/or
	 * activates an IME, which can prevent some key press events from being passed
	 * through.
	 *
	 * \param window the window to enable text input.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetTextInputArea
	 * \sa SDL_StartTextInputWithProperties
	 * \sa SDL_StopTextInput
	 * \sa SDL_TextInputActive
	 */"

	^ self ffiCall: #(bool SDL_StartTextInput(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> startTextInputWithPropertiesWindow: window props: props [
	"/**
	 * Start accepting Unicode text input events in a window, with properties
	 * describing the input.
	 *
	 * This function will enable text input (SDL_EVENT_TEXT_INPUT and
	 * SDL_EVENT_TEXT_EDITING events) in the specified window. Please use this
	 * function paired with SDL_StopTextInput().
	 *
	 * Text input events are not received by default.
	 *
	 * On some platforms using this function shows the screen keyboard and/or
	 * activates an IME, which can prevent some key press events from being passed
	 * through.
	 *
	 * These are the supported properties:
	 *
	 * - `SDL_PROP_TEXTINPUT_TYPE_NUMBER` - an SDL_TextInputType value that
	 *   describes text being input, defaults to SDL_TEXTINPUT_TYPE_TEXT.
	 * - `SDL_PROP_TEXTINPUT_CAPITALIZATION_NUMBER` - an SDL_Capitalization value
	 *   that describes how text should be capitalized, defaults to
	 *   SDL_CAPITALIZE_SENTENCES for normal text entry, SDL_CAPITALIZE_WORDS for
	 *   SDL_TEXTINPUT_TYPE_TEXT_NAME, and SDL_CAPITALIZE_NONE for e-mail
	 *   addresses, usernames, and passwords.
	 * - `SDL_PROP_TEXTINPUT_AUTOCORRECT_BOOLEAN` - true to enable auto completion
	 *   and auto correction, defaults to true.
	 * - `SDL_PROP_TEXTINPUT_MULTILINE_BOOLEAN` - true if multiple lines of text
	 *   are allowed. This defaults to true if SDL_HINT_RETURN_KEY_HIDES_IME is
	 *   ""0"" or is not set, and defaults to false if SDL_HINT_RETURN_KEY_HIDES_IME
	 *   is ""1"".
	 *
	 * On Android you can directly specify the input type:
	 *
	 * - `SDL_PROP_TEXTINPUT_ANDROID_INPUTTYPE_NUMBER` - the text input type to
	 *   use, overriding other properties. This is documented at
	 *   https://developer.android.com/reference/android/text/InputType
	 *
	 * \param window the window to enable text input.
	 * \param props the properties to use.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetTextInputArea
	 * \sa SDL_StartTextInput
	 * \sa SDL_StopTextInput
	 * \sa SDL_TextInputActive
	 */"

	^ self ffiCall: #(bool SDL_StartTextInputWithProperties(SDL_Window* window, SDL_PropertiesID props))
]

{ #category : 'public' }
LibSDL3 >> stepBackUTF8Start: start pstr: pstr [
	"/**
	 * Decode a UTF-8 string in reverse, one Unicode codepoint at a time.
	 *
	 * This will go to the start of the previous Unicode codepoint in the string,
	 * move `*pstr` to that location and return that codepoint.
	 *
	 * If `*pstr` is already at the start of the string), it will not advance
	 * `*pstr` at all.
	 *
	 * Generally this function is called in a loop until it returns zero,
	 * adjusting its parameter each iteration.
	 *
	 * If an invalid UTF-8 sequence is encountered, this function returns
	 * SDL_INVALID_UNICODE_CODEPOINT.
	 *
	 * Several things can generate invalid UTF-8 sequences, including overlong
	 * encodings, the use of UTF-16 surrogate values, and truncated data. Please
	 * refer to
	 * [RFC3629](https://www.ietf.org/rfc/rfc3629.txt)
	 * for details.
	 *
	 * \param start a pointer to the beginning of the UTF-8 string.
	 * \param pstr a pointer to a UTF-8 string pointer to be read and adjusted.
	 * \returns the previous Unicode codepoint in the string.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(Uint32 SDL_StepBackUTF8(const char* start, const char** pstr))
]

{ #category : 'public' }
LibSDL3 >> stepUTF8Pstr: pstr pslen: pslen [
	"/**
	 * Decode a UTF-8 string, one Unicode codepoint at a time.
	 *
	 * This will return the first Unicode codepoint in the UTF-8 encoded string in
	 * `*pstr`, and then advance `*pstr` past any consumed bytes before returning.
	 *
	 * It will not access more than `*pslen` bytes from the string. `*pslen` will
	 * be adjusted, as well, subtracting the number of bytes consumed.
	 *
	 * `pslen` is allowed to be NULL, in which case the string _must_ be
	 * NULL-terminated, as the function will blindly read until it sees the NULL
	 * char.
	 *
	 * if `*pslen` is zero, it assumes the end of string is reached and returns a
	 * zero codepoint regardless of the contents of the string buffer.
	 *
	 * If the resulting codepoint is zero (a NULL terminator), or `*pslen` is
	 * zero, it will not advance `*pstr` or `*pslen` at all.
	 *
	 * Generally this function is called in a loop until it returns zero,
	 * adjusting its parameters each iteration.
	 *
	 * If an invalid UTF-8 sequence is encountered, this function returns
	 * SDL_INVALID_UNICODE_CODEPOINT and advances the string/length by one byte
	 * (which is to say, a multibyte sequence might produce several
	 * SDL_INVALID_UNICODE_CODEPOINT returns before it syncs to the next valid
	 * UTF-8 sequence).
	 *
	 * Several things can generate invalid UTF-8 sequences, including overlong
	 * encodings, the use of UTF-16 surrogate values, and truncated data. Please
	 * refer to
	 * [RFC3629](https://www.ietf.org/rfc/rfc3629.txt)
	 * for details.
	 *
	 * \param pstr a pointer to a UTF-8 string pointer to be read and adjusted.
	 * \param pslen a pointer to the number of bytes in the string, to be read and
	 *              adjusted. NULL is allowed.
	 * \returns the first Unicode codepoint in the string.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(Uint32 SDL_StepUTF8(const char** pstr, size_t* pslen))
]

{ #category : 'public' }
LibSDL3 >> stopTextInput: window [
	"/**
	 * Stop receiving any text input events in a window.
	 *
	 * If SDL_StartTextInput() showed the screen keyboard, this function will hide
	 * it.
	 *
	 * \param window the window to disable text input.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_StartTextInput
	 */"

	^ self ffiCall: #(bool SDL_StopTextInput(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> strcasecmpStr1: str1 str2: str2 [
	"/**
	 * Compare two null-terminated UTF-8 strings, case-insensitively.
	 *
	 * This will work with Unicode strings, using a technique called
	 * ""case-folding"" to handle the vast majority of case-sensitive human
	 * languages regardless of system locale. It can deal with expanding values: a
	 * German Eszett character can compare against two ASCII 's' chars and be
	 * considered a match, for example. A notable exception: it does not handle
	 * the Turkish 'i' character; human language is complicated!
	 *
	 * Since this handles Unicode, it expects the string to be well-formed UTF-8
	 * and not a null-terminated string of arbitrary bytes. Bytes that are not
	 * valid UTF-8 are treated as Unicode character U+FFFD (REPLACEMENT
	 * CHARACTER), which is to say two strings of random bits may turn out to
	 * match if they convert to the same amount of replacement characters.
	 *
	 * \param str1 the first string to compare. NULL is not permitted!
	 * \param str2 the second string to compare. NULL is not permitted!
	 * \returns less than zero if str1 is ""less than"" str2, greater than zero if
	 *          str1 is ""greater than"" str2, and zero if the strings match
	 *          exactly.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(int SDL_strcasecmp(const char* str1, const char* str2))
]

{ #category : 'public' }
LibSDL3 >> strcasestrHaystack: haystack needle: needle [
	"/**
	 * Search a UTF-8 string for the first instance of a specific substring,
	 * case-insensitively.
	 *
	 * This will work with Unicode strings, using a technique called
	 * ""case-folding"" to handle the vast majority of case-sensitive human
	 * languages regardless of system locale. It can deal with expanding values: a
	 * German Eszett character can compare against two ASCII 's' chars and be
	 * considered a match, for example. A notable exception: it does not handle
	 * the Turkish 'i' character; human language is complicated!
	 *
	 * Since this handles Unicode, it expects the strings to be well-formed UTF-8
	 * and not a null-terminated string of arbitrary bytes. Bytes that are not
	 * valid UTF-8 are treated as Unicode character U+FFFD (REPLACEMENT
	 * CHARACTER), which is to say two strings of random bits may turn out to
	 * match if they convert to the same amount of replacement characters.
	 *
	 * \param haystack the string to search. Must not be NULL.
	 * \param needle the string to search for. Must not be NULL.
	 * \returns a pointer to the first instance of `needle` in the string, or NULL
	 *          if not found.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(char* SDL_strcasestr(const char* haystack, const char* needle))
]

{ #category : 'public' }
LibSDL3 >> strchrStr: str c: c [
	"/**
	 * Search a string for the first instance of a specific byte.
	 *
	 * The search ends once it finds the requested byte value, or a null
	 * terminator byte to end the string.
	 *
	 * Note that this looks for _bytes_, not _characters_, so you cannot match
	 * against a Unicode codepoint > 255, regardless of character encoding.
	 *
	 * \param str the string to search. Must not be NULL.
	 * \param c the byte value to search for.
	 * \returns a pointer to the first instance of `c` in the string, or NULL if
	 *          not found.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(char* SDL_strchr(const char* str, int c))
]

{ #category : 'public' }
LibSDL3 >> strcmpStr1: str1 str2: str2 [
	"/**
	 * Compare two null-terminated UTF-8 strings.
	 *
	 * Due to the nature of UTF-8 encoding, this will work with Unicode strings,
	 * since effectively this function just compares bytes until it hits a
	 * null-terminating character. Also due to the nature of UTF-8, this can be
	 * used with SDL_qsort() to put strings in (roughly) alphabetical order.
	 *
	 * \param str1 the first string to compare. NULL is not permitted!
	 * \param str2 the second string to compare. NULL is not permitted!
	 * \returns less than zero if str1 is ""less than"" str2, greater than zero if
	 *          str1 is ""greater than"" str2, and zero if the strings match
	 *          exactly.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(int SDL_strcmp(const char* str1, const char* str2))
]

{ #category : 'public' }
LibSDL3 >> strdup: str [
	"/**
	 * Allocate a copy of a string.
	 *
	 * This allocates enough space for a null-terminated copy of `str`, using
	 * SDL_malloc, and then makes a copy of the string into this space.
	 *
	 * The returned string is owned by the caller, and should be passed to
	 * SDL_free when no longer needed.
	 *
	 * \param str the string to copy.
	 * \returns a pointer to the newly-allocated string.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(char* SDL_strdup(const char* str))
]

{ #category : 'public' }
LibSDL3 >> stretchSurfaceSrc: src srcrect: srcrect dst: dst dstrect: dstrect scaleMode: scaleMode [
	"/**
	 * Perform a stretched pixel copy from one surface to another.
	 *
	 * \param src the SDL_Surface structure to be copied from.
	 * \param srcrect the SDL_Rect structure representing the rectangle to be
	 *                copied, may not be NULL.
	 * \param dst the SDL_Surface structure that is the blit target.
	 * \param dstrect the SDL_Rect structure representing the target rectangle in
	 *                the destination surface, may not be NULL.
	 * \param scaleMode the SDL_ScaleMode to be used.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety Only one thread should be using the `src` and `dst` surfaces
	 *               at any given time.
	 *
	 * \since This function is available since SDL 3.4.0.
	 *
	 * \sa SDL_BlitSurfaceScaled
	 */"

	^ self ffiCall: #(bool SDL_StretchSurface(SDL_Surface* src, SDL_Rect* srcrect, SDL_Surface* dst, SDL_Rect* dstrect, SDL_ScaleMode scaleMode))
]

{ #category : 'public' }
LibSDL3 >> stringToGUID: pchGUID [
	"/**
	 * Convert a GUID string into a SDL_GUID structure.
	 *
	 * Performs no error checking. If this function is given a string containing
	 * an invalid GUID, the function will silently succeed, but the GUID generated
	 * will not be useful.
	 *
	 * \param pchGUID string containing an ASCII representation of a GUID.
	 * \returns a SDL_GUID structure.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GUIDToString
	 */"

	^ self ffiCall: #(SDL_GUID SDL_StringToGUID(const char* pchGUID))
]

{ #category : 'public' }
LibSDL3 >> strlcatDst: dst src: src maxlen: maxlen [
	"/**
	 * Concatenate strings.
	 *
	 * This function appends up to `maxlen` - SDL_strlen(dst) - 1 characters from
	 * `src` to the end of the string in `dst`, then appends a null terminator.
	 *
	 * `src` and `dst` must not overlap.
	 *
	 * If `maxlen` - SDL_strlen(dst) - 1 is less than or equal to 0, then `dst` is
	 * unmodified.
	 *
	 * \param dst The destination buffer already containing the first
	 *            null-terminated string. Must not be NULL and must not overlap
	 *            with `src`.
	 * \param src The second null-terminated string. Must not be NULL, and must
	 *            not overlap with `dst`.
	 * \param maxlen The length (in characters) of the destination buffer.
	 * \returns the length (in characters, excluding the null terminator) of the
	 *          string in `dst` plus the length of `src`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_strlcpy
	 */"

	^ self ffiCall: #(size_t SDL_strlcat(char* dst, const char* src, size_t maxlen))
]

{ #category : 'public' }
LibSDL3 >> strlcpyDst: dst src: src maxlen: maxlen [
	"/**
	 * Copy a string.
	 *
	 * This function copies up to `maxlen` - 1 characters from `src` to `dst`,
	 * then appends a null terminator.
	 *
	 * If `maxlen` is 0, no characters are copied and no null terminator is
	 * written.
	 *
	 * If you want to copy an UTF-8 string but need to ensure that multi-byte
	 * sequences are not truncated, consider using SDL_utf8strlcpy().
	 *
	 * \param dst The destination buffer. Must not be NULL, and must not overlap
	 *            with `src`.
	 * \param src The null-terminated string to copy. Must not be NULL, and must
	 *            not overlap with `dst`.
	 * \param maxlen The length (in characters) of the destination buffer.
	 * \returns the length (in characters, excluding the null terminator) of
	 *          `src`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_strlcat
	 * \sa SDL_utf8strlcpy
	 */"

	^ self ffiCall: #(size_t SDL_strlcpy(char* dst, const char* src, size_t maxlen))
]

{ #category : 'public' }
LibSDL3 >> strlen: str [
	"/**
	 * This works exactly like strlen() but doesn't require access to a C runtime.
	 *
	 * Counts the bytes in `str`, excluding the null terminator.
	 *
	 * If you need the length of a UTF-8 string, consider using SDL_utf8strlen().
	 *
	 * \param str The null-terminated string to read. Must not be NULL.
	 * \returns the length (in bytes, excluding the null terminator) of `src`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_strnlen
	 * \sa SDL_utf8strlen
	 * \sa SDL_utf8strnlen
	 */"

	^ self ffiCall: #(size_t SDL_strlen(const char* str))
]

{ #category : 'public' }
LibSDL3 >> strlwr: str [
	"/**
	 * Convert a string to lowercase.
	 *
	 * **WARNING**: Regardless of system locale, this will only convert ASCII
	 * values 'A' through 'Z' to lowercase.
	 *
	 * This function operates on a null-terminated string of bytes--even if it is
	 * malformed UTF-8!--and converts ASCII characters 'A' through 'Z' to their
	 * lowercase equivalents in-place, returning the original `str` pointer.
	 *
	 * \param str the string to convert in-place. Can not be NULL.
	 * \returns the `str` pointer passed into this function.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_strupr
	 */"

	^ self ffiCall: #(char* SDL_strlwr(char* str))
]

{ #category : 'public' }
LibSDL3 >> strncasecmpStr1: str1 str2: str2 maxlen: maxlen [
	"/**
	 * Compare two UTF-8 strings, case-insensitively, up to a number of bytes.
	 *
	 * This will work with Unicode strings, using a technique called
	 * ""case-folding"" to handle the vast majority of case-sensitive human
	 * languages regardless of system locale. It can deal with expanding values: a
	 * German Eszett character can compare against two ASCII 's' chars and be
	 * considered a match, for example. A notable exception: it does not handle
	 * the Turkish 'i' character; human language is complicated!
	 *
	 * Since this handles Unicode, it expects the string to be well-formed UTF-8
	 * and not a null-terminated string of arbitrary bytes. Bytes that are not
	 * valid UTF-8 are treated as Unicode character U+FFFD (REPLACEMENT
	 * CHARACTER), which is to say two strings of random bits may turn out to
	 * match if they convert to the same amount of replacement characters.
	 *
	 * Note that while this function is intended to be used with UTF-8, `maxlen`
	 * specifies a _byte_ limit! If the limit lands in the middle of a multi-byte
	 * UTF-8 sequence, it may convert a portion of the final character to one or
	 * more Unicode character U+FFFD (REPLACEMENT CHARACTER) so as not to overflow
	 * a buffer.
	 *
	 * `maxlen` specifies a maximum number of bytes to compare; if the strings
	 * match to this number of bytes (or both have matched to a null-terminator
	 * character before this number of bytes), they will be considered equal.
	 *
	 * \param str1 the first string to compare. NULL is not permitted!
	 * \param str2 the second string to compare. NULL is not permitted!
	 * \param maxlen the maximum number of bytes to compare.
	 * \returns less than zero if str1 is ""less than"" str2, greater than zero if
	 *          str1 is ""greater than"" str2, and zero if the strings match
	 *          exactly.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(int SDL_strncasecmp(const char* str1, const char* str2, size_t maxlen))
]

{ #category : 'public' }
LibSDL3 >> strncmpStr1: str1 str2: str2 maxlen: maxlen [
	"/**
	 * Compare two UTF-8 strings up to a number of bytes.
	 *
	 * Due to the nature of UTF-8 encoding, this will work with Unicode strings,
	 * since effectively this function just compares bytes until it hits a
	 * null-terminating character. Also due to the nature of UTF-8, this can be
	 * used with SDL_qsort() to put strings in (roughly) alphabetical order.
	 *
	 * Note that while this function is intended to be used with UTF-8, it is
	 * doing a bytewise comparison, and `maxlen` specifies a _byte_ limit! If the
	 * limit lands in the middle of a multi-byte UTF-8 sequence, it will only
	 * compare a portion of the final character.
	 *
	 * `maxlen` specifies a maximum number of bytes to compare; if the strings
	 * match to this number of bytes (or both have matched to a null-terminator
	 * character before this number of bytes), they will be considered equal.
	 *
	 * \param str1 the first string to compare. NULL is not permitted!
	 * \param str2 the second string to compare. NULL is not permitted!
	 * \param maxlen the maximum number of _bytes_ to compare.
	 * \returns less than zero if str1 is ""less than"" str2, greater than zero if
	 *          str1 is ""greater than"" str2, and zero if the strings match
	 *          exactly.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(int SDL_strncmp(const char* str1, const char* str2, size_t maxlen))
]

{ #category : 'public' }
LibSDL3 >> strndupStr: str maxlen: maxlen [
	"/**
	 * Allocate a copy of a string, up to n characters.
	 *
	 * This allocates enough space for a null-terminated copy of `str`, up to
	 * `maxlen` bytes, using SDL_malloc, and then makes a copy of the string into
	 * this space.
	 *
	 * If the string is longer than `maxlen` bytes, the returned string will be
	 * `maxlen` bytes long, plus a null-terminator character that isn't included
	 * in the count.
	 *
	 * The returned string is owned by the caller, and should be passed to
	 * SDL_free when no longer needed.
	 *
	 * \param str the string to copy.
	 * \param maxlen the maximum length of the copied string, not counting the
	 *               null-terminator character.
	 * \returns a pointer to the newly-allocated string.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(char* SDL_strndup(const char* str, size_t maxlen))
]

{ #category : 'public' }
LibSDL3 >> strnlenStr: str maxlen: maxlen [
	"/**
	 * This works exactly like strnlen() but doesn't require access to a C
	 * runtime.
	 *
	 * Counts up to a maximum of `maxlen` bytes in `str`, excluding the null
	 * terminator.
	 *
	 * If you need the length of a UTF-8 string, consider using SDL_utf8strnlen().
	 *
	 * \param str The null-terminated string to read. Must not be NULL.
	 * \param maxlen The maximum amount of bytes to count.
	 * \returns the length (in bytes, excluding the null terminator) of `src` but
	 *          never more than `maxlen`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_strlen
	 * \sa SDL_utf8strlen
	 * \sa SDL_utf8strnlen
	 */"

	^ self ffiCall: #(size_t SDL_strnlen(const char* str, size_t maxlen))
]

{ #category : 'public' }
LibSDL3 >> strnstrHaystack: haystack needle: needle maxlen: maxlen [
	"/**
	 * Search a string, up to n bytes, for the first instance of a specific
	 * substring.
	 *
	 * The search ends once it finds the requested substring, or a null terminator
	 * byte to end the string, or `maxlen` bytes have been examined. It is
	 * possible to use this function on a string without a null terminator.
	 *
	 * Note that this looks for strings of _bytes_, not _characters_, so it's
	 * legal to search for malformed and incomplete UTF-8 sequences.
	 *
	 * \param haystack the string to search. Must not be NULL.
	 * \param needle the string to search for. Must not be NULL.
	 * \param maxlen the maximum number of bytes to search in `haystack`.
	 * \returns a pointer to the first instance of `needle` in the string, or NULL
	 *          if not found.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(char* SDL_strnstr(const char* haystack, const char* needle, size_t maxlen))
]

{ #category : 'public' }
LibSDL3 >> strpbrkStr: str breakset: breakset [
	"/**
	 * Searches a string for the first occurence of any character contained in a
	 * breakset, and returns a pointer from the string to that character.
	 *
	 * \param str The null-terminated string to be searched. Must not be NULL, and
	 *            must not overlap with `breakset`.
	 * \param breakset A null-terminated string containing the list of characters
	 *                 to look for. Must not be NULL, and must not overlap with
	 *                 `str`.
	 * \returns A pointer to the location, in str, of the first occurence of a
	 *          character present in the breakset, or NULL if none is found.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(char* SDL_strpbrk(const char* str, const char* breakset))
]

{ #category : 'public' }
LibSDL3 >> strrchrStr: str c: c [
	"/**
	 * Search a string for the last instance of a specific byte.
	 *
	 * The search must go until it finds a null terminator byte to end the string.
	 *
	 * Note that this looks for _bytes_, not _characters_, so you cannot match
	 * against a Unicode codepoint > 255, regardless of character encoding.
	 *
	 * \param str the string to search. Must not be NULL.
	 * \param c the byte value to search for.
	 * \returns a pointer to the last instance of `c` in the string, or NULL if
	 *          not found.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(char* SDL_strrchr(const char* str, int c))
]

{ #category : 'public' }
LibSDL3 >> strrev: str [
	"/**
	 * Reverse a string's contents.
	 *
	 * This reverses a null-terminated string in-place. Only the content of the
	 * string is reversed; the null-terminator character remains at the end of the
	 * reversed string.
	 *
	 * **WARNING**: This function reverses the _bytes_ of the string, not the
	 * codepoints. If `str` is a UTF-8 string with Unicode codepoints > 127, this
	 * will ruin the string data. You should only use this function on strings
	 * that are completely comprised of low ASCII characters.
	 *
	 * \param str the string to reverse.
	 * \returns `str`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(char* SDL_strrev(char* str))
]

{ #category : 'public' }
LibSDL3 >> strstrHaystack: haystack needle: needle [
	"/**
	 * Search a string for the first instance of a specific substring.
	 *
	 * The search ends once it finds the requested substring, or a null terminator
	 * byte to end the string.
	 *
	 * Note that this looks for strings of _bytes_, not _characters_, so it's
	 * legal to search for malformed and incomplete UTF-8 sequences.
	 *
	 * \param haystack the string to search. Must not be NULL.
	 * \param needle the string to search for. Must not be NULL.
	 * \returns a pointer to the first instance of `needle` in the string, or NULL
	 *          if not found.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(char* SDL_strstr(const char* haystack, const char* needle))
]

{ #category : 'public' }
LibSDL3 >> strtodStr: str endp: endp [
	"/**
	 * Parse a `double` from a string.
	 *
	 * This function makes fewer guarantees than the C runtime `strtod`:
	 *
	 * - Only decimal notation is guaranteed to be supported. The handling of
	 *   scientific and hexadecimal notation is unspecified.
	 * - Whether or not INF and NAN can be parsed is unspecified.
	 * - The precision of the result is unspecified.
	 *
	 * \param str the null-terminated string to read. Must not be NULL.
	 * \param endp if not NULL, the address of the first invalid character (i.e.
	 *             the next character after the parsed number) will be written to
	 *             this pointer.
	 * \returns the parsed `double`, or 0 if no number could be parsed.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_atoi
	 * \sa SDL_atof
	 * \sa SDL_strtol
	 * \sa SDL_strtoll
	 * \sa SDL_strtoul
	 * \sa SDL_strtoull
	 */"

	^ self ffiCall: #(double SDL_strtod(const char* str, char** endp))
]

{ #category : 'public' }
LibSDL3 >> strtokRS1: s1 s2: s2 saveptr: saveptr [

	self ffiCall: #(char* SDL_strtok_r(char* s1, const char* s2, char** saveptr))
]

{ #category : 'public' }
LibSDL3 >> strtokRStr: str delim: delim saveptr: saveptr [
	"/**
	 * This works exactly like strtok_r() but doesn't require access to a C
	 * runtime.
	 *
	 * Break a string up into a series of tokens.
	 *
	 * To start tokenizing a new string, `str` should be the non-NULL address of
	 * the string to start tokenizing. Future calls to get the next token from the
	 * same string should specify a NULL.
	 *
	 * Note that this function will overwrite pieces of `str` with null chars to
	 * split it into tokens. This function cannot be used with const/read-only
	 * strings!
	 *
	 * `saveptr` just needs to point to a `char *` that can be overwritten; SDL
	 * will use this to save tokenizing state between calls. It is initialized if
	 * `str` is non-NULL, and used to resume tokenizing when `str` is NULL.
	 *
	 * \param str the string to tokenize, or NULL to continue tokenizing.
	 * \param delim the delimiter string that separates tokens.
	 * \param saveptr pointer to a char *, used for ongoing state.
	 * \returns A pointer to the next token, or NULL if no tokens remain.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(char* SDL_strtok_r(char* str, const char* delim, char** saveptr))
]

{ #category : 'public' }
LibSDL3 >> strtolStr: str endp: endp base: base [
	"/**
	 * Parse a `long` from a string.
	 *
	 * If `str` starts with whitespace, then those whitespace characters are
	 * skipped before attempting to parse the number.
	 *
	 * If the parsed number does not fit inside a `long`, the result is clamped to
	 * the minimum and maximum representable `long` values.
	 *
	 * \param str The null-terminated string to read. Must not be NULL.
	 * \param endp If not NULL, the address of the first invalid character (i.e.
	 *             the next character after the parsed number) will be written to
	 *             this pointer.
	 * \param base The base of the integer to read. Supported values are 0 and 2
	 *             to 36 inclusive. If 0, the base will be inferred from the
	 *             number's prefix (0x for hexadecimal, 0 for octal, decimal
	 *             otherwise).
	 * \returns the parsed `long`, or 0 if no number could be parsed.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_atoi
	 * \sa SDL_atof
	 * \sa SDL_strtoul
	 * \sa SDL_strtoll
	 * \sa SDL_strtoull
	 * \sa SDL_strtod
	 * \sa SDL_ltoa
	 * \sa SDL_wcstol
	 */"

	^ self ffiCall: #(long SDL_strtol(const char* str, char** endp, int base))
]

{ #category : 'public' }
LibSDL3 >> strtollStr: str endp: endp base: base [
	"/**
	 * Parse a `long long` from a string.
	 *
	 * If `str` starts with whitespace, then those whitespace characters are
	 * skipped before attempting to parse the number.
	 *
	 * If the parsed number does not fit inside a `long long`, the result is
	 * clamped to the minimum and maximum representable `long long` values.
	 *
	 * \param str The null-terminated string to read. Must not be NULL.
	 * \param endp If not NULL, the address of the first invalid character (i.e.
	 *             the next character after the parsed number) will be written to
	 *             this pointer.
	 * \param base The base of the integer to read. Supported values are 0 and 2
	 *             to 36 inclusive. If 0, the base will be inferred from the
	 *             number's prefix (0x for hexadecimal, 0 for octal, decimal
	 *             otherwise).
	 * \returns the parsed `long long`, or 0 if no number could be parsed.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_atoi
	 * \sa SDL_atof
	 * \sa SDL_strtol
	 * \sa SDL_strtoul
	 * \sa SDL_strtoull
	 * \sa SDL_strtod
	 * \sa SDL_lltoa
	 */"

	^ self ffiCall: #(long SDL_strtoll(const char* str, char** endp, int base))
]

{ #category : 'public' }
LibSDL3 >> strtoulStr: str endp: endp base: base [
	"/**
	 * Parse an `unsigned long` from a string.
	 *
	 * If `str` starts with whitespace, then those whitespace characters are
	 * skipped before attempting to parse the number.
	 *
	 * If the parsed number does not fit inside an `unsigned long`, the result is
	 * clamped to the maximum representable `unsigned long` value.
	 *
	 * \param str The null-terminated string to read. Must not be NULL.
	 * \param endp If not NULL, the address of the first invalid character (i.e.
	 *             the next character after the parsed number) will be written to
	 *             this pointer.
	 * \param base The base of the integer to read. Supported values are 0 and 2
	 *             to 36 inclusive. If 0, the base will be inferred from the
	 *             number's prefix (0x for hexadecimal, 0 for octal, decimal
	 *             otherwise).
	 * \returns the parsed `unsigned long`, or 0 if no number could be parsed.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_atoi
	 * \sa SDL_atof
	 * \sa SDL_strtol
	 * \sa SDL_strtoll
	 * \sa SDL_strtoull
	 * \sa SDL_strtod
	 * \sa SDL_ultoa
	 */"

	^ self ffiCall: #(ulong SDL_strtoul(const char* str, char** endp, int base))
]

{ #category : 'public' }
LibSDL3 >> strtoullStr: str endp: endp base: base [
	"/**
	 * Parse an `unsigned long long` from a string.
	 *
	 * If `str` starts with whitespace, then those whitespace characters are
	 * skipped before attempting to parse the number.
	 *
	 * If the parsed number does not fit inside an `unsigned long long`, the
	 * result is clamped to the maximum representable `unsigned long long` value.
	 *
	 * \param str The null-terminated string to read. Must not be NULL.
	 * \param endp If not NULL, the address of the first invalid character (i.e.
	 *             the next character after the parsed number) will be written to
	 *             this pointer.
	 * \param base The base of the integer to read. Supported values are 0 and 2
	 *             to 36 inclusive. If 0, the base will be inferred from the
	 *             number's prefix (0x for hexadecimal, 0 for octal, decimal
	 *             otherwise).
	 * \returns the parsed `unsigned long long`, or 0 if no number could be
	 *          parsed.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_atoi
	 * \sa SDL_atof
	 * \sa SDL_strtol
	 * \sa SDL_strtoll
	 * \sa SDL_strtoul
	 * \sa SDL_strtod
	 * \sa SDL_ulltoa
	 */"

	^ self ffiCall: #(ulong SDL_strtoull(const char* str, char** endp, int base))
]

{ #category : 'public' }
LibSDL3 >> strupr: str [
	"/**
	 * Convert a string to uppercase.
	 *
	 * **WARNING**: Regardless of system locale, this will only convert ASCII
	 * values 'A' through 'Z' to uppercase.
	 *
	 * This function operates on a null-terminated string of bytes--even if it is
	 * malformed UTF-8!--and converts ASCII characters 'a' through 'z' to their
	 * uppercase equivalents in-place, returning the original `str` pointer.
	 *
	 * \param str the string to convert in-place. Can not be NULL.
	 * \returns the `str` pointer passed into this function.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_strlwr
	 */"

	^ self ffiCall: #(char* SDL_strupr(char* str))
]

{ #category : 'public' }
LibSDL3 >> submitGPUCommandBuffer: command_buffer [
	"/**
	 * Submits a command buffer so its commands can be processed on the GPU.
	 *
	 * It is invalid to use the command buffer after this is called.
	 *
	 * This must be called from the thread the command buffer was acquired on.
	 *
	 * All commands in the submission are guaranteed to begin executing before any
	 * command in a subsequent submission begins executing.
	 *
	 * \param command_buffer a command buffer.
	 * \returns true on success, false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_AcquireGPUCommandBuffer
	 * \sa SDL_WaitAndAcquireGPUSwapchainTexture
	 * \sa SDL_AcquireGPUSwapchainTexture
	 * \sa SDL_SubmitGPUCommandBufferAndAcquireFence
	 */"

	^ self ffiCall: #(bool SDL_SubmitGPUCommandBuffer(SDL_GPUCommandBuffer* command_buffer))
]

{ #category : 'public' }
LibSDL3 >> submitGPUCommandBufferAndAcquireFence: command_buffer [
	"/**
	 * Submits a command buffer so its commands can be processed on the GPU, and
	 * acquires a fence associated with the command buffer.
	 *
	 * You must release this fence when it is no longer needed or it will cause a
	 * leak. It is invalid to use the command buffer after this is called.
	 *
	 * This must be called from the thread the command buffer was acquired on.
	 *
	 * All commands in the submission are guaranteed to begin executing before any
	 * command in a subsequent submission begins executing.
	 *
	 * \param command_buffer a command buffer.
	 * \returns a fence associated with the command buffer, or NULL on failure;
	 *          call SDL_GetError() for more information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_AcquireGPUCommandBuffer
	 * \sa SDL_WaitAndAcquireGPUSwapchainTexture
	 * \sa SDL_AcquireGPUSwapchainTexture
	 * \sa SDL_SubmitGPUCommandBuffer
	 * \sa SDL_ReleaseGPUFence
	 */"

	^ self ffiCall: #(SDL_GPUFence* SDL_SubmitGPUCommandBufferAndAcquireFence(SDL_GPUCommandBuffer* command_buffer))
]

{ #category : 'public' }
LibSDL3 >> surfaceHasAlternateImages: surface [
	"/**
	 * Return whether a surface has alternate versions available.
	 *
	 * \param surface the SDL_Surface structure to query.
	 * \returns true if alternate versions are available or false otherwise.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_AddSurfaceAlternateImage
	 * \sa SDL_RemoveSurfaceAlternateImages
	 * \sa SDL_GetSurfaceImages
	 */"

	^ self ffiCall: #(bool SDL_SurfaceHasAlternateImages(SDL_Surface* surface))
]

{ #category : 'public' }
LibSDL3 >> surfaceHasColorKey: surface [
	"/**
	 * Returns whether the surface has a color key.
	 *
	 * It is safe to pass a NULL `surface` here; it will return false.
	 *
	 * \param surface the SDL_Surface structure to query.
	 * \returns true if the surface has a color key, false otherwise.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetSurfaceColorKey
	 * \sa SDL_GetSurfaceColorKey
	 */"

	^ self ffiCall: #(bool SDL_SurfaceHasColorKey(SDL_Surface* surface))
]

{ #category : 'public' }
LibSDL3 >> surfaceHasRLE: surface [
	"/**
	 * Returns whether the surface is RLE enabled.
	 *
	 * It is safe to pass a NULL `surface` here; it will return false.
	 *
	 * \param surface the SDL_Surface structure to query.
	 * \returns true if the surface is RLE enabled, false otherwise.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetSurfaceRLE
	 */"

	^ self ffiCall: #(bool SDL_SurfaceHasRLE(SDL_Surface* surface))
]

{ #category : 'public' }
LibSDL3 >> swapFloat: x [
	"/**
	 * Byte-swap a floating point number.
	 *
	 * This will always byte-swap the value, whether it's currently in the native
	 * byteorder of the system or not. You should use SDL_SwapFloatLE or
	 * SDL_SwapFloatBE instead, in most cases.
	 *
	 * Note that this is a forced-inline function in a header, and not a public
	 * API function available in the SDL library (which is to say, the code is
	 * embedded in the calling program and the linker and dynamic loader will not
	 * be able to find this function inside SDL itself).
	 *
	 * \param x the value to byte-swap.
	 * \returns x, with its bytes in the opposite endian order.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(float SDL_SwapFloat(float x))
]

{ #category : 'public' }
LibSDL3 >> syncWindow: window [
	"/**
	 * Block until any pending window state is finalized.
	 *
	 * On asynchronous windowing systems, this acts as a synchronization barrier
	 * for pending window state. It will attempt to wait until any pending window
	 * state has been applied and is guaranteed to return within finite time. Note
	 * that for how long it can potentially block depends on the underlying window
	 * system, as window state changes may involve somewhat lengthy animations
	 * that must complete before the window is in its final requested state.
	 *
	 * On windowing systems where changes are immediate, this does nothing.
	 *
	 * \param window the window for which to wait for the pending state to be
	 *               applied.
	 * \returns true on success or false if the operation timed out before the
	 *          window was in the requested state.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SetWindowSize
	 * \sa SDL_SetWindowPosition
	 * \sa SDL_SetWindowFullscreen
	 * \sa SDL_MinimizeWindow
	 * \sa SDL_MaximizeWindow
	 * \sa SDL_RestoreWindow
	 * \sa SDL_HINT_VIDEO_SYNC_WINDOW_OPERATIONS
	 */"

	^ self ffiCall: #(bool SDL_SyncWindow(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> tan: x [
	"/**
	 * Compute the tangent of `x`.
	 *
	 * Domain: `-INF <= x <= INF`
	 *
	 * Range: `-INF <= y <= INF`
	 *
	 * This function operates on double-precision floating point values, use
	 * SDL_tanf for single-precision floats.
	 *
	 * This function may use a different approximation across different versions,
	 * platforms and configurations. i.e, it can return a different value given
	 * the same input on different machines or operating systems, or if SDL is
	 * updated.
	 *
	 * \param x floating point value, in radians.
	 * \returns tangent of `x`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_tanf
	 * \sa SDL_sin
	 * \sa SDL_cos
	 * \sa SDL_atan
	 * \sa SDL_atan2
	 */"

	^ self ffiCall: #(double SDL_tan(double x))
]

{ #category : 'public' }
LibSDL3 >> tanf: x [
	"/**
	 * Compute the tangent of `x`.
	 *
	 * Domain: `-INF <= x <= INF`
	 *
	 * Range: `-INF <= y <= INF`
	 *
	 * This function operates on single-precision floating point values, use
	 * SDL_tan for double-precision floats.
	 *
	 * This function may use a different approximation across different versions,
	 * platforms and configurations. i.e, it can return a different value given
	 * the same input on different machines or operating systems, or if SDL is
	 * updated.
	 *
	 * \param x floating point value, in radians.
	 * \returns tangent of `x`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_tan
	 * \sa SDL_sinf
	 * \sa SDL_cosf
	 * \sa SDL_atanf
	 * \sa SDL_atan2f
	 */"

	^ self ffiCall: #(float SDL_tanf(float x))
]

{ #category : 'public' }
LibSDL3 >> tellIO: context [
	"/**
	 * Determine the current read/write offset in an SDL_IOStream data stream.
	 *
	 * SDL_TellIO is actually a wrapper function that calls the SDL_IOStream's
	 * `seek` method, with an offset of 0 bytes from `SDL_IO_SEEK_CUR`, to
	 * simplify application development.
	 *
	 * \param context an SDL_IOStream data stream object from which to get the
	 *                current offset.
	 * \returns the current offset in the stream, or -1 if the information can not
	 *          be determined.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SeekIO
	 */"

	^ self ffiCall: #(Sint64 SDL_TellIO(SDL_IOStream* context))
]

{ #category : 'public' }
LibSDL3 >> textInputActive: window [
	"/**
	 * Check whether or not Unicode text input events are enabled for a window.
	 *
	 * \param window the window to check.
	 * \returns true if text input events are enabled else false.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_StartTextInput
	 */"

	^ self ffiCall: #(bool SDL_TextInputActive(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> timeFromWindowsDwLowDateTime: dwLowDateTime dwHighDateTime: dwHighDateTime [
	"/**
	 * Converts a Windows FILETIME (100-nanosecond intervals since January 1,
	 * 1601) to an SDL time.
	 *
	 * This function takes the two 32-bit values of the FILETIME structure as
	 * parameters.
	 *
	 * \param dwLowDateTime the low portion of the Windows FILETIME value.
	 * \param dwHighDateTime the high portion of the Windows FILETIME value.
	 * \returns the converted SDL time.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(SDL_Time SDL_TimeFromWindows(Uint32 dwLowDateTime, Uint32 dwHighDateTime))
]

{ #category : 'public' }
LibSDL3 >> timeToDateTimeTicks: ticks dt: dt localTime: localTime [
	"/**
	 * Converts an SDL_Time in nanoseconds since the epoch to a calendar time in
	 * the SDL_DateTime format.
	 *
	 * \param ticks the SDL_Time to be converted.
	 * \param dt the resulting SDL_DateTime.
	 * \param localTime the resulting SDL_DateTime will be expressed in local time
	 *                  if true, otherwise it will be in Universal Coordinated
	 *                  Time (UTC).
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_TimeToDateTime(SDL_Time ticks, SDL_DateTime* dt, _Bool localTime))
]

{ #category : 'public' }
LibSDL3 >> timeToWindowsTicks: ticks dwLowDateTime: dwLowDateTime dwHighDateTime: dwHighDateTime [
	"/**
	 * Converts an SDL time into a Windows FILETIME (100-nanosecond intervals
	 * since January 1, 1601).
	 *
	 * This function fills in the two 32-bit values of the FILETIME structure.
	 *
	 * \param ticks the time to convert.
	 * \param dwLowDateTime a pointer filled in with the low portion of the
	 *                      Windows FILETIME value.
	 * \param dwHighDateTime a pointer filled in with the high portion of the
	 *                       Windows FILETIME value.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_TimeToWindows(SDL_Time ticks, Uint32* dwLowDateTime, Uint32* dwHighDateTime))
]

{ #category : 'public' }
LibSDL3 >> tolower: x [
	"/**
	 * Convert low-ASCII English letters to lowercase.
	 *
	 * **WARNING**: Regardless of system locale, this will only convert ASCII
	 * values 'A' through 'Z' to lowercase.
	 *
	 * This function returns the lowercase equivalent of `x`. If a character
	 * cannot be converted, or is already lowercase, this function returns `x`.
	 *
	 * \param x character value to check.
	 * \returns lowercase version of x, or x if no conversion available.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(int SDL_tolower(int x))
]

{ #category : 'public' }
LibSDL3 >> toupper: x [
	"/**
	 * Convert low-ASCII English letters to uppercase.
	 *
	 * **WARNING**: Regardless of system locale, this will only convert ASCII
	 * values 'a' through 'z' to uppercase.
	 *
	 * This function returns the uppercase equivalent of `x`. If a character
	 * cannot be converted, or is already uppercase, this function returns `x`.
	 *
	 * \param x character value to check.
	 * \returns capitalized version of x, or x if no conversion available.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(int SDL_toupper(int x))
]

{ #category : 'public' }
LibSDL3 >> trunc: x [
	"/**
	 * Truncate `x` to an integer.
	 *
	 * Rounds `x` to the next closest integer to 0. This is equivalent to removing
	 * the fractional part of `x`, leaving only the integer part.
	 *
	 * Domain: `-INF <= x <= INF`
	 *
	 * Range: `-INF <= y <= INF`, y integer
	 *
	 * This function operates on double-precision floating point values, use
	 * SDL_truncf for single-precision floats.
	 *
	 * \param x floating point value.
	 * \returns `x` truncated to an integer.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_truncf
	 * \sa SDL_fmod
	 * \sa SDL_ceil
	 * \sa SDL_floor
	 * \sa SDL_round
	 * \sa SDL_lround
	 */"

	^ self ffiCall: #(double SDL_trunc(double x))
]

{ #category : 'public' }
LibSDL3 >> truncf: x [
	"/**
	 * Truncate `x` to an integer.
	 *
	 * Rounds `x` to the next closest integer to 0. This is equivalent to removing
	 * the fractional part of `x`, leaving only the integer part.
	 *
	 * Domain: `-INF <= x <= INF`
	 *
	 * Range: `-INF <= y <= INF`, y integer
	 *
	 * This function operates on single-precision floating point values, use
	 * SDL_trunc for double-precision floats.
	 *
	 * \param x floating point value.
	 * \returns `x` truncated to an integer.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_trunc
	 * \sa SDL_fmodf
	 * \sa SDL_ceilf
	 * \sa SDL_floorf
	 * \sa SDL_roundf
	 * \sa SDL_lroundf
	 */"

	^ self ffiCall: #(float SDL_truncf(float x))
]

{ #category : 'public' }
LibSDL3 >> tryLockMutex: mutex [
	"/**
	 * Try to lock a mutex without blocking.
	 *
	 * This works just like SDL_LockMutex(), but if the mutex is not available,
	 * this function returns false immediately.
	 *
	 * This technique is useful if you need exclusive access to a resource but
	 * don't want to wait for it, and will return to it to try again later.
	 *
	 * This function returns true if passed a NULL mutex.
	 *
	 * \param mutex the mutex to try to lock.
	 * \returns true on success, false if the mutex would block.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_LockMutex
	 * \sa SDL_UnlockMutex
	 */"

	^ self ffiCall: #(bool SDL_TryLockMutex(SDL_Mutex* mutex))
]

{ #category : 'public' }
LibSDL3 >> tryLockRWLockForReading: rwlock [
	"/**
	 * Try to lock a read/write lock _for reading_ without blocking.
	 *
	 * This works just like SDL_LockRWLockForReading(), but if the rwlock is not
	 * available, then this function returns false immediately.
	 *
	 * This technique is useful if you need access to a resource but don't want to
	 * wait for it, and will return to it to try again later.
	 *
	 * Trying to lock for read-only access can succeed if other threads are
	 * holding read-only locks, as this won't prevent access.
	 *
	 * This function returns true if passed a NULL rwlock.
	 *
	 * \param rwlock the rwlock to try to lock.
	 * \returns true on success, false if the lock would block.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_LockRWLockForReading
	 * \sa SDL_TryLockRWLockForWriting
	 * \sa SDL_UnlockRWLock
	 */"

	^ self ffiCall: #(bool SDL_TryLockRWLockForReading(SDL_RWLock* rwlock))
]

{ #category : 'public' }
LibSDL3 >> tryLockRWLockForWriting: rwlock [
	"/**
	 * Try to lock a read/write lock _for writing_ without blocking.
	 *
	 * This works just like SDL_LockRWLockForWriting(), but if the rwlock is not
	 * available, then this function returns false immediately.
	 *
	 * This technique is useful if you need exclusive access to a resource but
	 * don't want to wait for it, and will return to it to try again later.
	 *
	 * It is illegal for the owning thread to lock an already-locked rwlock for
	 * writing (read-only may be locked recursively, writing can not). Doing so
	 * results in undefined behavior.
	 *
	 * It is illegal to request a write lock from a thread that already holds a
	 * read-only lock. Doing so results in undefined behavior. Unlock the
	 * read-only lock before requesting a write lock.
	 *
	 * This function returns true if passed a NULL rwlock.
	 *
	 * \param rwlock the rwlock to try to lock.
	 * \returns true on success, false if the lock would block.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_LockRWLockForWriting
	 * \sa SDL_TryLockRWLockForReading
	 * \sa SDL_UnlockRWLock
	 */"

	^ self ffiCall: #(bool SDL_TryLockRWLockForWriting(SDL_RWLock* rwlock))
]

{ #category : 'public' }
LibSDL3 >> tryLockSpinlock: lock [
	"/**
	 * Try to lock a spin lock by setting it to a non-zero value.
	 *
	 * ***Please note that spinlocks are dangerous if you don't know what you're
	 * doing. Please be careful using any sort of spinlock!***
	 *
	 * \param lock a pointer to a lock variable.
	 * \returns true if the lock succeeded, false if the lock is already held.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_LockSpinlock
	 * \sa SDL_UnlockSpinlock
	 */"

	^ self ffiCall: #(bool SDL_TryLockSpinlock(SDL_SpinLock* lock))
]

{ #category : 'public' }
LibSDL3 >> tryWaitSemaphore: sem [
	"/**
	 * See if a semaphore has a positive value and decrement it if it does.
	 *
	 * This function checks to see if the semaphore pointed to by `sem` has a
	 * positive value and atomically decrements the semaphore value if it does. If
	 * the semaphore doesn't have a positive value, the function immediately
	 * returns false.
	 *
	 * \param sem the semaphore to wait on.
	 * \returns true if the wait succeeds, false if the wait would block.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SignalSemaphore
	 * \sa SDL_WaitSemaphore
	 * \sa SDL_WaitSemaphoreTimeout
	 */"

	^ self ffiCall: #(bool SDL_TryWaitSemaphore(SDL_Semaphore* sem))
]

{ #category : 'public' }
LibSDL3 >> uCS4ToUTF8Codepoint: codepoint dst: dst [
	"/**
	 * Convert a single Unicode codepoint to UTF-8.
	 *
	 * The buffer pointed to by `dst` must be at least 4 bytes long, as this
	 * function may generate between 1 and 4 bytes of output.
	 *
	 * This function returns the first byte _after_ the newly-written UTF-8
	 * sequence, which is useful for encoding multiple codepoints in a loop, or
	 * knowing where to write a NULL-terminator character to end the string (in
	 * either case, plan to have a buffer of _more_ than 4 bytes!).
	 *
	 * If `codepoint` is an invalid value (outside the Unicode range, or a UTF-16
	 * surrogate value, etc), this will use U+FFFD (REPLACEMENT CHARACTER) for the
	 * codepoint instead, and not set an error.
	 *
	 * If `dst` is NULL, this returns NULL immediately without writing to the
	 * pointer and without setting an error.
	 *
	 * \param codepoint a Unicode codepoint to convert to UTF-8.
	 * \param dst the location to write the encoded UTF-8. Must point to at least
	 *            4 bytes!
	 * \returns the first byte past the newly-written UTF-8 sequence.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(char* SDL_UCS4ToUTF8(Uint32 codepoint, char* dst))
]

{ #category : 'public' }
LibSDL3 >> uitoaValue: value str: str radix: radix [
	"/**
	 * Convert an unsigned integer into a string.
	 *
	 * This requires a radix to specified for string format. Specifying 10
	 * produces a decimal number, 16 hexidecimal, etc. Must be in the range of 2
	 * to 36.
	 *
	 * Note that this function will overflow a buffer if `str` is not large enough
	 * to hold the output! It may be safer to use SDL_snprintf to clamp output, or
	 * SDL_asprintf to allocate a buffer. Otherwise, it doesn't hurt to allocate
	 * much more space than you expect to use (and don't forget null terminator
	 * bytes, etc).
	 *
	 * \param value the unsigned integer to convert.
	 * \param str the buffer to write the string into.
	 * \param radix the radix to use for string generation.
	 * \returns `str`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_itoa
	 * \sa SDL_ultoa
	 * \sa SDL_ulltoa
	 */"

	^ self ffiCall: #(char* SDL_uitoa(uint value, char* str, int radix))
]

{ #category : 'public' }
LibSDL3 >> ulltoaValue: value str: str radix: radix [
	"/**
	 * Convert an unsigned long long integer into a string.
	 *
	 * This requires a radix to specified for string format. Specifying 10
	 * produces a decimal number, 16 hexidecimal, etc. Must be in the range of 2
	 * to 36.
	 *
	 * Note that this function will overflow a buffer if `str` is not large enough
	 * to hold the output! It may be safer to use SDL_snprintf to clamp output, or
	 * SDL_asprintf to allocate a buffer. Otherwise, it doesn't hurt to allocate
	 * much more space than you expect to use (and don't forget null terminator
	 * bytes, etc).
	 *
	 * \param value the unsigned long long integer to convert.
	 * \param str the buffer to write the string into.
	 * \param radix the radix to use for string generation.
	 * \returns `str`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_lltoa
	 * \sa SDL_uitoa
	 * \sa SDL_ultoa
	 */"

	^ self ffiCall: #(char* SDL_ulltoa(ulong value, char* str, int radix))
]

{ #category : 'public' }
LibSDL3 >> ultoaValue: value str: str radix: radix [
	"/**
	 * Convert an unsigned long integer into a string.
	 *
	 * This requires a radix to specified for string format. Specifying 10
	 * produces a decimal number, 16 hexidecimal, etc. Must be in the range of 2
	 * to 36.
	 *
	 * Note that this function will overflow a buffer if `str` is not large enough
	 * to hold the output! It may be safer to use SDL_snprintf to clamp output, or
	 * SDL_asprintf to allocate a buffer. Otherwise, it doesn't hurt to allocate
	 * much more space than you expect to use (and don't forget null terminator
	 * bytes, etc).
	 *
	 * \param value the unsigned long integer to convert.
	 * \param str the buffer to write the string into.
	 * \param radix the radix to use for string generation.
	 * \returns `str`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_ltoa
	 * \sa SDL_uitoa
	 * \sa SDL_ulltoa
	 */"

	^ self ffiCall: #(char* SDL_ultoa(ulong value, char* str, int radix))
]

{ #category : 'public' }
LibSDL3 >> unbindAudioStream: stream [
	"/**
	 * Unbind a single audio stream from its audio device.
	 *
	 * This is a convenience function, equivalent to calling
	 * `SDL_UnbindAudioStreams(&stream, 1)`.
	 *
	 * \param stream an audio stream to unbind from a device. Can be NULL.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_BindAudioStream
	 */"

	self ffiCall: #(void SDL_UnbindAudioStream(SDL_AudioStream* stream))
]

{ #category : 'public' }
LibSDL3 >> unbindAudioStreams: streams numStreams: num_streams [
	"/**
	 * Unbind a list of audio streams from their audio devices.
	 *
	 * The streams being unbound do not all have to be on the same device. All
	 * streams on the same device will be unbound atomically (data will stop
	 * flowing through all unbound streams on the same device at the same time).
	 *
	 * Unbinding a stream that isn't bound to a device is a legal no-op.
	 *
	 * \param streams an array of audio streams to unbind. Can be NULL or contain
	 *                NULL.
	 * \param num_streams number streams listed in the `streams` array.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_BindAudioStreams
	 */"

	self ffiCall: #(void SDL_UnbindAudioStreams(SDL_AudioStream* streams, int num_streams))
]

{ #category : 'accessing - platform' }
LibSDL3 >> unix64LibraryName [

	^ FFIUnix64LibraryFinder new
		userPaths: #('./CIG/lib');
		findLibrary: 'libSDL3.so'
]

{ #category : 'public' }
LibSDL3 >> unloadObject: handle [
	"/**
	 * Unload a shared object from memory.
	 *
	 * Note that any pointers from this object looked up through
	 * SDL_LoadFunction() will no longer be valid.
	 *
	 * \param handle a valid shared object handle returned by SDL_LoadObject().
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_LoadObject
	 */"

	self ffiCall: #(void SDL_UnloadObject(SDL_SharedObject* handle))
]

{ #category : 'public' }
LibSDL3 >> unlockAudioStream: stream [
	"/**
	 * Unlock an audio stream for serialized access.
	 *
	 * This unlocks an audio stream after a call to SDL_LockAudioStream.
	 *
	 * \param stream the audio stream to unlock.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety You should only call this from the same thread that
	 *               previously called SDL_LockAudioStream.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_LockAudioStream
	 */"

	^ self ffiCall: #(bool SDL_UnlockAudioStream(SDL_AudioStream* stream))
]

{ #category : 'public' }
LibSDL3 >> unlockJoysticks [
	"/**
	 * Unlocking for atomic access to the joystick API.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_UnlockJoysticks())
]

{ #category : 'public' }
LibSDL3 >> unlockMutex: mutex [
	"/**
	 * Unlock the mutex.
	 *
	 * It is legal for the owning thread to lock an already-locked mutex. It must
	 * unlock it the same number of times before it is actually made available for
	 * other threads in the system (this is known as a ""recursive mutex"").
	 *
	 * It is illegal to unlock a mutex that has not been locked by the current
	 * thread, and doing so results in undefined behavior.
	 *
	 * \param mutex the mutex to unlock.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_LockMutex
	 * \sa SDL_TryLockMutex
	 */"

	self ffiCall: #(void SDL_UnlockMutex(SDL_Mutex* mutex))
]

{ #category : 'public' }
LibSDL3 >> unlockProperties: props [
	"/**
	 * Unlock a group of properties.
	 *
	 * \param props the properties to unlock.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_LockProperties
	 */"

	self ffiCall: #(void SDL_UnlockProperties(SDL_PropertiesID props))
]

{ #category : 'public' }
LibSDL3 >> unlockRWLock: rwlock [
	"/**
	 * Unlock the read/write lock.
	 *
	 * Use this function to unlock the rwlock, whether it was locked for read-only
	 * or write operations.
	 *
	 * It is legal for the owning thread to lock an already-locked read-only lock.
	 * It must unlock it the same number of times before it is actually made
	 * available for other threads in the system (this is known as a ""recursive
	 * rwlock"").
	 *
	 * It is illegal to unlock a rwlock that has not been locked by the current
	 * thread, and doing so results in undefined behavior.
	 *
	 * \param rwlock the rwlock to unlock.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_LockRWLockForReading
	 * \sa SDL_LockRWLockForWriting
	 * \sa SDL_TryLockRWLockForReading
	 * \sa SDL_TryLockRWLockForWriting
	 */"

	self ffiCall: #(void SDL_UnlockRWLock(SDL_RWLock* rwlock))
]

{ #category : 'public' }
LibSDL3 >> unlockSpinlock: lock [
	"/**
	 * Unlock a spin lock by setting it to 0.
	 *
	 * Always returns immediately.
	 *
	 * ***Please note that spinlocks are dangerous if you don't know what you're
	 * doing. Please be careful using any sort of spinlock!***
	 *
	 * \param lock a pointer to a lock variable.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_LockSpinlock
	 * \sa SDL_TryLockSpinlock
	 */"

	self ffiCall: #(void SDL_UnlockSpinlock(SDL_SpinLock* lock))
]

{ #category : 'public' }
LibSDL3 >> unlockSurface: surface [
	"/**
	 * Release a surface after directly accessing the pixels.
	 *
	 * \param surface the SDL_Surface structure to be unlocked.
	 *
	 * \threadsafety This function is not thread safe. The locking referred to by
	 *               this function is making the pixels available for direct
	 *               access, not thread-safe locking.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_LockSurface
	 */"

	self ffiCall: #(void SDL_UnlockSurface(SDL_Surface* surface))
]

{ #category : 'public' }
LibSDL3 >> unlockTexture: texture [
	"/**
	 * Unlock a texture, uploading the changes to video memory, if needed.
	 *
	 * **Warning**: Please note that SDL_LockTexture() is intended to be
	 * write-only; it will not guarantee the previous contents of the texture will
	 * be provided. You must fully initialize any area of a texture that you lock
	 * before unlocking it, as the pixels might otherwise be uninitialized memory.
	 *
	 * Which is to say: locking and immediately unlocking a texture can result in
	 * corrupted textures, depending on the renderer in use.
	 *
	 * \param texture a texture locked by SDL_LockTexture().
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_LockTexture
	 */"

	self ffiCall: #(void SDL_UnlockTexture(SDL_Texture* texture))
]

{ #category : 'public' }
LibSDL3 >> unmapGPUTransferBufferDevice: device transferBuffer: transfer_buffer [
	"/**
	 * Unmaps a previously mapped transfer buffer.
	 *
	 * \param device a GPU context.
	 * \param transfer_buffer a previously mapped transfer buffer.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_UnmapGPUTransferBuffer(SDL_GPUDevice* device, SDL_GPUTransferBuffer* transfer_buffer))
]

{ #category : 'public' }
LibSDL3 >> unsetEnvironmentVariableEnv: env name: name [
	"/**
	 * Clear a variable from the environment.
	 *
	 * \param env the environment to modify.
	 * \param name the name of the variable to unset.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetEnvironment
	 * \sa SDL_CreateEnvironment
	 * \sa SDL_GetEnvironmentVariable
	 * \sa SDL_GetEnvironmentVariables
	 * \sa SDL_SetEnvironmentVariable
	 * \sa SDL_UnsetEnvironmentVariable
	 */"

	^ self ffiCall: #(bool SDL_UnsetEnvironmentVariable(SDL_Environment* env, const char* name))
]

{ #category : 'public' }
LibSDL3 >> unsetenvUnsafe: name [
	"/**
	 * Clear a variable from the environment.
	 *
	 * \param name the name of the variable to unset.
	 * \returns 0 on success, -1 on error.
	 *
	 * \threadsafety This function is not thread safe, consider using
	 *               SDL_UnsetEnvironmentVariable() instead.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_UnsetEnvironmentVariable
	 */"

	^ self ffiCall: #(int SDL_unsetenv_unsafe(const char* name))
]

{ #category : 'public' }
LibSDL3 >> updateJoysticks [
	"/**
	 * Update the current state of the open joysticks.
	 *
	 * This is called automatically by the event loop if any joystick events are
	 * enabled.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_UpdateJoysticks())
]

{ #category : 'public' }
LibSDL3 >> updateNVTexture: texture rect: rect Yplane: Yplane Ypitch: Ypitch UVplane: UVplane UVpitch: UVpitch [
	"/**
	 * Update a rectangle within a planar NV12 or NV21 texture with new pixels.
	 *
	 * You can use SDL_UpdateTexture() as long as your pixel data is a contiguous
	 * block of NV12/21 planes in the proper order, but this function is available
	 * if your pixel data is not contiguous.
	 *
	 * \param texture the texture to update.
	 * \param rect a pointer to the rectangle of pixels to update, or NULL to
	 *             update the entire texture.
	 * \param Yplane the raw pixel data for the Y plane.
	 * \param Ypitch the number of bytes between rows of pixel data for the Y
	 *               plane.
	 * \param UVplane the raw pixel data for the UV plane.
	 * \param UVpitch the number of bytes between rows of pixel data for the UV
	 *                plane.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_UpdateTexture
	 * \sa SDL_UpdateYUVTexture
	 */"

	^ self ffiCall: #(bool SDL_UpdateNVTexture(SDL_Texture* texture, SDL_Rect* rect, const Uint8* Yplane, int Ypitch, const Uint8* UVplane, int UVpitch))
]

{ #category : 'public' }
LibSDL3 >> updateSensors [
	"/**
	 * Update the current state of the open sensors.
	 *
	 * This is called automatically by the event loop if sensor events are
	 * enabled.
	 *
	 * This needs to be called from the thread that initialized the sensor
	 * subsystem.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_UpdateSensors())
]

{ #category : 'public' }
LibSDL3 >> updateTexture: texture rect: rect pixels: pixels pitch: pitch [
	"/**
	 * Update the given texture rectangle with new pixel data.
	 *
	 * The pixel data must be in the pixel format of the texture, which can be
	 * queried using the SDL_PROP_TEXTURE_FORMAT_NUMBER property.
	 *
	 * This is a fairly slow function, intended for use with static textures that
	 * do not change often.
	 *
	 * If the texture is intended to be updated often, it is preferred to create
	 * the texture as streaming and use the locking functions referenced below.
	 * While this function will work with streaming textures, for optimization
	 * reasons you may not get the pixels back if you lock the texture afterward.
	 *
	 * \param texture the texture to update.
	 * \param rect an SDL_Rect structure representing the area to update, or NULL
	 *             to update the entire texture.
	 * \param pixels the raw pixel data in the format of the texture.
	 * \param pitch the number of bytes in a row of pixel data, including padding
	 *              between lines.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_LockTexture
	 * \sa SDL_UnlockTexture
	 * \sa SDL_UpdateNVTexture
	 * \sa SDL_UpdateYUVTexture
	 */"

	^ self ffiCall: #(bool SDL_UpdateTexture(SDL_Texture* texture, SDL_Rect* rect, const void* pixels, int pitch))
]

{ #category : 'public' }
LibSDL3 >> updateTrays [
	"/**
	 * Update the trays.
	 *
	 * This is called automatically by the event loop and is only needed if you're
	 * using trays but aren't handling SDL events.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_UpdateTrays())
]

{ #category : 'public' }
LibSDL3 >> updateWindowSurface: window [
	"/**
	 * Copy the window surface to the screen.
	 *
	 * This is the function you use to reflect any changes to the surface on the
	 * screen.
	 *
	 * This function is equivalent to the SDL 1.2 API SDL_Flip().
	 *
	 * \param window the window to update.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetWindowSurface
	 * \sa SDL_UpdateWindowSurfaceRects
	 */"

	^ self ffiCall: #(bool SDL_UpdateWindowSurface(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> updateWindowSurfaceRectsWindow: window rects: rects numrects: numrects [
	"/**
	 * Copy areas of the window surface to the screen.
	 *
	 * This is the function you use to reflect changes to portions of the surface
	 * on the screen.
	 *
	 * This function is equivalent to the SDL 1.2 API SDL_UpdateRects().
	 *
	 * Note that this function will update _at least_ the rectangles specified,
	 * but this is only intended as an optimization; in practice, this might
	 * update more of the screen (or all of the screen!), depending on what method
	 * SDL uses to send pixels to the system.
	 *
	 * \param window the window to update.
	 * \param rects an array of SDL_Rect structures representing areas of the
	 *              surface to copy, in pixels.
	 * \param numrects the number of rectangles.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetWindowSurface
	 * \sa SDL_UpdateWindowSurface
	 */"

	^ self ffiCall: #(bool SDL_UpdateWindowSurfaceRects(SDL_Window* window, SDL_Rect* rects, int numrects))
]

{ #category : 'public' }
LibSDL3 >> updateYUVTexture: texture rect: rect Yplane: Yplane Ypitch: Ypitch Uplane: Uplane Upitch: Upitch Vplane: Vplane Vpitch: Vpitch [
	"/**
	 * Update a rectangle within a planar YV12 or IYUV texture with new pixel
	 * data.
	 *
	 * You can use SDL_UpdateTexture() as long as your pixel data is a contiguous
	 * block of Y and U/V planes in the proper order, but this function is
	 * available if your pixel data is not contiguous.
	 *
	 * \param texture the texture to update.
	 * \param rect a pointer to the rectangle of pixels to update, or NULL to
	 *             update the entire texture.
	 * \param Yplane the raw pixel data for the Y plane.
	 * \param Ypitch the number of bytes between rows of pixel data for the Y
	 *               plane.
	 * \param Uplane the raw pixel data for the U plane.
	 * \param Upitch the number of bytes between rows of pixel data for the U
	 *               plane.
	 * \param Vplane the raw pixel data for the V plane.
	 * \param Vpitch the number of bytes between rows of pixel data for the V
	 *               plane.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_UpdateNVTexture
	 * \sa SDL_UpdateTexture
	 */"

	^ self ffiCall: #(bool SDL_UpdateYUVTexture(SDL_Texture* texture, SDL_Rect* rect, const Uint8* Yplane, int Ypitch, const Uint8* Uplane, int Upitch, const Uint8* Vplane, int Vpitch))
]

{ #category : 'public' }
LibSDL3 >> uploadToGPUBufferCopyPass: copy_pass source: source destination: destination cycle: cycle [
	"/**
	 * Uploads data from a transfer buffer to a buffer.
	 *
	 * The upload occurs on the GPU timeline. You may assume that the upload has
	 * finished in subsequent commands.
	 *
	 * \param copy_pass a copy pass handle.
	 * \param source the source transfer buffer with offset.
	 * \param destination the destination buffer with offset and size.
	 * \param cycle if true, cycles the buffer if it is already bound, otherwise
	 *              overwrites the data.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_UploadToGPUBuffer(SDL_GPUCopyPass* copy_pass, SDL_GPUTransferBufferLocation* source, SDL_GPUBufferRegion* destination, _Bool cycle))
]

{ #category : 'public' }
LibSDL3 >> uploadToGPUTextureCopyPass: copy_pass source: source destination: destination cycle: cycle [
	"/**
	 * Uploads data from a transfer buffer to a texture.
	 *
	 * The upload occurs on the GPU timeline. You may assume that the upload has
	 * finished in subsequent commands.
	 *
	 * You must align the data in the transfer buffer to a multiple of the texel
	 * size of the texture format.
	 *
	 * \param copy_pass a copy pass handle.
	 * \param source the source transfer buffer with image layout information.
	 * \param destination the destination texture region.
	 * \param cycle if true, cycles the texture if the texture is bound, otherwise
	 *              overwrites the data.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	self ffiCall: #(void SDL_UploadToGPUTexture(SDL_GPUCopyPass* copy_pass, SDL_GPUTextureTransferInfo* source, SDL_GPUTextureRegion* destination, _Bool cycle))
]

{ #category : 'public' }
LibSDL3 >> utf8strlcpyDst: dst src: src dstBytes: dst_bytes [
	"/**
	 * Copy an UTF-8 string.
	 *
	 * This function copies up to `dst_bytes` - 1 bytes from `src` to `dst` while
	 * also ensuring that the string written to `dst` does not end in a truncated
	 * multi-byte sequence. Finally, it appends a null terminator.
	 *
	 * `src` and `dst` must not overlap.
	 *
	 * Note that unlike SDL_strlcpy(), this function returns the number of bytes
	 * written, not the length of `src`.
	 *
	 * \param dst The destination buffer. Must not be NULL, and must not overlap
	 *            with `src`.
	 * \param src The null-terminated UTF-8 string to copy. Must not be NULL, and
	 *            must not overlap with `dst`.
	 * \param dst_bytes The length (in bytes) of the destination buffer. Must not
	 *                  be 0.
	 * \returns the number of bytes written, excluding the null terminator.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_strlcpy
	 */"

	^ self ffiCall: #(size_t SDL_utf8strlcpy(char* dst, const char* src, size_t dst_bytes))
]

{ #category : 'public' }
LibSDL3 >> utf8strlen: str [
	"/**
	 * Count the number of codepoints in a UTF-8 string.
	 *
	 * Counts the _codepoints_, not _bytes_, in `str`, excluding the null
	 * terminator.
	 *
	 * If you need to count the bytes in a string instead, consider using
	 * SDL_strlen().
	 *
	 * Since this handles Unicode, it expects the strings to be well-formed UTF-8
	 * and not a null-terminated string of arbitrary bytes. Bytes that are not
	 * valid UTF-8 are treated as Unicode character U+FFFD (REPLACEMENT
	 * CHARACTER), so a malformed or incomplete UTF-8 sequence might increase the
	 * count by several replacement characters.
	 *
	 * \param str The null-terminated UTF-8 string to read. Must not be NULL.
	 * \returns The length (in codepoints, excluding the null terminator) of
	 *          `src`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_utf8strnlen
	 * \sa SDL_strlen
	 */"

	^ self ffiCall: #(size_t SDL_utf8strlen(const char* str))
]

{ #category : 'public' }
LibSDL3 >> utf8strnlenStr: str bytes: bytes [
	"/**
	 * Count the number of codepoints in a UTF-8 string, up to n bytes.
	 *
	 * Counts the _codepoints_, not _bytes_, in `str`, excluding the null
	 * terminator.
	 *
	 * If you need to count the bytes in a string instead, consider using
	 * SDL_strnlen().
	 *
	 * The counting stops at `bytes` bytes (not codepoints!). This seems
	 * counterintuitive, but makes it easy to express the total size of the
	 * string's buffer.
	 *
	 * Since this handles Unicode, it expects the strings to be well-formed UTF-8
	 * and not a null-terminated string of arbitrary bytes. Bytes that are not
	 * valid UTF-8 are treated as Unicode character U+FFFD (REPLACEMENT
	 * CHARACTER), so a malformed or incomplete UTF-8 sequence might increase the
	 * count by several replacement characters.
	 *
	 * \param str The null-terminated UTF-8 string to read. Must not be NULL.
	 * \param bytes The maximum amount of bytes to count.
	 * \returns The length (in codepoints, excluding the null terminator) of `src`
	 *          but never more than `maxlen`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_utf8strlen
	 * \sa SDL_strnlen
	 */"

	^ self ffiCall: #(size_t SDL_utf8strnlen(const char* str, size_t bytes))
]

{ #category : 'public' }
LibSDL3 >> waitAndAcquireGPUSwapchainTextureCommandBuffer: command_buffer window: window swapchainTexture: swapchain_texture swapchainTextureWidth: swapchain_texture_width swapchainTextureHeight: swapchain_texture_height [
	"/**
	 * Blocks the thread until a swapchain texture is available to be acquired,
	 * and then acquires it.
	 *
	 * When a swapchain texture is acquired on a command buffer, it will
	 * automatically be submitted for presentation when the command buffer is
	 * submitted. The swapchain texture should only be referenced by the command
	 * buffer used to acquire it. It is an error to call
	 * SDL_CancelGPUCommandBuffer() after a swapchain texture is acquired.
	 *
	 * This function can fill the swapchain texture handle with NULL in certain
	 * cases, for example if the window is minimized. This is not an error. You
	 * should always make sure to check whether the pointer is NULL before
	 * actually using it.
	 *
	 * The swapchain texture is managed by the implementation and must not be
	 * freed by the user. You MUST NOT call this function from any thread other
	 * than the one that created the window.
	 *
	 * The swapchain texture is write-only and cannot be used as a sampler or for
	 * another reading operation.
	 *
	 * \param command_buffer a command buffer.
	 * \param window a window that has been claimed.
	 * \param swapchain_texture a pointer filled in with a swapchain texture
	 *                          handle.
	 * \param swapchain_texture_width a pointer filled in with the swapchain
	 *                                texture width, may be NULL.
	 * \param swapchain_texture_height a pointer filled in with the swapchain
	 *                                 texture height, may be NULL.
	 * \returns true on success, false on error; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called from the thread that
	 *               created the window.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SubmitGPUCommandBuffer
	 * \sa SDL_SubmitGPUCommandBufferAndAcquireFence
	 * \sa SDL_AcquireGPUSwapchainTexture
	 */"

	^ self ffiCall: #(bool SDL_WaitAndAcquireGPUSwapchainTexture(SDL_GPUCommandBuffer* command_buffer, SDL_Window* window, SDL_GPUTexture* swapchain_texture, Uint32* swapchain_texture_width, Uint32* swapchain_texture_height))
]

{ #category : 'public' }
LibSDL3 >> waitAsyncIOResultQueue: queue outcome: outcome timeoutMS: timeoutMS [
	"/**
	 * Block until an async I/O task queue has a completed task.
	 *
	 * This function puts the calling thread to sleep until there a task assigned
	 * to the queue that has finished.
	 *
	 * If a task assigned to the queue has finished, this will return true and
	 * fill in `outcome` with the details of the task. If no task in the queue has
	 * finished, this function will return false.
	 *
	 * If a task has completed, this function will free its resources and the task
	 * pointer will no longer be valid. The task will be removed from the queue.
	 *
	 * It is safe for multiple threads to call this function on the same queue at
	 * once; a completed task will only go to one of the threads.
	 *
	 * Note that by the nature of various platforms, more than one waiting thread
	 * may wake to handle a single task, but only one will obtain it, so
	 * `timeoutMS` is a _maximum_ wait time, and this function may return false
	 * sooner.
	 *
	 * This function may return false if there was a system error, the OS
	 * inadvertently awoke multiple threads, or if SDL_SignalAsyncIOQueue() was
	 * called to wake up all waiting threads without a finished task.
	 *
	 * A timeout can be used to specify a maximum wait time, but rather than
	 * polling, it is possible to have a timeout of -1 to wait forever, and use
	 * SDL_SignalAsyncIOQueue() to wake up the waiting threads later.
	 *
	 * \param queue the async I/O task queue to wait on.
	 * \param outcome details of a finished task will be written here. May not be
	 *                NULL.
	 * \param timeoutMS the maximum time to wait, in milliseconds, or -1 to wait
	 *                  indefinitely.
	 * \returns true if task has completed, false otherwise.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SignalAsyncIOQueue
	 */"

	^ self ffiCall: #(bool SDL_WaitAsyncIOResult(SDL_AsyncIOQueue* queue, SDL_AsyncIOOutcome* outcome, Sint32 timeoutMS))
]

{ #category : 'public' }
LibSDL3 >> waitConditionCond: cond mutex: mutex [
	"/**
	 * Wait until a condition variable is signaled.
	 *
	 * This function unlocks the specified `mutex` and waits for another thread to
	 * call SDL_SignalCondition() or SDL_BroadcastCondition() on the condition
	 * variable `cond`. Once the condition variable is signaled, the mutex is
	 * re-locked and the function returns.
	 *
	 * The mutex must be locked before calling this function. Locking the mutex
	 * recursively (more than once) is not supported and leads to undefined
	 * behavior.
	 *
	 * This function is the equivalent of calling SDL_WaitConditionTimeout() with
	 * a time length of -1.
	 *
	 * \param cond the condition variable to wait on.
	 * \param mutex the mutex used to coordinate thread access.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_BroadcastCondition
	 * \sa SDL_SignalCondition
	 * \sa SDL_WaitConditionTimeout
	 */"

	self ffiCall: #(void SDL_WaitCondition(SDL_Condition* cond, SDL_Mutex* mutex))
]

{ #category : 'public' }
LibSDL3 >> waitConditionTimeoutCond: cond mutex: mutex timeoutMS: timeoutMS [
	"/**
	 * Wait until a condition variable is signaled or a certain time has passed.
	 *
	 * This function unlocks the specified `mutex` and waits for another thread to
	 * call SDL_SignalCondition() or SDL_BroadcastCondition() on the condition
	 * variable `cond`, or for the specified time to elapse. Once the condition
	 * variable is signaled or the time elapsed, the mutex is re-locked and the
	 * function returns.
	 *
	 * The mutex must be locked before calling this function. Locking the mutex
	 * recursively (more than once) is not supported and leads to undefined
	 * behavior.
	 *
	 * \param cond the condition variable to wait on.
	 * \param mutex the mutex used to coordinate thread access.
	 * \param timeoutMS the maximum time to wait, in milliseconds, or -1 to wait
	 *                  indefinitely.
	 * \returns true if the condition variable is signaled, false if the condition
	 *          is not signaled in the allotted time.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_BroadcastCondition
	 * \sa SDL_SignalCondition
	 * \sa SDL_WaitCondition
	 */"

	^ self ffiCall: #(bool SDL_WaitConditionTimeout(SDL_Condition* cond, SDL_Mutex* mutex, Sint32 timeoutMS))
]

{ #category : 'public' }
LibSDL3 >> waitEvent: event [
	"/**
	 * Wait indefinitely for the next available event.
	 *
	 * If `event` is not NULL, the next event is removed from the queue and stored
	 * in the SDL_Event structure pointed to by `event`.
	 *
	 * As this function may implicitly call SDL_PumpEvents(), you can only call
	 * this function in the thread that initialized the video subsystem.
	 *
	 * \param event the SDL_Event structure to be filled in with the next event
	 *              from the queue, or NULL.
	 * \returns true on success or false if there was an error while waiting for
	 *          events; call SDL_GetError() for more information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_PollEvent
	 * \sa SDL_PushEvent
	 * \sa SDL_WaitEventTimeout
	 */"

	^ self ffiCall: #(bool SDL_WaitEvent(SDL_Event* event))
]

{ #category : 'public' }
LibSDL3 >> waitEventTimeoutEvent: event timeoutMS: timeoutMS [
	"/**
	 * Wait until the specified timeout (in milliseconds) for the next available
	 * event.
	 *
	 * If `event` is not NULL, the next event is removed from the queue and stored
	 * in the SDL_Event structure pointed to by `event`.
	 *
	 * As this function may implicitly call SDL_PumpEvents(), you can only call
	 * this function in the thread that initialized the video subsystem.
	 *
	 * The timeout is not guaranteed, the actual wait time could be longer due to
	 * system scheduling.
	 *
	 * \param event the SDL_Event structure to be filled in with the next event
	 *              from the queue, or NULL.
	 * \param timeoutMS the maximum number of milliseconds to wait for the next
	 *                  available event.
	 * \returns true if this got an event or false if the timeout elapsed without
	 *          any events available.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_PollEvent
	 * \sa SDL_PushEvent
	 * \sa SDL_WaitEvent
	 */"

	^ self ffiCall: #(bool SDL_WaitEventTimeout(SDL_Event* event, Sint32 timeoutMS))
]

{ #category : 'public' }
LibSDL3 >> waitForGPUFencesDevice: device waitAll: wait_all fences: fences numFences: num_fences [
	"/**
	 * Blocks the thread until the given fences are signaled.
	 *
	 * \param device a GPU context.
	 * \param wait_all if 0, wait for any fence to be signaled, if 1, wait for all
	 *                 fences to be signaled.
	 * \param fences an array of fences to wait on.
	 * \param num_fences the number of fences in the fences array.
	 * \returns true on success, false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SubmitGPUCommandBufferAndAcquireFence
	 * \sa SDL_WaitForGPUIdle
	 */"

	^ self ffiCall: #(bool SDL_WaitForGPUFences(SDL_GPUDevice* device, _Bool wait_all, SDL_GPUFence* fences, Uint32 num_fences))
]

{ #category : 'public' }
LibSDL3 >> waitForGPUIdle: device [
	"/**
	 * Blocks the thread until the GPU is completely idle.
	 *
	 * \param device a GPU context.
	 * \returns true on success, false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_WaitForGPUFences
	 */"

	^ self ffiCall: #(bool SDL_WaitForGPUIdle(SDL_GPUDevice* device))
]

{ #category : 'public' }
LibSDL3 >> waitForGPUSwapchainDevice: device window: window [
	"/**
	 * Blocks the thread until a swapchain texture is available to be acquired.
	 *
	 * \param device a GPU context.
	 * \param window a window that has been claimed.
	 * \returns true on success, false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called from the thread that
	 *               created the window.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_AcquireGPUSwapchainTexture
	 * \sa SDL_WaitAndAcquireGPUSwapchainTexture
	 * \sa SDL_SetGPUAllowedFramesInFlight
	 */"

	^ self ffiCall: #(bool SDL_WaitForGPUSwapchain(SDL_GPUDevice* device, SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> waitSemaphore: sem [
	"/**
	 * Wait until a semaphore has a positive value and then decrements it.
	 *
	 * This function suspends the calling thread until the semaphore pointed to by
	 * `sem` has a positive value, and then atomically decrement the semaphore
	 * value.
	 *
	 * This function is the equivalent of calling SDL_WaitSemaphoreTimeout() with
	 * a time length of -1.
	 *
	 * \param sem the semaphore wait on.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SignalSemaphore
	 * \sa SDL_TryWaitSemaphore
	 * \sa SDL_WaitSemaphoreTimeout
	 */"

	self ffiCall: #(void SDL_WaitSemaphore(SDL_Semaphore* sem))
]

{ #category : 'public' }
LibSDL3 >> waitSemaphoreTimeoutSem: sem timeoutMS: timeoutMS [
	"/**
	 * Wait until a semaphore has a positive value and then decrements it.
	 *
	 * This function suspends the calling thread until either the semaphore
	 * pointed to by `sem` has a positive value or the specified time has elapsed.
	 * If the call is successful it will atomically decrement the semaphore value.
	 *
	 * \param sem the semaphore to wait on.
	 * \param timeoutMS the length of the timeout, in milliseconds, or -1 to wait
	 *                  indefinitely.
	 * \returns true if the wait succeeds or false if the wait times out.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_SignalSemaphore
	 * \sa SDL_TryWaitSemaphore
	 * \sa SDL_WaitSemaphore
	 */"

	^ self ffiCall: #(bool SDL_WaitSemaphoreTimeout(SDL_Semaphore* sem, Sint32 timeoutMS))
]

{ #category : 'public' }
LibSDL3 >> waitThread: thread status: status [
	"/**
	 * Wait for a thread to finish.
	 *
	 * Threads that haven't been detached will remain until this function cleans
	 * them up. Not doing so is a resource leak.
	 *
	 * Once a thread has been cleaned up through this function, the SDL_Thread
	 * that references it becomes invalid and should not be referenced again. As
	 * such, only one thread may call SDL_WaitThread() on another.
	 *
	 * The return code from the thread function is placed in the area pointed to
	 * by `status`, if `status` is not NULL.
	 *
	 * You may not wait on a thread that has been used in a call to
	 * SDL_DetachThread(). Use either that function or this one, but not both, or
	 * behavior is undefined.
	 *
	 * It is safe to pass a NULL thread to this function; it is a no-op.
	 *
	 * Note that the thread pointer is freed by this function and is not valid
	 * afterward.
	 *
	 * \param thread the SDL_Thread pointer that was returned from the
	 *               SDL_CreateThread() call that started this thread.
	 * \param status a pointer filled in with the value returned from the thread
	 *               function by its 'return', or -1 if the thread has been
	 *               detached or isn't valid, may be NULL.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_CreateThread
	 * \sa SDL_DetachThread
	 */"

	self ffiCall: #(void SDL_WaitThread(SDL_Thread* thread, int* status))
]

{ #category : 'public' }
LibSDL3 >> warpMouseGlobalX: x y: y [
	"/**
	 * Move the mouse to the given position in global screen space.
	 *
	 * This function generates a mouse motion event.
	 *
	 * A failure of this function usually means that it is unsupported by a
	 * platform.
	 *
	 * Note that this function will appear to succeed, but not actually move the
	 * mouse when used over Microsoft Remote Desktop.
	 *
	 * \param x the x coordinate.
	 * \param y the y coordinate.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_WarpMouseInWindow
	 */"

	^ self ffiCall: #(bool SDL_WarpMouseGlobal(float x, float y))
]

{ #category : 'public' }
LibSDL3 >> warpMouseInWindow: window x: x y: y [
	"/**
	 * Move the mouse cursor to the given position within the window.
	 *
	 * This function generates a mouse motion event if relative mode is not
	 * enabled. If relative mode is enabled, you can force mouse events for the
	 * warp by setting the SDL_HINT_MOUSE_RELATIVE_WARP_MOTION hint.
	 *
	 * Note that this function will appear to succeed, but not actually move the
	 * mouse when used over Microsoft Remote Desktop.
	 *
	 * \param window the window to move the mouse into, or NULL for the current
	 *               mouse focus.
	 * \param x the x coordinate within the window.
	 * \param y the y coordinate within the window.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_WarpMouseGlobal
	 */"

	self ffiCall: #(void SDL_WarpMouseInWindow(SDL_Window* window, float x, float y))
]

{ #category : 'public' }
LibSDL3 >> wasInit: flags [
	"/**
	 * Get a mask of the specified subsystems which are currently initialized.
	 *
	 * \param flags any of the flags used by SDL_Init(); see SDL_Init for details.
	 * \returns a mask of all initialized subsystems if `flags` is 0, otherwise it
	 *          returns the initialization status of the specified subsystems.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_Init
	 * \sa SDL_InitSubSystem
	 */"

	^ self ffiCall: #(SDL_InitFlags SDL_WasInit(SDL_InitFlags flags))
]

{ #category : 'public' }
LibSDL3 >> wcscasecmpStr1: str1 str2: str2 [
	"/**
	 * Compare two null-terminated wide strings, case-insensitively.
	 *
	 * This will work with Unicode strings, using a technique called
	 * ""case-folding"" to handle the vast majority of case-sensitive human
	 * languages regardless of system locale. It can deal with expanding values: a
	 * German Eszett character can compare against two ASCII 's' chars and be
	 * considered a match, for example. A notable exception: it does not handle
	 * the Turkish 'i' character; human language is complicated!
	 *
	 * Depending on your platform, ""wchar_t"" might be 2 bytes, and expected to be
	 * UTF-16 encoded (like Windows), or 4 bytes in UTF-32 format. Since this
	 * handles Unicode, it expects the string to be well-formed and not a
	 * null-terminated string of arbitrary bytes. Characters that are not valid
	 * UTF-16 (or UTF-32) are treated as Unicode character U+FFFD (REPLACEMENT
	 * CHARACTER), which is to say two strings of random bits may turn out to
	 * match if they convert to the same amount of replacement characters.
	 *
	 * \param str1 the first string to compare. NULL is not permitted!
	 * \param str2 the second string to compare. NULL is not permitted!
	 * \returns less than zero if str1 is ""less than"" str2, greater than zero if
	 *          str1 is ""greater than"" str2, and zero if the strings match
	 *          exactly.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(int SDL_wcscasecmp(const wchar_t* str1, const wchar_t* str2))
]

{ #category : 'public' }
LibSDL3 >> wcscmpStr1: str1 str2: str2 [
	"/**
	 * Compare two null-terminated wide strings.
	 *
	 * This only compares wchar_t values until it hits a null-terminating
	 * character; it does not care if the string is well-formed UTF-16 (or UTF-32,
	 * depending on your platform's wchar_t size), or uses valid Unicode values.
	 *
	 * \param str1 the first string to compare. NULL is not permitted!
	 * \param str2 the second string to compare. NULL is not permitted!
	 * \returns less than zero if str1 is ""less than"" str2, greater than zero if
	 *          str1 is ""greater than"" str2, and zero if the strings match
	 *          exactly.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(int SDL_wcscmp(const wchar_t* str1, const wchar_t* str2))
]

{ #category : 'public' }
LibSDL3 >> wcsdup: wstr [
	"/**
	 * Allocate a copy of a wide string.
	 *
	 * This allocates enough space for a null-terminated copy of `wstr`, using
	 * SDL_malloc, and then makes a copy of the string into this space.
	 *
	 * The returned string is owned by the caller, and should be passed to
	 * SDL_free when no longer needed.
	 *
	 * \param wstr the string to copy.
	 * \returns a pointer to the newly-allocated wide string.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(int* SDL_wcsdup(const wchar_t* wstr))
]

{ #category : 'public' }
LibSDL3 >> wcslcatDst: dst src: src maxlen: maxlen [
	"/**
	 * Concatenate wide strings.
	 *
	 * This function appends up to `maxlen` - SDL_wcslen(dst) - 1 wide characters
	 * from `src` to the end of the wide string in `dst`, then appends a null
	 * terminator.
	 *
	 * `src` and `dst` must not overlap.
	 *
	 * If `maxlen` - SDL_wcslen(dst) - 1 is less than or equal to 0, then `dst` is
	 * unmodified.
	 *
	 * \param dst The destination buffer already containing the first
	 *            null-terminated wide string. Must not be NULL and must not
	 *            overlap with `src`.
	 * \param src The second null-terminated wide string. Must not be NULL, and
	 *            must not overlap with `dst`.
	 * \param maxlen The length (in wide characters) of the destination buffer.
	 * \returns the length (in wide characters, excluding the null terminator) of
	 *          the string in `dst` plus the length of `src`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_wcslcpy
	 */"

	^ self ffiCall: #(size_t SDL_wcslcat(wchar_t* dst, const wchar_t* src, size_t maxlen))
]

{ #category : 'public' }
LibSDL3 >> wcslcpyDst: dst src: src maxlen: maxlen [
	"/**
	 * Copy a wide string.
	 *
	 * This function copies `maxlen` - 1 wide characters from `src` to `dst`, then
	 * appends a null terminator.
	 *
	 * `src` and `dst` must not overlap.
	 *
	 * If `maxlen` is 0, no wide characters are copied and no null terminator is
	 * written.
	 *
	 * \param dst The destination buffer. Must not be NULL, and must not overlap
	 *            with `src`.
	 * \param src The null-terminated wide string to copy. Must not be NULL, and
	 *            must not overlap with `dst`.
	 * \param maxlen The length (in wide characters) of the destination buffer.
	 * \returns the length (in wide characters, excluding the null terminator) of
	 *          `src`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_wcslcat
	 */"

	^ self ffiCall: #(size_t SDL_wcslcpy(wchar_t* dst, const wchar_t* src, size_t maxlen))
]

{ #category : 'public' }
LibSDL3 >> wcslen: wstr [
	"/**
	 * This works exactly like wcslen() but doesn't require access to a C runtime.
	 *
	 * Counts the number of wchar_t values in `wstr`, excluding the null
	 * terminator.
	 *
	 * Like SDL_strlen only counts bytes and not codepoints in a UTF-8 string,
	 * this counts wchar_t values in a string, even if the string's encoding is of
	 * variable width, like UTF-16.
	 *
	 * Also be aware that wchar_t is different sizes on different platforms (4
	 * bytes on Linux, 2 on Windows, etc).
	 *
	 * \param wstr The null-terminated wide string to read. Must not be NULL.
	 * \returns the length (in wchar_t values, excluding the null terminator) of
	 *          `wstr`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_wcsnlen
	 * \sa SDL_utf8strlen
	 * \sa SDL_utf8strnlen
	 */"

	^ self ffiCall: #(size_t SDL_wcslen(const wchar_t* wstr))
]

{ #category : 'public' }
LibSDL3 >> wcsncasecmpStr1: str1 str2: str2 maxlen: maxlen [
	"/**
	 * Compare two wide strings, case-insensitively, up to a number of wchar_t.
	 *
	 * This will work with Unicode strings, using a technique called
	 * ""case-folding"" to handle the vast majority of case-sensitive human
	 * languages regardless of system locale. It can deal with expanding values: a
	 * German Eszett character can compare against two ASCII 's' chars and be
	 * considered a match, for example. A notable exception: it does not handle
	 * the Turkish 'i' character; human language is complicated!
	 *
	 * Depending on your platform, ""wchar_t"" might be 2 bytes, and expected to be
	 * UTF-16 encoded (like Windows), or 4 bytes in UTF-32 format. Since this
	 * handles Unicode, it expects the string to be well-formed and not a
	 * null-terminated string of arbitrary bytes. Characters that are not valid
	 * UTF-16 (or UTF-32) are treated as Unicode character U+FFFD (REPLACEMENT
	 * CHARACTER), which is to say two strings of random bits may turn out to
	 * match if they convert to the same amount of replacement characters.
	 *
	 * Note that while this function might deal with variable-sized characters,
	 * `maxlen` specifies a _wchar_ limit! If the limit lands in the middle of a
	 * multi-byte UTF-16 sequence, it may convert a portion of the final character
	 * to one or more Unicode character U+FFFD (REPLACEMENT CHARACTER) so as not
	 * to overflow a buffer.
	 *
	 * `maxlen` specifies a maximum number of wchar_t values to compare; if the
	 * strings match to this number of wchar_t (or both have matched to a
	 * null-terminator character before this number of bytes), they will be
	 * considered equal.
	 *
	 * \param str1 the first string to compare. NULL is not permitted!
	 * \param str2 the second string to compare. NULL is not permitted!
	 * \param maxlen the maximum number of wchar_t values to compare.
	 * \returns less than zero if str1 is ""less than"" str2, greater than zero if
	 *          str1 is ""greater than"" str2, and zero if the strings match
	 *          exactly.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(int SDL_wcsncasecmp(const wchar_t* str1, const wchar_t* str2, size_t maxlen))
]

{ #category : 'public' }
LibSDL3 >> wcsncmpStr1: str1 str2: str2 maxlen: maxlen [
	"/**
	 * Compare two wide strings up to a number of wchar_t values.
	 *
	 * This only compares wchar_t values; it does not care if the string is
	 * well-formed UTF-16 (or UTF-32, depending on your platform's wchar_t size),
	 * or uses valid Unicode values.
	 *
	 * Note that while this function is intended to be used with UTF-16 (or
	 * UTF-32, depending on your platform's definition of wchar_t), it is
	 * comparing raw wchar_t values and not Unicode codepoints: `maxlen` specifies
	 * a wchar_t limit! If the limit lands in the middle of a multi-wchar UTF-16
	 * sequence, it will only compare a portion of the final character.
	 *
	 * `maxlen` specifies a maximum number of wchar_t to compare; if the strings
	 * match to this number of wide chars (or both have matched to a
	 * null-terminator character before this count), they will be considered
	 * equal.
	 *
	 * \param str1 the first string to compare. NULL is not permitted!
	 * \param str2 the second string to compare. NULL is not permitted!
	 * \param maxlen the maximum number of wchar_t to compare.
	 * \returns less than zero if str1 is ""less than"" str2, greater than zero if
	 *          str1 is ""greater than"" str2, and zero if the strings match
	 *          exactly.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(int SDL_wcsncmp(const wchar_t* str1, const wchar_t* str2, size_t maxlen))
]

{ #category : 'public' }
LibSDL3 >> wcsnlenWstr: wstr maxlen: maxlen [
	"/**
	 * This works exactly like wcsnlen() but doesn't require access to a C
	 * runtime.
	 *
	 * Counts up to a maximum of `maxlen` wchar_t values in `wstr`, excluding the
	 * null terminator.
	 *
	 * Like SDL_strnlen only counts bytes and not codepoints in a UTF-8 string,
	 * this counts wchar_t values in a string, even if the string's encoding is of
	 * variable width, like UTF-16.
	 *
	 * Also be aware that wchar_t is different sizes on different platforms (4
	 * bytes on Linux, 2 on Windows, etc).
	 *
	 * Also, `maxlen` is a count of wide characters, not bytes!
	 *
	 * \param wstr The null-terminated wide string to read. Must not be NULL.
	 * \param maxlen The maximum amount of wide characters to count.
	 * \returns the length (in wide characters, excluding the null terminator) of
	 *          `wstr` but never more than `maxlen`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_wcslen
	 * \sa SDL_utf8strlen
	 * \sa SDL_utf8strnlen
	 */"

	^ self ffiCall: #(size_t SDL_wcsnlen(const wchar_t* wstr, size_t maxlen))
]

{ #category : 'public' }
LibSDL3 >> wcsnstrHaystack: haystack needle: needle maxlen: maxlen [
	"/**
	 * Search a wide string, up to n wide chars, for the first instance of a
	 * specific substring.
	 *
	 * The search ends once it finds the requested substring, or a null terminator
	 * value to end the string, or `maxlen` wide character have been examined. It
	 * is possible to use this function on a wide string without a null
	 * terminator.
	 *
	 * Note that this looks for strings of _wide characters_, not _codepoints_, so
	 * it's legal to search for malformed and incomplete UTF-16 sequences.
	 *
	 * \param haystack the wide string to search. Must not be NULL.
	 * \param needle the wide string to search for. Must not be NULL.
	 * \param maxlen the maximum number of wide characters to search in
	 *               `haystack`.
	 * \returns a pointer to the first instance of `needle` in the string, or NULL
	 *          if not found.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(int* SDL_wcsnstr(const wchar_t* haystack, const wchar_t* needle, size_t maxlen))
]

{ #category : 'public' }
LibSDL3 >> wcsstrHaystack: haystack needle: needle [
	"/**
	 * Search a wide string for the first instance of a specific substring.
	 *
	 * The search ends once it finds the requested substring, or a null terminator
	 * byte to end the string.
	 *
	 * Note that this looks for strings of _wide characters_, not _codepoints_, so
	 * it's legal to search for malformed and incomplete UTF-16 sequences.
	 *
	 * \param haystack the wide string to search. Must not be NULL.
	 * \param needle the wide string to search for. Must not be NULL.
	 * \returns a pointer to the first instance of `needle` in the string, or NULL
	 *          if not found.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(int* SDL_wcsstr(const wchar_t* haystack, const wchar_t* needle))
]

{ #category : 'public' }
LibSDL3 >> wcstolStr: str endp: endp base: base [
	"/**
	 * Parse a `long` from a wide string.
	 *
	 * If `str` starts with whitespace, then those whitespace characters are
	 * skipped before attempting to parse the number.
	 *
	 * If the parsed number does not fit inside a `long`, the result is clamped to
	 * the minimum and maximum representable `long` values.
	 *
	 * \param str The null-terminated wide string to read. Must not be NULL.
	 * \param endp If not NULL, the address of the first invalid wide character
	 *             (i.e. the next character after the parsed number) will be
	 *             written to this pointer.
	 * \param base The base of the integer to read. Supported values are 0 and 2
	 *             to 36 inclusive. If 0, the base will be inferred from the
	 *             number's prefix (0x for hexadecimal, 0 for octal, decimal
	 *             otherwise).
	 * \returns the parsed `long`, or 0 if no number could be parsed.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_strtol
	 */"

	^ self ffiCall: #(long SDL_wcstol(const wchar_t* str, wchar_t** endp, int base))
]

{ #category : 'accessing - platform' }
LibSDL3 >> win32LibraryName [

	^ FFIWindowsLibraryFinder new
		userPaths: #('./CIG/lib');
		findLibrary: 'SDL3.dll'
]

{ #category : 'public' }
LibSDL3 >> windowHasSurface: window [
	"/**
	 * Return whether the window has a surface associated with it.
	 *
	 * \param window the window to query.
	 * \returns true if there is a surface associated with the window, or false
	 *          otherwise.
	 *
	 * \threadsafety This function should only be called on the main thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_GetWindowSurface
	 */"

	^ self ffiCall: #(bool SDL_WindowHasSurface(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> windowSupportsGPUPresentModeDevice: device window: window presentMode: present_mode [
	"/**
	 * Determines whether a presentation mode is supported by the window.
	 *
	 * The window must be claimed before calling this function.
	 *
	 * \param device a GPU context.
	 * \param window an SDL_Window.
	 * \param present_mode the presentation mode to check.
	 * \returns true if supported, false if unsupported.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_ClaimWindowForGPUDevice
	 */"

	^ self ffiCall: #(bool SDL_WindowSupportsGPUPresentMode(SDL_GPUDevice* device, SDL_Window* window, SDL_GPUPresentMode present_mode))
]

{ #category : 'public' }
LibSDL3 >> windowSupportsGPUSwapchainCompositionDevice: device window: window swapchainComposition: swapchain_composition [
	"/**
	 * Determines whether a swapchain composition is supported by the window.
	 *
	 * The window must be claimed before calling this function.
	 *
	 * \param device a GPU context.
	 * \param window an SDL_Window.
	 * \param swapchain_composition the swapchain composition to check.
	 * \returns true if supported, false if unsupported.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_ClaimWindowForGPUDevice
	 */"

	^ self ffiCall: #(bool SDL_WindowSupportsGPUSwapchainComposition(SDL_GPUDevice* device, SDL_Window* window, SDL_GPUSwapchainComposition swapchain_composition))
]

{ #category : 'public' }
LibSDL3 >> writeAsyncIO: asyncio ptr: ptr offset: offset size: size queue: queue userdata: userdata [
	"/**
	 * Start an async write.
	 *
	 * This function writes `size` bytes from `offset` position in the data source
	 * to the area pointed at by `ptr`.
	 *
	 * This function returns as quickly as possible; it does not wait for the
	 * write to complete. On a successful return, this work will continue in the
	 * background. If the work begins, even failure is asynchronous: a failing
	 * return value from this function only means the work couldn't start at all.
	 *
	 * `ptr` must remain available until the work is done, and may be accessed by
	 * the system at any time until then. Do not allocate it on the stack, as this
	 * might take longer than the life of the calling function to complete!
	 *
	 * An SDL_AsyncIOQueue must be specified. The newly-created task will be added
	 * to it when it completes its work.
	 *
	 * \param asyncio a pointer to an SDL_AsyncIO structure.
	 * \param ptr a pointer to a buffer to write data from.
	 * \param offset the position to start writing to the data source.
	 * \param size the number of bytes to write to the data source.
	 * \param queue a queue to add the new SDL_AsyncIO to.
	 * \param userdata an app-defined pointer that will be provided with the task
	 *                 results.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_ReadAsyncIO
	 * \sa SDL_CreateAsyncIOQueue
	 */"

	^ self ffiCall: #(bool SDL_WriteAsyncIO(SDL_AsyncIO* asyncio, void* ptr, Uint64 offset, Uint64 size, SDL_AsyncIOQueue* queue, void* userdata))
]

{ #category : 'public' }
LibSDL3 >> writeIOContext: context ptr: ptr size: size [
	"/**
	 * Write to an SDL_IOStream data stream.
	 *
	 * This function writes exactly `size` bytes from the area pointed at by `ptr`
	 * to the stream. If this fails for any reason, it'll return less than `size`
	 * to demonstrate how far the write progressed. On success, it returns `size`.
	 *
	 * On error, this function still attempts to write as much as possible, so it
	 * might return a positive value less than the requested write size.
	 *
	 * The caller can use SDL_GetIOStatus() to determine if the problem is
	 * recoverable, such as a non-blocking write that can simply be retried later,
	 * or a fatal error.
	 *
	 * \param context a pointer to an SDL_IOStream structure.
	 * \param ptr a pointer to a buffer containing data to write.
	 * \param size the number of bytes to write.
	 * \returns the number of bytes written, which will be less than `size` on
	 *          failure; call SDL_GetError() for more information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 *
	 * \sa SDL_IOprintf
	 * \sa SDL_ReadIO
	 * \sa SDL_SeekIO
	 * \sa SDL_FlushIO
	 * \sa SDL_GetIOStatus
	 */"

	^ self ffiCall: #(size_t SDL_WriteIO(SDL_IOStream* context, const void* ptr, size_t size))
]

{ #category : 'public' }
LibSDL3 >> writeS16BEDst: dst value: value [
	"/**
	 * Use this function to write 16 bits in native format to an SDL_IOStream as
	 * big-endian data.
	 *
	 * SDL byteswaps the data only if necessary, so the application always
	 * specifies native format, and the data written will be in big-endian format.
	 *
	 * \param dst the stream to which data will be written.
	 * \param value the data to be written, in native format.
	 * \returns true on successful write or false on failure; call SDL_GetError()
	 *          for more information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_WriteS16BE(SDL_IOStream* dst, Sint16 value))
]

{ #category : 'public' }
LibSDL3 >> writeS16LEDst: dst value: value [
	"/**
	 * Use this function to write 16 bits in native format to an SDL_IOStream as
	 * little-endian data.
	 *
	 * SDL byteswaps the data only if necessary, so the application always
	 * specifies native format, and the data written will be in little-endian
	 * format.
	 *
	 * \param dst the stream to which data will be written.
	 * \param value the data to be written, in native format.
	 * \returns true on successful write or false on failure; call SDL_GetError()
	 *          for more information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_WriteS16LE(SDL_IOStream* dst, Sint16 value))
]

{ #category : 'public' }
LibSDL3 >> writeS32BEDst: dst value: value [
	"/**
	 * Use this function to write 32 bits in native format to an SDL_IOStream as
	 * big-endian data.
	 *
	 * SDL byteswaps the data only if necessary, so the application always
	 * specifies native format, and the data written will be in big-endian format.
	 *
	 * \param dst the stream to which data will be written.
	 * \param value the data to be written, in native format.
	 * \returns true on successful write or false on failure; call SDL_GetError()
	 *          for more information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_WriteS32BE(SDL_IOStream* dst, Sint32 value))
]

{ #category : 'public' }
LibSDL3 >> writeS32LEDst: dst value: value [
	"/**
	 * Use this function to write 32 bits in native format to an SDL_IOStream as
	 * little-endian data.
	 *
	 * SDL byteswaps the data only if necessary, so the application always
	 * specifies native format, and the data written will be in little-endian
	 * format.
	 *
	 * \param dst the stream to which data will be written.
	 * \param value the data to be written, in native format.
	 * \returns true on successful write or false on failure; call SDL_GetError()
	 *          for more information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_WriteS32LE(SDL_IOStream* dst, Sint32 value))
]

{ #category : 'public' }
LibSDL3 >> writeS64BEDst: dst value: value [
	"/**
	 * Use this function to write 64 bits in native format to an SDL_IOStream as
	 * big-endian data.
	 *
	 * SDL byteswaps the data only if necessary, so the application always
	 * specifies native format, and the data written will be in big-endian format.
	 *
	 * \param dst the stream to which data will be written.
	 * \param value the data to be written, in native format.
	 * \returns true on successful write or false on failure; call SDL_GetError()
	 *          for more information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_WriteS64BE(SDL_IOStream* dst, Sint64 value))
]

{ #category : 'public' }
LibSDL3 >> writeS64LEDst: dst value: value [
	"/**
	 * Use this function to write 64 bits in native format to an SDL_IOStream as
	 * little-endian data.
	 *
	 * SDL byteswaps the data only if necessary, so the application always
	 * specifies native format, and the data written will be in little-endian
	 * format.
	 *
	 * \param dst the stream to which data will be written.
	 * \param value the data to be written, in native format.
	 * \returns true on successful write or false on failure; call SDL_GetError()
	 *          for more information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_WriteS64LE(SDL_IOStream* dst, Sint64 value))
]

{ #category : 'public' }
LibSDL3 >> writeS8Dst: dst value: value [
	"/**
	 * Use this function to write a signed byte to an SDL_IOStream.
	 *
	 * \param dst the SDL_IOStream to write to.
	 * \param value the byte value to write.
	 * \returns true on successful write or false on failure; call SDL_GetError()
	 *          for more information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_WriteS8(SDL_IOStream* dst, Sint8 value))
]

{ #category : 'public' }
LibSDL3 >> writeSurfacePixelFloatSurface: surface x: x y: y r: r g: g b: b a: a [
	"/**
	 * Writes a single pixel to a surface.
	 *
	 * This function prioritizes correctness over speed: it is suitable for unit
	 * tests, but is not intended for use in a game engine.
	 *
	 * \param surface the surface to write.
	 * \param x the horizontal coordinate, 0 <= x < width.
	 * \param y the vertical coordinate, 0 <= y < height.
	 * \param r the red channel value, normally in the range 0-1.
	 * \param g the green channel value, normally in the range 0-1.
	 * \param b the blue channel value, normally in the range 0-1.
	 * \param a the alpha channel value, normally in the range 0-1.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_WriteSurfacePixelFloat(SDL_Surface* surface, int x, int y, float r, float g, float b, float a))
]

{ #category : 'public' }
LibSDL3 >> writeSurfacePixelSurface: surface x: x y: y r: r g: g b: b a: a [
	"/**
	 * Writes a single pixel to a surface.
	 *
	 * This function prioritizes correctness over speed: it is suitable for unit
	 * tests, but is not intended for use in a game engine.
	 *
	 * Like SDL_MapRGBA, this uses the entire 0..255 range when converting color
	 * components from pixel formats with less than 8 bits per RGB component.
	 *
	 * \param surface the surface to write.
	 * \param x the horizontal coordinate, 0 <= x < width.
	 * \param y the vertical coordinate, 0 <= y < height.
	 * \param r the red channel value, 0-255.
	 * \param g the green channel value, 0-255.
	 * \param b the blue channel value, 0-255.
	 * \param a the alpha channel value, 0-255.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_WriteSurfacePixel(SDL_Surface* surface, int x, int y, Uint8 r, Uint8 g, Uint8 b, Uint8 a))
]

{ #category : 'public' }
LibSDL3 >> writeU16BEDst: dst value: value [
	"/**
	 * Use this function to write 16 bits in native format to an SDL_IOStream as
	 * big-endian data.
	 *
	 * SDL byteswaps the data only if necessary, so the application always
	 * specifies native format, and the data written will be in big-endian format.
	 *
	 * \param dst the stream to which data will be written.
	 * \param value the data to be written, in native format.
	 * \returns true on successful write or false on failure; call SDL_GetError()
	 *          for more information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_WriteU16BE(SDL_IOStream* dst, Uint16 value))
]

{ #category : 'public' }
LibSDL3 >> writeU16LEDst: dst value: value [
	"/**
	 * Use this function to write 16 bits in native format to an SDL_IOStream as
	 * little-endian data.
	 *
	 * SDL byteswaps the data only if necessary, so the application always
	 * specifies native format, and the data written will be in little-endian
	 * format.
	 *
	 * \param dst the stream to which data will be written.
	 * \param value the data to be written, in native format.
	 * \returns true on successful write or false on failure; call SDL_GetError()
	 *          for more information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_WriteU16LE(SDL_IOStream* dst, Uint16 value))
]

{ #category : 'public' }
LibSDL3 >> writeU32BEDst: dst value: value [
	"/**
	 * Use this function to write 32 bits in native format to an SDL_IOStream as
	 * big-endian data.
	 *
	 * SDL byteswaps the data only if necessary, so the application always
	 * specifies native format, and the data written will be in big-endian format.
	 *
	 * \param dst the stream to which data will be written.
	 * \param value the data to be written, in native format.
	 * \returns true on successful write or false on failure; call SDL_GetError()
	 *          for more information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_WriteU32BE(SDL_IOStream* dst, Uint32 value))
]

{ #category : 'public' }
LibSDL3 >> writeU32LEDst: dst value: value [
	"/**
	 * Use this function to write 32 bits in native format to an SDL_IOStream as
	 * little-endian data.
	 *
	 * SDL byteswaps the data only if necessary, so the application always
	 * specifies native format, and the data written will be in little-endian
	 * format.
	 *
	 * \param dst the stream to which data will be written.
	 * \param value the data to be written, in native format.
	 * \returns true on successful write or false on failure; call SDL_GetError()
	 *          for more information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_WriteU32LE(SDL_IOStream* dst, Uint32 value))
]

{ #category : 'public' }
LibSDL3 >> writeU64BEDst: dst value: value [
	"/**
	 * Use this function to write 64 bits in native format to an SDL_IOStream as
	 * big-endian data.
	 *
	 * SDL byteswaps the data only if necessary, so the application always
	 * specifies native format, and the data written will be in big-endian format.
	 *
	 * \param dst the stream to which data will be written.
	 * \param value the data to be written, in native format.
	 * \returns true on successful write or false on failure; call SDL_GetError()
	 *          for more information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_WriteU64BE(SDL_IOStream* dst, Uint64 value))
]

{ #category : 'public' }
LibSDL3 >> writeU64LEDst: dst value: value [
	"/**
	 * Use this function to write 64 bits in native format to an SDL_IOStream as
	 * little-endian data.
	 *
	 * SDL byteswaps the data only if necessary, so the application always
	 * specifies native format, and the data written will be in little-endian
	 * format.
	 *
	 * \param dst the stream to which data will be written.
	 * \param value the data to be written, in native format.
	 * \returns true on successful write or false on failure; call SDL_GetError()
	 *          for more information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_WriteU64LE(SDL_IOStream* dst, Uint64 value))
]

{ #category : 'public' }
LibSDL3 >> writeU8Dst: dst value: value [
	"/**
	 * Use this function to write a byte to an SDL_IOStream.
	 *
	 * \param dst the SDL_IOStream to write to.
	 * \param value the byte value to write.
	 * \returns true on successful write or false on failure; call SDL_GetError()
	 *          for more information.
	 *
	 * \threadsafety This function is not thread safe.
	 *
	 * \since This function is available since SDL 3.2.0.
	 */"

	^ self ffiCall: #(bool SDL_WriteU8(SDL_IOStream* dst, Uint8 value))
]
