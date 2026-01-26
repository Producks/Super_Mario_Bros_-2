; Looooooooooop
CharacterSelectMenuLoop:
	JSR WaitForNMI_TurnOnPPU

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

  LDA #$3F
  STA PPUBuffer_301
  LDA #$14
  STA PPUBuffer_301 + 1
  LDA #$04
  STA PPUBuffer_301 + 2

  LDA CharacterPalette, Y
	STA PPUBuffer_301 + 3
  LDA CharacterPalette + 1, Y
	STA PPUBuffer_301 + 4
  LDA CharacterPalette + 2, Y
	STA PPUBuffer_301 + 5
  LDA CharacterPalette + 3, Y
	STA PPUBuffer_301 + 6

  LDA #$00
	STA PPUBuffer_301 + 7
  LDA #$07
  STA byte_RAM_300

CheckConfirmation:
  LDA Player1JoypadPress
  AND #ControllerInput_A
  BEQ CharacterSelectMenuLoop

CharSelectDone:
	JMP QuitCharacterSelect ; We're done! Time to leave
