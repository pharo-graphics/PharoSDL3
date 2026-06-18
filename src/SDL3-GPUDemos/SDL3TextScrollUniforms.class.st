Class {
	#name : 'SDL3TextScrollUniforms',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_COLOR10A',
		'OFFSET_COLOR10B',
		'OFFSET_COLOR10G',
		'OFFSET_COLOR10R',
		'OFFSET_COLOR11A',
		'OFFSET_COLOR11B',
		'OFFSET_COLOR11G',
		'OFFSET_COLOR11R',
		'OFFSET_COLOR12A',
		'OFFSET_COLOR12B',
		'OFFSET_COLOR12G',
		'OFFSET_COLOR12R',
		'OFFSET_COLOR13A',
		'OFFSET_COLOR13B',
		'OFFSET_COLOR13G',
		'OFFSET_COLOR13R',
		'OFFSET_COLOR14A',
		'OFFSET_COLOR14B',
		'OFFSET_COLOR14G',
		'OFFSET_COLOR14R',
		'OFFSET_COLOR15A',
		'OFFSET_COLOR15B',
		'OFFSET_COLOR15G',
		'OFFSET_COLOR15R',
		'OFFSET_COLOR16A',
		'OFFSET_COLOR16B',
		'OFFSET_COLOR16G',
		'OFFSET_COLOR16R',
		'OFFSET_COLOR1A',
		'OFFSET_COLOR1B',
		'OFFSET_COLOR1G',
		'OFFSET_COLOR1R',
		'OFFSET_COLOR2A',
		'OFFSET_COLOR2B',
		'OFFSET_COLOR2G',
		'OFFSET_COLOR2R',
		'OFFSET_COLOR3A',
		'OFFSET_COLOR3B',
		'OFFSET_COLOR3G',
		'OFFSET_COLOR3R',
		'OFFSET_COLOR4A',
		'OFFSET_COLOR4B',
		'OFFSET_COLOR4G',
		'OFFSET_COLOR4R',
		'OFFSET_COLOR5A',
		'OFFSET_COLOR5B',
		'OFFSET_COLOR5G',
		'OFFSET_COLOR5R',
		'OFFSET_COLOR6A',
		'OFFSET_COLOR6B',
		'OFFSET_COLOR6G',
		'OFFSET_COLOR6R',
		'OFFSET_COLOR7A',
		'OFFSET_COLOR7B',
		'OFFSET_COLOR7G',
		'OFFSET_COLOR7R',
		'OFFSET_COLOR8A',
		'OFFSET_COLOR8B',
		'OFFSET_COLOR8G',
		'OFFSET_COLOR8R',
		'OFFSET_COLOR9A',
		'OFFSET_COLOR9B',
		'OFFSET_COLOR9G',
		'OFFSET_COLOR9R',
		'OFFSET_SCROLLOFFSETX',
		'OFFSET_SCROLLOFFSETY',
		'OFFSET_VIEWPORTHEIGHT',
		'OFFSET_VIEWPORTWIDTH'
	],
	#category : 'SDL3-GPUDemos-TextScroll',
	#package : 'SDL3-GPUDemos',
	#tag : 'TextScroll'
}

