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

Build SDL3 and make the lib findable by the Pharo's FFI finder. For example, put it together with the Pharo image install it on your system (e.g. Mac's homebrew).
Build steps here: https://wiki.libsdl.org/SDL3/Installation

## License

This code is licensed under the [MIT license](./LICENSE).
