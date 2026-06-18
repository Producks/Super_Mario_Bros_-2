; Regular character menu init
CharacterSelectMenuInit:
	JSR WaitForNMI

	LDA #$00
	STA PPUMASK
  STA PlayerPickingCharacterSelect
	JSR DisableNMI

; Set CHR bank character select
	LDA #CHRBank_CharacterSelectSprites
	STA SpriteCHR1
  LDA #CHRBank_CharacterSelectSprites + 1
  STA SpriteCHR2
  LDA #CHRBank_CharacterSelectSprites + 2
  STA SpriteCHR3
  LDA #CHRBank_CharacterSelectSprites + 3
  STA SpriteCHR4
	LDA #CHRBank_CharacterSelectBG1
	STA BackgroundCHR1
	LDA #CHRBank_CharacterSelectBG2
	STA BackgroundCHR2

  LDA DumpCharacterPaletteRamBool
  BEQ DumpCharacterSelectPalette
; Dump static palette table
  LDY #$7F
DumpStaticPaletteTableLoop:
  LDA CharacterPaletteDefaultTable, Y
  STA PlayerOneCharacterPaletteRamTable, Y
  DEY
  BPL DumpStaticPaletteTableLoop
  LDA #$00
  STA DumpCharacterPaletteRamBool

; Temp... TODO dump option instead
DumpCharacterSelectPalette:
	LDY #$4C
DumpCharacterSelectPaletteLoop:
	LDA PlayerSelectPalettes, Y
	STA PPUBuffer_TitleCardPalette, Y
	DEY
	CPY #$FF
	BNE DumpCharacterSelectPaletteLoop

	JSR ResetScreenForTitleCard

	JSR EnableNMI

	JSR WaitForNMI_TurnOffPPU

	LDA #Stack100_Menu
	STA StackArea
	LDA #ScreenUpdateBuffer_CharacterSelect
	STA ScreenUpdateIndex
	JSR WaitForNMI

	LDA #ScreenUpdateBuffer_TitleCard
	STA ScreenUpdateIndex

	JSR WaitForNMI

	JSR DisableNMI

	LDA #Music1_CharacterSelect
	STA MusicQueue1

  JSR DumpCharacterSpritesSelect

  JSR PrintTextCharSelect

	JSR EnableNMI

	JSR WaitForNMI

; Init cursor location with the first player
  LDA CurrentcharacterPOne
  STA CursorLocation

; Black out palettes & dump new palette
  LDY #$1F
-
  LDA PlayerSelectPalettesBG, Y
  STA PaletteFadeOutBuffer, Y
  LDA #$0F
  STA PPU_PaletteBufferBackgroundOne, Y
  DEY
  BPL -

  LDA #RTS_OPCODE
  STA FadeOptionalFuncOP

  LDA #FadeIn
  JSR ColorFade

	JMP CharacterSelectInputHandler
