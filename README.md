# PharoSDL3

[Pharo](https://github.com/pharo-project/pharo) FFI bindings for [SDL (Simple DirectMedia Layer)](https://github.com/libsdl-org/SDL) version 3.0, initially generated with [PharoCIG](https://github.com/pharo-cig/pharo-cig).

SDL is a cross-platform development library designed to provide low-level access to audio, keyboard, mouse, joystick, and graphics hardware. It is used by video playback software, emulators, and games.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Test](https://github.com/pharo-graphics/PharoSDL3/actions/workflows/test.yml/badge.svg)](https://github.com/pharo-graphics/PharoSDL3/actions/workflows/test.yml)

## Installation

### 1. Load the Pharo project

In a Pharo 14 image, evaluate the following Metacello script:

```smalltalk
Metacello new
    baseline: 'SDL3';
    repository: 'github://tinchodias/PharoSDL3:dev/src';
    load
```

Alternatively, from your terminal:
```bash
curl https://get.pharo.org/140+vmLatest | bash
./pharo Pharo.image metacello install --save github://tinchodias/PharoSDL3:dev/src SDL3
```

### 2. Ensure SDL3 library is available

Since end of June/2026, the Pharo 14 **"latest"** VM ships SDL3 for Mac and Windows (not Linux yet). Find below other options to ensure the SDL3 library is available on your system so Pharo's FFI can find it.
- **MacOS:** `brew install sdl3`
- **Linux:** Build from [source](https://github.com/libsdl-org/SDL/blob/main/INSTALL.md) or use your package manager.
- **Windows:** Download the DLL from [SDL releases](https://github.com/libsdl-org/SDL/releases) and place it in the same folder as your Pharo image.


## New OSWindow Drivers

The System Settings provide an option to establish the OSWindow driver. Search for "OSWindow":
![System Settings](./SystemSettings.png)

You can force the driver from an environment variable, from terminal:
1. Download Pharo 14 via zeroconf script as described above
2. Load this project's baseline
3. Save and Close
4. Run in terminal: `PHARO_WINDOW_DRIVER=OSSDL3Driver ./pharo-ui Pharo.image`
5. Verify that `OSWindowDriver current` answers a `OSSDL3Driver`

Other options define the strategy for refreshing the window & VSYNC. The `OSBenchmarkMorph` can show metrics and visuals related to such options.


## Demos & Tests

The project includes automated tests as well as interactive demos. These demos complement automated testing by allowing for human verification of visual rendering and event handling.

**Important:** Pharo's UI and SDL2 (used by default in Pharo 14) conflict with SDL3's subsystems. It is recommended to run SDL3 tests and demos in **headless mode** or ensure proper work.

### Tests

Run tests from the terminal:
```bash
./pharo Pharo.image test 'SDL3-Tests' 'SDL3-GPU-Tests'
```

([This video](https://youtu.be/v812EpMevKQ)) shows how to run `SDL3WindowTest>>#test12ShapedWindow`.

### Demos

You can run any of the following demos by evaluating `./pharo Pharo.image eval '<ClassName> new run'` from terminal. They are listed below from simplest to most advanced:

#### Core API Demos
- `SDL3ClearDemoApp`: The basic "Hello World" of **window management** and rendering clear operations.
- `SDL3LogEventsDemoApp`: Real-time logging of the SDL3 **event stream** (mouse, keyboard, window) to a console.
- `SDL3SystemQueryDemoApp`: Queries system and device properties like **display modes**, **audio drivers**, and **video drivers**.
- `SDL3DisplayDemoApp`: Visualizes logical **display layouts**, hardware specs, and multiple display boundary frontiers.
- `SDL3MouseDemoApp`: Mouse-related functions including **grabbing**, **relative mode**, **window confinement**, **warping**, and **system cursors**.
- `SDL3KeyboardDemoApp`: Low-level keyboard state monitoring (**scancodes**, **keycodes**, **modifiers**) and **Unicode text input**.
- `SDL3WindowChildrenDemoApp`: Parent/child window relationships including **utility**, **tooltip**, **popup menu**, and **modal** behaviors.
- `SDL3AnimatedCursorDemoApp`: Creation and usage of custom **animated cursors** from image frames ([Video](https://youtube.com/shorts/r7KVAxjZ70w?feature=share)).
- `SDL3MultiWindowDemoApp`: Management and update loops for multiple top-level windows simultaneously.
- `SDL3TouchpadDemoApp`: **Multi-touch** finger tracking ([Video](https://youtube.com/shorts/xlDduwDMxZw?feature=share)).
- `SDL3TouchpadZoomDemoApp`: Smooth zooming gestures utilizing complex **touchpad pinch events**.
- `SDL3AudioRecorderDemoApp`: **Audio capture** from the system's default microphone and playback.
- `SDL3CameraDemoApp`: Live frame acquisition from a camera with horizontal mirror support.
- `SDL3TrayMenuDemoApp`: **System tray** integration, including icon management and contextual menus ([Video](https://youtu.be/L6Mw00fW1bE)).
- `SDL3ImageClipboardDemoApp`: **System clipboard** integration for copying and pasting image data.
- `SDL3FolderDialogDemoApp`: Native system **file/folder selection dialogs**.

#### GPU API Demos (Advanced Graphics)
- `SDL3GPUClearDemoApp`: The simplest entry point to the hardware-accelerated GPU API, showing basic **render pass** and **clear color** setup.
- `SDL3GPURenderStateDemoApp`: Simplified use of the **graphics pipeline** via the `SDL_Renderer` API. ([Video](https://www.youtube.com/watch?v=94hMw9pPvBQ))
- `SDL3GPUQuadDemoApp`: Foundations of geometry: rendering a textured quad using **vertex buffers**, **index buffers**, and **UV mapping** ([Video](https://youtube.com/shorts/j4yIu-TdR0o?feature=share)).
- `SDL3GPURoundedRectDemoApp`: Perfectly anti-aliased procedural shapes using **Signed Distance Fields (SDF)** and **fragment shaders** ([Video](https://youtube.com/shorts/fpLCFB_mvW8?feature=share)).
- `SDL3GPUShimmerDemoApp`: Mock UI with a loading effect utilizing **time uniforms** and **procedural shader generation** ([Video](https://youtu.be/GNoRRP7irXs)).
- `SDL3GPUInstancedQuadDemoApp`: High-performance rendering of thousands of objects using **hardware instancing** and **instance buffers**.
- `SDL3TextScrollDemoApp`: Smooth text scrolling of a large file utilizing a **texture atlas** and **instanced quad rendering**.
- `SDL3GPUMandelbrotDemoApp`: Interactive fractal exploration using **compute shaders**, **storage textures**, and dynamic **zoom/pan navigation uniforms**.
- `SDL3GPUBlurComputeDemoApp`: Real-time image processing utilizing **compute shaders**, **storage textures**, and a **Gaussian blur** algorithm.
- `SDL3GPUKawaseBlurDemoApp`: Multi-pass **post-processing** effect demonstrating **ping-pong buffers**, **downsampling/upsampling**, and a **Dual Kawase Blur** ([Video](https://youtu.be/t0MlKdq3KHs)).
- `SDL3GPUBoidsDemoApp`: High-performance **particle system** using a **compute-to-vertex-buffer** architecture for a flocking simulation ([Video](https://www.youtube.com/watch?v=-6wztetR5qg)).
- `SDL3GPUNodeForceDemoApp`: Force-directed graph simulation utilizing **N-body physics** in a **compute shader** ([Video](https://youtube.com/shorts/hl3kqMp0tao?feature=share)).


### Helper Scripts

The project includes shell scripts in `scripts/`:

- **`scripts/smokeTestDemos.sh`**: Runs each demo sequentially for few seconds to verify startup, execution, and clean shutdown without throwing errors or crashing. Collects all results and reports a summary.
  ```bash
  # Run all demos (defaults to ./pharo Pharo.image)
  ./scripts/smokeTestDemos.sh

  # Filter demos by substring (e.g. GPU demos)
  ./scripts/smokeTestDemos.sh GPU

  # Custom Pharo VM/Image path
  ./scripts/smokeTestDemos.sh GPU "./pharo Pharo.image"
  ```

- **`scripts/benchOSWindow.sh`**: Runs `OSBenchmarkMorph` against multiple OSWindow drivers to collect windowing benchmarks.
  ```bash
  # Run benchmarks with default ./pharo-ui Pharo.image
  ./scripts/benchOSWindow.sh

  # Run and record results to a file for comparison
  ./scripts/benchOSWindow.sh | tee -a results.txt

  # Custom Pharo launcher and image
  ./scripts/benchOSWindow.sh "./pharo-ui MyImage.image" | tee -a results.txt
  ```


## Beyond Raw FFI: High-Level Abstractions

While the core FFI layer provides direct bindings to C functions, PharoSDL3 adds object-oriented abstractions that eliminate manual C bookkeeping:

- **Standalone Desktop Applications (`SDL3App`)**: Build and run standalone desktop applications directly from a headless Pharo image, completely independent of Morphic and OSWindow.
- **GPU Pipeline Builder (`SDL3GPUGraphicsPipelineBuilder`)**: Declarative pipeline configuration with vertex struct reflection (`addVertexBufferFor:`) and pre-flight validation preventing native driver crashes.
- **Polymorphic Event Visitor (`TSDL3HierarchicalEventVisitor`)**: Reifies the raw C `SDL_Event` union into 130+ event classes with hierarchical bubbling delegation.
- **Deterministic Scope Disposal (`DiScope`)**: RAII-style ambient LIFO scopes that guarantee clean resource teardown without nested `ensure:` blocks.
- **Reified Domain Entities**: First-class objects for C integer IDs (`SDL3Display`, `SDL3AudioDevice`, `SDL3PropertyGroup`) and typed macro flags (`SDL3MacroDefinedFlag`, `SDL3WindowFlags`).
- **Pharo Interoperability**: Zero-copy surface sharing (`Form >> unownedAsSDL3Surface`) and geometry/color conversions.

### Minimal Standalone App in 10 Lines

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

### In-Depth Documentation

For detailed architectural explanations and guides, see:
- [`doc/Standalone-Applications.md`](./doc/Standalone-Applications.md): Complete guide to `SDL3App`, lifecycle hooks, frame pacing with `SDL3CappedLoop`, and GPU apps.
- [`doc/Architecture-And-OOP-Design.md`](./doc/Architecture-And-OOP-Design.md): In-depth comparison of the raw C FFI baseline against the OOP abstractions (events, builder, domain entities).
- [`doc/GPU-Resource-Mapping.md`](./doc/GPU-Resource-Mapping.md): Ground-truth reference for HLSL descriptor spaces, registers, and transpiler rules.


## Mapping SDL3 Functions to Pharo Methods

The bindings follow a consistent naming convention to map C functions to Pharo methods.

GENERAL TIP: Given a SDL3 C name (e.g. `SDL_` function, struct or constant), in Pharo you can select the string -> open context menu -> "**Code search**" -> "**Method source with it**", and you should find where in the project it is used or defined.

### 1. Raw C API (`SDL3Library`)
The `SDL3Library` class provides direct access to the C API.
- **Prefix Removal:** The `SDL_` prefix is removed.
- **CamelCase:** The first letter of the function name is lowercased.
- **Keywords:** Function parameters are converted into Pharo keywords.
- **Argument Naming:** Arguments are named using `camelCase` (e.g., `numThreads` instead of `num_threads`).

**Examples:**
- `SDL_Init(flags)` maps to `SDL3Library >> init: flags`
- `SDL_CreateWindow(title, w, h, flags)` maps to `SDL3Library >> createWindowTitle:w:h:flags:`

### 2. Object-Oriented API (Instance-Side Methods)

Key classes like `SDL3Window`, `SDL3Renderer`, `SDL3Surface`, and `SDL3GPUDevice` provide idiomatic Smalltalk methods.

- **Accessors:** Getter and setter functions are converted to Smalltalk-style accessors by omitting the `Get` and `Set` prefixes.
  - `SDL_GetWindowFlags(window)` maps to `SDL3Window >> flags`
  - `SDL_SetWindowBordered(window, bordered)` maps to `SDL3Window >> bordered: bordered`
- **Output Parameters (Into):** When a function returns values via pointers (output parameters), the Pharo method typically uses the `Into` keyword in the selector.
  - `SDL_GetWindowSize(window, &w, &h)` maps to `SDL3Window >> getSizeIntoW: w h: h`
  - `SDL_GetRenderClipRect(renderer, &rect)` maps to `SDL3Renderer >> getRenderClipRectInto: rect`
- **Argument Naming:** Just like in the raw API, all arguments use `camelCase`.
- **Internal Assertions:** These methods internally perform success assertions, and signal `SDL3Error` if something was wrong in a SDL3 C function call.

You can explore all available functions in the `SDL3Library` class or by browsing the object classes.

### 3. Instance Creation ("Unowned" Methods)

These key classes also provide class-side and factory methods for creating or opening SDL resources.

- **Explicit Ownership:** Methods prefixed with `unownedNew`, `unownedOpen`, `unownedAs...`, or `unownedCopy...` signal that the **sender is responsible** for disposing the object (e.g., sending `dispose`, `destroy`, `close`, `end`, or `release`).
- **Internal Assertions:** These methods verify return values and signal `SDL3Error` on failure.

**Examples:**
- `SDL3Window unownedNewTitle: 'title' width: 800 height: 600 flags: 0`
- `SDL3Joystick unownedOpen: 0`
- `SDL3PropertyGroup unownedNew`


## License

This project is licensed under the [MIT license](./LICENSE).
