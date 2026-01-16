SpriteTitleScreenDMAInitTable:
  .db $9C, $D1, $03, $60 ; S
  .db $9C, $D3, $03, $68 ; T
  .db $9C, $D5, $03, $70 ; A
  .db $9C, $D7, $03, $78 ; R
  .db $9C, $D3, $03, $80 ; T

  .db $AF, $D9, $02, $60 ; O
  .db $AF, $DB, $02, $68 ; P
  .db $AF, $D3, $02, $70 ; T
  .db $AF, $DD, $02, $78 ; I
  .db $AF, $D9, $02, $80 ; O
  .db $AF, $DF, $02, $88 ; N
  .db $AF, $D1, $02, $90 ; S

; subcon dude
  .db $46, $81, $01, $D7
  .db $46, $83, $01, $DF

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
  .db $60, $A1, $02, $C0
  .db $60, $A3, $02, $C8
  .db $60, $A5, $02, $D0
  .db $60, $A7, $02, $D8

  .db $70, $A9, $02, $C0
  .db $70, $AB, $02, $C8
  .db $70, $AD, $02, $D0
  .db $70, $AF, $02, $D8

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

; Faster than using a multiplication subroutine
DMATextStartingAddress:
  .db $02, $1E

UpdateTextPalette:
  LDA DMATextStartingAddress, Y
  TAY
  LDA #$02
  JSR WriteUpdateTextPalette
  LDY CursorLocation
  LDA DMATextStartingAddress, Y
  TAY
  LDA #$03
  JSR WriteUpdateTextPalette
  RTS

; A value to set
; Y Ram offset
WriteUpdateTextPalette:
  LDX #$00
WriteUpdateTextPaletteLoop:
  STA SpriteDMAArea, Y
  INY
  INY
  INY
  INY ; 8 total cycle, better versus CLC ADC TYA LDA
  INX
  CPX #$07
  BNE WriteUpdateTextPaletteLoop
  RTS
