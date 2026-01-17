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
  .db $40, $80

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

DumpOptionText:
  .db $24, $5A, $03
  .db $24, $9A, $03
  .db $24, $DA, $03
  .db $25, $1A, $03
  .db $25, $5A, $03
  .db $25, $9A, $03

CursorTitleScreenOptionYLookup:
  .db $09
  .db $1A
  .db $2A
  .db $38
  .db $49
  .db $59
  .db $69

CursorLeftTitleScreenOption:
  .db $4D, $B9, $4F, $5B, $BD, $49, $C1

CursorRightTitleScreenOption:
  .db $4D, $BB, $4F, $5D, $BF, $4B, $C3

CursorFlipTitleScreenOption:
  .db $40, $00, $40, $00, $00, $00, $00

LookupTableEOROptionTitleScreen:
  .db $01, $02, $04, $08, $10, $20, $40

CursorPaletteTitleScreenOption:
  .db $0F, $20, $27, $17 ; Star
  .db $0F, $30, $16, $0F ; 1-UP
  .db $0F, $30, $16, $03 ; Orb
  .db $0F, $30, $16, $02 ; Bomb
  .db $0F, $30, $27, $07 ; Lamp
  .db $0F, $30, $14, $04 ; Potion
  .db $0F, $30, $30, $02 ; :)

TitleScreen_Option:
  LDA #$FF
  STA PPUScrollXMirror
  JSR HideAllSprites
  LDA #CHRBank_FontTitleScreen
  STA SpriteCHR1
  LDA #$00
  STA CursorLocation
  JMP CreateCursor_TitleScreen_Option

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
  LDA #$18
  STA PPUBuffer_301, X
  INX
  LDA #$17
  STA PPUBuffer_301, X
  INX
  LDA #$FB
  STA PPUBuffer_301, X
  INX
  BNE LoopCheckYesNo
YesOptions:
  LDA #$2C
  STA PPUBuffer_301, X
  INX
  LDA #$0E
  STA PPUBuffer_301, X
  INX
  LDA #$1B
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


BreakOutOfOptionTitleScreen:
  LDA #$00
  STA PPUScrollXMirror
  LDA #CHRBank_TitleScreenBG1
  STA SpriteCHR1

; Restore sprites
  LDY #$00
RestoreSpritesTitleScreenLoop:
  LDA SpriteTitleScreenDMAInitTable, Y
  STA SpriteDMAArea, Y
  INY
  INY
  INY
  INY
  CPY #$A4
  BNE RestoreSpritesTitleScreenLoop

; Restore birdo palette
  LDA #$3F
  STA PPUBuffer_301
  LDA #$10
  STA PPUBuffer_301 + 1
  LDA #$04
  STA PPUBuffer_301 + 2
  LDA #$0F
  STA PPUBuffer_301 + 3
  LDA #$25
  STA PPUBuffer_301 + 4
  LDA #$02
  STA PPUBuffer_301 + 5
  LDA #$16
  STA PPUBuffer_301 + 6
  LDA #$07
  STA byte_RAM_300
  LDA #$00
  STA CursorLocation
  JMP UpdateTextPalette
