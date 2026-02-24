; Tables used for character select
WordListIndexCharSelect:
  .db $00, $08, $0D, $12, $1D, $23

WordListCharSelect:
PlayerText:
  .db $E9, $E5, $DA, $F2, $DE, $EB, $FB
  .db $00

OneText:
  .db $E8, $E7, $DE, $FB
  .db $00

TwoText:
  .db $ED, $F0, $E8, $FB
  .db $00

CharacterText:
  .db $DC, $E1, $DA, $EB, $DA, $DC, $ED, $DE, $EB, $FB
  .db $00

TurnText:
  .db $ED, $EE, $EB, $E7, $FB
  .db $00

SelectText:
  .db $EC, $DE, $E5, $DE, $DC, $ED, $FB
  .db $00

; Truth table with the real cursor index, if indexing from the character
RealCursorIndexTable:
  .db Character_Mario, Character_Luigi, Character_Toad, Character_Princess
  .db Character_Imajin, Character_Mama, Character_Papa, Character_Lina
  .db Character_Merio, Character_Garfield, Character_Toadette, Character_Rosalina
  .db Character_Merio, Character_Garfield

; Curse method to index directly into the DMA memory for the palette
DMATableCharacterPalette:
  .db $12, $22, $32, $42, $52, $62, $72, $82, $92, $A2, $B2, $C2, $92, $A2

Math_CharacterSelectInput:
  .db $01, $FF, $04, $FC
