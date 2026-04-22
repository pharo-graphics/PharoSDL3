# PharoSDL3

Pharo Smalltalk bindings for [SDL3 (Simple DirectMedia Layer)](https://github.com/libsdl-org/SDL).

SDL3 is a cross-platform development library designed to provide low-level access to audio, keyboard, mouse, joystick, and graphics hardware. It is used by video playback software, emulators, and games.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

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
curl https://get.pharo.org/140+vm | bash
./pharo Pharo.image metacello install --save github://tinchodias/PharoSDL3:dev/src SDL3
```

### 2. Install the SDL3 library

Ensure the SDL3 library is available on your system so Pharo's FFI can find it.
- **macOS:** `brew install sdl3`
- **Linux:** Build from [source](https://github.com/libsdl-org/SDL/blob/main/INSTALL.md) or use your package manager.
- **Windows:** Download the DLL from [SDL releases](https://github.com/libsdl-org/SDL/releases) and place it in the same folder as your Pharo image.


## Demos & Tests

The project includes automated tests as well as interactive demos. These demos complement automated testing by allowing for human verification of visual rendering and event handling.

Available demos:
- **Basic Windows:** `SDL3Demo example01MultipleWindows`
- **Events & Input:** `SDL3Demo example04HandleEvents`
- **System Tray:** `SDL3Demo example08TrayMenu`
- **GPU Rendering:** `SDL3GPURenderStateDemo run` ([Video](https://www.youtube.com/watch?v=94hMw9pPvBQ))

**Important:** Pharo's UI and SDL2 (used by the Pharo VM) may conflict with SDL3's event loop in some environments. It is recommended to run SDL3 applications in **headless mode** or ensure proper event handling.

To run tests from the terminal:
```bash
./pharo Pharo.image test 'SDL3-Tests'
```

## Mapping SDL3 Functions to Pharo Methods

The bindings follow a consistent naming convention to map C functions to Pharo methods.

### 1. Low-level API (LibSDL3)
The `LibSDL3` class provides direct access to the C API.
- **Prefix Removal:** The `SDL_` prefix is removed.
- **CamelCase:** The first letter of the function name is lowercased.
- **Keywords:** Function parameters are converted into Pharo keywords.

You can browse [a mapping table](../../wiki/Low%E2%80%90level-API) in our wiki with a complete mapping from SDL functions to each Pharo method in `LibSDL3`.

**Examples:**
- `SDL_Init(flags)` maps to `LibSDL3 >> init: flags`
- `SDL_CreateWindow(title, w, h, flags)` maps to `LibSDL3 >> newWindowTitle:w:h:flags:`

### 2. High-level API (Convenience Methods)
Object-oriented classes like `SDL3Window` and `SDL3Renderer` provide more idiomatic Smalltalk methods.

- **Accessors:** Getter and setter functions are converted to Smalltalk-style accessors by omitting the `Get` and `Set` prefixes.
  - `SDL_GetWindowFlags(window)` maps to `SDL3Window >> flags`
  - `SDL_SetWindowBordered(window, bordered)` maps to `SDL3Window >> bordered: bordered`
- **Output Parameters (Into):** When a function returns values via pointers (output parameters), the Pharo method typically uses the `Into` keyword in the selector.
  - `SDL_GetWindowSize(window, &w, &h)` maps to `SDL3Window >> getSizeIntoW:w h:h`
  - `SDL_GetRenderClipRect(renderer, &rect)` maps to `SDL3Renderer >> getRenderClipRectInto: rect`

You can explore all available functions in the `LibSDL3` class or by browsing the object classes. The tables in [our wiki page](../../wiki/High%E2%80%90level-API) can help, as well.

## More Information

* **Is this code generated?** Yes, it was initially generated with [CIG](https://github.com/estebanlm/pharo-cig) and post-processed manually. 
* **Wiki:** Check the [project wiki](../../wiki) for post-processing details and technical documentation.

## License

This project is licensed under the [MIT license](./LICENSE).
