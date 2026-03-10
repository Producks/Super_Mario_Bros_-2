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

ProtoFunc:
  
