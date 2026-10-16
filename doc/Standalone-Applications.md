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
- **`setUp`**: Executed immediately before the main loop begins. Ideal for opening windows, compiling pipelines, and loading textures. All resources registered with `DiScope own:` are retained during execution.
- **`step`**: Executed once per frame. Use this hook for simulation updates, input handling responses, and rendering.
- **`tearDown`**: Pre-cleanup hook executed when the loop terminates, just before scoped resources are sent `#dispose`.
- **Automatic Initialization and Shutdown**: Guaranteed `#sdlInit` and `#sdlQuit` calls wrapped in `ensure:` blocks.

### Execution Modes
- **`run`**: Synchronous execution on the active thread. This mode is required on macOS, where the operating system mandates that windowing and event polling occur on the main OS thread.
- **`runForSeconds: aNumber`**: Runs the application for a fixed duration and then requests termination. Used for automated smoke testing in CI environments without requiring user interaction.

---

## 3. Frame Pacing and Main Loop (`SDL3CappedLoop`)

The application loop is driven by `SDL3CappedLoop`:

- **Frame Rate Capping**: Targets 60 Hz by default (`hertz: 60`). It measures microsecond deltas between frames and yields spare time to the Pharo VM via `Delay`, preventing CPU starvation.
- **Session Safety**: Checks `Smalltalk session ~~ session` on each iteration to cleanly stop execution if the image is saved or restarted.
- **Integrated Event Polling**: On every iteration, events are polled from `SDL3Library`, converted to `SDL3MappedEvent` instances via `SDL3EventMap`, and dispatched to the application using `#accept: self`.
- **Default Handlers**: Built-in handling for `SDL_EVENT_QUIT` and the `ESCAPE` key requests loop termination gracefully.

---

## 4. Application Hierarchies and Example

PharoSDL3 provides two main abstract application classes depending on the rendering technology:

### 2D Rendering: `SDL3SingleWindowApp`
Specializes `SDL3App` for applications using the `SDL_Renderer` API. It automates window creation with configurable extent (`initialExtent`), window flags (`initialWindowFlags`), dynamic window title updating, and window close event handling.

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

MyGameApp >> visitKeyboardDownEvent: anEvent [
	anEvent key = SDLK_SPACE asInteger ifTrue: [ "handle spacebar" ].
	^ super visitKeyboardDownEvent: anEvent
]
```

Run it from the terminal using a headless Pharo VM:
```bash
./pharo Pharo.image eval 'MyGameApp new run'
```

### GPU API: `SDL3GPUDemoApp`
Specializes `SDL3SingleWindowApp` for the SDL3 GPU subsystem (Vulkan, Metal, Direct3D 12):
- Automatically initializes an `SDL_GPUDevice` and claims the window.
- Manages command buffer acquisition and submission.
- Handles non-blocking swapchain texture acquisition (`acquireSwapchainTextureForWindow:into:width:height:`), gracefully skipping frames when minimized or when the GPU is saturated.
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
