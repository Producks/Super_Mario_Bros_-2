OptionSelectLoop:
  JSR ReadInputOptionMenu
  JSR FrameUpdateOptionSelect
  JMP OptionSelectLoop ; Jump back to the loop

; Stuff that need to be updated every frame, chr animation, sprites and the seed counter
FrameUpdateOptionSelect:
  DEC OptionSelectSeedCounter
  JSR OptionMenuAnimationCHRHandling
  JSR UpdateSpriteLogicOptionSelect
  JSR WaitForNMI_Menu
  RTS

; Wait a fix amount of NMI, but with the frame update
WaitFixedAmountOptionSelectNMI:
  JSR FrameUpdateOptionSelect
  JSR FrameUpdateOptionSelect
  JSR FrameUpdateOptionSelect
  JSR FrameUpdateOptionSelect ; LOL
  RTS

; Range for our index buffer is #$04-#$08
; Check enum for their name
ReadInputOptionMenu:
  LDA Player1JoypadPress
  BEQ LeaveInputReadingOption ; If no input, leave the routine
  AND #ControllerInput_Start | #ControllerInput_A ;  A or Start will select the option the user want
  BEQ ReadInputOptionMenuCheckDirection
  JMP OptionSelectQuit
ReadInputOptionMenuCheckDirection:
  LDA Player1JoypadPress
  CMP #ControllerInput_Left
  BNE ReadInputOptionMenuCheckRight ; If less isn't pressed, check right or start
  LDA CursorLocation ; optmize later
  STA PrevCursorLocation
  DEC CursorLocation
  BPL NoOverflowReadInputLeft
  LDA #ChaosPPUBuffer
  STA CursorLocation
NoOverflowReadInputLeft:
  JSR UpdateGFXMenuOption
  JMP LeaveInputReadingOption
ReadInputOptionMenuCheckRight:
  AND #ControllerInput_Right | #ControllerInput_Select ; Increase -> with -> or select
  BEQ LeaveInputReadingOption
  LDA CursorLocation ; optmize later
  STA PrevCursorLocation
  INC CursorLocation
  LDA CursorLocation
  CMP #$04
  BNE NoOverFlowReadInputRight
  LDA #TraditionalPPUBuffer
  STA CursorLocation
NoOverFlowReadInputRight:
  JSR UpdateGFXMenuOption
LeaveInputReadingOption:
  RTS

; ------------------------------------------------------------
; Fade in the text color and dump the graphics update
; Params: 
;         None
; ------------------------------------------------------------
PaletteTableOtherOption:
  .db $3F, $0E, $02, $25, $0F ; Color palette for the sprite
  .db $00

FadeOutTableHi:
  .db >TraditionalPalette
  .db >TagTeamPalette
  .db >SharedControlPalette
  .db >ChaosSwapPalette

FadeOutTableLo:
  .db <TraditionalPalette
  .db <TagTeamPalette
  .db <SharedControlPalette
  .db <ChaosSwapPalette

; This subroutine works, but is beyond stupid and smart
; Use a temp buffer that is normaly overwritten
FadeOutToOtherOption:
  LDY PrevCursorLocation
  JSR DumpPalettePTR
  JSR FadeOutDumpPaletteUpdate
; First fadeout
  LDA #$00 ; Greyyyyy
  STA PPUBuffer_301 + 9
  JSR WaitFixedAmountOptionSelectNMI
; Second fadeout
  LDA #$3F
  STA PPUBuffer_301 ; Dumb trick to save time
  LDA #$10 ; More 50 shades of greyy
  STA PPUBuffer_301 + 9
  LDA PPUBuffer_301 + 3
  STA PPUBuffer_301 + 8
  JSR WaitFixedAmountOptionSelectNMI
; Last fadeout
  LDA #$3F
  STA PPUBuffer_301 ; This is literally stupid
  LDA PPUBuffer_301 + 3 ; Get true background color
  STA PPUBuffer_301 + 9
  JSR FrameUpdateOptionSelect
  RTS

FadeInToOtherOption:
  LDY CursorLocation
  JSR DumpPalettePTR
  JSR FadeOutDumpPaletteUpdate
