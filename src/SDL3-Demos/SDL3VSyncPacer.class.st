"
I delegate frame pacing to hardware VSync in SDL3 for tear-free presentation.

I configure renderers and GPU swapchains for `VSYNC` and use `waitAndAcquireSwapchainTextureForWindow:into:width:height:`. On a single-threaded Pharo VM, hardware VBlank waits block the VM thread in C; `SDL3CappedLoop` avoids running a competing software deadline and only applies a fallback sleep if a frame completes without blocking (such as when a window is minimized).
"
Class {
	#name : 'SDL3VSyncPacer',
	#superclass : 'SDL3FramePacer',
	#category : 'SDL3-Demos-Base',
	#package : 'SDL3-Demos',
	#tag : 'Base'
}

{ #category : 'gpu' }
SDL3VSyncPacer >> acquireSwapchainTextureForWindow: aWindow commandBuffer: aCommandBuffer into: aTextureHolder [

	aCommandBuffer
		waitAndAcquireSwapchainTextureForWindow: aWindow
		into: aTextureHolder
		width: nil
		height: nil
]

{ #category : 'gpu' }
SDL3VSyncPacer >> configureGPUDevice: aGPUDevice window: aWindow [

	aGPUDevice
		gpuSwapchainParametersWindow: aWindow
		swapchainComposition: SDL3GPUSwapchainComposition sdr
		presentMode: SDL3GPUPresentMode vsync
]

{ #category : 'renderer' }
SDL3VSyncPacer >> configureRenderer: aRenderer [

	aRenderer renderVsync: 1
]

{ #category : 'accessing' }
SDL3VSyncPacer >> name [

	^ 'Hardware VSync (tear-free, blocks VM in C)'
]

{ #category : 'accessing' }
SDL3VSyncPacer >> shortName [

	^ 'VSync'
]

{ #category : 'converting' }
SDL3VSyncPacer >> toggled [

	^ SDL3CooperativePacer new
]

{ #category : 'pacing' }
SDL3VSyncPacer >> waitOnLoop: aLoop at: currentUS [

	aLoop waitIfUnthrottledFrom: currentUS
]
