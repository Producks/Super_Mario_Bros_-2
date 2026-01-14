TitleScreenLoop:

; Input reading
  LDA Player1JoypadPress
  CMP #ControllerInput_Start
  BNE CheckCursorInputTitleScreen
  LDA CursorLocation
  BEQ LeaveTitleScreen
  JMP TitleScreen_Option
LeaveTitleScreen:
  JMP TitleScreen_Exit ; Leave the title screen

; Cursor Logic
CheckCursorInputTitleScreen:
  AND #ControllerInput_Select | ControllerInput_Down | ControllerInput_Up
  BEQ UpdateSpriteTitleScreen ; Branch to update sprite if no input are set
  LDY CursorLocation
  TYA
  EOR #$01 ; The cursor can only be 0 or 1, so we just flip the bit everytime we get an input
  STA CursorLocation
  JSR UpdateTextPalette

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

UpdateShyGuyCarpet:
  LDA TitleScreenSeedCounter
  AND #$0F
  EOR #$0F
  BNE MakeSpriteMoveLeftTitleScreen
  LDX #$08
  LDY #$00
UpdateShyGuyCrapetLoop:
  LDA $0239, Y
  EOR #$01
  STA $0239, Y
  INY
  INY
  INY
  INY
  DEX
  BNE UpdateShyGuyCrapetLoop

MakeSpriteMoveLeftTitleScreen: ; This make the bird move, directly decrease X position in the RAM DMA area
  DEC $025B
  DEC $025F
  DEC $0263
  DEC $0267
  DEC $026B
  DEC $026F
  DEC $0273
  DEC $0277

UpdateSpritePalette:
  DEC PaletteTimer
  BPL LeaveUpdateSpriteTitleScreen
  LDA #SpritePaletteTimer ; Reset back the timer
  STA PaletteTimer
  LDA #$02
  STA ScreenUpdateIndex ; Tell the NMI to update the palette
  LDY TitleScreenPaletteSpriteIndex
  DEY
  BPL SetNewPaletteSprite
  LDY #SpritePaletteStartingIndex
SetNewPaletteSprite:
  LDA PaletteColorTableTitleScreen, Y
  STA PPU_PaletteBuffer + 3
  STY TitleScreenPaletteSpriteIndex
LeaveUpdateSpriteTitleScreen:
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

ExtraLivesCode:
  .db ControllerInput_Left, ControllerInput_Right, ControllerInput_Left, ControllerInput_Right, ControllerInput_Up, ControllerInput_Down

ExtraContinuesCode:
  .db ControllerInput_B, ControllerInput_B, ControllerInput_B, ControllerInput_B, ControllerInput_B, ControllerInput_Right

DokiDokiRunCode:
  .db ControllerInput_Up, ControllerInput_Up, ControllerInput_Down, ControllerInput_Down, ControllerInput_Right, ControllerInput_Right

WarioWaluigiCode:
  .db ControllerInput_Right, ControllerInput_Right, ControllerInput_Up, ControllerInput_Right, ControllerInput_Right, ControllerInput_Up

AllCharactersFloatCode:
  .db ControllerInput_Select, ControllerInput_Select, ControllerInput_Select, ControllerInput_Select, ControllerInput_Left, ControllerInput_Select

StartingIndexTableCheats:
  .db $00, $06, $0C, $12, $18

CheatCodeTableCode:
  .db ExtraLivesCheat, ExtraContinuesCheat, DokiDokiRunCheat, WarioWaluigiCheat, AllCharactersFloatCheat

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
  CMP ExtraLivesCode, X
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

CursorTitleScreenOptionYLookup:
  .db $0B, $1B, $2B, $3B, $4B, $5B, $6B

CursorTopLeftTitleScreenOption:
  .db $4C, $C0, $4E, $5A, $C4, $48, $CC

CursorTopRightTitleScreenOption:
  .db $4C, $C2, $4E, $5C, $C6, $4A, $CE

CursorBottomLeftTitleScreenOption:
  .db $4D, $C1, $4F, $5B, $C5, $49, $CD

CursorBottomRightTitleScreenOption:
  .db $4D, $C3, $4F, $5D, $C7, $4B, $CF

CursorFlipTitleScreenOption:
  .db $40, $00, $40, $00, $00, $00, $00

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
  AND #ControllerInput_Left | ControllerInput_Right | ControllerInput_A
  BEQ CreateCursor_TitleScreen_Option


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

; Set Y position for the sprite
  LDY CursorLocation
  LDA CursorTitleScreenOptionYLookup, Y
  STA $02C0
  STA $02C4
  CLC
  ADC #$08
  STA $02C8
  STA $02CC

; Set tiles
  LDA CursorTopLeftTitleScreenOption, Y
  STA $02C1
  LDA CursorTopRightTitleScreenOption, Y
  STA $02C5
  LDA CursorBottomLeftTitleScreenOption, Y
  STA $02C9
  LDA CursorBottomRightTitleScreenOption, Y
  STA $02CD

; Set Flip
  LDA CursorFlipTitleScreenOption, Y
  STA $02C6
  STA $02CE

InfiniteLoop:
  JSR WaitForNMI_Menu
  JSR TitleScreenCHRHandling
  JMP CursorHandling_TitleScreen_Option
