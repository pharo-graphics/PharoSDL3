# Building Standalone Desktop Applications (`SDL3App`)

PharoSDL3 is not only an FFI binding or an OSWindow driver backend; it also provides an application framework based on `SDL3App` to build and run standalone SDL3 desktop applications directly from headless Pharo images.

---

## 1. Overview: Applications Outside Morphic and OSWindow

`SDL3App` allows running graphical desktop applications independently from Pharo's Morphic World and OSWindow:
- **Headless Execution**: Applications run in a headless Pharo VM directly from the terminal without launching Morphic or the Pharo IDE.
- **Dedicated Main Loop**: Frame pacing and event handling are controlled directly by the application loop, preventing event dispatch interference.
- **Direct Hardware Access**: Well suited for games, simulations, custom rendering engines, and GPU compute viewers.

---

## 2. Template Method Pattern and Lifecycle Management

`SDL3App` uses the Template Method pattern to establish a predictable lifecycle:

- **`subsystemInitFlags`**: Answers the SDL subsystems to initialize upon launch (defaults to `SDL_INIT_VIDEO`).
- **`initializeKeybindings`**: Registers declarative keyboard shortcuts via `#bindKey:description:action:` (defaults to binding `SDLK_ESCAPE` to quit).
- **`setUp`**: Executed immediately before the main loop begins (and prints the application's class comment and registered key bindings banner to `stdout`). Ideal for opening windows, compiling pipelines, and loading textures. All resources registered with `DiScope own:` are retained during execution.
- **`step` / `step:`**: Executed once per frame. Override `#step: deltaSeconds` to advance time-stepped simulations using the elapsed frame delta in seconds, or `#step` for stateless and event-driven rendering.
- **`tearDown`**: Pre-cleanup hook executed when the loop terminates, just before scoped resources are sent `#dispose`.
- **Automatic Initialization and Shutdown**: Guaranteed `#sdlInit` and `#sdlQuit` calls wrapped in `ensure:` blocks.

### Execution Modes
- **`run`**: Synchronous execution on the active thread. This mode is required on macOS, where the operating system mandates that windowing and event polling occur on the main OS thread.
- **`runForSeconds: aNumber`**: Runs the application for a fixed duration and then requests termination. Used for automated smoke testing in CI environments without requiring user interaction.

---

## 3. Frame Pacing and Main Loop (`SDL3CappedLoop` & `SDL3FramePacer`)

The application loop is driven by `SDL3CappedLoop`, which delegates waiting and presentation configuration to an `SDL3FramePacer`:

- **Two Frame Pacers**:
  - **`SDL3VSyncPacer`** *(default in `SDL3SingleWindowApp` demos)*: Enables hardware VSync (`renderVsync: 1` / `SDL3GPUPresentMode vsync` + `waitAndAcquireSwapchainTextureForWindow:into:width:height:`) for tear-free presentation out of the box. Because hardware VSync paces visible frames in C, the loop avoids running a competing software deadline and falls back to `Delay` only if a frame completes in under 1 ms without blocking (such as when a window is minimized).
  - **`SDL3CooperativePacer`** *(default in `SDL3CappedLoop`)*: Disables blocking C VSync (`renderVsync: 0` / `MAILBOX` falling back to `IMMEDIATE` + `acquireSwapchainTextureForWindow:into:width:height:`) and paces frames in Smalltalk against progressive absolute deadlines (`nextDeadlineUS`), yielding spare time via `Delay` (or `Processor yield` under 1 ms) so background Smalltalk processes stay responsive.
- **Runtime `[V]` Toggle**: `SDL3SingleWindowApp` binds `SDLK_V` in `#initializeKeybindings` to switch between `VSync` and `Cooperative` pacers on the fly, reapplying renderer/swapchain settings via `#applyPacer` and updating the window title (`[VSync]` / `[Cooperative]`).
- **Frame Rate Synchronization**: Targets 60 Hz by default (`hertz: 60`, or synchronized to the display refresh rate via `#syncToWindow:` in `SDL3SingleWindowApp`). See [`Loop-Pacing-And-VSync.md`](./Loop-Pacing-And-VSync.md) for details.
- **Session Safety**: Checks `Smalltalk session ~~ session` on each iteration to cleanly stop execution if the image is saved or restarted.
- **Integrated Event Polling**: On every iteration, events are polled from `SDL3Library`, converted to `SDL3MappedEvent` instances via `SDL3EventMap`, and dispatched to the application using `#accept: self`.
- **Default Handlers and Key Bindings**: Built-in handling for `SDL_EVENT_QUIT` and automatic dispatch of key bindings registered in `#initializeKeybindings` (including `ESCAPE` to quit and `V` to toggle pacing).

---

## 4. Application Hierarchies and Example

PharoSDL3 provides two main abstract application classes depending on the rendering technology:

### 2D Rendering: `SDL3SingleWindowApp` & `SDL3RendererDemoApp`
`SDL3SingleWindowApp` specializes `SDL3App` for single-window demos, automating window creation (`initialExtent`, `initialWindowFlags`), dynamic window title updates (including the active pacer tag), `[V]` pacer toggle, and window close handling. `SDL3RendererDemoApp` builds on it for `SDL_Renderer` applications and applies `self pacer configureRenderer: renderer` via `#applyPacer`.

#### A Minimal Standalone App in 10 Lines

```smalltalk
SDL3SingleWindowApp << #MyGameApp
	slots: { #renderer };
	package: 'MyGame'.

MyGameApp >> setUp [
	super setUp.
	renderer := DiScope own: window unownedNewRenderer.
]

MyGameApp >> step [
	renderer
		drawColor: (SDL3FColor r: 0.1 g: 0.2 b: 0.3 a: 1.0);
		renderClear;
		renderPresent.
]

MyGameApp >> initializeKeybindings [
	self
		bindKey: SDLK_SPACE
		description: 'Trigger action'
		action: [ "handle spacebar" ].
	super initializeKeybindings
]
```

Run it from the terminal using a headless Pharo VM:
```bash
./pharo Pharo.image eval 'MyGameApp new run'
```

### GPU API: `SDL3GPUDemoApp`
Specializes `SDL3SingleWindowApp` for the SDL3 GPU subsystem (Vulkan, Metal, Direct3D 12):
- Automatically initializes an `SDL_GPUDevice`, claims the window, and configures swapchain parameters for the active pacer via `#applyPacer`.
- Manages command buffer acquisition and submission.
- Delegates swapchain texture acquisition in `#render` to `self pacer acquireSwapchainTextureForWindow: window commandBuffer: commandBuffer into: swapchainTextureHolder`, gracefully skipping frames when `swapchainTextureHolder value isNull` (such as when minimized or when Cooperative mode hits the in-flight frame limit).
- Reuses external value holders to eliminate garbage collection pressure in the rendering hot path.
- Subclasses only need to implement `#doRenderPassesOn: swapchainTexture with: commandBuffer`.

---

## 5. Automated CI Smoke Testing

To verify that applications launch, run, and terminate cleanly without memory leaks or crashes, `SDL3App >> runForSeconds:` is used by the smoke test runner script (`scripts/smokeTestDemos.sh`):

```bash
# Smoke test all demos for a few seconds
./scripts/smokeTestDemos.sh

# Smoke test only GPU demos
./scripts/smokeTestDemos.sh GPU
```
