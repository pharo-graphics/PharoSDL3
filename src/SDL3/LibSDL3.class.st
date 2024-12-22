Class {
	#name : 'LibSDL3',
	#superclass : 'FFILibrary',
	#pools : [
		'S3SDL3Typedef'
	],
	#category : 'SDL3-Library',
	#package : 'SDL3',
	#tag : 'Library'
}

{ #category : 'public' }
LibSDL3 >> SDL_COMPILE_TIME_ASSERT [

	self ffiCall: #(int SDL_COMPILE_TIME_ASSERT_1())
]

{ #category : 'public' }
LibSDL3 >> SDL_COMPILE_TIME_ASSERT: arg1 [

	self ffiCall: #(int SDL_COMPILE_TIME_ASSERT_2(SDL_Event arg1))
]

{ #category : 'public' }
LibSDL3 >> SDL_ClearClipboardData [
	"/**
	 * Clear the clipboard data.
	 *
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \threadsafety You may only call this function from the main thread.
	 *
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_SetClipboardData
	 */"

	self ffiCall: #(int SDL_ClearClipboardData())
]

{ #category : 'public' }
LibSDL3 >> SDL_DestroyWindowSurface: window [
	"/**
	 * Destroy the surface associated with the window.
	 *
	 * \param window the window to update.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GetWindowSurface
	 * \sa SDL_WindowHasSurface
	 */"

	self ffiCall: #(int SDL_DestroyWindowSurface(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> SDL_DisableScreenSaver [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_EnableScreenSaver
	 * \sa SDL_ScreenSaverEnabled
	 */"

	self ffiCall: #(int SDL_DisableScreenSaver())
]

{ #category : 'public' }
LibSDL3 >> SDL_EGL_GetCurrentConfig [
	"/**
	 * Get the currently active EGL config.
	 *
	 * \returns the currently active EGL config or NULL on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \since This function is available since SDL 3.1.3.
	 */"

	self ffiCall: #(int SDL_EGL_GetCurrentConfig())
]

{ #category : 'public' }
LibSDL3 >> SDL_EGL_GetCurrentDisplay [
	"/**
	 * Get the currently active EGL display.
	 *
	 * \returns the currently active EGL display or NULL on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \since This function is available since SDL 3.1.3.
	 */"

	self ffiCall: #(int SDL_EGL_GetCurrentDisplay())
]

{ #category : 'public' }
LibSDL3 >> SDL_EGL_GetProcAddress: proc [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_EGL_GetCurrentDisplay
	 */"

	self ffiCall: #(int SDL_EGL_GetProcAddress(const char* proc))
]

{ #category : 'public' }
LibSDL3 >> SDL_EGL_GetWindowSurface: window [
	"/**
	 * Get the EGL surface associated with the window.
	 *
	 * \param window the window to query.
	 * \returns the EGLSurface pointer associated with the window, or NULL on
	 *          failure.
	 *
	 * \since This function is available since SDL 3.1.3.
	 */"

	self ffiCall: #(int SDL_EGL_GetWindowSurface(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> SDL_EnableScreenSaver [
	"/**
	 * Allow the screen to be blanked by a screen saver.
	 *
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_DisableScreenSaver
	 * \sa SDL_ScreenSaverEnabled
	 */"

	self ffiCall: #(int SDL_EnableScreenSaver())
]

{ #category : 'public' }
LibSDL3 >> SDL_FlashWindow: window operation: operation [
	"/**
	 * Request a window to demand attention from the user.
	 *
	 * \param window the window to be flashed.
	 * \param operation the operation to perform.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.1.3.
	 */"

	self ffiCall: #(int SDL_FlashWindow(SDL_Window* window, SDL_FlashOperation operation))
]

{ #category : 'public' }
LibSDL3 >> SDL_GL_CreateContext: window [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GL_DestroyContext
	 * \sa SDL_GL_MakeCurrent
	 */"

	self ffiCall: #(int SDL_GL_CreateContext(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> SDL_GL_DestroyContext: context [
	"/**
	 * Delete an OpenGL context.
	 *
	 * \param context the OpenGL context to be deleted.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GL_CreateContext
	 */"

	self ffiCall: #(int SDL_GL_DestroyContext(SDL_GLContext context))
]

{ #category : 'public' }
LibSDL3 >> SDL_GL_ExtensionSupported: extension [
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
	 * \since This function is available since SDL 3.1.3.
	 */"

	self ffiCall: #(int SDL_GL_ExtensionSupported(const char* extension))
]

{ #category : 'public' }
LibSDL3 >> SDL_GL_GetAttributeAttr: attr value: value [
	"/**
	 * Get the actual value for an attribute from the current context.
	 *
	 * \param attr an SDL_GLAttr enum value specifying the OpenGL attribute to
	 *             get.
	 * \param value a pointer filled in with the current value of `attr`.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GL_ResetAttributes
	 * \sa SDL_GL_SetAttribute
	 */"

	self ffiCall: #(int SDL_GL_GetAttribute(SDL_GLAttr attr, int* value))
]

{ #category : 'public' }
LibSDL3 >> SDL_GL_GetCurrentContext [
	"/**
	 * Get the currently active OpenGL context.
	 *
	 * \returns the currently active OpenGL context or NULL on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GL_MakeCurrent
	 */"

	self ffiCall: #(int SDL_GL_GetCurrentContext())
]

{ #category : 'public' }
LibSDL3 >> SDL_GL_GetProcAddress: proc [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GL_ExtensionSupported
	 * \sa SDL_GL_LoadLibrary
	 * \sa SDL_GL_UnloadLibrary
	 */"

	self ffiCall: #(int SDL_GL_GetProcAddress(const char* proc))
]

{ #category : 'public' }
LibSDL3 >> SDL_GL_GetSwapInterval: interval [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GL_SetSwapInterval
	 */"

	self ffiCall: #(int SDL_GL_GetSwapInterval(int* interval))
]

{ #category : 'public' }
LibSDL3 >> SDL_GL_LoadLibrary: path [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GL_GetProcAddress
	 * \sa SDL_GL_UnloadLibrary
	 */"

	self ffiCall: #(int SDL_GL_LoadLibrary(const char* path))
]

{ #category : 'public' }
LibSDL3 >> SDL_GL_MakeCurrentWindow: window context: context [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GL_CreateContext
	 */"

	self ffiCall: #(int SDL_GL_MakeCurrent(SDL_Window* window, SDL_GLContext context))
]

{ #category : 'public' }
LibSDL3 >> SDL_GL_SetAttributeAttr: attr value: value [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GL_GetAttribute
	 * \sa SDL_GL_ResetAttributes
	 */"

	self ffiCall: #(int SDL_GL_SetAttribute(SDL_GLAttr attr, int value))
]

{ #category : 'public' }
LibSDL3 >> SDL_GL_SetSwapInterval: interval [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GL_GetSwapInterval
	 */"

	self ffiCall: #(int SDL_GL_SetSwapInterval(int interval))
]

{ #category : 'public' }
LibSDL3 >> SDL_GL_SwapWindow: window [
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
	 * \since This function is available since SDL 3.1.3.
	 */"

	self ffiCall: #(int SDL_GL_SwapWindow(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> SDL_GetAssertionHandler: puserdata [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_SetAssertionHandler
	 */"

	self ffiCall: #(int SDL_GetAssertionHandler(void** puserdata))
]

{ #category : 'public' }
LibSDL3 >> SDL_GetClosestFullscreenDisplayModeDisplayID: displayID w: w h: h refresh_rate: refresh_rate include_high_density_modes: include_high_density_modes mode: mode [
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
LibSDL3 >> SDL_GetCurrentDisplayOrientation: displayID [
	"/**
	 * Get the orientation of a display.
	 *
	 * \param displayID the instance ID of the display to query.
	 * \returns the SDL_DisplayOrientation enum value of the display, or
	 *          `SDL_ORIENTATION_UNKNOWN` if it isn't available.
	 *
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GetDisplays
	 */"

	self ffiCall: #(int SDL_GetCurrentDisplayOrientation(int displayID))
]

{ #category : 'public' }
LibSDL3 >> SDL_GetCurrentThreadID [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GetThreadID
	 */"

	self ffiCall: #(int SDL_GetCurrentThreadID())
]

{ #category : 'public' }
LibSDL3 >> SDL_GetDefaultAssertionHandler [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GetAssertionHandler
	 */"

	self ffiCall: #(int SDL_GetDefaultAssertionHandler())
]

{ #category : 'public' }
LibSDL3 >> SDL_GetDisplayBoundsDisplayID: displayID rect: rect [
	"/**
	 * Get the desktop area represented by a display.
	 *
	 * The primary display is always located at (0,0).
	 *
	 * \param displayID the instance ID of the display to query.
	 * \param rect the SDL_Rect structure filled in with the display bounds.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GetDisplayUsableBounds
	 * \sa SDL_GetDisplays
	 */"

	self ffiCall: #(int SDL_GetDisplayBounds(int displayID, int* rect))
]

{ #category : 'public' }
LibSDL3 >> SDL_GetDisplayForPoint: point [
	"/**
	 * Get the display containing a point.
	 *
	 * \param point the point to query.
	 * \returns the instance ID of the display containing the point or 0 on
	 *          failure; call SDL_GetError() for more information.
	 *
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GetDisplayBounds
	 * \sa SDL_GetDisplays
	 */"

	self ffiCall: #(int SDL_GetDisplayForPoint(const int* point))
]

{ #category : 'public' }
LibSDL3 >> SDL_GetDisplayForRect: rect [
	"/**
	 * Get the display primarily containing a rect.
	 *
	 * \param rect the rect to query.
	 * \returns the instance ID of the display entirely containing the rect or
	 *          closest to the center of the rect on success or 0 on failure; call
	 *          SDL_GetError() for more information.
	 *
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GetDisplayBounds
	 * \sa SDL_GetDisplays
	 */"

	self ffiCall: #(int SDL_GetDisplayForRect(const int* rect))
]

{ #category : 'public' }
LibSDL3 >> SDL_GetDisplayForWindow: window [
	"/**
	 * Get the display associated with a window.
	 *
	 * \param window the window to query.
	 * \returns the instance ID of the display containing the center of the window
	 *          on success or 0 on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GetDisplayBounds
	 * \sa SDL_GetDisplays
	 */"

	self ffiCall: #(int SDL_GetDisplayForWindow(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> SDL_GetDisplayProperties: displayID [
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
	 * \since This function is available since SDL 3.1.3.
	 */"

	self ffiCall: #(int SDL_GetDisplayProperties(int displayID))
]

{ #category : 'public' }
LibSDL3 >> SDL_GetDisplayUsableBoundsDisplayID: displayID rect: rect [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GetDisplayBounds
	 * \sa SDL_GetDisplays
	 */"

	self ffiCall: #(int SDL_GetDisplayUsableBounds(int displayID, int* rect))
]

{ #category : 'public' }
LibSDL3 >> SDL_GetNaturalDisplayOrientation: displayID [
	"/**
	 * Get the orientation of a display when it is unrotated.
	 *
	 * \param displayID the instance ID of the display to query.
	 * \returns the SDL_DisplayOrientation enum value of the display, or
	 *          `SDL_ORIENTATION_UNKNOWN` if it isn't available.
	 *
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GetDisplays
	 */"

	self ffiCall: #(int SDL_GetNaturalDisplayOrientation(int displayID))
]

{ #category : 'public' }
LibSDL3 >> SDL_GetPrimaryDisplay [
	"/**
	 * Return the primary display.
	 *
	 * \returns the instance ID of the primary display on success or 0 on failure;
	 *          call SDL_GetError() for more information.
	 *
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GetDisplays
	 */"

	self ffiCall: #(int SDL_GetPrimaryDisplay())
]

{ #category : 'public' }
LibSDL3 >> SDL_GetSystemTheme [
	"/**
	 * Get the current system theme.
	 *
	 * \returns the current system theme, light, dark, or unknown.
	 *
	 * \since This function is available since SDL 3.1.3.
	 */"

	self ffiCall: #(int SDL_GetSystemTheme())
]

{ #category : 'public' }
LibSDL3 >> SDL_GetThreadID: thread [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GetCurrentThreadID
	 */"

	self ffiCall: #(int SDL_GetThreadID(SDL_Thread* thread))
]

{ #category : 'public' }
LibSDL3 >> SDL_GetVersion [

	^ self ffiCall: #(int SDL_GetVersion())
]

{ #category : 'public' }
LibSDL3 >> SDL_GetWindowAspectRatioWindow: window min_aspect: min_aspect max_aspect: max_aspect [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_SetWindowAspectRatio
	 */"

	self ffiCall: #(int SDL_GetWindowAspectRatio(SDL_Window* window, float* min_aspect, float* max_aspect))
]

{ #category : 'public' }
LibSDL3 >> SDL_GetWindowBordersSizeWindow: window top: top left: left bottom: bottom right: right [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GetWindowSize
	 */"

	self ffiCall: #(int SDL_GetWindowBordersSize(SDL_Window* window, int* top, int* left, int* bottom, int* right))
]

{ #category : 'public' }
LibSDL3 >> SDL_GetWindowFlags: window [
	"/**
	 * Get the window flags.
	 *
	 * \param window the window to query.
	 * \returns a mask of the SDL_WindowFlags associated with `window`.
	 *
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_CreateWindow
	 * \sa SDL_HideWindow
	 * \sa SDL_MaximizeWindow
	 * \sa SDL_MinimizeWindow
	 * \sa SDL_SetWindowFullscreen
	 * \sa SDL_SetWindowMouseGrab
	 * \sa SDL_ShowWindow
	 */"

	self ffiCall: #(int SDL_GetWindowFlags(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> SDL_GetWindowID: window [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GetWindowFromID
	 */"

	self ffiCall: #(int SDL_GetWindowID(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> SDL_GetWindowKeyboardGrab: window [
	"/**
	 * Get a window's keyboard grab mode.
	 *
	 * \param window the window to query.
	 * \returns true if keyboard is grabbed, and false otherwise.
	 *
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_SetWindowKeyboardGrab
	 */"

	self ffiCall: #(int SDL_GetWindowKeyboardGrab(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> SDL_GetWindowMaximumSizeWindow: window w: w h: h [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GetWindowMinimumSize
	 * \sa SDL_SetWindowMaximumSize
	 */"

	self ffiCall: #(int SDL_GetWindowMaximumSize(SDL_Window* window, int* w, int* h))
]

{ #category : 'public' }
LibSDL3 >> SDL_GetWindowMinimumSizeWindow: window w: w h: h [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GetWindowMaximumSize
	 * \sa SDL_SetWindowMinimumSize
	 */"

	self ffiCall: #(int SDL_GetWindowMinimumSize(SDL_Window* window, int* w, int* h))
]

{ #category : 'public' }
LibSDL3 >> SDL_GetWindowMouseGrab: window [
	"/**
	 * Get a window's mouse grab mode.
	 *
	 * \param window the window to query.
	 * \returns true if mouse is grabbed, and false otherwise.
	 *
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_SetWindowKeyboardGrab
	 */"

	self ffiCall: #(int SDL_GetWindowMouseGrab(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> SDL_GetWindowPixelFormat: window [
	"/**
	 * Get the pixel format associated with the window.
	 *
	 * \param window the window to query.
	 * \returns the pixel format of the window on success or
	 *          SDL_PIXELFORMAT_UNKNOWN on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.1.3.
	 */"

	self ffiCall: #(int SDL_GetWindowPixelFormat(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> SDL_GetWindowPositionWindow: window x: x y: y [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_SetWindowPosition
	 */"

	self ffiCall: #(int SDL_GetWindowPosition(SDL_Window* window, int* x, int* y))
]

{ #category : 'public' }
LibSDL3 >> SDL_GetWindowProperties: window [
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
	 * \since This function is available since SDL 3.1.3.
	 */"

	self ffiCall: #(int SDL_GetWindowProperties(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> SDL_GetWindowSafeAreaWindow: window rect: rect [
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
	 * \since This function is available since SDL 3.1.3.
	 */"

	self ffiCall: #(int SDL_GetWindowSafeArea(SDL_Window* window, int* rect))
]

{ #category : 'public' }
LibSDL3 >> SDL_GetWindowSizeInPixelsWindow: window w: w h: h [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_CreateWindow
	 * \sa SDL_GetWindowSize
	 */"

	self ffiCall: #(int SDL_GetWindowSizeInPixels(SDL_Window* window, int* w, int* h))
]

{ #category : 'public' }
LibSDL3 >> SDL_GetWindowSizeWindow: window w: w h: h [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GetRenderOutputSize
	 * \sa SDL_GetWindowSizeInPixels
	 * \sa SDL_SetWindowSize
	 */"

	self ffiCall: #(int SDL_GetWindowSize(SDL_Window* window, int* w, int* h))
]

{ #category : 'public' }
LibSDL3 >> SDL_GetWindowSurfaceVSyncWindow: window vsync: vsync [
	"/**
	 * Get VSync for the window surface.
	 *
	 * \param window the window to query.
	 * \param vsync an int filled with the current vertical refresh sync interval.
	 *              See SDL_SetWindowSurfaceVSync() for the meaning of the value.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_SetWindowSurfaceVSync
	 */"

	self ffiCall: #(int SDL_GetWindowSurfaceVSync(SDL_Window* window, int* vsync))
]

{ #category : 'public' }
LibSDL3 >> SDL_HasClipboardData: mime_type [
	"/**
	 * Query whether there is data in the clipboard for the provided mime type.
	 *
	 * \param mime_type the mime type to check for data for.
	 * \returns true if there exists data in clipboard for the provided mime type,
	 *          false if it does not.
	 *
	 * \threadsafety You may only call this function from the main thread.
	 *
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_SetClipboardData
	 * \sa SDL_GetClipboardData
	 */"

	self ffiCall: #(int SDL_HasClipboardData(const char* mime_type))
]

{ #category : 'public' }
LibSDL3 >> SDL_HideWindow: window [
	"/**
	 * Hide a window.
	 *
	 * \param window the window to hide.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_ShowWindow
	 */"

	self ffiCall: #(int SDL_HideWindow(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> SDL_Init: flags [
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
	 *   subsystem
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_SetAppMetadata
	 * \sa SDL_SetAppMetadataProperty
	 * \sa SDL_InitSubSystem
	 * \sa SDL_Quit
	 * \sa SDL_SetMainReady
	 * \sa SDL_WasInit
	 */"

	self ffiCall: #(int SDL_Init(SDL_InitFlags flags))
]

{ #category : 'public' }
LibSDL3 >> SDL_InitSubSystem: flags [
	"/**
	 * Compatibility function to initialize the SDL library.
	 *
	 * This function and SDL_Init() are interchangeable.
	 *
	 * \param flags any of the flags used by SDL_Init(); see SDL_Init for details.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_Init
	 * \sa SDL_Quit
	 * \sa SDL_QuitSubSystem
	 */"

	self ffiCall: #(int SDL_InitSubSystem(SDL_InitFlags flags))
]

{ #category : 'public' }
LibSDL3 >> SDL_MaximizeWindow: window [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_MinimizeWindow
	 * \sa SDL_RestoreWindow
	 * \sa SDL_SyncWindow
	 */"

	self ffiCall: #(int SDL_MaximizeWindow(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> SDL_MinimizeWindow: window [
	"/**
	 * Request that the window be minimized to an iconic representation.
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_MaximizeWindow
	 * \sa SDL_RestoreWindow
	 * \sa SDL_SyncWindow
	 */"

	self ffiCall: #(int SDL_MinimizeWindow(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> SDL_MostSignificantBitIndex32: x [
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
LibSDL3 >> SDL_RaiseWindow: window [
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
	 * \since This function is available since SDL 3.1.3.
	 */"

	self ffiCall: #(int SDL_RaiseWindow(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> SDL_RectToFRect: rect frect: frect [
	"/**
	 * Convert an SDL_Rect to SDL_FRect
	 *
	 * \param rect a pointer to an SDL_Rect.
	 * \param frect a pointer filled in with the floating point representation of
	 *              `rect`.
	 *
	 * \threadsafety It is safe to call this function from any thread.
	 *
	 * \since This function is available since SDL 3.1.3.
	 */"

	self ffiCall: #(int SDL_RectToFRect(SDL_Rect* rect, SDL_FRect* frect))
]

{ #category : 'public' }
LibSDL3 >> SDL_RestoreWindow: window [
	"/**
	 * Request that the size and position of a minimized or maximized window be
	 * restored.
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_MaximizeWindow
	 * \sa SDL_MinimizeWindow
	 * \sa SDL_SyncWindow
	 */"

	self ffiCall: #(int SDL_RestoreWindow(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> SDL_ScreenSaverEnabled [
	"/**
	 * Check whether the screensaver is currently enabled.
	 *
	 * The screensaver is disabled by default.
	 *
	 * The default can also be changed using `SDL_HINT_VIDEO_ALLOW_SCREENSAVER`.
	 *
	 * \returns true if the screensaver is enabled, false if it is disabled.
	 *
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_DisableScreenSaver
	 * \sa SDL_EnableScreenSaver
	 */"

	self ffiCall: #(int SDL_ScreenSaverEnabled())
]

{ #category : 'public' }
LibSDL3 >> SDL_SetAppMetadataAppname: appname appversion: appversion appidentifier: appidentifier [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_SetAppMetadataProperty
	 */"

	self ffiCall: #(int SDL_SetAppMetadata(const char* appname, const char* appversion, const char* appidentifier))
]

{ #category : 'public' }
LibSDL3 >> SDL_SetAppMetadataPropertyName: name value: value [
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
	 * Once set, this metadata can be read using SDL_GetMetadataProperty().
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GetAppMetadataProperty
	 * \sa SDL_SetAppMetadata
	 */"

	self ffiCall: #(int SDL_SetAppMetadataProperty(const char* name, const char* value))
]

{ #category : 'public' }
LibSDL3 >> SDL_SetClipboardDataCallback: callback cleanup: cleanup userdata: userdata mime_types: mime_types num_mime_types: num_mime_types [
	"/**
	 * Offer clipboard data to the OS.
	 *
	 * Tell the operating system that the application is offering clipboard data
	 * for each of the proivded mime-types. Once another application requests the
	 * data the callback function will be called allowing it to generate and
	 * respond with the data for the requested mime-type.
	 *
	 * The size of text data does not include any terminator, and the text does
	 * not need to be null terminated (e.g. you can directly copy a portion of a
	 * document)
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
	 * \threadsafety You may only call this function from the main thread.
	 *
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_ClearClipboardData
	 * \sa SDL_GetClipboardData
	 * \sa SDL_HasClipboardData
	 */"

	self ffiCall: #(int SDL_SetClipboardData(int callback, int cleanup, void* userdata, const char** mime_types, size_t num_mime_types))
]

{ #category : 'public' }
LibSDL3 >> SDL_SetCurrentThreadPriority: priority [
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
	 * \since This function is available since SDL 3.1.3.
	 */"

	self ffiCall: #(int SDL_SetCurrentThreadPriority(SDL_ThreadPriority priority))
]

{ #category : 'public' }
LibSDL3 >> SDL_SetTLSId: id value: value destructor: destructor [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GetTLS
	 */"

	self ffiCall: #(int SDL_SetTLS(SDL_TLSID* id, const void* value, int destructor))
]

{ #category : 'public' }
LibSDL3 >> SDL_SetWindowAlwaysOnTopWindow: window on_top: on_top [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GetWindowFlags
	 */"

	self ffiCall: #(int SDL_SetWindowAlwaysOnTop(SDL_Window* window, int on_top))
]

{ #category : 'public' }
LibSDL3 >> SDL_SetWindowAspectRatioWindow: window min_aspect: min_aspect max_aspect: max_aspect [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GetWindowAspectRatio
	 * \sa SDL_SyncWindow
	 */"

	self ffiCall: #(int SDL_SetWindowAspectRatio(SDL_Window* window, float min_aspect, float max_aspect))
]

{ #category : 'public' }
LibSDL3 >> SDL_SetWindowBorderedWindow: window bordered: bordered [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GetWindowFlags
	 */"

	self ffiCall: #(int SDL_SetWindowBordered(SDL_Window* window, int bordered))
]

{ #category : 'public' }
LibSDL3 >> SDL_SetWindowFocusableWindow: window focusable: focusable [
	"/**
	 * Set whether the window may have input focus.
	 *
	 * \param window the window to set focusable state.
	 * \param focusable true to allow input focus, false to not allow input focus.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.1.3.
	 */"

	self ffiCall: #(int SDL_SetWindowFocusable(SDL_Window* window, int focusable))
]

{ #category : 'public' }
LibSDL3 >> SDL_SetWindowFullscreenModeWindow: window mode: mode [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GetWindowFullscreenMode
	 * \sa SDL_SetWindowFullscreen
	 * \sa SDL_SyncWindow
	 */"

	self ffiCall: #(int SDL_SetWindowFullscreenMode(SDL_Window* window, SDL_DisplayMode* mode))
]

{ #category : 'public' }
LibSDL3 >> SDL_SetWindowFullscreenWindow: window fullscreen: fullscreen [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GetWindowFullscreenMode
	 * \sa SDL_SetWindowFullscreenMode
	 * \sa SDL_SyncWindow
	 */"

	self ffiCall: #(int SDL_SetWindowFullscreen(SDL_Window* window, int fullscreen))
]

{ #category : 'public' }
LibSDL3 >> SDL_SetWindowHitTestWindow: window callback: callback callback_data: callback_data [
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
	 * \since This function is available since SDL 3.1.3.
	 */"

	self ffiCall: #(int SDL_SetWindowHitTest(SDL_Window* window, int callback, void* callback_data))
]

{ #category : 'public' }
LibSDL3 >> SDL_SetWindowIconWindow: window icon: icon [
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
	 * \since This function is available since SDL 3.1.3.
	 */"

	self ffiCall: #(int SDL_SetWindowIcon(SDL_Window* window, int* icon))
]

{ #category : 'public' }
LibSDL3 >> SDL_SetWindowKeyboardGrabWindow: window grabbed: grabbed [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GetWindowKeyboardGrab
	 * \sa SDL_SetWindowMouseGrab
	 */"

	self ffiCall: #(int SDL_SetWindowKeyboardGrab(SDL_Window* window, int grabbed))
]

{ #category : 'public' }
LibSDL3 >> SDL_SetWindowMaximumSizeWindow: window max_w: max_w max_h: max_h [
	"/**
	 * Set the maximum size of a window's client area.
	 *
	 * \param window the window to change.
	 * \param max_w the maximum width of the window, or 0 for no limit.
	 * \param max_h the maximum height of the window, or 0 for no limit.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GetWindowMaximumSize
	 * \sa SDL_SetWindowMinimumSize
	 */"

	self ffiCall: #(int SDL_SetWindowMaximumSize(SDL_Window* window, int max_w, int max_h))
]

{ #category : 'public' }
LibSDL3 >> SDL_SetWindowMinimumSizeWindow: window min_w: min_w min_h: min_h [
	"/**
	 * Set the minimum size of a window's client area.
	 *
	 * \param window the window to change.
	 * \param min_w the minimum width of the window, or 0 for no limit.
	 * \param min_h the minimum height of the window, or 0 for no limit.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GetWindowMinimumSize
	 * \sa SDL_SetWindowMaximumSize
	 */"

	self ffiCall: #(int SDL_SetWindowMinimumSize(SDL_Window* window, int min_w, int min_h))
]

{ #category : 'public' }
LibSDL3 >> SDL_SetWindowModalWindow: window modal: modal [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_SetWindowParent
	 */"

	self ffiCall: #(int SDL_SetWindowModal(SDL_Window* window, int modal))
]

{ #category : 'public' }
LibSDL3 >> SDL_SetWindowMouseGrabWindow: window grabbed: grabbed [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GetWindowMouseGrab
	 * \sa SDL_SetWindowKeyboardGrab
	 */"

	self ffiCall: #(int SDL_SetWindowMouseGrab(SDL_Window* window, int grabbed))
]

{ #category : 'public' }
LibSDL3 >> SDL_SetWindowMouseRectWindow: window rect: rect [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GetWindowMouseRect
	 * \sa SDL_SetWindowMouseGrab
	 */"

	self ffiCall: #(int SDL_SetWindowMouseRect(SDL_Window* window, const int* rect))
]

{ #category : 'public' }
LibSDL3 >> SDL_SetWindowOpacityWindow: window opacity: opacity [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GetWindowOpacity
	 */"

	self ffiCall: #(int SDL_SetWindowOpacity(SDL_Window* window, float opacity))
]

{ #category : 'public' }
LibSDL3 >> SDL_SetWindowParentWindow: window parent: parent [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_SetWindowModal
	 */"

	self ffiCall: #(int SDL_SetWindowParent(SDL_Window* window, SDL_Window* parent))
]

{ #category : 'public' }
LibSDL3 >> SDL_SetWindowPositionWindow: window x: x y: y [
	"/**
	 * Request that the window's position be set.
	 *
	 * If, at the time of this request, the window is in a fixed-size state such
	 * as maximized, this request may be deferred until the window returns to a
	 * resizable state.
	 *
	 * This can be used to reposition fullscreen-desktop windows onto a different
	 * display, however, exclusive fullscreen windows are locked to a specific
	 * display and can only be repositioned programmatically via
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GetWindowPosition
	 * \sa SDL_SyncWindow
	 */"

	self ffiCall: #(int SDL_SetWindowPosition(SDL_Window* window, int x, int y))
]

{ #category : 'public' }
LibSDL3 >> SDL_SetWindowResizableWindow: window resizable: resizable [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GetWindowFlags
	 */"

	self ffiCall: #(int SDL_SetWindowResizable(SDL_Window* window, int resizable))
]

{ #category : 'public' }
LibSDL3 >> SDL_SetWindowShapeWindow: window shape: shape [
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
	 * \since This function is available since SDL 3.1.3.
	 */"

	self ffiCall: #(int SDL_SetWindowShape(SDL_Window* window, int* shape))
]

{ #category : 'public' }
LibSDL3 >> SDL_SetWindowSizeWindow: window w: w h: h [
	"/**
	 * Request that the size of a window's client area be set.
	 *
	 * If, at the time of this request, the window in a fixed-size state, such as
	 * maximized or fullscreen, the request will be deferred until the window
	 * exits this state and becomes resizable again.
	 *
	 * To change the fullscreen mode of a window, use
	 * SDL_SetWindowFullscreenMode()
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GetWindowSize
	 * \sa SDL_SetWindowFullscreenMode
	 * \sa SDL_SyncWindow
	 */"

	self ffiCall: #(int SDL_SetWindowSize(SDL_Window* window, int w, int h))
]

{ #category : 'public' }
LibSDL3 >> SDL_SetWindowSurfaceVSyncWindow: window vsync: vsync [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GetWindowSurfaceVSync
	 */"

	self ffiCall: #(int SDL_SetWindowSurfaceVSync(SDL_Window* window, int vsync))
]

{ #category : 'public' }
LibSDL3 >> SDL_SetWindowTitleWindow: window title: title [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GetWindowTitle
	 */"

	self ffiCall: #(int SDL_SetWindowTitle(SDL_Window* window, const char* title))
]

{ #category : 'public' }
LibSDL3 >> SDL_ShowWindow: window [
	"/**
	 * Show a window.
	 *
	 * \param window the window to show.
	 * \returns true on success or false on failure; call SDL_GetError() for more
	 *          information.
	 *
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_HideWindow
	 * \sa SDL_RaiseWindow
	 */"

	self ffiCall: #(int SDL_ShowWindow(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> SDL_ShowWindowSystemMenuWindow: window x: x y: y [
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
	 * \since This function is available since SDL 3.1.3.
	 */"

	self ffiCall: #(int SDL_ShowWindowSystemMenu(SDL_Window* window, int x, int y))
]

{ #category : 'public' }
LibSDL3 >> SDL_SyncWindow: window [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_SetWindowSize
	 * \sa SDL_SetWindowPosition
	 * \sa SDL_SetWindowFullscreen
	 * \sa SDL_MinimizeWindow
	 * \sa SDL_MaximizeWindow
	 * \sa SDL_RestoreWindow
	 * \sa SDL_HINT_VIDEO_SYNC_WINDOW_OPERATIONS
	 */"

	self ffiCall: #(int SDL_SyncWindow(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> SDL_UpdateWindowSurface: window [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GetWindowSurface
	 * \sa SDL_UpdateWindowSurfaceRects
	 */"

	self ffiCall: #(int SDL_UpdateWindowSurface(SDL_Window* window))
]

{ #category : 'public' }
LibSDL3 >> SDL_UpdateWindowSurfaceRectsWindow: window rects: rects numrects: numrects [
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
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GetWindowSurface
	 * \sa SDL_UpdateWindowSurface
	 */"

	self ffiCall: #(int SDL_UpdateWindowSurfaceRects(SDL_Window* window, const int* rects, int numrects))
]

{ #category : 'public' }
LibSDL3 >> SDL_WasInit: flags [
	"/**
	 * Get a mask of the specified subsystems which are currently initialized.
	 *
	 * \param flags any of the flags used by SDL_Init(); see SDL_Init for details.
	 * \returns a mask of all initialized subsystems if `flags` is 0, otherwise it
	 *          returns the initialization status of the specified subsystems.
	 *
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_Init
	 * \sa SDL_InitSubSystem
	 */"

	self ffiCall: #(int SDL_WasInit(SDL_InitFlags flags))
]

{ #category : 'public' }
LibSDL3 >> SDL_WindowHasSurface: window [
	"/**
	 * Return whether the window has a surface associated with it.
	 *
	 * \param window the window to query.
	 * \returns true if there is a surface associated with the window, or false
	 *          otherwise.
	 *
	 * \since This function is available since SDL 3.1.3.
	 *
	 * \sa SDL_GetWindowSurface
	 */"

	self ffiCall: #(int SDL_WindowHasSurface(SDL_Window* window))
]

{ #category : 'accessing - platform' }
LibSDL3 >> macLibraryName [

	^ FFIMacLibraryFinder new
		userPaths: #('./CIG/lib');
		findLibrary: 'libSDL3.dylib'
]

{ #category : 'accessing' }
LibSDL3 >> runner [
	
	^ TFProcessLocalWorker new 
		defaultWorker: TFMainThreadRunner uniqueInstance;
		yourself
]

{ #category : 'accessing - platform' }
LibSDL3 >> unix64LibraryName [

	^ FFIUnix64LibraryFinder new
		findLibrary: 'libSDL3.so'
]

{ #category : 'accessing - platform' }
LibSDL3 >> win32LibraryName [

	^ FFIWindowsLibraryFinder new
		userPaths: #('./CIG/lib');
		findLibrary: 'SDL3.dll'
]
