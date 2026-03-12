; This file contains subroutines that are called by the title screen and the option select
; Some of these subroutines might not even be used anymore

GameplayInputFuncHiTable:
  .db >SoloMode
  .db >TraditionalMode
  .db >TagMode
  .db >OnePlayerTwoControllers
  .db >RunTimerChaos

GameplayInputFuncLoTable:
  .db <SoloMode
  .db <TraditionalMode
  .db <TagMode
  .db <OnePlayerTwoControllers
  .db <RunTimerChaos

TitleScreenPPUDataPointers:
	.dw PPUBuffer_301
	.dw DecodedLevelData
  .dw PPU_PaletteBuffer
  .dw MenuBorder
  .dw MenuFirstOption ; To speed up the transition

WaitForNMI_Menu_TurnOffPPU:
	LDA #$00
	BEQ WaitForNMI_Menu_StuffPPUMask ; Branch always

WaitForNMI_Menu_TurnOnPPU:
	LDA #PPUMask_ShowLeft8Pixels_BG | PPUMask_ShowLeft8Pixels_SPR | PPUMask_ShowBackground | PPUMask_ShowSprites

WaitForNMI_Menu_StuffPPUMask:
  STA PPUMaskMirror

WaitForNMI_Menu:
	LDA ScreenUpdateIndex
	ASL A
	TAX
	LDA TitleScreenPPUDataPointers, X
	STA RAM_PPUDataBufferPointer
	LDA TitleScreenPPUDataPointers + 1, X
	STA RAM_PPUDataBufferPointer + 1

	LDA #$00
	STA NMIWaitFlag
WaitForNMI_Menu_Loop:
	LDA NMIWaitFlag
	BPL WaitForNMI_Menu_Loop

	RTS

InitContextWindow_OptionSelect:
  JSR LoadNew_PTR_OptionSelect
  LDA #$00
  STA RowDrawingOptionSelect
-
  JSR LoadContextLine_OptionSelect
  JSR LoadContextLine_OptionSelect
  JSR FrameUpdateOptionSelect
  JSR WaitForNMI_Menu
  LDA RowDrawingOptionSelect
  CMP #$10
  BNE -
  RTS

; Dump all the content in memory so I can use it easily later on
LoadNew_PTR_OptionSelect:
  LDA CursorLocation
  ASL A
  ASL A
  ASL A
  ASL A
  TAY
  LDX #$00
-
  LDA OptionSelectLoTable, Y
  STA $6900, X
  LDA OptionSelectHiTable, Y
  STA $6910, X
  INX
  INY
  CPX #$10
  BNE -
  RTS

LoadContextLine_OptionSelect:
  LDY RowDrawingOptionSelect ; Load in which row we are

  LDA $6900, Y
  STA byte_RAM_0
  LDA $6910, Y
  STA byte_RAM_1

  LDX byte_RAM_300 ; Load where we are in the buffer

  LDA TileMapFirstOptionSelect, Y
  STA PPUBuffer_301, X
  INX
  LDA TileMapSecondOptionselect, Y
  STA PPUBuffer_301, X
  INX

  LDY #$00
-
  LDA (byte_RAM_0), Y
  STA PPUBuffer_301, X
  CMP #$FF
  BEQ +
  INX
  INY
  BNE -
+
  LDA #$00
  STA PPUBuffer_301, X ; Set terminating 0
  STX byte_RAM_300
  INC RowDrawingOptionSelect
  RTS