; First recolor
  LDA PPUBuffer_301 + 3 ; Load background
  STA PPUBuffer_301 + 7
  STA PPUBuffer_301 + 8
  STA PPUBuffer_301 + 9
  JSR WaitFixedAmountOptionSelectNMI
; Second fadeout
  LDA #$3F
  STA PPUBuffer_301 ; Dumb trick to save time
  LDA #$10 ; More 50 shades of greyy
  STA PPUBuffer_301 + 9
  JSR WaitFixedAmountOptionSelectNMI
; Third Fadeout
  LDA #$3F
  STA PPUBuffer_301 ; Dumb trick to save time
  LDA #$0F ; More 50 shades of greyy
  STA PPUBuffer_301 + 9
  LDA PPUBuffer_301 + 4
  STA PPUBuffer_301 + 8
  JSR FrameUpdateOptionSelect
  RTS

FadeOutDumpPaletteUpdate:
  LDY #$00
FadeOutDumpPaletteUpdateLoop:
  LDA (PaletteOptionLo), Y
  STA PPUBuffer_301, Y
  INY
  CPY #$0B
  BNE FadeOutDumpPaletteUpdateLoop
  LDA byte_RAM_300
  CLC
  ADC #$0B
  STA byte_RAM_300
  RTS

; ------------------------------------------------------------
; Dump palette ptr in ram
; Params: 
;         Y index to drag it from
; ------------------------------------------------------------
DumpPalettePTR:
  LDA FadeOutTableLo, Y
  STA PaletteOptionLo
  LDA FadeOutTableHi, Y
  STA PaletteOptionHi
  RTS

; ------------------------------------------------------------
; Dump gfx while the palette are transparent
; Params: 
;         X the current index we are going to
; ------------------------------------------------------------

; Table holding the pointer to where the begining address is located
MenuGFXPointerTableHi:
  .db >MenuFirstOption
  .db >MenuSecondOption
  .db >MenuThirdOption
  .db >MenuFourthOption

MenuGFXPointerTableLo:
  .db <MenuFirstOption
  .db <MenuSecondOption
  .db <MenuThirdOption
  .db <MenuFourthOption

UpdateGFXMenuOption:
  JSR FadeOutToOtherOption
  LDX CursorLocation
  LDA MenuGFXPointerTableLo, X
  STA MenuPointerLo
  LDA MenuGFXPointerTableHi, X
  STA MenuPointerHi

  LDX #$00
UpdateGFXMenuOptionLoop:
  JSR DumpGFXMenuOptionRoutine ; Dump gfx into ram

; Add what we read to the adress
  LDA MenuPointerLo
  CLC
  ADC #$1B
  STA MenuPointerLo
  BCC NoCarryUpdateGFXMenuOption
  INC MenuPointerHi ; TODO check for bug later BUG BUG
NoCarryUpdateGFXMenuOption:
  TXA
  PHA
  JSR FrameUpdateOptionSelect
;  JSR WaitForNMI_Menu
  PLA
  TAX

  INX ; Increment our index
  CPX #$10
  BNE UpdateGFXMenuOptionLoop
ExitUpdateGFXMenu:
;  JSR UpdateChrBankOption
; Update before we fade the graphics in
  LDA CursorLocation
  CLC
  ADC #CHRStartOption
  STA SpriteCHR3

  JSR FadeInToOtherOption
  RTS

; ------------------------------------------------------------
; Dump gfx in ram for the NMI
; Params: 
;         MenuPointerLo & Hi containt where we are pulling from
; ------------------------------------------------------------

DumpGFXMenuOptionRoutine:
  LDY #$00 ; Index
DumpGFXMenuOptionLoop:
  LDA (MenuPointerLo), Y
  STA PPUBuffer_301, Y
  INY
  CPY #$1B
  BNE DumpGFXMenuOptionLoop
  TYA
  CLC
  ADC byte_RAM_300 ; Add to byte_RAM_300
  STA byte_RAM_300
  RTS

; ------------------------------------------------------------
; Animate the CHR table
; Params: 
;         None
; ------------------------------------------------------------
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
