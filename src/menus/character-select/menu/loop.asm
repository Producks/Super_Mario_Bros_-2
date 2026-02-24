CharacterEditorMenuLoop:
  JSR WaitForNMI

  LDA Player1JoypadPress
  AND #ControllerInput_Down
  BEQ CheckUPCharacterSelectMenu
  LDA #SoundEffect1_CherryGet
  STA SoundEffectQueue1
  INC FuncLoTemp
  LDA FuncLoTemp
  CMP #$03
  BNE +
  LDA #$00
  STA FuncLoTemp
  BEQ +

CheckUPCharacterSelectMenu:
  LDA Player1JoypadPress
  AND #ControllerInput_Up
  BEQ CheckACharacterSelectMenu
  LDA #SoundEffect1_CherryGet
  STA SoundEffectQueue1
  DEC FuncLoTemp
  BPL +
  LDA #$02
  STA FuncLoTemp
  BNE +

CheckACharacterSelectMenu:
  LDA Player1JoypadPress
  AND #ControllerInput_A
  BEQ CharacterEditorMenuLoop
  LDA FuncLoTemp
  BEQ PaletteEditorInit
  CMP #$01
  BEQ RestoreDefaultPaletteCharacterEditor
  JMP QuitSubMenuCharacterEditor

+
  LDY FuncLoTemp
  LDA CursorCharSelectMenuYPosition, Y
  STA SpriteDMAArea + 24
  LDA #$3C
  STA SpriteDMAArea + 27

  BNE CharacterEditorMenuLoop

RestoreDefaultPaletteCharacterEditor:
  LDA #SoundEffect1_EnemyHit
  STA SoundEffectQueue1
  LDA CursorLocation
  ASL A
  ASL A
  TAY
  LDX #$00
-
  LDA CharacterPaletteDefaultTable, Y
  STA PlayerOneCharacterPaletteRamTable, Y
  STA PPU_PaletteBufferSpriteTwo, X
  INX
  INY
  CPX #$04
  BNE -

  JSR SetAllNumberSpritesCharacterPaletteEditor

  LDA #$02
  STA ScreenUpdateIndex
  BNE CharacterEditorMenuLoop