{ #category : 'field definition' }
SDL3TextScrollUniforms class >> fieldsDesc [
	<script: 'self rebuildFieldAccessors'>

	^ #(
	float scrollOffsetX;
	float scrollOffsetY;
	float viewportWidth;
	float viewportHeight;
	float color1R;
	float color1G;
	float color1B;
	float color1A;
	float color2R;
	float color2G;
	float color2B;
	float color2A;
	float color3R;
	float color3G;
	float color3B;
	float color3A;
	float color4R;
	float color4G;
	float color4B;
	float color4A;
	float color5R;
	float color5G;
	float color5B;
	float color5A;
	float color6R;
	float color6G;
	float color6B;
	float color6A;
	float color7R;
	float color7G;
	float color7B;
	float color7A;
	float color8R;
	float color8G;
	float color8B;
	float color8A;
	float color9R;
	float color9G;
	float color9B;
	float color9A;
	float color10R;
	float color10G;
	float color10B;
	float color10A;
	float color11R;
	float color11G;
	float color11B;
	float color11A;
	float color12R;
	float color12G;
	float color12B;
	float color12A;
	float color13R;
	float color13G;
	float color13B;
	float color13A;
	float color14R;
	float color14G;
	float color14B;
	float color14A;
	float color15R;
	float color15G;
	float color15B;
	float color15A;
	float color16R;
	float color16G;
	float color16B;
	float color16A;
	)
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color10A [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR10A
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color10A: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR10A put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color10B [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR10B
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color10B: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR10B put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color10G [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR10G
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color10G: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR10G put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color10R [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR10R
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color10R: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR10R put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color11A [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR11A
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color11A: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR11A put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color11B [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR11B
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color11B: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR11B put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color11G [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR11G
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color11G: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR11G put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color11R [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR11R
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color11R: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR11R put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color12A [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR12A
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color12A: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR12A put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color12B [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR12B
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color12B: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR12B put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color12G [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR12G
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color12G: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR12G put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color12R [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR12R
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color12R: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR12R put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color13A [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR13A
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color13A: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR13A put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color13B [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR13B
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color13B: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR13B put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color13G [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR13G
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color13G: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR13G put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color13R [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR13R
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color13R: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR13R put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color14A [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR14A
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color14A: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR14A put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color14B [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR14B
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color14B: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR14B put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color14G [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR14G
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color14G: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR14G put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color14R [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR14R
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color14R: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR14R put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color15A [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR15A
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color15A: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR15A put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color15B [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR15B
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color15B: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR15B put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color15G [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR15G
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color15G: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR15G put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color15R [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR15R
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color15R: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR15R put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color16A [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR16A
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color16A: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR16A put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color16B [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR16B
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color16B: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR16B put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color16G [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR16G
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color16G: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR16G put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color16R [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR16R
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color16R: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR16R put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color1A [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR1A
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color1A: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR1A put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color1B [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR1B
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color1B: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR1B put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color1G [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR1G
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color1G: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR1G put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color1R [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR1R
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color1R: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR1R put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color2A [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR2A
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color2A: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR2A put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color2B [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR2B
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color2B: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR2B put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color2G [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR2G
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color2G: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR2G put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color2R [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR2R
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color2R: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR2R put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color3A [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR3A
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color3A: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR3A put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color3B [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR3B
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color3B: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR3B put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color3G [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR3G
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color3G: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR3G put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color3R [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR3R
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color3R: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR3R put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color4A [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR4A
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color4A: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR4A put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color4B [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR4B
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color4B: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR4B put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color4G [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR4G
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color4G: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR4G put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color4R [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR4R
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color4R: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR4R put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color5A [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR5A
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color5A: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR5A put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color5B [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR5B
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color5B: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR5B put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color5G [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR5G
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color5G: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR5G put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color5R [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR5R
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color5R: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR5R put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color6A [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR6A
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color6A: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR6A put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color6B [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR6B
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color6B: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR6B put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color6G [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR6G
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color6G: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR6G put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color6R [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR6R
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color6R: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR6R put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color7A [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR7A
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color7A: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR7A put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color7B [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR7B
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color7B: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR7B put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color7G [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR7G
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color7G: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR7G put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color7R [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR7R
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color7R: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR7R put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color8A [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR8A
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color8A: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR8A put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color8B [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR8B
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color8B: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR8B put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color8G [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR8G
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color8G: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR8G put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color8R [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR8R
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color8R: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR8R put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color9A [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR9A
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color9A: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR9A put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color9B [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR9B
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color9B: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR9B put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color9G [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR9G
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color9G: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR9G put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color9R [
	"This method was automatically generated"
	^handle floatAt: OFFSET_COLOR9R
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> color9R: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_COLOR9R put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> scrollOffsetX [
	"This method was automatically generated"
	^handle floatAt: OFFSET_SCROLLOFFSETX
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> scrollOffsetX: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_SCROLLOFFSETX put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> scrollOffsetY [
	"This method was automatically generated"
	^handle floatAt: OFFSET_SCROLLOFFSETY
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> scrollOffsetY: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_SCROLLOFFSETY put: anObject
]

{ #category : 'helper' }
SDL3TextScrollUniforms >> setColorAt: index r: r g: g b: b a: a [

	| baseOffset |
	"index is 1-based (1 to 16). Each color is 4 floats (16 bytes). The first 4 fields are 16 bytes."
	baseOffset := OFFSET_COLOR1R - 1 + ((index - 1) * 16).
	handle floatAt: baseOffset + 1 put: r asFloat.
	handle floatAt: baseOffset + 5 put: g asFloat.
	handle floatAt: baseOffset + 9 put: b asFloat.
	handle floatAt: baseOffset + 13 put: a asFloat.
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> viewportHeight [
	"This method was automatically generated"
	^handle floatAt: OFFSET_VIEWPORTHEIGHT
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> viewportHeight: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_VIEWPORTHEIGHT put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> viewportWidth [
	"This method was automatically generated"
	^handle floatAt: OFFSET_VIEWPORTWIDTH
]

{ #category : 'accessing - structure variables' }
SDL3TextScrollUniforms >> viewportWidth: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_VIEWPORTWIDTH put: anObject
]
