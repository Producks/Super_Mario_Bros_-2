; This file contains subroutines that are called by the title screen and the option select
; Some of these subroutines might not even be used anymore

GameplayInputFuncHiTable:
  .db >SoloMode
  .db >SoloMode
  .db >SoloMode
  .db >SoloMode
  .db >TraditionalMode
  .db >TagMode
  .db >OnePlayerTwoControllers
  .db >RunTimerChaos

GameplayInputFuncLoTable:
  .db <SoloMode
  .db <SoloMode
  .db <SoloMode
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
  LDY CursorLocation
  LDA PointerTableOptionSelectStartingIndex, Y
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

  LDA TileMapFirstOptionSelect, Y ; Load option
  STA PPUBuffer_301, X
  INX
  LDA TileMapSecondOptionselect, Y
  STA PPUBuffer_301, X
  INX
  LDA #$18
  STA PPUBuffer_301, X
  STA byte_RAM_2 ; Set a counter of 18. When we reach 0 it mean we finished the line
  INX

  LDY #$00
Load_New_Option_Unpack_Line_Option_Select:
  LDA (byte_RAM_0), Y ; Load type of unpacking + length
  STA byte_RAM_3
  AND #$3F ; Get the length of what we are working with XX00 0000
  STA byte_RAM_4
  INY
  BIT byte_RAM_3
  BMI Unpack_Compressed_Repeat_Double ; Branch if bit 7 is set
  BVS Unpack_Compressed_Repeat_Regular_Option_Select ; Branch if bit 6 is set

Regular_Unpack_Load_Tile_Option_Select:
  LDA (byte_RAM_0), Y ; Get the tile ID
  STA PPUBuffer_301, X
  INX
  INY
  DEC byte_RAM_2 ; Decrease global counter for the line
  BEQ Unpacking_Line_Done ; If 0 we're done
  DEC byte_RAM_4 ; Decrease counter for the instruction length
  BNE Regular_Unpack_Load_Tile_Option_Select ; Loop back if we aren't done
  BEQ Load_New_Option_Unpack_Line_Option_Select ; Get a new option since we aren't done

Unpacking_Line_Done:
  LDA #$00
  STA PPUBuffer_301, X ; Set terminating 0
  STX byte_RAM_300
  INC RowDrawingOptionSelect
  RTS

Unpack_Compressed_Repeat_Regular_Option_Select:
  LDA (byte_RAM_0), Y ; Get the tile ID
-
  STA PPUBuffer_301, X
  INX
  DEC byte_RAM_2
  BEQ Unpacking_Line_Done
  DEC byte_RAM_4
  BNE -
  INY
  BNE Load_New_Option_Unpack_Line_Option_Select

Unpack_Compressed_Repeat_Double:
  LDA (byte_RAM_0), Y ; Get the tile ID
  STA byte_RAM_5
  INY
  LDA (byte_RAM_0), Y ; Get the second tile ID
  STA byte_RAM_6
-
  LDA byte_RAM_5
  STA PPUBuffer_301, X
  INX
  LDA byte_RAM_6
  STA PPUBuffer_301, X
  INX
  DEC byte_RAM_2
  DEC byte_RAM_2
  BEQ Unpacking_Line_Done
  DEC byte_RAM_4
  BNE -
  INY
  BNE Load_New_Option_Unpack_Line_Option_Select