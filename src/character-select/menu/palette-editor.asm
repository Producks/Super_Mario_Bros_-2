PaletteEditorInit:
  LDA #$00
  STA FuncHiTemp ; Set cursor to 0
  LDA #$22
  STA SpriteDMAArea + 25 ; Make the other cursor red
  JMP UpdateCursorPaletteEditor

PaletteEditorCharacterSelectLoop:
  LDA Player1JoypadPress
  AND #ControllerInput_Left
  BEQ +
  DEC FuncHiTemp
  BPL +
  LDA #$02
  STA FuncHiTemp

+
  LDA Player1JoypadPress
  AND #ControllerInput_Right
  BEQ +
  INC FuncHiTemp
  LDA FuncHiTemp
  CMP #$03
  BNE +
  LDA #$00
  STA FuncHiTemp

+
  LDA Player1JoypadPress
  AND #ControllerInput_A
  BEQ +
  BNE EditColorInit

+
; Check exit input
  LDA Player1JoypadPress
  AND #ControllerInput_B
  BNE ExitPaletteEditor

UpdateCursorPaletteEditor:
  LDY FuncHiTemp
  LDA #$58
  STA SpriteDMAArea + 28
  LDA CursorCharSelectMenuEditorXPosition, Y
  STA SpriteDMAArea + 31

  JSR WaitForNMI_TurnOnPPU
  JMP PaletteEditorCharacterSelectLoop

ExitPaletteEditor:
  LDA #$20
  STA SpriteDMAArea + 25 ; Restore back the main cursor to white
  LDA #$F8
  STA SpriteDMAArea + 28 ; Hide back the other cursor
  JMP CharacterEditorMenuLoop

EditColorInit:
  LDA #$22
  STA SpriteDMAArea + 29
  LDA #$00
  STA DpadHeldTimer

EditColorLoop:

; Check held state
  LDA Player1JoypadHeld
  AND #ControllerInput_Left | ControllerInput_Right
  BEQ ResetHeldEditorColor
  LDY DpadHeldTimer
  CPY #$10
  BEQ FireUpHeld
  INY
  STY DpadHeldTimer
  BNE CheckButtonPressEditorColor

FireUpHeld:
  INC HeldTimerFire
  LDA HeldTimerFire
  AND #$07
  STA HeldTimerFire
  BNE CheckButtonPressEditorColor
  LDA Player1JoypadHeld
  AND #ControllerInput_Left
  BNE +
  JMP IncreaseColorPaletteEditor
+
  JMP DecreaseColorPaletteEditor

ResetHeldEditorColor:
  LDA #$00
  STA DpadHeldTimer

CheckButtonPressEditorColor:
  LDA Player1JoypadPress
  AND #ControllerInput_B
  BEQ +
  LDA #$20
  STA SpriteDMAArea + 29
  JMP UpdateCursorPaletteEditor

+
  LDA Player1JoypadPress
  AND #ControllerInput_Left
  BEQ +
  JMP DecreaseColorPaletteEditor

+
  LDA Player1JoypadPress
  AND #ControllerInput_Right
  BEQ +
  JMP IncreaseColorPaletteEditor
+

-
  JSR WaitForNMI
  JMP EditColorLoop

DecreaseColorPaletteEditor:
  JSR GetPaletteCharacterIndexEditor

  LDA PlayerOneCharacterPaletteRamTable, Y
  SEC
  SBC #$01
  AND #$3F ; Prevent underflow
  CMP #$0D ; https://www.nesdev.org/wiki/Color_$0D_games
  BNE +
  LDA #$0C
+
  STA PlayerOneCharacterPaletteRamTable, Y


  JMP UpdatePaletteEditor

IncreaseColorPaletteEditor:
  JSR GetPaletteCharacterIndexEditor

  LDA PlayerOneCharacterPaletteRamTable, Y
  CLC
  ADC #$01
  AND #$3F
  CMP #$0D
  BNE +
  LDA #$0E
+
  STA PlayerOneCharacterPaletteRamTable, Y

UpdatePaletteEditor:
  PHA

  LDX FuncHiTemp
  LDA TableSpriteOAMIndexTilePositionCharacterEditor, X
  TAX
  JSR SetSpriteColorPalette


  TAX
  LDA FuncHiTemp
  ASL A
  ASL A
  TAY

  PLA
  STA PPU_PaletteBufferSpriteOne + 1, Y
  LDY FuncHiTemp
  STA PPU_PaletteBufferSpriteOne + 1, Y 

  LDA #$02
  STA ScreenUpdateIndex
  JMP -
