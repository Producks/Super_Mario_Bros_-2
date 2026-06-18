  JSR SetCharacterFromCursor

; Copy both player stats
  LDX #$00
-
  JSR DumpCharacterStatsInRam
  JSR DumpCharacterPaletteInRam
  DEX
  BPL -

; Copy current player stats in ram
  LDX CurrentPlayer
  LDA #<CharacterStatsRAM
  STA byte_RAM_0
  LDA #>CharacterStatsRAM
  STA byte_RAM_1
  JSR DumpCharacterStatsInRam
