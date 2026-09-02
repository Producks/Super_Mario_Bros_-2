OptionSelectLoop:
  LDA Player1JoypadPress
  AND #ControllerInput_B
  BEQ +
  JMP RewindOptionSelect 
+
  LDA Player1JoypadPress
  AND #ControllerInput_Start | #ControllerInput_A ;  A or Start will select the option the user want
  BEQ ReadInputOptionMenuCheckDirection
  LDY OptionSelectModeIndex
  LDA OptionSelectConfirmLo, Y
  STA byte_RAM_0
  LDA OptionSelectConfirmHi, Y
  STA byte_RAM_1
  LDY #$00
  JMP (byte_RAM_0)

ReadInputOptionMenuCheckDirection:
  LDA Player1JoypadPress
  CMP #ControllerInput_Left
  BNE ReadInputOptionMenuCheckRight ; If less isn't pressed, check right or start
  LDA CursorLocation
  STA PrevCursorLocation
  DEC CursorLocation
  JMP UpdateCursorModeSelect

ReadInputOptionMenuCheckRight:
  AND #ControllerInput_Right
  BEQ FrameUpdateModeSelectLoop
  LDA CursorLocation
  STA PrevCursorLocation
  INC CursorLocation
  JMP UpdateCursorModeSelect
;  JSR UpdateGFXMenuOption

FrameUpdateModeSelectLoop:
  JSR FrameUpdateOptionSelect
  JSR WaitForNMI_Menu
  JMP OptionSelectLoop ; Jump back to the loop

UpdateCursorModeSelect:
  LDA CursorLocation
  LDY OptionSelectModeIndex
  AND AND_TableOptionSelect, Y
  ORA OR_TableOptionSelect, Y
  CMP #$07 ; Check for roll over since there only 3 menu...
  BNE +
  LDA PrevCursorLocation
  EOR #$02 ; Flip the bit
+
  STA CursorLocation
  JSR TransitionContextWindowMode
  JMP FrameUpdateModeSelectLoop

; Stuff that need to be updated every frame, chr animation, sprites and the seed counter
FrameUpdateOptionSelect:
  DEC OptionSelectSeedCounter
  JSR OptionMenuAnimationCHRHandling
  JSR UpdateSpriteLogicOptionSelect
  RTS

OptionMenuAnimationCHRHandling:
  DEC CHRTableTimer
  BPL OptionMenuAnimationCHRHandlingQuit
  LDA #CHRAnimationSpeedOption
  STA CHRTableTimer
OptionMenuCHRAnimation:
  LDY SpriteCHR4
  INY
  CPY #CHRStartOptionAnimation + 8
  BNE OptionMenuUpdateCHRTable
  LDY #CHRStartOptionAnimation
OptionMenuUpdateCHRTable:
  STY SpriteCHR4
OptionMenuAnimationCHRHandlingQuit:
  RTS

TransitionContextWindowMode:
  LDA PrevCursorLocation
  ASL A
  ASL A
  ASL A
  TAY
  LDA ContextWindowModePalette + 1, Y
  STA PaletteFadeoutBufferBG_Four + 1
  STA PaletteFadeoutBufferBG_Four + 2
  STA PaletteFadeoutBufferBG_Four + 3
  LDA #$00
  JSR ColorFade

  LDA CursorLocation
  ASL A
  ASL A
  ASL A
  TAY
  LDX #$00
-
  LDA ContextWindowModePalette, Y
  STA PPU_PaletteBufferBackgroundThree, X
  STA PaletteFadeoutBufferBG_Three, X
  INX
  INY
  CPX #$08
  BNE -

  LDA PPU_PaletteBufferBackgroundFour + 1
  STA PPU_PaletteBufferBackgroundFour + 2
  STA PPU_PaletteBufferBackgroundFour + 3
  LDA #$02
  STA ScreenUpdateIndex
  JSR WaitForNMI_Menu
;
  LDY CursorLocation
  LDA CHRBankModeSelect, Y
  STA SpriteCHR3

  JSR InitContextWindow_OptionSelect
  LDA #$01
  JSR ColorFade
  RTS

WorldModeConfirm:
  LDA CursorLocation
  STA SpecialWorld
  LDY PlayerCount
  BEQ UpdateModeMenu
  INC OptionSelectModeIndex
  BNE UpdateModeMenu

PlayerModeConfirm:
  LDA CursorLocation
  STA PlayerCount

UpdateModeMenu:
  STA PrevCursorLocation
  INC OptionSelectModeIndex
  LDY OptionSelectModeIndex
  LDA OR_TableOptionSelect, Y
  STA CursorLocation
  JSR TransitionContextWindowMode
  JMP FrameUpdateModeSelectLoop

RewindOptionSelect:
  LDY OptionSelectModeIndex
  BEQ +
  LDA Rewind_TableOptionSelect, Y
  STA OptionSelectModeIndex
  TAY
  LDA CursorLocation
  STA PrevCursorLocation
  LDA OR_TableOptionSelect, Y
  STA CursorLocation
  JSR TransitionContextWindowMode
+
  JMP FrameUpdateModeSelectLoop


Rewind_TableOptionSelect:
  .db $00, $00, $01, $01

AND_TableOptionSelect:
  .db $01, $03, $07, $0B

OR_TableOptionSelect:
  .db $00, $02, $04, $08

OptionSelectConfirmLo:
  .db #<PlayerModeConfirm
  .db #<WorldModeConfirm
  .db #<OptionSelectQuit
  .db #<OptionSelectQuit
OptionSelectConfirmHi:
  .db #>PlayerModeConfirm
  .db #>WorldModeConfirm
  .db #>OptionSelectQuit
  .db #>OptionSelectQuit
