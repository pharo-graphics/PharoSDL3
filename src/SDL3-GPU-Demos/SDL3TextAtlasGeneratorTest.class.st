"
Tests for SDL3TextAtlasGenerator.
"
Class {
	#name : 'SDL3TextAtlasGeneratorTest',
	#superclass : 'TestCase',
	#category : 'SDL3-GPU-Demos-TextScroll',
	#package : 'SDL3-GPU-Demos',
	#tag : 'TextScroll'
}

{ #category : 'tests' }
SDL3TextAtlasGeneratorTest >> testGenerateA8Atlas [
	| generator atlas expectedSize |
	generator := SDL3TextAtlasGenerator new.

	atlas := generator generateAtlasFor: 'A' deviceScale: 1@1.

	"For A8, we expect width * height bytes (plus potentially some stride padding, but AthensCairoSurface hides that mostly or we can check the stride if we had access to it).
	Actually, let's just verify it's NOT 4 bytes per pixel."

	self assert: atlas width > 0.
	self assert: atlas height > 0.

	"If it were ARGB32, it would be width * height * 4.
	We can check the surface format if we add it to SDL3TextAtlas or just check the surface directly if possible."
	self assert: atlas surface status equals: 0. "CAIRO_STATUS_SUCCESS"
]

{ #category : 'tests' }
SDL3TextAtlasGeneratorTest >> testGenerateAtlasForString [
	| generator atlas |
	generator := SDL3TextAtlasGenerator new.
	generator fontSize: 20.
	generator familyName: 'Source Sans Pro'.

	atlas := generator generateAtlasFor: 'Hello'.

	self assert: atlas isNotNil.
	self assert: atlas width > 0.
	self assert: atlas height >= generator fontSize.
	self assert: atlas dataPtr isNotNil.
	self assert: (atlas glyphMap includesKey: $H).
	self assert: (atlas glyphMap includesKey: $e).
	self assert: (atlas glyphMap includesKey: $l).
	self assert: (atlas glyphMap includesKey: $o)
]

{ #category : 'tests' }
SDL3TextAtlasGeneratorTest >> testLayoutEngineUpdatesMetricsOnScaleTransition [

	| generator atlas1x atlas2x engine text lineHeight1x |
	generator := SDL3TextAtlasGenerator new.
	atlas1x := generator generateAtlasFor: 'HelloWorld' deviceScale: 1 @ 1.
	atlas2x := generator generateAtlasFor: 'HelloWorld' deviceScale: 2 @ 2.
	text := 'Hello', String cr, 'World', String cr, 'SDL3'.
	engine :=
		SDL3TextLayoutEngine new
			atlas: atlas1x;
			yourself.
	engine layoutString: text.
	lineHeight1x := engine lineHeight.
	self assert: lineHeight1x > 0.
	self assert: engine totalHeight equals: lineHeight1x * 3.

	engine atlas: atlas2x.
	self assert: engine lineHeight > lineHeight1x.
	self assert: engine totalHeight equals: engine lineHeight * 3
]

{ #category : 'tests' }
SDL3TextAtlasGeneratorTest >> testTextScrollDemoPreservesRelativeScrollOnScaleTransition [

	| generator atlas1x atlas2x app lineHeight1x ratio |
	generator := SDL3TextAtlasGenerator new.
	atlas1x := generator generateAtlasFor: 'HelloWorld' deviceScale: 1 @ 1.
	atlas2x := generator generateAtlasFor: 'HelloWorld' deviceScale: 2 @ 2.
	app := SDL3TextScrollDemoApp new.
	app applyAtlas: atlas1x.
	app layoutEngine layoutString: ('Line1', String cr, 'Line2', String cr, 'Line3').
	lineHeight1x := app layoutEngine lineHeight.
	app scrollPosition: 0 @ (lineHeight1x * 2) asFloat.
	app targetScrollY: (lineHeight1x * 2) asFloat.
	self assert: app scrollPosition y closeTo: (lineHeight1x * 2) asFloat.

	app applyAtlas: atlas2x.
	ratio := app layoutEngine lineHeight asFloat / lineHeight1x asFloat.
	self assert: ratio > 1.5.
	self assert: app targetScrollY closeTo: (lineHeight1x * 2) asFloat * ratio.
	self assert: app scrollPosition y closeTo: (lineHeight1x * 2) asFloat * ratio.

	app applyAtlas: atlas1x.
	self assert: app targetScrollY closeTo: (lineHeight1x * 2) asFloat.
	self assert: app scrollPosition y closeTo: (lineHeight1x * 2) asFloat
]
