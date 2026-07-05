"
I am a OSWindow driver that uses the low-level GPU API of SDL3 to create window Form renderer.
"
Class {
	#name : 'OSSDL3GPUDriver',
	#superclass : 'OSSDL3Driver',
	#instVars : [
		'gpuDevice',
		'lastUS'
	],
	#category : 'SDL3-OSWindow-Core',
	#package : 'SDL3-OSWindow',
	#tag : 'Core'
}
