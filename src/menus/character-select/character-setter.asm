  JSR SetCharacterFromCursor

; Copy both player stats
  LDX #$01
-
  JSR DumpCharacterStatsInRam
  JSR DumpCharacterPaletteInRam
  JSR DumpCarryCharacterInRam
  DEX
  BPL -

; Copy current player stats in ram
  LDX CurrentPlayer
  LDA #<CharacterStatsRAM
  STA byte_RAM_0
  LDA #>CharacterStatsRAM
  STA byte_RAM_1
  JSR SetLoad_DumpCharacterStatsInRam
  LDA #<RestorePlayerPalette0
  STA byte_RAM_0
  LDA #>RestorePlayerPalette0
  STA byte_RAM_1
  JSR SetLoad_DumpCharacterPaletteInRam

  LDA CurrentcharacterPOne, X ; Load current character
  ASL A
  ASL A
  TAY
  LDA CarryYOffsetsStats, Y
  STA ItemCarryYOffsetsRAM
  LDA CarryYOffsetsStats + 1, Y
  STA ItemCarryYOffsetsRAM + $07
  LDA CarryYOffsetsStats + 2, Y
  STA ItemCarryYOffsetsRAM + $0E
  LDA CarryYOffsetsStats + 3, Y
  STA ItemCarryYOffsetsRAM + $15
