CursorHandling_TitleScreen_Option:
  LDA Player1JoypadPress
  AND #ControllerInput_Down
  BEQ CheckUP_TitleScreen_Option
  INC CursorLocation
  LDA CursorLocation
  EOR #$07
  BNE CheckSideInput_TitleScreen_Option
  STA CursorLocation
  BEQ CheckSideInput_TitleScreen_Option

CheckUP_TitleScreen_Option:
  LDA Player1JoypadPress
  AND #ControllerInput_Up
  BEQ CheckSideInput_TitleScreen_Option
  DEC CursorLocation
  BPL CheckSideInput_TitleScreen_Option
  LDA #$06
  STA CursorLocation

CheckSideInput_TitleScreen_Option:
  LDA Player1JoypadPress
  AND #ControllerInput_A | ControllerInput_Start
  BEQ CreateCursor_TitleScreen_Option
  LDA #SoundEffect1_CherryGet
  STA SoundEffectQueue1
  LDY CursorLocation
  CPY #$06
  BNE SetSettingsTitleScreen
  JMP BreakOutOfOptionTitleScreen
SetSettingsTitleScreen:
  LDA LookupTableEOROptionTitleScreen, Y
  EOR SettingsTitleScreen
  STA SettingsTitleScreen

CreateCursor_TitleScreen_Option:
; Set cursor palette
  LDA #$3F
  STA PPUBuffer_301
  LDA #$10
  STA PPUBuffer_301 + 1
  LDA #$04
  STA PPUBuffer_301 + 2
  LDA CursorLocation
  ASL
  ASL
  TAY
  LDX #$00
SetPaletteCursor_Option_Loop:
  LDA CursorPaletteTitleScreenOption, Y
  STA PPUBuffer_301 + 3, X
  INY
  INX
  CPX #$04
  BNE SetPaletteCursor_Option_Loop
  LDA byte_RAM_300
  CLC
  ADC #$07
  STA byte_RAM_300

; Set Y position for the sprite
  LDY CursorLocation
  LDA CursorTitleScreenOptionYLookup, Y
  STA $029C
  STA $02A0

; Set tiles
  LDA CursorLeftTitleScreenOption, Y
  STA $029D
  LDA CursorRightTitleScreenOption, Y
  STA $02A1

; Set Flip
  LDA CursorFlipTitleScreenOption, Y
  STA $02A2

; Set deez options
  LDX byte_RAM_300
  LDY #$00
  LDA SettingsTitleScreen
  STA Player2JoypadHeld ; Use has trown away memory
DumpOptionsLoop:
  LDA DumpOptionText, Y
  STA PPUBuffer_301, X
  INY
  INX
  LDA DumpOptionText, Y
  STA PPUBuffer_301, X
  INY
  INX
  LDA DumpOptionText, Y
  STA PPUBuffer_301, X
  INY
  INX
  LSR Player2JoypadHeld
  BCS YesOptions
NoOptions:
  LDA #$78
  STA PPUBuffer_301, X
  INX
  LDA #$77
  STA PPUBuffer_301, X
  INX
  LDA #$FB
  STA PPUBuffer_301, X
  INX
  BNE LoopCheckYesNo
YesOptions:
  LDA #$5C
  STA PPUBuffer_301, X
  INX
  LDA #$6E
  STA PPUBuffer_301, X
  INX
  LDA #$7B
  STA PPUBuffer_301, X
  INX
LoopCheckYesNo:
  CPY #$12
  BNE DumpOptionsLoop
  LDA #$00
  STA PPUBuffer_301, X
  LDA byte_RAM_300
  CLC
  ADC #$25
  STA byte_RAM_300

InfiniteLoop:
  JSR TitleScreenCHRHandling
  JSR WaitForNMI_Menu
  JMP CursorHandling_TitleScreen_Option
