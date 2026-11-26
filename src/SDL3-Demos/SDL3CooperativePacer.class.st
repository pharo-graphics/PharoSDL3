"
I pace frames cooperatively in Smalltalk using progressive deadlines in `SDL3CappedLoop`.

I configure SDL3 renderers and GPU swapchains to avoid blocking on hardware VBlank (`renderVsync: 0`, and `MAILBOX` falling back to `IMMEDIATE`) so the single-threaded Pharo VM remains free to schedule other `Process`es during `Delay wait`.
"
Class {
	#name : 'SDL3CooperativePacer',
	#superclass : 'SDL3FramePacer',
	#category : 'SDL3-Demos-Base',
	#package : 'SDL3-Demos',
	#tag : 'Base'
}

{ #category : 'gpu' }
SDL3CooperativePacer >> acquireSwapchainTextureForWindow: aWindow commandBuffer: aCommandBuffer into: aTextureHolder [

	aCommandBuffer
		acquireSwapchainTextureForWindow: aWindow
		into: aTextureHolder
		width: nil
		height: nil
]

{ #category : 'gpu' }
SDL3CooperativePacer >> configureGPUDevice: aGPUDevice window: aWindow [

	self preferredPresentModes
		detect: [ :mode |
			aGPUDevice
				windowSupportsGPUPresentModeWindow: aWindow
				presentMode: mode ]
		ifFound: [ :mode |
			aGPUDevice
				gpuSwapchainParametersWindow: aWindow
				swapchainComposition: SDL3GPUSwapchainComposition sdr
				presentMode: mode ]
]

{ #category : 'renderer' }
SDL3CooperativePacer >> configureRenderer: aRenderer [

	aRenderer renderVsync: 0
]

{ #category : 'accessing' }
SDL3CooperativePacer >> name [

	^ 'Cooperative (Smalltalk Delay, non-blocking C)'
]

{ #category : 'gpu' }
SDL3CooperativePacer >> preferredPresentModes [

	^ {
		SDL3GPUPresentMode mailbox.
		SDL3GPUPresentMode immediate
	}
]

{ #category : 'accessing' }
SDL3CooperativePacer >> shortName [

	^ 'Cooperative'
]

{ #category : 'converting' }
SDL3CooperativePacer >> toggled [

	^ SDL3VSyncPacer new
]

{ #category : 'pacing' }
SDL3CooperativePacer >> waitOnLoop: aLoop at: currentUS [

	aLoop waitUntilNextDeadlineFrom: currentUS
]
