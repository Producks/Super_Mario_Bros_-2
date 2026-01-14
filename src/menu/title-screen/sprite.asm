SpriteTitleScreenDMAInitTable:
  .db $9C, $EC, $03, $60 ; S
  .db $9C, $ED, $03, $68 ; T
  .db $9C, $DA, $03, $70 ; A
  .db $9C, $EB, $03, $78 ; R
  .db $9C, $ED, $03, $80 ; T

  .db $9C, $CA, $03, $88 ; 0
  .db $9C, $CA, $03, $90 ; 0

  .db $AF, $E8, $02, $60 ; O
  .db $AF, $E9, $02, $68 ; P
  .db $AF, $ED, $02, $70 ; T
  .db $AF, $E2, $02, $78 ; I
  .db $AF, $E8, $02, $80 ; O
  .db $AF, $E7, $02, $88 ; N
  .db $AF, $EC, $02, $90 ; S

; subcon dude
  .db $56, $80, $01, $D7
  .db $56, $82, $01, $DF
  .db $5E, $84, $01, $D7
  .db $5E, $86, $01, $DF

; Shyguy
  .db $1F, $88, $03, $32
  .db $1F, $8A, $03, $3A
  .db $27, $8C, $03, $32
  .db $27, $8E, $03, $3A

; Bird
  .db $0F, $60, $21, $C3
  .db $0F, $62, $21, $CB
  .db $0F, $64, $21, $D3
  .db $0F, $66, $21, $DB

  .db $17, $61, $21, $C3
  .db $17, $63, $21, $CB
  .db $17, $65, $21, $D3
  .db $17, $67, $21, $DB

; Birdoooo
  .db $5E, $90, $00, $1E
  .db $5E, $92, $00, $26
  .db $5E, $94, $00, $2E

  .db $66, $91, $00, $1E
  .db $66, $93, $00, $26
  .db $66, $95, $00, $2E
  .db $66, $97, $00, $36

  .db $6E, $B0, $00, $1E
  .db $6E, $B2, $00, $26
  .db $6E, $B4, $00, $2E
  .db $6E, $B6, $00, $36

  .db $76, $B1, $00, $1E
  .db $76, $B3, $00, $26
  .db $76, $B5, $00, $2E
  .db $76, $B7, $00, $36

  .db $7E, $98, $00, $1E
  .db $7E, $9A, $00, $26
  .db $7E, $9C, $00, $2E

; Cursor option menu
  .db $F8, $C0, $00, $10
  .db $F8, $C2, $00, $18
  .db $F8, $C1, $00, $10
  .db $F8, $C3, $00, $18

SpriteDMAInitSize = $D0

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
