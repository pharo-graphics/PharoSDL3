# Architecture and Object-Oriented Abstractions

PharoSDL3 provides FFI bindings for SDL 3.0. While the core FFI layer was initially generated from C headers using PharoCIG, raw C bindings impose a non-OOP style of source code: procedural library calls, manual error checking, unmanaged resources prone to leaking memory, untyped integer identifiers, and raw union buffers.

This document describes the architectural layers and object-oriented abstractions that transform these raw C bindings into an idiomatic Smalltalk framework.

---

## 1. The Baseline: Raw C / FFI Procedural Programming

In a bare FFI binding, interaction with SDL3 is procedural. The developer calls functions on `SDL3Library uniqueInstance`, explicitly checks for null pointers or boolean return codes, manually frees resources in nested `ensure:` blocks, and performs manual byte arithmetic on pixel buffers.

The following script illustrates how a window, renderer, and streaming texture from a Pharo `Form` are created and managed using only the low-level API:

```smalltalk
| lib window renderer texture tempSurface form |
lib := SDL3Library uniqueInstance.

"0. Initialize SDL Library Subsystems"
(lib init: SDL3InitFlags video) ifFalse: [ self error: 'Could not initialize SDL' ].

[
	"Create Window"
	window := lib createWindowTitle: 'Demo' w: 640 h: 480 flags: 0.
	window isNull ifTrue: [ self error: 'Could not create SDL window' ].

	[
		"Create Renderer"
		renderer := lib createRendererWindow: window name: nil.
		renderer isNull ifTrue: [ self error: 'Could not create SDL renderer' ].

		form := Smalltalk ui iconNamed: #pharoBig.

		[
			"Create Streaming Texture matching Form dimensions and pixel format"
			texture := lib
				createTextureRenderer: renderer
				format: SDL3PixelFormat argb8888
				access: SDL3TextureAccess streaming
				w: form width
				h: form height.
			texture isNull ifTrue: [ self error: 'Could not create SDL texture' ].

			[
				"Transient Nested Surface"
				[
					form depth = 32 ifFalse: [ form := form asFormOfDepth: 32 ].
					form unhibernate.

					"Create an SDL_Surface that shares the Form's pixel buffer (zero copy)"
					tempSurface := lib
						createSurfaceFromWidth: form width
						height: form height
						format: SDL3PixelFormat argb8888
						pixels: form bits
						pitch: form bits byteSize // form height.
					tempSurface isNull ifTrue: [ self error: 'Could not create SDL surface from Form' ].

					"Update Texture with surface pixels"
					lib
						updateTexture: texture
						rect: nil
						pixels: tempSurface pixels
						pitch: tempSurface pitch
				] ensure: [
					tempSurface ifNotNil: [
						tempSurface isNull ifFalse: [ lib destroySurface: tempSurface ] ] ].

				"Render Pass"
				lib renderClear: renderer.
				lib renderTextureRenderer: renderer texture: texture srcrect: nil dstrect: nil.
				lib renderPresent: renderer.

				5 seconds wait.

			] ensure: [
				texture ifNotNil: [
					texture isNull ifFalse: [ lib destroyTexture: texture ] ] ]
		] ensure: [
			renderer ifNotNil: [
				renderer isNull ifFalse: [ lib destroyRenderer: renderer ] ] ]
	] ensure: [
		window ifNotNil: [
			window isNull ifFalse: [ lib destroyWindow: window ] ] ]
] ensure: [
	"Shutdown SDL Subsystems"
	lib quit ]
```

### Problems of the Procedural Baseline:
- **Nested Teardown**: Four levels of nested `[ ... ] ensure: [ ... ]` blocks are required to guarantee cleanup. If an error occurs midway, manual `ifNotNil:` and `isNull` checks must guard every destruction call.
- **Manual Verification**: Every allocation requires an explicit null-pointer check and manual exception signaling.
- **Procedural Routing**: All operations are static sends to `lib` passing the target pointer as an argument, rather than polymorphic messages sent directly to the object.
- **Buffer Mathematics**: Low-level pitch and byte size calculations are repeated at every call site.

