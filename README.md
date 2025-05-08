# Pharo bindings for SDL3

[Simple DirectMedia Layer (SDL)](https://github.com/libsdl-org/SDL) is a cross-platform development library designed to provide low level access to audio, keyboard, mouse, joystick, and graphics hardware. It is used by video playback software, emulators, and popular games including Valve's award winning catalog and many Humble Bundle games.


## Install

In Pharo 12/13/14:

```smalltalk
Metacello new
        baseline: 'SDL3';
        repository: 'github://tinchodias/PharoSDL3:master/src';
        load
```

[Build SDL3](https://github.com/libsdl-org/SDL/blob/main/INSTALL.md) and make the lib findable by the Pharo's FFI finder. 
* On Linux, you can download the sources and then build and install using CMake.
* On Mac, you can use homebrew to install it on the system.
* On Windows, you can [download it](https://github.com/libsdl-org/SDL/releases) and place it together with the Pharo image.


## More information

* **Demos and tests?** They are located in the 'SDL3-Tests' package. Check class-side of `SDL3Demo` for instructions to execute from a headless Pharo. The instructions assume you got Pharo with zeroconf scripts, but you can adapt them otherwise. Important: Currently, there are conflicts with Pharo's SDL2 if you execute from the GUI, but some calls work anyway.
* **Is this code generated?** Yes, it was initially generated with [CIG](https://github.com/estebanlm/pharo-cig) and post-processed manually. Check [this wiki page](../../wiki) for our post-processing and other details.
* **What's the selector for each function?** [This table](https://github.com/pharo-graphics/PharoSDL3/wiki/Table-of-C-Function-and-Pharo-Selector) shows the Pharo selector for each SDL3 function in this project.


## License

This code is licensed under the [MIT license](./LICENSE).
