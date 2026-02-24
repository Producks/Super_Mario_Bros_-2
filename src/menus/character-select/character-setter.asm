; Set current character according to cursor location
  LDA CursorLocation
  STA CurrentCharacter ; Set current character
  STA CurrentcharacterPOne
  LDA CursorLocationPTwo
  STA CurrentCharacterPTwo

  LDY CursorLocation
  LDA CharacterStatsLo, Y
  STA FuncLoTemp
  LDA CharacterStatsHi, Y
  STA FuncHiTemp

; Copy character stats
  LDY #$00
CopyPlayerOneStatsLoop:
  LDA (FuncLoTemp), Y
  STA PlayerOneStatsRam, Y
  STA CharacterStatsRAM, Y
  INY
  CPY #kCharacterStatsTotal
  BCC CopyPlayerOneStatsLoop

CopyPlayerOnePalette:
	LDA CurrentcharacterPOne
	ASL A
	ASL A
	TAY
	LDX #$00
CopyPlayerOnePaletteLoop:
  LDA PlayerOneCharacterPaletteRamTable, Y
  STA PlayerOnePaletteRam, X
  STA RestorePlayerPalette0, X
  INY
  INX
  CPX #$04
  BNE CopyPlayerOnePaletteLoop