---

## 2. Layer 1: Automatic Error Handling and Smalltalk Accessors

To eliminate manual error checking and procedural routing:

- **Instance-Side Methods**: Functions are routed to their target object (`SDL3Window`, `SDL3Renderer`, `SDL3Surface`, `SDL3GPUDevice`). Senders communicate directly with the object: `window flags`, `window bordered: true`.
- **Accessor Conventions**: C `Get` and `Set` prefixes are omitted in favor of Smalltalk accessors.
- **Out-Parameter Elimination**: C functions that write into pointer out-parameters (`int *w, int *h`) are wrapped to return Smalltalk objects directly (`Point`, `Rectangle`, or arrays of structures).

### Success Assertions

Wrapper methods in the Convenience API handle error checking internally based on the C return type:

- **Boolean Success**: Methods that return a boolean success code in C (e.g., `SDL_SetWindowBordered()`) use `assertSuccess:` internally. If the function call fails, an `SDL3Error` is signaled with the diagnostic message from `SDL_GetError()`. These methods return `self` on success.
- **Pointer Results**: Methods that create or return SDL3 objects (e.g., `unownedNewRenderer:`) use `assertNotNullReturn` internally. If the returned pointer is `NULL`, an `SDL3Error` is signaled.
- **Void Returns**: Methods returning `void` in C (e.g., `destroy`) do not perform assertions and return `self` to allow for method chaining.
- **Query Methods**: Methods that return a state or value (e.g., `isTextInputActive` or `flags`) do not perform internal assertions and return the value directly.

---

## 3. Layer 2: Deterministic Disposal with DiScope and Zero-Copy Forms

To simplify resource management without nested `ensure:` blocks, PharoSDL3 integrates with `DiScope` (from the `DisposeScopes` package) and provides native conversions:

- **Ambient Scopes**: `DiScope during: [ ... ]` evaluates a block and sends `#dispose` to registered disposables in reverse (LIFO) order upon block completion or error.
- **Nesting**: Scopes can be nested. Disposables registered within an inner `DiScope during:` are disposed as soon as the inner block exits, while outer objects remain active.
- **Error Safety**: If an error is signaled inside the innermost block closure, all registered SDL objects across enclosing scopes are disposed in LIFO order as the stack unwinds.
- **Ownership**: `DiScope own: aDisposable` (or `ownAll:`) registers SDL objects into the current scope.
- **Replacement**: `texture := DiScope dispose: texture andOwn: aNewTexture` sends `#dispose` to the previous object and registers the new one in place (handling an initial `nil` seamlessly).
- **Applications**: `SDL3App` runs inside an ambient `DiScope during:`, so disposables registered in `setUp` are disposed automatically when the application terminates.
- **Idempotent Disposal**: `SDL3BaseObject >> dispose` sends the C destruction function and nullifies the internal handle (`handle beNull`), guarding against accidental double-free errors.
- **Zero-Copy Surface Sharing**: `Form >> unownedAsSDL3Surface` shares the Pharo Form's pixel buffer directly with SDL3 without copying memory.

The previous procedural script collapses into a single flat lexical scope:

```smalltalk
DiScope during: [
	| window renderer form texture |
	window := DiScope own: (SDL3Window unownedNewTitle: 'Demo' width: 640 height: 480 flags: 0).
	renderer := DiScope own: window unownedNewRenderer.
	form := Smalltalk ui iconNamed: #pharoBig.

	texture := DiScope own: (renderer
		unownedNewTextureFormat: SDL3PixelFormat argb8888
		access: SDL3TextureAccess streaming
		width: form width
		height: form height).

	"Nested scope: transient objects are disposed immediately upon inner block exit"
	DiScope during: [
		| tempSurface |
		tempSurface := DiScope own: form unownedAsSDL3Surface.
		texture updateRect: nil pixels: tempSurface pixels pitch: tempSurface pitch
	]. "tempSurface is disposed here; if an error is signaled inside, all SDL objects unwind and dispose in LIFO order"

	renderer
		renderClear;
		renderTexture: texture srcrect: nil dstrect: nil;
		renderPresent.

	"Dynamically replace an SDL object (e.g. upon window resize)"
	texture := DiScope dispose: texture andOwn: (renderer
		unownedNewTextureFormat: SDL3PixelFormat argb8888
		access: SDL3TextureAccess streaming
		width: 800
		height: 600).

	5 seconds wait
]. "All registered disposables are sent #dispose in reverse order (LIFO)"
```

