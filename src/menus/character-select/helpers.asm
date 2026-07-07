;
; Global functions that can help with certain things...
;

MultiplyBy16:
  ASL A
  ASL A
  ASL A
  ASL A
  RTS

;
; Set which character accordin to which player and the cursor location
;
SetCharacterFromCursor:
  LDY PlayerPickingCharacterSelect
  LDA CursorLocation
  STA CurrentcharacterPOne, Y
  RTS

PlayerOneCarryStatsLo_Write:
  .db #<PlayerOneCarryStats
  .db #<PlayerTwoCarryStats

; FuncLo and Funchi point to where we read from
; byte_ram_1 and byte_ram_0 are pointing to where to dump the data
; X = Point to which player is currently dumping
DumpCarryCharacterInRam:
  LDA PlayerOneCarryStatsLo_Write, X
  STA byte_RAM_0

SetRead_DumpCarryCharacterRam:
  LDA CurrentcharacterPOne, X ; Load current character
  STX byte_RAM_2 ; Stash x to restore it later
  ASL A
  ASL A
  TAX
  LDY #$00
-
  LDA CarryYOffsetsStats, X
  STA (byte_RAM_0), Y
  INY
  INX
  CPY #$04
  BNE -
  LDX byte_RAM_2 ; Restore X
  RTS

DumpPaletteStatsInRamLo_Write:
  .db #<PlayerOnePaletteRam
  .db #<PlayerTwoPaletteRam

DumpPaletteStatsInRamLo_Read:
  .db #<PlayerOneCharacterPaletteRamTable
  .db #<PlayerTwoCharacterPaletteRamTable

; Dump palette in ram
; FuncLo and Funchi point to where we read from
; byte_ram_1 and byte_ram_0 are pointing to where to dump the data
; X = Point to which player is currently dumping
DumpCharacterPaletteInRam:
; Load where we are dumping from
  LDA DumpPaletteStatsInRamLo_Write, X
  STA byte_RAM_0
  LDA #>PlayerOnePaletteRam ; Should be Fixed to $7F
  STA byte_RAM_1

; Load where we are reading from
SetLoad_DumpCharacterPaletteInRam:
  LDA DumpPaletteStatsInRamLo_Read, X
  STA FuncLoTemp
  LDA #>PlayerTwoCharacterPaletteRamTable ; Should be fixed to #$7F
  STA FuncHiTemp

  LDA CurrentcharacterPOne, X
	ASL A
	ASL A
  CLC
  ADC FuncLoTemp
  STA FuncLoTemp

  LDY #$00
CopyPaletteInRAMLoop:
  LDA (FuncLoTemp), Y
  STA (byte_RAM_0), Y
  INY
  CPY #$04
  BNE CopyPaletteInRAMLoop
  RTS

DumpCharacterStatsInRamLo:
  .db #<PlayerOneStatsRam
  .db #<PlayerTwoStatsRam

; Dump Character Stats
; byte_ram_1 and byte_ram_0 are pointing to where to dump the data
; X = Point to which player is currently dumping
DumpCharacterStatsInRam:
; Load where we're dumping the data
  LDA DumpCharacterStatsInRamLo, X
  STA byte_RAM_0
  LDA #>PlayerOneStatsRam ; Should be fixed to #$7F
  STA byte_RAM_1
SetLoad_DumpCharacterStatsInRam:
; Load stats PTR with the X offset
  LDY CurrentcharacterPOne, X
  LDA CharacterStatsLo, Y
  STA FuncLoTemp
  LDA CharacterStatsHi, Y
  STA FuncHiTemp
; Setup index for the loop
  LDY #$00
CopyPlayerOneStatsLoop:
  LDA (FuncLoTemp), Y
  STA (byte_RAM_0), Y
  INY
  CPY #kCharacterStatsTotal
  BCC CopyPlayerOneStatsLoop
  RTS

