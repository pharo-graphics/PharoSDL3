# Frame Pacing and VSync in PharoSDL3

`SDL3CappedLoop` and `OSSDL3GPUDriver` regulate the execution rate of application and window event loops in PharoSDL3.

This document explains why software pacing matters in Pharo, how progressive deadline scheduling works, why C-level VSync conflicts with a software deadline clock, and how `PharoSDL3` separates cooperative pacing from hardware VSync.

---

## 1. Why Software Pacing Matters in Pharo

In typical games and native apps, an uncapped loop burns 100% of a CPU core running as fast as possible. But in Pharo Smalltalk, there is an even more important reason to pace loops carefully: **process concurrency**.

Smalltalk processes run cooperatively on the Pharo VM thread. If a rendering loop delegates frame pacing entirely to a blocking C-level call (like a driver waiting for VSync):
- The entire VM OS thread is blocked.
- Background Smalltalk processes (UI updates, network sockets, worker tasks) are starved of CPU time.

By calculating remaining spare time and calling `(Delay forMilliseconds: ...) wait`, the loop yields control to the Pharo process scheduler. Other Smalltalk processes can execute freely during the idle headroom between frames.

---

## 2. Progressive Deadline Scheduling

### The Pitfall of Relative Elapsed Deltas
A naive loop measures how long the current frame took and sleeps for the remainder:

```text
sleepTime = targetPeriod - (currentTime - previousTime)
```

In practice, OS sleeps are not perfectly exact: a 14 ms sleep might wake up after 14.8 ms. If the loop simply measures relative time from that late wakeup, the error accumulates every frame, leading to micro-stutter and frame rate drift.

### The Solution: Scheduling Against an Absolute Deadline
Instead of measuring relative intervals, `SDL3CappedLoop` schedules against a progressive target time:

```text
nextDeadline = nextDeadline + targetPeriod
spareTime = nextDeadline - currentTime
```

- If a frame finishes slightly early or the sleep wakes up slightly late, the next frame naturally compensates.
- The average frame rate remains locked to the target without drift.
- **Lag Clamp**: If a large interruption occurs (such as window dragging or a garbage collection pause), the deadline resets forward so the loop does not run a burst of zero-wait frames trying to catch up.

---

## 3. Hardware VSync vs. Cooperative Software Pacing

### Why C-Level VSync Blocks the Single-Threaded Pharo VM
Because Pharo runs all Smalltalk `Process`es cooperatively on one OS thread, any blocking FFI call inside SDL3 pauses the entire VM until the call returns. Notably, calling `SDL_AcquireGPUSwapchainTexture` (`block = false`) does **not** avoid VSync blocking across backends:
- `block = false` only controls whether SDL3 waits on the *GPU render-completion fence* (`QueryFence` vs `WaitForFences`). When GPU passes finish quickly (`< 1 ms`), that fence is already signaled and SDL3 proceeds to acquire or present the swapchain image.
- Under `SDL_GPU_PRESENTMODE_VSYNC` (and `SDL_SetRenderVSync(renderer, 1)`), SDL3 still blocks on hardware VBlank once the swapchain queue fills up:
  - **macOS (Metal)**: `[CAMetalLayer nextDrawable]` blocks inside `acquireSwapchainTexture` when all 3 drawables are queued.
  - **Linux X11 / Wayland (Vulkan)**: `vkAcquireNextImageKHR` (called with timeout `SDL_MAX_UINT64`) or `vkQueuePresentKHR` (`VK_PRESENT_MODE_FIFO_KHR`) blocks on VBlank.
  - **Windows (D3D12)**: `IDXGISwapChain_Present` with `syncInterval = 1` blocks once the DXGI flip queue is full.

### The "Two Master Clocks" Conflict
Running a progressive software deadline (`nextDeadlineUS := nextDeadlineUS + periodUS`) at the same period as hardware VSync makes two independent clocks compete:
1. **1 ms `Delay` truncation**: Because `(Delay forMilliseconds: spareUS // 1000) wait` truncates sub-millisecond remainders, software pacing gradually advances ahead of VBlank until the swapchain queue fills up, at which point C blocks until VBlank, leaving `spareUS <= 0` and locking the VM into C-side VSync waits.
2. **Phase splitting & beat-frequency stutters**: Startup phase offset between the software deadline and VBlank splits waiting arbitrarily between Smalltalk `Delay` and C VBlank, and any late wakeup across a VBlank boundary causes an occasional `2 * period` drop.

### Reified Frame Pacers (`SDL3FramePacer`)
`SDL3CappedLoop` delegates waiting and presentation configuration to a polymorphic `SDL3FramePacer`:

- **`SDL3CooperativePacer`** *(default for `SDL3CappedLoop`)*:
  - Configures 2D renderers with `renderVsync: 0` and GPU swapchains with `MAILBOX` falling back to `IMMEDIATE`, and uses `acquireSwapchainTextureForWindow:into:width:height:`.
  - Paces frames in Smalltalk via `SDL3CappedLoop >> #waitUntilNextDeadlineFrom:` so background Smalltalk `Process`es remain scheduled during `Delay wait` (or `Processor yield` under 1 ms).
- **`SDL3VSyncPacer`** *(default for standalone `SDL3SingleWindowApp` demos; toggleable at runtime with `[V]`)*:
  - Configures 2D renderers with `renderVsync: 1` and GPU swapchains with `VSYNC`, and uses `waitAndAcquireSwapchainTextureForWindow:into:width:height:` for tear-free presentation.
  - Calls `SDL3CappedLoop >> #waitIfUnthrottledFrom:`, which avoids running a competing software deadline clock: it invokes `yieldBlock` (`Processor yield`) after VSync-blocked frames and only sleeps via `delayBlock` when a frame completes in under 1 ms without blocking (e.g., when the window is minimized).

### Non-Blocking Defaults in `SDL3-OSWindow`
Unlike standalone visual demos, IDE/Morphic windows driven by `OSSDL3Driver` and `OSSDL3GPUDriver` must keep the Pharo UI and background processes responsive:
- `OSSDL3SystemSettings class >> #gpuPresentMode` defaults to `2` (`Mailbox`, tear-free and non-blocking on Vulkan/D3D12), and `OSSDL3GPUFormRenderer >> #initializeSwapchainParameters` falls back to `Immediate` before `VSync` when `Mailbox` is unsupported (such as on macOS Metal).
- `OSSDL3SystemSettings class >> #rendererVsync` defaults to `0` (`Disabled`), and `OSSDL3FormRenderer >> #initializeVsync` falls back to `0` if setting the configured VSync mode fails.

---

## 4. Pluggable Collaborator Hooks

`SDL3CappedLoop` delegates pacing policy to its `pacer` (`SDL3CooperativePacer` or `SDL3VSyncPacer`) and provides four pluggable blocks for customization and deterministic testing:

- **`stepBlock`**: Receives the measured, lag-clamped elapsed frame delta in microseconds (`deltaUS`, clamped to `maxDeltaUS`; zero-argument blocks are also supported via `cull:`) and performs the frame update/render (defaults to `[ :deltaUS | ]`).
- **`microsecondsBlock`**: Answers the current time in microseconds (defaults to `[ Time microsecondClockValue ]`).
- **`delayBlock`**: Receives remaining spare microseconds to pause when sleeping (defaults to `[ :microseconds | (Delay forMilliseconds: microseconds // 1000) wait ]`).
- **`yieldBlock`**: Cooperatively yields execution when not sleeping on a `Delay` (defaults to `[ Processor yield ]`).

In unit tests, these blocks allow simulating multi-frame scenarios and both frame pacers instantly without wall-clock pauses.
