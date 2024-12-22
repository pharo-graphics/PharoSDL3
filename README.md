# Pharo bindings for SDL3

Simple DirectMedia Layer (SDL) is a cross-platform development library designed to provide low level access to audio, keyboard, mouse, joystick, and graphics hardware. It is used by video playback software, emulators, and popular games including Valve's award winning catalog and many Humble Bundle games.

Links:
* https://www.libsdl.org/
* https://github.com/libsdl-org/SDL

These Pharo bindings were generated with https://github.com/estebanlm/pharo-cig

## Install

```smalltalk
Metacello new
        baseline: 'SDL3';
        repository: 'github://tinchodias/SDL3:master/src';
        load
```

## License

This code is licensed under the [MIT license](./LICENSE).
