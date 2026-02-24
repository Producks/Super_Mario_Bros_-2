; Dump the line text in FuncLoTemp and FuncHiTemp
; Y is the index... Not always 0
DumpTextLine:
  LDX #$00
-
  LDA (FuncLoTemp), Y
  STA PPUBuffer_301, X
  BEQ +
  INX
  INY
  BNE -
+
  STX byte_RAM_300
  INY ; Make it so the index can be re-used!
  JMP WaitForNMI

; Y points to the color value I need to translate to a sprite
; X index for sprite DMA OAM 
SetSpriteColorPalette:
  LDA PlayerOneCharacterPaletteRamTable, Y
  AND #$F0
  LSR A
  LSR A
  LSR A
  STA SpriteDMAArea, X

  INX
  INX
  INX
  INX

  LDA PlayerOneCharacterPaletteRamTable, Y
  AND #$0F
  ASL A
  STA SpriteDMAArea, X

  INX
  INX
  INX
  INX
  INY
  RTS

GetPaletteCharacterIndexEditor:
  LDA CursorLocation ; Cursor index for the character we want to update
  ASL A
  ASL A
  CLC
  ADC FuncHiTemp
  TAY
  INY
  RTS

SetAllNumberSpritesCharacterPaletteEditor:
  LDA CursorLocation
  ASL A
  ASL A
  TAY
  INY
  LDX #$01
  JSR SetSpriteColorPalette
  JSR SetSpriteColorPalette
  JSR SetSpriteColorPalette
  RTS

FadeOutColorsCharacterEditorMenu:
  LDY #$1F
-
  LDA PPU_PaletteBufferBegin, Y
  STA PaletteFadeOutBuffer, Y
  DEY
  BPL -

  LDY #$03
  LDA #$0F
-
  STA PaletteFadeoutBufferBG_Two, Y
  STA PaletteFadeoutBufferSP_One, Y
  STA PaletteFadeoutBufferSP_Two, Y
  STA PaletteFadeoutBufferSP_Four, Y
  DEY
  BPL -
  LDA #$0F

  LDA #FadeOut
  JMP ColorFade

FadeInColorsCharacterEditorMenu:
	LDY #$1F
-
	LDA PlayerSelectPalettesBG, Y
	STA PaletteFadeOutBuffer, Y
	DEY
	BPL -

; Set palette sprite fade in
  LDA CursorLocation
  ASL A
  ASL A
  TAY
  LDX #$00
-
  LDA PlayerOneCharacterPaletteRamTable, Y
  STA PaletteFadeoutBufferSP_Two, X

  LDA PlayerSelectPalettesSprite, X
  STA PaletteFadeoutBufferSP_One, X
  INX
  INY
  CPX #$04
  BNE -

  LDA #FadeIn
  JMP ColorFade
