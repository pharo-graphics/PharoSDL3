# Pharo bindings for SDL3

[Simple DirectMedia Layer (SDL)](https://github.com/libsdl-org/SDL) is a cross-platform development library designed to provide low level access to audio, keyboard, mouse, joystick, and graphics hardware. It is used by video playback software, emulators, and popular games including Valve's award winning catalog and many Humble Bundle games.


## Install

Download a Pharo 12/13/14 and evaluate:

```smalltalk
Metacello new
        baseline: 'SDL3';
        repository: 'github://tinchodias/PharoSDL3:master/src';
        load
```
An alternative way to download a Pharo image and load this project is running the following commands in a bash terminal:
```bash
$ curl https://get.pharo.org/130+vm | bash
$ ./pharo Pharo.image metacello install github://tinchodias/PharoSDL3:master/src BaselineOfSDL3
```

### Get the library

Follow the [install instructions](https://github.com/libsdl-org/SDL/blob/main/INSTALL.md) and make the lib findable by the Pharo's FFI finder. 
* On Linux, you can download the sources and then build and install using CMake.
* On Mac, you can use [homebrew](https://formulae.brew.sh/formula/sdl3) to install it on the system.
* On Windows, you can [download it](https://github.com/libsdl-org/SDL/releases) and place it together with the Pharo image.


## Execution

We count with tests that do FFI calls and assert on the resulting code, but "demos" complement testing with human interaction. Some features require visually checking that rendering is correctly done, as well as interacting via mouse and keyboard to check events are correctly handled.

Both **Tests and demos** need to run in **headless mode** Pharo due to conflicts with SDL2, otherwise. Run instructions often assume you downloaded Pharo via zeroconf scripts, but you can adapt them.

**Tests** are located in the `'SDL3-Tests'` package, so they can be executed from terminal: `./pharo Pharo.image test 'SDL3-Tests'`. Follow instructions in class-side of [LibSDL3VideoTest](https://github.com/pharo-graphics/PharoSDL3/blob/master/src/SDL3-Tests/LibSDL3VideoTest.class.st) to enable a wait before closing each video test so you have some seconds to see what happens.

**Demos** can be found in:
- Class-side of [`SDL3Demo`](https://github.com/pharo-graphics/PharoSDL3/blob/master/src/SDL3-Tests/SDL3Demo.class.st) (several demos)
- [`SDL3GPURenderStateDemo>>run`](https://github.com/pharo-graphics/PharoSDL3/blob/master/src/SDL3-Tests/SDL3GPURenderStateDemo.class.st) ([video](https://www.youtube.com/watch?v=94hMw9pPvBQ)).

## More information

* **Is this code generated?** Yes, it was initially generated with [CIG](https://github.com/estebanlm/pharo-cig) and post-processed manually. Check [this wiki page](../../wiki) for our post-processing and other details.
* **What's the selector for each function?** **(OUTDATED)** [This table](https://github.com/pharo-graphics/PharoSDL3/wiki/Table-of-C-Function-and-Pharo-Selector) shows the Pharo selector for each SDL3 function in this project.


## License

This code is licensed under the [MIT license](./LICENSE).
