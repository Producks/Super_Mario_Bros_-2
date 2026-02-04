;
; Global functions that can help with certain things...
;

MultiplyBy16:
  ASL A
  ASL A
  ASL A
  ASL A
  RTS

;
; X = Value to set
;
SetCharacter_OAM_Palette:
  LDA CursorLocation
  JSR MultiplyBy16
  TAY
  TXA
  STA SpriteDMAArea + 2, Y
  STA SpriteDMAArea + 6, Y
  STA SpriteDMAArea + 10, Y
  STA SpriteDMAArea + 14, Y
  RTS

;
; Check game mode
; Check which player is playing
;
PrintTextCharSelect:
  LDY byte_RAM_300
  LDA #$23
  STA PPUBuffer_301, Y
  INY
  LDA #$66
  STA PPUBuffer_301, Y
  INY
;  LDA #$10
  LDA #$15
  STA PPUBuffer_301, Y
  INY

  LDX #$05
  JSR PrintWordCharSelect

  LDX #$03
  JSR PrintWordCharSelect

  LDX #$01
  JSR PrintWordCharSelect ; ; bug bug check here late to fix ovefrflow

  LDA #$00
  STA PPUBuffer_301, Y

  STY byte_RAM_300

  RTS

PrintWordCharSelect:
  LDA WordListIndexCharSelect, X
  TAX
PrintWordCharSelectLoop:
  LDA WordListCharSelect, X
  BEQ LeavePRintWordCharSelect
  STA PPUBuffer_301, Y
  INY
  INX
  BNE PrintWordCharSelectLoop
LeavePRintWordCharSelect:
  RTS


DumpCharacterSpritesSelect:
  LDY #$00
  LDX #$00
-
	LDA PlayerSelectMarioSprites1, Y
	STA SpriteDMAArea, X
  INY
  INX
	LDA PlayerSelectMarioSprites1, Y
	STA SpriteDMAArea, X
  INY
  INX
  LDA #$00
  STA SpriteDMAArea, X
  INX
	LDA PlayerSelectMarioSprites1, Y
  STA SpriteDMAArea, X
  INY
  INX
	BNE -
  RTS

SetCharacterPaletteSlotTwo:
  LDA CursorLocation
  ASL A
  ASL A
  TAY
  LDX #$00
-
  LDA PlayerOneCharacterPaletteRamTable, Y
  STA PPU_PaletteBufferSpriteTwo, X
  INX
  INY
  CPX #$04
  BNE -
  LDA #$02
  STA ScreenUpdateIndex
  RTS

IncreaseBrightnessPalette:
  LDX #$1F
IncreaseBrightnessPaletteLoop:
  LDA PPU_PaletteBufferBegin, X
  CMP #$0F ; Check if black
  BNE BrightnessAddition
  LDA PaletteFadeOutBuffer, X
  AND #$0F
  BPL SetBrightnessResult
BrightnessAddition:
  CMP PaletteFadeOutBuffer, X
  BEQ DecreaseBrightnessLoop
  CLC
  ADC #$10
SetBrightnessResult:
  STA PPU_PaletteBufferBegin, X
DecreaseBrightnessLoop:
  DEX
  BPL IncreaseBrightnessPaletteLoop
  BCS +

DecreaseBrightnessPalette:
  LDX #$1F
DecreaseBrightnessPaletteLoop:
  LDA PPU_PaletteBufferBegin, X
  CMP PaletteFadeOutBuffer, X
  BEQ DecLoopDecreaseBrightness
  SEC
  SBC #$10
  BCS SetResultDecDecBrightness
  LDA #$0F
SetResultDecDecBrightness:
  STA PPU_PaletteBufferBegin, X
DecLoopDecreaseBrightness:
  DEX
  BPL DecreaseBrightnessPaletteLoop
  BCS +

ColorFade:
  STA FadeType
  LDY #$03
--
  LDA #FadeoutTimer
  STA FadeCounter
  LDA FadeType
  BEQ IncreaseBrightnessPalette
  BNE DecreaseBrightnessPalette
+
  LDA #$02
  STA ScreenUpdateIndex
-
  JSR WaitForNMI_TurnOnPPU
  DEC FadeCounter
  BPL -
  DEY
  BPL --
  RTS

; End of helpers