;
; X = Value to set
;
SetCharacter_OAM_Palette:
  LDA CursorLocation
  JSR MultiplyBy16
  TAY
  TXA
  STA SpriteDMAArea + 2, Y
  STA SpriteDMAArea + 6, Y
  STA SpriteDMAArea + 10, Y
  STA SpriteDMAArea + 14, Y
  RTS

;
; Print the text at the bottom of the character select
; Variation with 1-2P mode
PrintTextCharSelect:
  LDY byte_RAM_300
  LDA #$23
  STA PPUBuffer_301, Y
  INY
  LDA GamePlayMode
  CMP #$04
  BMI DisplayOnePlayerTextCharSelect

DisplayTwoPlayerTextCharSelect:
  LDA #$68
  STA PPUBuffer_301, Y
  INY
  LDA #$10
  STA PPUBuffer_301, Y
  INY

  LDX #$02 ; PlayerText
  JSR PrintWordCharSelect

  JSR PrintCurrentPlayerNumberCharacterSelect

  LDX #$04
  JSR PrintWordCharSelect
  JMP +

DisplayOnePlayerTextCharSelect:
  LDA #$66
  STA PPUBuffer_301, Y
  INY
  LDA #$15
  STA PPUBuffer_301, Y
  INY

  LDX #$05 ; SelectText
  JSR PrintWordCharSelect

  LDX #$03 ; CharacterText
  JSR PrintWordCharSelect

  JSR PrintCurrentPlayerNumberCharacterSelect

+
  LDA #$00
  STA PPUBuffer_301, Y

  STY byte_RAM_300

  RTS

PrintCurrentPlayerNumberCharacterSelect:
  LDX PlayerPickingCharacterSelect

PrintWordCharSelect:
  LDA WordListIndexCharSelect, X
  TAX
PrintWordCharSelectLoop:
  LDA WordListCharSelect, X
  BEQ LeavePRintWordCharSelect
  STA PPUBuffer_301, Y
  INY
  INX
  BNE PrintWordCharSelectLoop
LeavePRintWordCharSelect:
  RTS


DumpCharacterSpritesSelect:
  LDY #$00
  LDX #$00
-
	LDA PlayerSelectMarioSprites1, Y
	STA SpriteDMAArea, X
  INY
  INX
	LDA PlayerSelectMarioSprites1, Y
	STA SpriteDMAArea, X
  INY
  INX
  LDA #$00
  STA SpriteDMAArea, X
  INX
	LDA PlayerSelectMarioSprites1, Y
  STA SpriteDMAArea, X
  INY
  INX
	BNE -
  RTS

SetCharacterPaletteSlotTwo:
  JSR GetPlayerCharacterIndexPalette_CharacterSelect
  LDX #$00
-
  LDA PlayerOneCharacterPaletteRamTable, Y
  STA PPU_PaletteBufferSpriteTwo, X
  INX
  INY
  CPX #$04
  BNE -
  LDA #$02
  STA ScreenUpdateIndex
  RTS


InputReaderCharacterSelect:
  LDA CurrentPlayer
  BEQ +
  LDA Player2JoypadPress
  STA Player1JoypadPress
  LDA Player2JoypadHeld
  STA Player1JoypadHeld
+
  RTS


; Check the current player and give you the correct index
; for the palette
GetPlayerCharacterIndexPalette_CharacterSelect:
  LDA CursorLocation
  ASL A
  ASL A
  LDY PlayerPickingCharacterSelect
  BEQ +
  CLC
  ADC #$40
+
  TAY
  RTS

; Set character pick pose
SetCharacterPickPose:
  LDA CursorLocation
  JSR MultiplyBy16
  TAY
  LDX #$03
-
  LDA SpriteDMAArea + 1, Y
  EOR #$20
  STA SpriteDMAArea + 1, Y
  INY
  INY
  INY
  INY
  DEX
  BPL -
  RTS

; End of helpers
