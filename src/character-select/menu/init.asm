MenuCharacterSelectInit:

  JSR FadeOutColorsCharacterEditorMenu

  JSR HideAllSprites


; Load the name
  LDY CursorLocation
  LDA CharacterNameLo, Y
  STA FuncLoTemp
  LDA CharacterNameHi, Y
  STA FuncHiTemp
  LDY #$00
  JSR DumpTextLine

; Hide bottom line to save space
  LDA #<EraseDescriptionLineThree
  STA FuncLoTemp
  LDA #>EraseDescriptionLineThree
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
  CPY #$44
  BNE -

; Update sprite table to display the correct character on the left
  LDA CursorLocation
  AND #$03
  ASL A
  ASL A
  ASL A ; Multiply by 8
  ORA #$80
  LDX #$03
  LDY #$00
-
  STA $231, Y
;  CLC TODO IF this bug restore it
  ADC #$02
  INY
  INY
  INY
  INY
  DEX
  BPL -

; Init character sprites depending on the cursor location
  JSR SetAllNumberSpritesCharacterPaletteEditor

  JSR FadeInColorsCharacterEditorMenu

  LDA #$00
  STA FuncLoTemp ; Hold sub menu cursor

