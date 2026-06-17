TitleScreenLoop:

; Input reading
  LDA Player1JoypadPress
  AND #ControllerInput_Start | ControllerInput_A
  BEQ CheckCursorInputTitleScreen
  LDA CursorLocation
  BEQ LeaveTitleScreen
  LDA #SoundEffect1_CherryGet
  STA SoundEffectQueue1
  JMP TitleScreen_Option
LeaveTitleScreen:
  JMP TitleScreen_Exit ; Leave the title screen

; Cursor Logic
CheckCursorInputTitleScreen:
  LDA Player1JoypadPress
  AND #ControllerInput_Select | ControllerInput_Down | ControllerInput_Up
  BEQ UpdateSpriteTitleScreen ; Branch to update sprite if no input are set
  LDY CursorLocation
  TYA
  EOR #$01 ; The cursor can only be 0 or 1, so we just flip the bit everytime we get an input
  STA CursorLocation
UpdateTextPalette:
  LDY #$00
UpdateTextPaletteLoop:
  LDA $0201, Y
  EOR #$20
  STA $0201, Y
  LDA $0202, Y
  EOR #$02
  STA $0202, Y
  INY
  INY
  INY
  INY
  CPY #$30
  BNE UpdateTextPaletteLoop

UpdateSpriteTitleScreen:
  JSR UpdateSpriteTitleScreenRoutine
  JSR TitleScreenCHRHandling
  JSR CheckForCheatCode
LoopWait:
  INC TitleScreenSeedCounter
  JSR WaitForNMI_Menu
  JMP TitleScreenLoop

; ------------------------------------------------------------
; Sprite update subroutine
; Update sprite palette on a timer
; ------------------------------------------------------------
UpdateSpriteTitleScreenRoutine:
UpdateSpriteAnimationTitleScreen:
  LDA TitleScreenSeedCounter
  AND #$0F
  EOR #$0F
  BNE BirdSpriteLogicTitleScreen

  LDX #$04 ; Number of sprites to animate
  LDY #$00
UpdateShyGuyCrapetLoop:
  LDA $0231, Y
  EOR #$04
  STA $0231, Y
  INY
  INY
  INY
  INY
  DEX
  BNE UpdateShyGuyCrapetLoop

BirdSpriteLogicTitleScreen: ; This make the bird move, directly decrease X position in the RAM DMA area
  DEC $0243
  DEC $0247
  DEC $024B
  DEC $024F

UpdateSpritePalette:
  DEC PaletteTimer
  BPL LeaveUpdateSpriteTitleScreen
  LDA #SpritePaletteTimer ; Reset back the timer
  STA PaletteTimer

  LDY byte_RAM_300
  LDA #$3F
  STA PPUBuffer_301, Y
  INY
  LDA #$1D
  STA PPUBuffer_301, Y
  INY
  LDA #$03
  STA PPUBuffer_301, Y
  INY

  LDX TitleScreenPaletteSpriteIndex
  JSR LowerIndexTitleScreen
  STX TitleScreenPaletteSpriteIndex
  JSR LowerIndexTitleScreen
  JSR LowerIndexTitleScreen
  STY byte_RAM_300
  LDA #$00
  STA PPUBuffer_301, Y
LeaveUpdateSpriteTitleScreen:
  RTS

LowerIndexTitleScreen:
  DEX
  BPL +
  LDX #SpritePaletteStartingIndex
+:
  LDA PaletteColorTableTitleScreen, X
  STA PPUBuffer_301, Y
  INY
  RTS

; ------------------------------------------------------------
; Title screen GFX handling
; Include palette update, graphic update and nametable udpate
; ------------------------------------------------------------
TitleScreenCHRHandling:
CoolDownChrAnimationHandling:
  DEC CHRTableTimer
  BPL LeaveTitleScreenChrHandling
  LDA #CHRAnimationSpeedTitleScreen
  STA CHRTableTimer
UpdateCHRAnimation:
  LDY SpriteCHR3
  INY
  INY
  CPY #CHRBank_Animated8 + 2
  BNE UpdateChrTable
  LDY #CHRBank_Animated1
UpdateChrTable:
  STY SpriteCHR3
  STY BackgroundCHR1
  INY
  STY SpriteCHR4
LeaveTitleScreenChrHandling:
  RTS

CheckForCheatCode:
  LDY #$00
CheckForCheatCodeLoop:
  JSR CheatCheckSubRoutine
  INY
  CPY #$05
  BNE CheckForCheatCodeLoop
  RTS

CheatCodeTableCode:
  .db AllCharactersFloatCheat, PlaceHolderCheat

StartingIndexTableCheats:
  .db $00, $06

CheatCodeTable:
AllCharactersFloatCode:
  .db ControllerInput_Select, ControllerInput_Select, ControllerInput_Select, ControllerInput_Select, ControllerInput_Left, ControllerInput_Select

PlaceHolderCode:
  .db ControllerInput_Up, ControllerInput_Up, ControllerInput_Down, ControllerInput_Down, ControllerInput_Left, ControllerInput_Right

; ------------------------------------------------------------
; Desc:
;       Check for a cheat code according to the index stored in Y
;       Will also apply a cheat code if there a match
; Params:
;         Y = Index of the cheat code to check
; ------------------------------------------------------------
CheatCheckSubRoutine:
  LDA Player1JoypadPress
  BEQ LeaveCheatSubRoutine ; If we have no input, leave!
  LDA StartingIndexTableCheats, Y
  STA TempVariableCheat
  LDA ExtraLivesCheatCounter, Y
  CLC
  ADC TempVariableCheat
  TAX ; Now X own the current index we need to check

  LDA Player1JoypadPress
  CMP CheatCodeTable, X
  BNE ResetCheatCounter

  LDA ExtraLivesCheatCounter, Y
  TAX
  INX
  TXA
  STA ExtraLivesCheatCounter, Y
  CMP #$06
  BNE LeaveCheatSubRoutine
  LDA #Music2_CrystalGetFanfare
  STA MusicQueue2
  LDA CheatCode
  ORA CheatCodeTableCode, Y
  STA CheatCode

ResetCheatCounter:
  LDA #$00
  STA ExtraLivesCheatCounter, Y

LeaveCheatSubRoutine:
  RTS
