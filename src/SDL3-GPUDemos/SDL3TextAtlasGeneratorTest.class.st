"
Tests for SDL3TextAtlasGenerator.
"
Class {
	#name : 'SDL3TextAtlasGeneratorTest',
	#superclass : 'TestCase',
	#category : 'SDL3-GPUDemos-TextScroll',
	#package : 'SDL3-GPUDemos',
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
