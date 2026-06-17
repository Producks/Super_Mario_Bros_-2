DumpOptionText:
  .db $24, $5A, $03
  .db $24, $9A, $03
  .db $24, $DA, $03
  .db $25, $1A, $03
  .db $25, $5A, $03
  .db $25, $9A, $03

CursorTitleScreenOptionYLookup:
  .db $09
  .db $1A
  .db $2A
  .db $38
  .db $49
  .db $59
  .db $69

CursorLeftTitleScreenOption:
  .db $4D, $B9, $4F, $5B, $BD, $49, $C1

CursorRightTitleScreenOption:
  .db $4D, $BB, $4F, $5D, $BF, $4B, $C3

CursorFlipTitleScreenOption:
  .db $40, $00, $40, $00, $00, $00, $00

LookupTableEOROptionTitleScreen:
  .db $01, $02, $04, $08, $10, $20, $40

CursorPaletteTitleScreenOption:
  .db $0F, $20, $27, $17 ; Star
  .db $0F, $30, $16, $0F ; 1-UP
  .db $0F, $30, $16, $03 ; Orb
  .db $0F, $30, $16, $02 ; Bomb
  .db $0F, $30, $27, $07 ; Lamp
  .db $0F, $30, $14, $04 ; Potion
  .db $0F, $30, $30, $02 ; :)
