BreakOutOfOptionTitleScreen:
  LDA #$00
  STA PPUScrollXMirror
  LDA #CHRBank_TitleScreenBG1
  STA SpriteCHR1

; Restore sprites
  LDY #$00
RestoreSpritesTitleScreenLoop:
  LDA SpriteTitleScreenDMAInitTable, Y
  STA SpriteDMAArea, Y
  INY
  INY
  INY
  INY
  CPY #$A4
  BNE RestoreSpritesTitleScreenLoop

; Restore birdo palette
  LDA #$3F
  STA PPUBuffer_301
  LDA #$10
  STA PPUBuffer_301 + 1
  LDA #$04
  STA PPUBuffer_301 + 2
  LDA #$0F
  STA PPUBuffer_301 + 3
  LDA #$25
  STA PPUBuffer_301 + 4
  LDA #$02
  STA PPUBuffer_301 + 5
  LDA #$16
  STA PPUBuffer_301 + 6
  LDA #$07
  STA byte_RAM_300
  LDA #$00
  STA CursorLocation
  JMP UpdateTextPalette
