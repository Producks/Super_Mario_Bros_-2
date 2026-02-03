CharacterEditorMenuLoop:
  JSR WaitForNMI_TurnOnPPU

  LDA Player1JoypadPress
  AND #ControllerInput_Down
  BEQ CheckUPCharacterSelectMenu
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
  LDA CursorLocation
  ASL A
  ASL A
  TAY
  LDX #$01
-
  LDA CharacterPaletteDefaultTable, Y
  STA PlayerOneCharacterPaletteRamTable + 1, Y
  STA PPU_PaletteBufferSpriteOne, X
  INY
  INX
  CPX #$04
  BNE -

  LDA #$02
  STA ScreenUpdateIndex
  BNE CharacterEditorMenuLoop
