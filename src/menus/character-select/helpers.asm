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
; Print the text at the bottom of the character select
; Variation with 1-2P mode
PrintTextCharSelect:
  LDY byte_RAM_300
  LDA #$23
  STA PPUBuffer_301, Y
  INY
  LDA GamePlayMode
  CMP #$04
  BMI DisplayOnePlayerTextCharSelect

DisplayTwoPlayerTextCharSelect:
  LDA #$68
  STA PPUBuffer_301, Y
  INY
  LDA #$10
  STA PPUBuffer_301, Y
  INY

  LDX #$02 ; PlayerText
  JSR PrintWordCharSelect

  JSR PrintCurrentPlayerNumberCharacterSelect

  LDX #$04
  JSR PrintWordCharSelect
  JMP +

DisplayOnePlayerTextCharSelect:
  LDA #$66
  STA PPUBuffer_301, Y
  INY
  LDA #$15
  STA PPUBuffer_301, Y
  INY

  LDX #$05 ; SelectText
  JSR PrintWordCharSelect

  LDX #$03 ; CharacterText
  JSR PrintWordCharSelect

  JSR PrintCurrentPlayerNumberCharacterSelect

+
  LDA #$00
  STA PPUBuffer_301, Y

  STY byte_RAM_300

  RTS

PrintCurrentPlayerNumberCharacterSelect:
  LDX CurrentPlayer
  JMP PrintWordCharSelect

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
  JSR GetPlayerCharacterIndexPalette_CharacterSelect
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


InputReaderCharacterSelect:
  LDA CurrentPlayer
  BEQ +
  LDA Player2JoypadPress
  STA Player1JoypadPress
  LDA Player2JoypadHeld
  STA Player1JoypadHeld
+
  RTS


; Check the current player and give you the correct index
; for the palette
GetPlayerCharacterIndexPalette_CharacterSelect:
  LDA CursorLocation
  ASL A
  ASL A
  LDY CurrentPlayer
  BEQ +
  CLC
  ADC #$40
+
  TAY
  RTS

; End of helpers
