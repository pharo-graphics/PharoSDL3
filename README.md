# Pharo bindings for SDL3

Simple DirectMedia Layer (SDL) is a cross-platform development library designed to provide low level access to audio, keyboard, mouse, joystick, and graphics hardware. It is used by video playback software, emulators, and popular games including Valve's award winning catalog and many Humble Bundle games.

Links:
* https://www.libsdl.org/
* https://github.com/libsdl-org/SDL

These Pharo bindings were generated with https://github.com/estebanlm/pharo-cig

For details on SDL3 version and other details, check [this wiki page](../../wiki).

## Install

In Pharo 12:

```smalltalk
Metacello new
        baseline: 'SDL3';
        repository: 'github://tinchodias/PharoSDL3:master/src';
        load
```

Build SDL3 and make the lib findable by the Pharo's FFI finder. 
* On Mac, you can use homebrew to install it on the system.
* On Windows, you can [download it](https://github.com/libsdl-org/SDL/releases) and place it together with the Pharo image.

## License

This code is licensed under the [MIT license](./LICENSE).
