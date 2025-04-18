# Pharo bindings for SDL3

[Simple DirectMedia Layer (SDL)](https://github.com/libsdl-org/SDL) is a cross-platform development library designed to provide low level access to audio, keyboard, mouse, joystick, and graphics hardware. It is used by video playback software, emulators, and popular games including Valve's award winning catalog and many Humble Bundle games.


## Install

In Pharo 12/13:

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

* **Demos and tests?** Browse the 'SDL3-Tests' package
* **How were they generated?** These Pharo bindings were generated with https://github.com/estebanlm/pharo-cig . Check [this wiki page](../../wiki) for our post-processing and other details.
* **What's the selector for each function?** [This table](https://github.com/pharo-graphics/PharoSDL3/wiki/Table-of-C-Function-and-Pharo-Selector) shows the Pharo selector for each SDL3 function in this project.


## License

This code is licensed under the [MIT license](./LICENSE).
