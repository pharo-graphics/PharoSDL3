# Frame Pacing and VSync in PharoSDL3

`SDL3CappedLoop` and `OSSDL3GPUDriver` regulate the execution rate of application and window event loops in PharoSDL3.

This document explains why software pacing is essential in Pharo, how progressive deadline scheduling works, and how it collaborates with hardware VSync.

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

## 3. Interaction with Hardware VSync

Hardware VSync synchronizes buffer swapping with the physical monitor refresh (`SDL3CappedLoop >> #syncToWindow:` can also query a window's display refresh rate automatically, falling back to 60 Hz). Software pacing and hardware VSync complement each other:

1. **Target Matches Refresh Rate (e.g., 60 Hz target on a 60 Hz or 120 Hz display)**
   The software loop sleeps for most of the spare time, letting background Pharo processes run. When it resumes, the GPU presents the frame cleanly on the vertical blank interval without tearing.

2. **Display Slower Than Target (e.g., 60 Hz target on a 30 Hz display or heavy GPU workload)**
   When the frame takes longer than the target period, the remaining spare time is zero or negative. The loop skips the software delay entirely, staying naturally locked to the hardware pace.

3. **Non-Multiple Refresh Rate (e.g., 60 Hz target on a 144 Hz display)**
   Frames alternate smoothly between 2 and 3 refresh cycles (a standard cadence). Progressive deadlines ensure that timing error does not accumulate over time.

4. **Hardware Clock Drift (e.g., 59.94 Hz display vs 60.00 Hz system clock)**
   Physical display crystal oscillators never tick at the exact same rate as the CPU clock. Progressive deadline pacing absorbs minor sub-millisecond drift without stutter.

---

## 4. Pluggable Collaborator Hooks

`SDL3CappedLoop` provides four pluggable blocks for customization and testing:

- **`stepBlock`**: Receives the nominal frame period in microseconds (`deltaUS`) and performs the frame update/render (defaults to `[ :deltaUS | ]`).
- **`microsecondsBlock`**: Answers the current time in microseconds (defaults to `[ Time microsecondClockValue ]`).
- **`delayBlock`**: Receives remaining spare microseconds to pause when >= 1ms (defaults to `[ :microseconds | (Delay forMilliseconds: microseconds // 1000) wait ]`).
- **`yieldBlock`**: Cooperatively yields execution when spare time is positive but under 1 ms (defaults to `[ Processor yield ]`).

In unit tests, these blocks allow simulating multi-frame scenarios instantly without actual wall-clock pauses.
