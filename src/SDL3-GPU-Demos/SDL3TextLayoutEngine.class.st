"
I compute glyph positions and UV coordinates for a string based on a font atlas.
"
Class {
	#name : 'SDL3TextLayoutEngine',
	#superclass : 'Object',
	#instVars : [
		'atlas',
		'totalHeight',
		'lineStarts',
		'lineHeight',
		'spaceWidth',
		'tabWidth',
		'lineStates'
	],
	#category : 'SDL3-GPU-Demos-TextScroll',
	#package : 'SDL3-GPU-Demos',
	#tag : 'TextScroll'
}

{ #category : 'accessing' }
SDL3TextLayoutEngine >> atlas [
	^ atlas
]

{ #category : 'accessing' }
SDL3TextLayoutEngine >> atlas: anObject [
	atlas := anObject.
	self calculateMetrics
]

{ #category : 'initialization' }
SDL3TextLayoutEngine >> calculateMetrics [
	| font scale |
	atlas ifNil: [ ^ self ].
	font := atlas fontMetrics.
	scale := atlas deviceScale.
	lineHeight := (font height ceiling * scale y) ceiling.
	spaceWidth := (((font widthOfString: ' ') max: ((font widthOfString: 'm') * 0.3)) * scale x) ceiling.
	tabWidth := ((font widthOfString: 'm') * 3 * scale x) ceiling.
]

{ #category : 'layout' }
SDL3TextLayoutEngine >> characterCountFromLine: first to: last [
	| count |
	count := 0.
	first to: last do: [ :idx | | startIdx endIdx |
		startIdx := lineStarts at: idx.
		endIdx := (idx < lineStarts size) ifTrue: [ (lineStarts at: idx + 1) - 1 ] ifFalse: [ 1000000000 ]. "Assume large if at end"
		"We don't need exact string end here, just a safe upper bound"
		count := count + (endIdx - startIdx + 1).
	].
	^ count
]

{ #category : 'lexing' }
SDL3TextLayoutEngine >> colorIndicesFor: char inComment: isComment isHeader: isHeader [
	"Returns packed uint32: low 16 bits = FG index, high 16 bits = BG index"
	| bg |
	"Palette Mapping:
	0: Black (Standard FG)
	1: Green (Comment FG)
	2: Blue (Keyword FG)
	3: Red (Separator FG)
	4: Transparent (Standard BG)
	5: Light Gray (Highlight BG)
	"
	bg := 4. "Default transparent"

	char = $! ifTrue: [
		bg := 5. "Highlight the ! separator background"
		^ 3 | (bg << 16)
	].

	isComment ifTrue: [ ^ 1 | (bg << 16) ].

	isHeader ifTrue: [
		(':.[ ]()' includes: char) ifTrue: [ ^ 2 | (bg << 16) ].
		^ 0 | (bg << 16)
	].

	char isDigit ifTrue: [ ^ 2 | (bg << 16) ].
	(':.[ ]()' includes: char) ifTrue: [ ^ 3 | (bg << 16) ].

	^ 0 | (bg << 16)
]

{ #category : 'layout' }
SDL3TextLayoutEngine >> layoutLine: lineIdx text: aString into: aBuffer glyphCount: startCount [
	| startIdx endIdx currentX currentY state inComment isHeader glyphCount atlasWidth atlasHeight |
	startIdx := lineStarts at: lineIdx.
	state := lineStates at: lineIdx.
	inComment := state first.
	isHeader := state second.

	endIdx := (lineIdx < lineStarts size) ifTrue: [ (lineStarts at: lineIdx + 1) - 1 ] ifFalse: [ aString size ].

	currentX := 0.
	currentY := (lineIdx - 1) * lineHeight.
	glyphCount := startCount.
	atlasWidth := atlas width asFloat.
	atlasHeight := atlas height asFloat.

	startIdx to: endIdx do: [ :i | | char |
		char := aString at: i.

		"Handle Syntax State"
		char = $" ifTrue: [ inComment := inComment not ].

		char = Character lf ifFalse: [
			char = Character space ifTrue: [
				currentX := currentX + spaceWidth.
			] ifFalse: [
				char = Character tab ifTrue: [
					currentX := currentX + tabWidth.
				] ifFalse: [ | glyphBounds |
					glyphBounds := atlas glyphMap at: char ifAbsent: [ nil ].
					glyphBounds ifNotNil: [
						glyphCount := glyphCount + 1.
						glyphCount <= aBuffer size ifTrue: [
							self writeGlyph: glyphBounds
								at: currentX @ currentY
								uvScale: atlasWidth @ atlasHeight
								colors: (self colorIndicesFor: char inComment: inComment isHeader: isHeader)
								into: (aBuffer at: glyphCount)
						].
						currentX := currentX + glyphBounds width.
					].
				].
			].
		].
	].

	^ glyphCount
]

{ #category : 'layout' }
SDL3TextLayoutEngine >> layoutString: aString [
	| inComment isHeader |
	lineStarts := OrderedCollection new.
	lineStates := OrderedCollection new.
	lineStarts add: 1.

	inComment := false.
	isHeader := aString isNotEmpty and: [ (aString at: 1) = $! ].
	lineStates add: { inComment . isHeader }.

	aString doWithIndex: [ :char :i |
		char = $" ifTrue: [ inComment := inComment not ].
		char = Character cr ifTrue: [
			| nextIsHeader |
			lineStarts add: i + 1.
			nextIsHeader := false.
			(i < aString size) ifTrue: [
				nextIsHeader := (aString at: i + 1) = $! and: [ inComment not ].
			].
			lineStates add: { inComment . nextIsHeader }.
		]
	].

	totalHeight := (lineStarts size * lineHeight).
	^ lineStarts
]

{ #category : 'layout' }
SDL3TextLayoutEngine >> layoutVisibleLinesOf: aString in: aViewport into: aBuffer [
	| range firstLineIndex lastLineIndex glyphCount |
	(lineStarts isNil or: [ lineStarts isEmpty ]) ifTrue: [ ^ 0 ].

	range := self visibleLineRangeIn: aViewport.
	firstLineIndex := range x.
	lastLineIndex := range y.

	glyphCount := 0.
	firstLineIndex to: lastLineIndex do: [ :lineIdx |
		glyphCount := self layoutLine: lineIdx text: aString into: aBuffer glyphCount: glyphCount.
	].
	^ glyphCount
]

{ #category : 'accessing' }
SDL3TextLayoutEngine >> lineHeight [
	^ lineHeight ifNil: [ 0 ]
]

{ #category : 'accessing' }
SDL3TextLayoutEngine >> totalHeight [
	^ totalHeight ifNil: [ 0 ]
]

{ #category : 'layout' }
SDL3TextLayoutEngine >> visibleLineRangeIn: aViewport [
	| first last |
	lineHeight = 0 ifTrue: [ ^ 1 @ 1 ].
	first := (aViewport top / lineHeight) floor + 1 max: 1.
	last := (aViewport bottom / lineHeight) ceiling min: lineStarts size.
	^ first @ last
]

{ #category : 'private' }
SDL3TextLayoutEngine >> writeGlyph: bounds at: pos uvScale: uvScale colors: packedIndices into: struct [

	struct
		posX: pos x asFloat;
		posY: pos y asFloat;
		extentX: bounds width asFloat;
		extentY: bounds height asFloat;
		uvX: bounds left asFloat / uvScale x;
		uvY: bounds top asFloat / uvScale y;
		uvWidth: bounds width asFloat / uvScale x;
		uvHeight: bounds height asFloat / uvScale y;
		colorIndices: packedIndices
]
