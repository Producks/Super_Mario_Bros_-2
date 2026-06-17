TitleScreen_Option:
  LDA #$FF
  STA PPUScrollXMirror
  JSR HideAllSprites
;  LDA #CHRBank_FontTitleScreen
;  STA SpriteCHR1
  LDA #$00
  STA CursorLocation
  JMP CreateCursor_TitleScreen_Option
