; Tables used for character select
WordListIndexCharSelect:
  .db $00, $05, $0A, $12, $1D, $23

WordListCharSelect:
OneText:
  .db $E8, $E7, $DE, $FB
  .db $00

TwoText:
  .db $ED, $F0, $E8, $FB
  .db $00

PlayerText:
  .db $E9, $E5, $DA, $F2, $DE, $EB, $FB
  .db $00

CharacterText:
  .db $DC, $E1, $DA, $EB, $DA, $DC, $ED, $DE, $EB, $FB
  .db $00

TurnText:
  .db $ED, $EE, $EB, $E7, $F9
  .db $00

SelectText:
  .db $EC, $DE, $E5, $DE, $DC, $ED, $FB
  .db $00

Math_CharacterSelectInput:
  .db $01, $FF, $04, $FC

; True or False if we need to pick a second character depending
; on the game mode
Bool_TwoPickModeTable:
  .db $00, $01, $01, $00
  .db $01, $01, $00, $01
