; Looooooooooop
CharacterSelectMenuLoop:
	JSR WaitForNMI_TurnOnPPU

  JSR InputReaderCharacterSelect

  LDA Player1JoypadPress
  AND #ControllerInput_Select
  BEQ NormalLoopCharacterSelect
  JMP MenuCharacterSelectInit

NormalLoopCharacterSelect:
  LDX #$00
  JSR SetCharacter_OAM_Palette

CharacterSelectInputHandler:
; Handle dpad input
  LDA Player1JoypadPress
  LDY #$00

Input_CharacterSelect_Loop:
  AND #$0F
  ROR
  BCC Inc_CharacterSelect_Loop
  TAX
  LDA Math_CharacterSelectInput, Y
  CLC
  ADC CursorLocation
  AND #$0F
  STA CursorLocation
  LDA #SoundEffect1_CherryGet
	STA SoundEffectQueue1
  TXA
Inc_CharacterSelect_Loop:
  INY
  CPY #$04
  BNE Input_CharacterSelect_Loop

  LDX #$01
  JSR SetCharacter_OAM_Palette

; Update second palette babyyy
UpdatePaletteOne_ChararacterSelect:
;  JSR GetPaletteStartingIndex
  LDA CursorLocation
  ASL A
  ASL A
  TAY

  JSR SetCharacterPaletteSlotTwo

CheckConfirmation:
  LDA Player1JoypadPress
  AND #ControllerInput_A
  BEQ CharacterSelectMenuLoop

CheckForSecondChar_OR_Player:
  LDY GamePlayMode
  LDA Bool_TwoPickModeTable, Y
  BEQ CharSelectDone
  LDA PlayerPickingCharacterSelect
  BNE CharSelectDone
; Set player one stuff before we move on to player 2
  JSR SetCharacterFromCursor
  LDA #SoundEffect1_CherryGet
  STA SoundEffectQueue1
  JSR SetCharacterPickPose

  LDA #$30
  JSR DelayFrames

  JSR SetCharacterPickPose ; Restore the initinal pose
  LDX #$00
  JSR SetCharacter_OAM_Palette ; Restore back the palette to 0

; Init player 2 stuff
  INC PlayerPickingCharacterSelect
  LDA CurrentCharacterPTwo
  STA CursorLocation

  JSR PrintTextCharSelect
  JSR WaitForNMI ; temp TODO remove
  JMP CharacterSelectMenuLoop

CharSelectDone:
  LDA #SoundEffect1_1UP
  STA SoundEffectQueue1
	JMP QuitCharacterSelect ; We're done! Time to leave