---

## 4. Layer 3: Polymorphic Events and the Hierarchical Visitor

In C, SDL events are passed as a raw 56-byte union (`SDL_Event`) containing an integer `type` field. Senders traditionally process events with a large `switch` statement.

PharoSDL3 reifies events into a complete object-oriented hierarchy:

- **130+ Event Classes**: Subclasses of `SDL3MappedEvent` map 1:1 to SDL3 event types, grouped into domain categories (`SDL3WindowEvent`, `SDL3MouseEvent`, `SDL3KeyboardEvent`, `SDL3TouchFingerEvent`, `SDL3DisplayEvent`, etc.).
- **Fast Event Mapping (`SDL3EventMap`)**: Direct lookup translates the raw union buffer into the corresponding `SDL3MappedEvent` instance without reflection.
- **Double-Dispatch Visitor (`TSDL3HierarchicalEventVisitor`)**: Events implement `#accept: aVisitor`. The visitor trait provides hierarchical bubbling delegation.

### Bubbling Delegation Example:
When a mouse button is pressed, the event sends `visitMouseButtonDownEvent: self`:
1. `visitMouseButtonDownEvent:` defaults to `^ self visitMouseButtonEvent: anEvent`.
2. `visitMouseButtonEvent:` defaults to `^ self visitMouseEvent: anEvent`.
3. `visitMouseEvent:` defaults to `^ self visitWindowIDEvent: anEvent`.
4. `visitWindowIDEvent:` defaults to `^ self visitMappedEvent: anEvent` (a no-op).

Any class composing `TSDL3HierarchicalEventVisitor` can override only the exact level of granularity it cares about.

---

## 5. Layer 4: Reified Objects for C IDs and Macro Flags

### Reified ID Objects (`SDL3BaseIDObject`)
In C, displays, audio devices, and properties are represented merely by 32-bit unsigned integers (`SDL_DisplayID`, `SDL_AudioDeviceID`, `SDL_PropertiesID`). In PharoSDL3, these are first-class domain objects:

- **`SDL3Display`**: Encapsulates `SDL_DisplayID`. Provides methods like `bounds`, `usableBounds`, `currentDisplayMode`, `fullscreenDisplayModes`, and `contentScale`.
- **`SDL3AudioDevice`**: Encapsulates `SDL_AudioDeviceID`. Provides audio controls (`pause`, `resume`, `gain`).
- **`SDL3PropertyGroup`**: Encapsulates `SDL_PropertiesID`. Acts as a Smalltalk dictionary (`booleanAt:put:`, `stringAt:ifAbsent:`, `numberAt:put:`) and as an object factory (`unownedNewWindow`, `unownedNewRenderer`, `unownedNewGPUDevice`).

### Reified Bitmasks (`SDL3MacroDefinedFlag`)
C `#define` bitmasks are reified into subclasses of `SDL3MacroDefinedFlag` (such as `SDL3WindowFlags`, `SDL3InitFlags`, `SDL3GPUBufferUsageFlags`, and `SDL3Keymod`):
- Support bitwise operations: `SDL_WINDOW_RESIZABLE | SDL_WINDOW_HIGH_PIXEL_DENSITY`.
- Introspection: Senders can decode raw integer masks from C back into Smalltalk symbols via `#allItemsIn: anInteger`.
- Shared Pool: `SDL3AllEnumerations` aggregates all 100+ enumerations and flag classes into a single shared pool.

---

## 6. Layer 5: GPU Pipeline Builder, Vertex Reflection, and Validation

