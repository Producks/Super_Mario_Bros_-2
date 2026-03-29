SpriteTitleScreenDMAInitTable:
  .db $9C, $D1, $03, $60 ; S
  .db $9C, $D3, $03, $68 ; T
  .db $9C, $D5, $03, $70 ; A
  .db $9C, $D7, $03, $78 ; R
  .db $9C, $D3, $03, $80 ; T

  .db $AF, $F9, $01, $60 ; O
  .db $AF, $FB, $01, $68 ; P
  .db $AF, $F3, $01, $70 ; T
  .db $AF, $FD, $01, $78 ; I
  .db $AF, $F9, $01, $80 ; O
  .db $AF, $FF, $01, $88 ; N
  .db $AF, $F1, $01, $90 ; S

; subcon dude
  .db $1F, $81, $01, $B6
  .db $1F, $83, $01, $BE

; Disco Ninji
  .db $1F, $89, $03, $32
  .db $1F, $8B, $03, $3A

; Bird
  .db $0F, $61, $21, $C3
  .db $0F, $63, $21, $CB
  .db $0F, $65, $21, $D3
  .db $0F, $67, $21, $DB

; Birdoooo
  .db $5D, $91, $00, $20
  .db $5D, $93, $00, $28
  .db $5D, $95, $00, $30
  .db $5D, $97, $00, $38

  .db $6D, $B1, $00, $20
  .db $6D, $B3, $00, $28
  .db $6D, $B5, $00, $30
  .db $6D, $B7, $00, $38

  .db $7D, $99, $00, $20
  .db $7D, $9B, $00, $28
  .db $7D, $9D, $00, $30

; Veggie
  .db $60, $A1, $02, $C8
  .db $60, $A3, $02, $D0
  .db $60, $A5, $02, $D8
  .db $60, $A7, $02, $E0

  .db $70, $A9, $02, $C8
  .db $70, $AB, $02, $D0
  .db $70, $AD, $02, $D8
  .db $70, $AF, $02, $E0

; Cursor option menu
  .db $F8, $C1, $00, $10
  .db $F8, $C3, $00, $18

SpriteDMAInitSize = $A4

; This can be optimize by a lot by only using 1 table,
; But I am lazy for now TODO if space needed
CopyDMADataTableTitleScreen:
  LDY #$00 ; Index
CopyDMADataTitleScreenLoop:
  LDA SpriteTitleScreenDMAInitTable, Y
  STA SpriteDMAArea, Y
  INY
  CPY #SpriteDMAInitSize
  BNE CopyDMADataTitleScreenLoop
  RTS
