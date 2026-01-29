wee:
  JSR WaitForNMI_TurnOnPPU

  LDA Player1JoypadPress
  AND #ControllerInput_Down
  BEQ CheckUPCharacterSelectMenu
  INC FuncLoTemp
  LDA FuncLoTemp
  CMP #$03
  BNE UpdateCursorCharacterSelectMenu
  LDA #$00
  STA FuncLoTemp
  BEQ UpdateCursorCharacterSelectMenu

CheckUPCharacterSelectMenu:
  LDA Player1JoypadPress
  AND #ControllerInput_Up
  BEQ CheckACharacterSelectMenu
  DEC FuncLoTemp
  BPL UpdateCursorCharacterSelectMenu
  LDA #$02
  STA FuncLoTemp
  BNE UpdateCursorCharacterSelectMenu

CheckACharacterSelectMenu:
  LDA Player1JoypadPress
  AND #ControllerInput_A
  BEQ wee
  LDA FuncLoTemp
  BEQ CharacterSelectMenuPaletteEditor
  CMP #$01
  BEQ RestoreDefaultPaletteCharacterEditor
  JMP QuitSubMenuCharacterEditor

UpdateCursorCharacterSelectMenu:
  LDY FuncLoTemp
  LDA CursorYPosition, Y
  STA SpriteDMAArea + 24
  LDA CursorXPosition, Y
  STA SpriteDMAArea + 27
  BNE wee

RestoreDefaultPaletteCharacterEditor:
  RTS

CharacterSelectMenuPaletteEditor:
  RTS