Building GPU graphics pipelines in SDL3 C requires manually populating complex nested structs (`SDL_GPUGraphicsPipelineCreateInfo`, `SDL_GPUVertexInputState`), allocating temporary C arrays, calculating byte offsets/strides, and synchronizing shader layout registers.

PharoSDL3 introduces high-level abstractions for the GPU subsystem:

### Pipeline Builder (`SDL3GPUGraphicsPipelineBuilder`)
Constructs pipelines declaratively, automatically populating create-info structures and managing transient build allocations via `DiScope`:

```smalltalk
pipeline := DiScope own: (gpuDevice newGraphicsPipelineBuilder
	vertexShader: MyVertexShaderSource;
	fragmentShader: MyFragmentShaderSource;
	addVertexBufferFor: MyVertexStruct;
	targetWindow: window;
	enableAlphaBlending;
	unownedNewPipeline).
```

### Vertex Struct Reflection
Smalltalk FFI structures subclassing `SDL3GPUVertexInputStructure` (such as `SDL3GPUQuadVertex`) declare their vertex element layouts via `gpuVertexElementsDescription`. The builder sends `#addVertexBufferFor: aVertexClass` to automatically calculate buffer pitch, attribute locations, offsets, and element formats without manual arithmetic.

### Pre-Flight Validation
Before submitting requests to native GPU drivers, the builder performs pre-flight checks:
- **Attribute Matching**: Compares builder vertex attributes against the vertex shader's reflected input signature. If an expected attribute is missing or misaligned, it signals `SDL3GPUShaderLayoutMismatch`.
- **Descriptor Space Ground-Truth**: Checks shader metadata against Metal/Vulkan transpiler rules ([`GPU-Resource-Mapping.md`](./GPU-Resource-Mapping.md)) to prevent overlapping Read-Only and Read-Write storage spaces.

### Shader Metadata and Sources
- **`SDL3GPUShaderMetadata`**: Scans HLSL shader code to infer uniform counts, sampler counts, storage buffer/texture counts, compute workgroup thread dimensions, and vertex input attribute locations/formats.
- **`SDL3GPUShader >> metadata`**: Compiled shaders store their metadata in an instance variable, allowing devices and pipeline builders to introspect resource requirements automatically.
- **`SDL3ShaderSource`**: Encapsulates HLSL source code, compiles it via `shadercross` to DXIL, MSL, and SPIR-V bytecodes, and caches Base64 binaries class-side for runtime deployment.

### GPU Block-Based API (Automatic Lifecycle)

The GPU stack also provides block-based methods to manage the lifecycle of transient resources (such as passes, mapped addresses, and configuration structs). These methods use `ensure:` blocks internally to guarantee that resources are closed, unmapped, or freed even if an error occurs:

- **Pass Management**: Methods like `renderPassTargets:do:`, `computePassTextures:computeStorageBuffers:do:`, and `copyPassDo:` automatically begin and end the underlying SDL pass around the block.
- **Safe Resource Creation**: Block-based factory methods on `SDL3GPUDevice` (such as `unownedNewGPUGraphicsPipeline:`, `unownedNewGPUSampler:`, and `unownedNewGPUBuffer:`) pass a temporary `CreateInfo` struct to the configuration block and free it once the resource is created, returning an unowned resource that the sender is responsible for releasing.
- **Memory Mapping**: `mapTransferBuffer:cycle:do: [ :mappedAddress | ... ]` automatically unmaps the transfer buffer when the block terminates.

```smalltalk
commandBuffer renderPassTargets: targets do: [ :renderPass |
	renderPass
		pipeline: aPipeline;
		drawPrimitives: 3 instances: 1 firstVertex: 0 firstInstance: 0 ].
```
The block closure is preceded by an FFI call to [SDL_BeginGPURenderPass()](https://wiki.libsdl.org/SDL3/SDL_BeginGPURenderPass) and ended with an FFI call to [SDL_EndGPURenderPass()](https://wiki.libsdl.org/SDL3/SDL_EndGPURenderPass).
