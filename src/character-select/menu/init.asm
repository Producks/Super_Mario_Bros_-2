MenuCharacterSelectInit:
; Temp color
  LDA #$3F
  STA PPUBuffer_301
  LDA #$04
  STA PPUBuffer_301 + 1
  LDA #$04
  STA PPUBuffer_301 + 2

  LDA #$0F
	STA PPUBuffer_301 + 3
	STA PPUBuffer_301 + 4
	STA PPUBuffer_301 + 5
	STA PPUBuffer_301 + 6

  LDA #$3F
  STA PPUBuffer_301 + 7
  LDA #$10
  STA PPUBuffer_301 + 8
  LDA #$08
  STA PPUBuffer_301 + 9

  LDA #$0F
	STA PPUBuffer_301 + 10
	STA PPUBuffer_301 + 11
	STA PPUBuffer_301 + 12
	STA PPUBuffer_301 + 13
	STA PPUBuffer_301 + 14
	STA PPUBuffer_301 + 15
	STA PPUBuffer_301 + 16
	STA PPUBuffer_301 + 17

  LDA #$00
	STA PPUBuffer_301 + 18

  JSR HideAllSprites

; Load the name
  LDY CursorLocation
  LDA CharacterNameLo, Y
  STA FuncLoTemp
  LDA CharacterNameHi, Y
  STA FuncHiTemp
  LDY #$00
  JSR DumpTextLine

; Load up the Palette Editor text
  LDA #<PaletteEditorText
  STA FuncLoTemp
  LDA #>PaletteEditorText
  STA FuncHiTemp
  LDY #$00
  JSR DumpTextLine

; Load up the Restore Palette text
  JSR DumpTextLine

; Load up the Exit Menu text
  JSR DumpTextLine

; Load up the Character Info text
  JSR DumpTextLine

; Dump the character description
  LDY CursorLocation
  LDA CharacterDescriptionLo, Y
  STA FuncLoTemp
  LDA CharacterDescriptionHi, Y
  STA FuncHiTemp
  LDY #$00
  JSR DumpTextLine
  JSR DumpTextLine
  JSR DumpTextLine

  LDA CursorLocation
  ASL A
  TAY
  LDA CHRBank_CharacterSize, Y
  STA SpriteCHR2

  LDA #$3E
  STA SpriteCHR1


; lol saving like 2 bytes over a table
  LDY #$FF
  LDA CursorLocation
-
  INY
  SEC
  SBC #$04
  BCS -
  TYA

  CLC
  ADC #CHRBank_CharacterSelectSprites
  STA SpriteCHR3

; Dump sprite table
  LDY #$00
-
  LDA SpriteTableMenuCharacterSelect, Y
  STA SpriteDMAArea, Y
  INY
  CPY #$40
  BNE -

; Init character sprites depending on the cursor location
  LDA CursorLocation
  ASL A
  ASL A
  ASL A
  ASL A
  TAY
  INY
  STY FuncLoTemp ; Store index for later
  LDX #$01
  JSR SetSpriteColorPalette
  JSR SetSpriteColorPalette
  JSR SetSpriteColorPalette

; Set new palettes
  LDY FuncLoTemp ; Restore index
  LDA PlayerOneCharacterPaletteRamTable, Y
  STA PPU_PaletteBufferSpriteOne, Y
  INY

  LDA PlayerOneCharacterPaletteRamTable, Y
  STA PPU_PaletteBufferSpriteOne, Y
  STA PPU_PaletteBufferSpriteTwo + 1
  INY

  LDA PlayerOneCharacterPaletteRamTable, Y
  STA PPU_PaletteBufferSpriteOne, Y
  STA PPU_PaletteBufferSpriteThree + 1

  LDA #$30
  STA PPU_PaletteBufferSpriteFour + 1

  LDA #$00
  STA FuncLoTemp ; Hold sub menu cursor

	LDA #ScreenUpdateBuffer_RAM_TitleCardPalette ; Then tell it to dump that into the PPU
	STA ScreenUpdateIndex
