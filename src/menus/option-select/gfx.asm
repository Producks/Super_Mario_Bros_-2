; ------------------------------------------------------------
; Option menu / Game mode menu
; ------------------------------------------------------------

OptionMenuBackgroundPalettes:
	.db $0F, $13, $02, $30
	.db $0F, $30, $26, $0F
	.db $0F, $35, $25, $06 ; Border
	.db $0F, $35, $25, $0F ; Text part of the screen

OptionMenuSpritePalettes:
	.db $0F, $30, $16, $02
	.db $0F, $38, $10, $02
	.db $0F, $30, $25, $02
	.db $0F, $38, $2A, $02

MenuBorder:
  .db $22, $85, $57, $47
  .db $20, $9C, $D0, $49
  .db $20, $A4, $58, $EE

  .db $22, $9C, $01, $48

; Super top half
  .db $22, $F1, $05
  .db $40, $41, $42, $43, $44

; Super bottom half, Mario Bros 2 top part
  .db $23, $11, $0E
  .db $50, $51, $52, $53, $54, $55, $56, $57, $58, $59, $5A, $5B, $5C, $5D

; Mario Bros 2 middle part
  .db $23, $31, $0E
  .db $60, $61, $62, $63, $64, $65, $66, $67, $68, $69, $6A, $6B, $6C, $6D

; Mario Bros 2 bottom part
  .db $23, $51, $0E
  .db $70, $71, $72, $73, $74, $75, $76, $77, $78, $79, $7A, $7B, $7C, $7D

AttributeOptionMenu:
  .db $23, $C0, $30
  .db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
  .db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $AA
  .db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $AA
  .db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $AA
  .db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $AA
  .db $0A, $0A, $0A, $0A, $0A, $0A, $0A, $0A
; End
	.db $00

; Traditional
; Turn Base
MenuFirstOption:
TradionalTopGFX:
  RepeatUnpack $05, $6E
  RegularUnpack +
    .db $4A, $6E, $2D, $2B, $20, $22, $25, $2D, $25, $29, $28, $20, $26, $6E, $4D
  +
  RepeatUnpack $04, $6E

TradionalBottomGFX:
  RepeatUnpack $05, $6E
  RegularUnpack +
    .db $4B, $6E, $3D, $3B, $30, $32, $35, $3D, $35, $39, $38, $30, $36, $6E, $4C
  +
  RepeatUnpack $04, $6E

; Players take turns;
TradionalFirstLineGFX:
  RegularUnpack +
    .db $6E, $0A, $04, $00, $19, $01, $16, $07, $6E, $17, $00, $13, $01, $6E, $17, $08, $16, $05, $07, $0F
  +
  RepeatUnpack $04, $6E

TraditionalThirdLineGFX:
  RegularUnpack +
    .db $6E, $11, $01, $00, $17, $12, $0E, $6E, $09, $00, $16, $06, $03, $05, $02, $0E, $6E, $15, $16
  +
  RepeatUnpack $05, $6E

TraditionalFithLineGFX:
  RegularUnpack +
    .db $6E, $04, $01, $18, $01, $04, $6E, $10, $15, $14, $06, $04, $01, $17, $03, $15, $05, $6E, $07, $09, $00, $06, $07, $6E
  +

TraditionalSeventhLineGFX:
  RegularUnpack +
    .db $6E, $17, $12, $01, $6E, $10, $08, $16, $16, $01, $05, $17, $6E, $06, $04, $00, $19, $01, $16, $1E, $6E, $6E, $84, $85
  +

TraditionalEightLineGFX:
  RepeatUnpack $0F, $6E
  RegularUnpack +
    .db $87, $88, $6E, $6E, $9E, $9F, $6E, $94, $95
  +

TraditionalNinhtLineGFX:
  RepeatUnpack $0B, $6E
  RegularUnpack +
    .db $82, $83, $6E, $6E, $97, $98, $6E, $6E, $AE, $AF, $6E, $A4, $A5
  +

TraditionalTenthLineGFX:
  RegularUnpack +
    .db $6E, $6E, $6E, $80, $81
  +
  RepeatUnpack $06, $6E
  RegularUnpack +
    .db $92, $93, $6E, $6E, $A7, $A8, $6E, $6E, $BE, $BF, $6E, $B4, $B5
  +

TraditionalEleventhLineGFX:
  RegularUnpack +
    .db $6E, $6E, $B0, $90, $91, $B1
  +
  RepeatUnpack $05, $6E
  RegularUnpack +
    .db $A2, $A3, $6E, $6E, $A7, $A8, $6E, $6E, $CA, $CB, $6E, $6E, $86
  +

TraditionalTwelfthLineGFX:
  RegularUnpack +
    .db $6E, $6E, $6E, $A0, $A1, $6E, $6E, $6E, $C9, $D9, $6E, $B2, $B3, $6E, $6E, $A7, $A8, $6E, $6E, $DA, $DB, $6E, $6E, $96
  +

TraditionalThirteenthLineGFX:
  RegularUnpack +
    .db $8A, $8B, $8A, $C8, $C8
  +
  RepeatDoubleUnpack $09, $8B, $8A
  RegularUnpack +
    .db $8B
  +

TraditionalFourteenthLineGFX:
  RegularUnpack +
    .db $9A, $9B, $9A, $D8, $D8
  +
  RepeatDoubleUnpack $09, $9B, $9A
  RegularUnpack +
    .db $9B
  +

; Tag Team
MenuSecondOption:
TagTeamTopGFX:
  RepeatUnpack $06, $6E
  RegularUnpack +
    .db $4A, $6E, $2D, $20, $24, $6E, $2D, $23, $20, $27, $6E, $4D
  +
  RepeatUnpack $06, $6E

TagTeamBottomGFX:
  RepeatUnpack $06, $6E
  RegularUnpack +
    .db $4B, $6E, $3D, $30, $34, $6E, $3D, $33, $30, $37, $6E, $4C
  +
  RepeatUnpack $06, $6E

TagTeamFirstLineGFX:
  RegularUnpack +
    .db $6E, $80, $90, $CC, $CD
  +
  RepeatUnpack $0C, $6E
  RegularUnpack +
    .db $80, $91, $C6, $C7, $6E, $6E, $6E
  +

TagTeamSecondLineGFX:
  RegularUnpack +
    .db $6E, $6E, $6E, $DC, $DD
  +
  RepeatUnpack $0E , $6E
  RegularUnpack +
    .db $D6, $D7, $6E, $6E, $6E
  +

TagTeamThirdLineGFX:
  RegularUnpack+
    .db $6E, $6E, $6E, $EC, $ED, $6E, $6E, $A2, $6E, $8C, $8D, $8E, $8D, $8F, $9C, $6E, $A2, $6E, $6E, $E6, $E7, $6E, $6E, $6E
  +

TagTeamFourthLineGFX:
  RegularUnpack +
    .db $6E, $6E, $6E, $FC, $FD
  +
  RepeatUnpack $0E, $6E
  RegularUnpack +
    .db $F6, $F7, $6E, $6E, $6E
  +

TagTeamFithLineGFX:
  RegularUnpack +
    .db $6E
  +
  RepeatDoubleUnpack $03, $A0, $A1
  RegularUnpack +
    .db $6E, $6E, $A3, $A4, $A5, $A6, $9D, $9E, $6E, $6E
  +
  RepeatDoubleUnpack $03, $A0, $A1
  RegularUnpack +
    .db $6E
  +

TagTeamSixthLineGFX:
  RegularUnpack +
    .db $6E
  +
  RepeatDoubleUnpack $03, $B0, $B1
  RegularUnpack +
    .db $6E, $6E, $B3, $B4, $B5, $B6, $AD, $AE, $6E, $6E
  +
  RepeatDoubleUnpack $03, $B0, $B1
  RegularUnpack +
    .db $6E
  +

TagTeamEightLineGFX:
  RegularUnpack +
  .db $6E, $0A, $16, $01, $07, $07, $6E, $07, $01, $04, $01, $10, $17, $6E, $17, $15, $6E, $07, $09, $00, $06, $6E, $6E, $6E
  +

TagTeamTenthLineGFX:
  RegularUnpack +
    .db $6E, $06, $04, $00, $19, $01, $16, $07, $6E, $14, $03, $11, $2E, $02, $00, $14, $01, $1E, $6E, $0B, $05, $04, $19, $6E
  +

TagTeamTwelfthLineGFX:
  RegularUnpack +
    .db $6E, $17, $12, $01, $6E, $10, $08, $16, $16, $01, $05, $17, $6E, $06, $04, $00, $19, $01, $16, $6E, $10, $00, $05, $6E
  +

TagTeamFourteenthLineGFX:
  RegularUnpack +
    .db $6E, $17, $16, $03, $02, $02, $01, $16, $6E, $00, $6E, $07, $09, $00, $06, $1E
  +
  RepeatUnpack $08, $6E

MenuThirdOption:
SharedTopGFX:
  .db $18
  .db $6E, $6E, $6E, $4A, $EE, $2C, $2E, $20, $2B, $23, $22, $EE, $21, $29, $28, $2D, $2B, $29, $26, $EE, $4D, $6E, $6E, $6E
  .db $FF
SharedBottomGFX:
  .db $18
  .db $6E, $6E, $6E, $4B, $EE, $3C, $3E, $30, $3B, $33, $32, $EE, $31, $39, $38, $3D, $3B, $39, $36, $EE, $4C, $6E, $6E, $6E
  .db $FF

SharedOneGFX:
  .db $18
  .db $6E, $1A, $15, $17, $12, $6E, $06, $04, $00, $19, $01, $16, $07, $6E, $10, $15, $05, $17, $16, $15, $04, $6E, $A6, $A7
  .db $FF

SharedTwoGFX:
  .db $18
  .db $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $B6, $B7
  .db $FF

SharedThreeGFX:
  .db $18
  .db $6E, $17, $12, $01, $6E, $07, $00, $14, $01, $6E, $10, $12, $00, $16, $00, $10, $17, $01, $16, $1E, $6E, $6E, $DE, $DF
  .db $FF

SharedFourGFX:
  .db $18
  .db $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $CE, $CF
  .db $FF

SharedFiveGFX:
  .db $18
  .db $6E, $0A, $04, $00, $19, $01, $16, $6E, $2D, $3E, $6E, $1B, $03, $16, $01, $10, $17, $03, $15, $05, $07, $1E, $DE, $DF
  .db $FF

SharedSixGFX:
  .db $18
  .db $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $80, $81, $6E, $6E, $82, $83, $6E, $6E, $6E, $6E, $6E, $6E, $84, $85
  .db $FF

SharedSevenGFX:
  .db $18
  .db $6E, $6E, $AC, $AD, $8E, $8E, $8E, $8F, $6E, $6E, $90, $91, $6E, $6E, $92, $93, $6E, $6E, $86, $87, $6E, $6E, $94, $95
  .db $FF

SharedEightGFX:
  .db $18
  .db $6E, $6E, $BC, $BD, $AE, $AF, $BE, $BF, $6E, $6E, $A0, $A1, $6E, $6E, $A2, $A3, $6E, $6E, $96, $97, $6E, $6E, $A4, $A5
  .db $FF

SharedNineGFX:
  .db $18
  .db $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $B0, $B0, $6E, $6E, $B0, $B0, $6E, $6E, $B0, $B0, $6E, $6E, $B0, $B0
  .db $FF

SharedTenGFX:
  .db $18
  .db $6E, $0A, $04, $00, $19, $01, $16, $6E, $3D, $3E, $6E, $0C, $1F, $1A, $1E, $6E, $6E, $6E, $6E, $6E, $8A, $8B, $6E, $6E
  .db $FF

SharedElevenGFX:
  .db $18
  .db $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $80, $81, $6E, $6E, $6E, $6E, $88, $89, $6E, $6E, $9A, $9B, $6E, $6E
  .db $FF

SharedTwelveGFX:
  .db $18
  .db $6E, $6E, $8C, $8D, $8E, $8E, $8E, $8F, $6E, $6E, $90, $91, $6E, $E8, $E9, $6E, $98, $99, $6E, $6E, $AA, $AB, $6E, $6E
  .db $FF

SharedThirteenGFX:
  .db $18
  .db $6E, $6E, $9C, $9D, $AE, $AF, $9E, $9F, $6E, $6E, $B1, $B2, $6E, $F8, $F9, $6E, $A8, $A9, $6E, $6E, $BA, $BB, $C8, $C8
  .db $FF

SharedFourteenGFX:
  .db $18
  .db $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $B3, $B4, $6E, $6E, $C9, $D9, $B8, $B9, $C9, $D9, $6E, $6E, $D8, $D8
  .db $FF

; Chaos Swap
MenuFourthOption:
ChaosTopGFX:
;  .db #RegularUnpack | $18
;  .db $6E, $6E, $6E, $6E, $6E, $4A, $6E, $21, $2E, $20, $29, $2C, $EE, $2C, $2F, $20, $2A, $6E, $4D, $6E, $6E, $6E, $6E, $6E

ChaosBottomGFX:
;  .db #RegularUnpack | $18
;  .db $6E, $6E, $6E, $6E, $6E, $4B, $6E, $31, $3E, $30, $39, $3C, $EE, $3C, $3F, $30, $3A, $6E, $4C, $6E, $6E, $6E, $6E, $6E

ChaosOneGFX:
  .db $18
  .db $6E, $1C, $09, $00, $06, $07, $6E, $06, $04, $00, $19, $01, $16, $07, $6E, $6E, $6E, $85, $86, $6E, $83, $93, $6E, $6E
  .db $FF

ChaosTwoGFX:
  .db $18
  .db $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $95, $96, $6E, $6E, $6E, $6E, $6E
  .db $FF

ChaosThreeGFX:
  .db $18
  .db $6E, $00, $17, $6E, $16, $00, $05, $11, $15, $14, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $A5, $A6, $6E, $6E, $6E, $6E, $6E
  .db $FF

ChaosFourGFX:
  .db $18
  .db $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $C0, $C1, $C2, $C3, $6E, $6E, $6E, $6E, $6E, $C0, $C2, $C3
  .db $FF

ChaosFiveGFX:
  .db $18
  .db $6E, $03, $05, $17, $01, $16, $18, $00, $04, $07, $1E, $6E, $D0, $D1, $D2, $D3, $C8, $C8, $C8, $C8, $C8, $D0, $D2, $D3
  .db $FF

ChaosSixGFX:
  .db $18
  .db $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $82, $6E, $6E, $6E, $6E, $6E
  .db $FF

ChaosSevenGFX:
  .db $18
  .db $6E, $0D, $15, $6E, $09, $00, $16, $05, $03, $05, $02, $07, $1E, $6E, $6E, $6E, $A0, $A1, $6E, $C4, $C5, $6E, $6E, $6E
  .db $FF

ChaosEightGFX:
  .db $18
  .db $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $B0, $B1, $6E, $D4, $D5, $6E, $6E, $6E
  .db $FF

ChaosNineGFX:
  .db $18
  .db $6E, $1D, $15, $15, $11, $6E, $04, $08, $10, $13, $84, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $82, $6E, $6E, $6E, $6E, $6E
  .db $FF

ChaosTenGFX:
  .db $18
  .db $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $87, $88, $6E, $83, $94, $6E, $6E
  .db $FF

ChaosElevenGFX:
  .db $18
  .db $6E, $6E, $8A, $8B, $B5, $6E, $6E, $8C, $8D, $8E, $8F, $6E, $6E, $6E, $6E, $6E, $6E, $97, $98, $6E, $6E, $6E, $6E, $6E
  .db $FF

ChaosTwelveGFX:
  .db $18
  .db $6E, $99, $9A, $9B, $B6, $6E, $6E, $9C, $9D, $9E, $9F, $6E, $6E, $6E, $6E, $6E, $6E, $A7, $A8, $6E, $6E, $6E, $6E, $6E
  .db $FF

ChaosThirteenGFX:
  .db $18
  .db $6E, $A9, $AA, $AB, $B7, $6E, $6E, $AC, $AD, $AE, $AF, $6E, $C0, $C1, $C2, $C3, $6E, $6E, $6E, $6E, $6E, $C0, $C2, $C3
  .db $FF

ChaosFourteenGFX:
  .db $18
  .db $6E, $B9, $BA, $BB, $B8, $6E, $6E, $BC, $BD, $BE, $BF, $6E, $D0, $D1, $D2, $D3, $C8, $C8, $C8, $C8, $C8, $D0, $D2, $D3
  .db $FF

OnePlayerTopGFX:
  RepeatUnpack $05, $6E
  RegularUnpack +
    .db $4A, $6E, $29, $28, $23, $6E, $2A, $26, $20, $45, $23, $2B, $6E, $4D
  +
  RepeatUnpack $05, $6E

OnePlayerBottomGFX:
  RepeatUnpack $05, $6E
  RegularUnpack +
    .db $4B, $6E, $39, $38, $33, $6E, $3A, $36, $30, $46, $33, $3B, $6E, $4C
  +
  RepeatUnpack $05, $6E

OnePlayerTwoGFX:
  RepeatUnpack $08, $6E
  RegularUnpack +
    .db $86, $87, $88
  +
  RepeatUnpack $0D, $6E

OnePlayerThirdGFX:
  RepeatUnpack $03, $6E
  RegularUnpack +
    .db $A8, $A9, $6E, $6E, $6E, $96, $97, $98, $6E, $86, $88
  +
  RepeatUnpack $0A, $6E

OnePlayerFourGFX:
  RepeatUnpack $03, $6E
  RegularUnpack +
    .db $B8, $B9
  +
  RepeatUnpack $04, $6E
  RegularUnpack +
    .db $84, $85, $6E, $96, $98
  +
  RepeatUnpack $0A, $6E

OnePlayerFiveGFX:
  RepeatUnpack $09, $6E
  RegularUnpack +
    .db $94, $95
  +
  RepeatUnpack $09, $6E
  RegularUnpack +
    .db $8C, $8D, $6E, $6E
  +

OnePlayerSixGFX:
  RepeatUnpack $03, $6E
  RegularUnpack +
    .db $A6, $A7
  +
  RepeatUnpack $04, $6E
  RegularUnpack +
    .db $A4, $A5
  +
  RepeatUnpack $03, $6E
  RegularUnpack +
    .db $E1, $E2
  +
  RepeatUnpack $04, $6E
  RegularUnpack +
    .db $9C, $9D, $6E, $6E
  +

OnePlayerSevenGFX:
  RepeatUnpack $03, $6E
  RegularUnpack +
    .db $B6, $B7
  +
  RepeatUnpack $04, $6E
  RegularUnpack +
    .db $B4, $B5, $6E, $6E, $6E, $F1, $F2
  +
  RepeatUnpack $08, $6E

OnePlayerEightGFX:
  RegularUnpack +
    .db $6E, $6E, $80, $81, $82, $83
  +
  RepeatUnpack $12, $6E

OnePlayerNineGFX:
  RegularUnpack +
    .db $6E, $6E, $90, $91, $92, $93
  +
  RepeatUnpack $12, $6E

OnePlayerTenGFX:
  RegularUnpack +
    .db $6E, $6E, $90, $91, $92, $93, $C9, $D9
  +
  RepeatUnpack $10, $6E

OnePlayerElevenGFX:
  RegularUnpack +
    .db $80
  +
  RepeatDoubleUnpack $03, $81, $82
  RegularUnpack +
    .db $83
  +
  RepeatUnpack $10, $6E

OnePlayerTwelveGFX:
  RegularUnpack +
    .db $90
  +
  RepeatDoubleUnpack $03, $91, $92
  RegularUnpack +
    .db $93
  +
  RepeatUnpack $05, $6E
  RegularUnpack +
    .db $89, $8A, $8A, $8B
  +
  RepeatUnpack $07, $6E

OnePlayerThirteenGFX:
  RegularUnpack +
    .db $90
  +
  RepeatDoubleUnpack $03, $91, $92
  RegularUnpack +
    .db $93
  +
  RepeatUnpack $05, $E0
  RegularUnpack +
    .db $99, $9A, $9A, $9B
  +
  RepeatUnpack $07, $E0

OnePlayerBottomLinesGFX:
  RegularUnpack +
    .db $90
  +
  RepeatDoubleUnpack $03, $91, $92
  RegularUnpack +
    .db $93
  +
  RepeatUnpack $10, $F0

TwoPlayerTopGFX:
  RepeatUnpack $05, $6E
  RegularUnpack +
    .db $4A, $6E, $2D, $2F, $29, $6E, $2A, $26, $20, $45, $23, $2B, $6E, $4D
  +
  RepeatUnpack $05, $6E

TwoPlayerBottomGFX:
  RepeatUnpack $05, $6E
  RegularUnpack +
    .db $4B, $6E, $3D, $3F, $39, $6E, $3A, $36, $30, $46, $33, $3B, $6E, $4C
  +
  RepeatUnpack $05, $6E

TwoPlayerLineTwoGFX:
  RegularUnpack +
    .db $6E, $6E, $6E, $8A, $8B, $8C, $8D
  +
  RepeatUnpack $11, $6E

TwoPlayerLineThreeGFX:
  RegularUnpack +
    .db $6E, $6E, $6E, $9A, $9B, $9C, $9D, $6E, $6E, $6E, $90, $91, $92, $93
  +
  RepeatUnpack $04, $6E
  RegularUnpack +
    .db $8A, $8B, $8C, $8D, $6E, $6E
  +

TwoPlayerLineFourGFX:
  RegularUnpack +
    .db $6E, $6E, $6E, $AA, $AB, $AC, $AD, $6E, $6E, $6E, $A0, $A1, $A2, $A3
  +
  RepeatUnpack $04, $6E
  RegularUnpack +
    .db $9A, $9B, $9C, $9D, $6E, $6E
  +

TwoPlayerLineFiveGFX:
  RegularUnpack +
    .db $6E, $6E, $6E, $BA, $BB, $BC, $BD, $6E, $6E, $6E, $B0, $B1, $B2, $B3
  +
  RepeatUnpack $04, $6E
  RegularUnpack +
    .db $AA, $AB, $AC, $AD, $6E, $6E
  +

TwoPlayerLineSixGFX:
  RegularUnpack +
    .db $6E, $6E, $8E, $8F, $6E, $6E, $6E
  +
  RepeatDoubleUnpack $05, $88, $89
  RegularUnpack +
    .db $6E, $BA, $BB, $BC, $BD, $6E, $6E
  +

TwoPlayerLineSevenGFX:
  RegularUnpack +
    .db $6E, $6E, $9E, $9F, $6E, $6E, $6E
  +
  RepeatDoubleUnpack $05, $98, $99
  RegularUnpack +
    .db $6E, $6E, $94, $95, $96, $97, $6E
  +

TwoPlayerLineEightGFX:
  RegularUnpack +
    .db $6E, $6E, $AE, $AF, $CA, $CB
  +
  RepeatUnpack $0D, $6E
  RegularUnpack +
    .db $A4, $A5, $A6, $A7, $6E
  +

TwoPlayerLineNineGFX:
  RegularUnpack +
    .db $6E, $6E, $BE, $BF, $DA, $DB
  +
  RepeatUnpack $0D, $6E
  RegularUnpack +
    .db $B4, $B5, $B6, $B7, $6E
  +

TwoPlayerLineElevenGFX:
  RepeatDoubleUnpack $0C, $6E, $C8

TwoPlayerLineTwelveGFX:
  RepeatDoubleUnpack $0C, $6E, $D8

TwoPlayerThirteenGFX:
  RegularUnpack +
    .db $A9, $B8, $B9, $A8, $A9, $B8, $B9, $A8, $A9, $B8, $B9, $A8, $A9, $B8, $B9, $A8, $A9, $B8, $B9, $A8, $A9, $B8, $B9, $A8
  +

TwoPlayerBottomLinesGFX:
  RegularUnpack +
    .db $A8, $A9, $B8, $B9, $A8, $A9, $B8, $B9, $A8, $A9, $B8, $B9, $A8, $A9, $B8, $B9, $A8, $A9, $B8, $B9, $A8, $A9, $B8, $B9
  +

ClassicLineOneGFX:
  RepeatUnpack $06, $6E
  RegularUnpack +
    .db $4A, $6E, $21, $26, $20, $2C, $2C, $25, $21, $6E, $4D
  +
  RepeatUnpack $07, $6E

ClassicLineTwoGFX:
  RepeatUnpack $06, $6E
  RegularUnpack +
    .db $4B, $6E, $31, $36, $30, $3C, $3C, $35, $31, $6E, $4C
  +
  RepeatUnpack $07, $6E

ClassicLineThreeGFX:
  RegularUnpack +
    .db $6E, $6E, $0D, $12, $01, $6E, $15, $16, $03, $02, $03, $05, $00, $04, $6E, $04, $01, $18, $01, $04, $07, $1F, $6E, $6E
  +

ClassicLineFourGFX:
ClassicLineFiveGFX:
  RegularUnpack +
    .db $80, $81, $82, $81, $82, $83
  +
  RepeatUnpack $0C, $6E
  RegularUnpack +
    .db $8E, $8F
  +
  RepeatUnpack $04, $6E

ClassicLineSixGFX:
  RegularUnpack +
  .db $90, $91, $92, $91, $92, $93
  +
  RepeatUnpack $08, $6E
  RegularUnpack +
    .db $8E, $8F, $6E, $6E, $9E, $9F
  +
  RepeatUnpack $04, $6E

ClassicLineSevenGFX:
  RegularUnpack +
    .db $90, $91, $92, $91, $92, $93
  +
  RepeatUnpack $08, $6E
  RegularUnpack +
    .db $9E, $9F, $6E, $6E, $AE, $AF
  +
  RepeatUnpack $04, $6E

ClassicLineEightGFX:
ClassicLineNineGFX:
  RegularUnpack +
    .db $90, $91, $92, $91, $92, $93
  +
  RepeatUnpack $08, $6E
  RegularUnpack +
    .db $AE, $AF, $6E, $6E, $AE, $AF
  +
  RepeatUnpack $04, $6E

ClassicLineTenGFX:
  RegularUnpack +
    .db $90, $91, $A0, $A1, $92, $93
  +
  RepeatUnpack $08, $6E
  RegularUnpack +
    .db $AE, $AF, $6E, $6E, $AE, $AF
  +
  RepeatUnpack $04, $6E

ClassicLineElevelGFX:
  RegularUnpack +
    .db $90, $91, $B0, $B1, $92, $93
  +
  RepeatUnpack $08, $6E
  RegularUnpack +
    .db $AE, $AF, $6E, $6E, $AE, $AF
  +
  RepeatUnpack $04, $6E

ClassicLineTwelveGFX:
  RegularUnpack +
    .db $90, $91, $A2, $A3, $92, $93
  +
  RepeatUnpack $08, $6E
  RegularUnpack +
    .db $AE, $AF, $6E, $6E, $AE, $AF
    .db $AC, $AD
    .db $6E, $6E
  +

ClassicLineThirteenGFX:
  RegularUnpack +
    .db $90, $91, $B2, $B3, $92, $93
  +
  RepeatUnpack $04, $6E
  RegularUnpack +
    .db $C9, $D9
    .db $6E, $6E
    .db $AE, $AF
    .db $C9, $D9
    .db $AE, $AF
    .db $BC, $BD
    .db $6E, $6E
  +

ClassicLineFourteenthGFX:
  RepeatDoubleUnpack $0C, $AA, $AB

ClassicLineBottomGFX:
  RepeatDoubleUnpack $0C, $bA, $BB

ClassicLineSandGFX:
  RepeatDoubleUnpack $0C, $BE, $BF
; end of GFX

ContextWindowModePalette:
OnePlayerPalette:
  .db $0F, $35, $25, $06, $0F, $35, $25, $0F
TwoPlayerPalette:
  .db $0F, $31, $21, $01, $0F, $31, $21, $0F

TraditionalPalette:
TagTeamPalette:
  .db $0F, $35, $25, $06, $0F, $35, $25, $0F
  .db $0F, $31, $21, $01, $0F, $31, $21, $0F

SharedControlPalette:
  .db $0F, $39, $29, $09, $0F, $39, $29, $0F
  .db $0F, $39, $29, $09, $0F, $39, $29, $0F
  .db $0F, $39, $29, $09, $0F, $39, $29, $0F
  .db $0F, $39, $29, $09, $0F, $39, $29, $0F

ChaosSwapPalette:
  .db $0F, $3D, $2D, $00, $0F, $3D, $2D, $0F
  .db $0F, $3D, $2D, $00, $0F, $3D, $2D, $0F
  .db $0F, $3D, $2D, $00, $0F, $3D, $2D, $0F
  .db $0F, $3D, $2D, $00, $0F, $3D, $2D, $0F

EmptyLinesOptionSelect:
  RepeatUnpack $18, $6E
;  .db #RepeatUnpack | $18, $6E

TileMapFirstOptionSelect:
  .db $20, $20, $20, $20, $21, $21, $21, $21, $21, $21, $21, $21, $22, $22, $22, $22

TileMapSecondOptionselect:
  .db $64, $84, $C4, $E4, $04, $24, $44, $64, $84, $A4, $C4, $E4, $04, $24, $44, $64

OptionSelectLoTable:
; One Player
  .db <OnePlayerTopGFX
  .db <OnePlayerBottomGFX
  .db <OnePlayerTwoGFX
  .db <OnePlayerThirdGFX
  .db <OnePlayerFourGFX
  .db <OnePlayerFiveGFX
  .db <OnePlayerSixGFX
  .db <OnePlayerSevenGFX
  .db <OnePlayerEightGFX
  .db <OnePlayerNineGFX
  .db <OnePlayerTenGFX
  .db <OnePlayerElevenGFX
  .db <OnePlayerTwelveGFX
  .db <OnePlayerThirteenGFX
  .db <OnePlayerBottomLinesGFX
  .db <OnePlayerBottomLinesGFX

; Two Player
  .db <TwoPlayerTopGFX
  .db <TwoPlayerBottomGFX
  .db <EmptyLinesOptionSelect
  .db <TwoPlayerLineTwoGFX
  .db <TwoPlayerLineThreeGFX
  .db <TwoPlayerLineFourGFX
  .db <TwoPlayerLineFiveGFX
  .db <TwoPlayerLineSixGFX
  .db <TwoPlayerLineSevenGFX
  .db <TwoPlayerLineEightGFX
  .db <TwoPlayerLineNineGFX
  .db <EmptyLinesOptionSelect
  .db <TwoPlayerLineElevenGFX
  .db <TwoPlayerLineTwelveGFX
  .db <TwoPlayerThirteenGFX
  .db <TwoPlayerBottomLinesGFX

; Classic
  .db <ClassicLineOneGFX
  .db <ClassicLineTwoGFX
  .db <ClassicLineThreeGFX
  .db <EmptyLinesOptionSelect
  .db <ClassicLineFiveGFX
  .db <ClassicLineSixGFX
  .db <ClassicLineSevenGFX
  .db <ClassicLineEightGFX
  .db <ClassicLineNineGFX
  .db <ClassicLineTenGFX
  .db <ClassicLineElevelGFX
  .db <ClassicLineTwelveGFX
  .db <ClassicLineThirteenGFX
  .db <ClassicLineFourteenthGFX
  .db <ClassicLineBottomGFX
  .db <ClassicLineSandGFX

; Two Player
  .db <TwoPlayerTopGFX
  .db <TwoPlayerBottomGFX
  .db <EmptyLinesOptionSelect
  .db <TwoPlayerLineTwoGFX
  .db <TwoPlayerLineThreeGFX
  .db <TwoPlayerLineFourGFX
  .db <TwoPlayerLineFiveGFX
  .db <TwoPlayerLineSixGFX
  .db <TwoPlayerLineSevenGFX
  .db <TwoPlayerLineEightGFX
  .db <TwoPlayerLineNineGFX
  .db <EmptyLinesOptionSelect
  .db <TwoPlayerLineElevenGFX
  .db <TwoPlayerLineTwelveGFX
  .db <TwoPlayerThirteenGFX
  .db <TwoPlayerBottomLinesGFX

; Traditional Section
  .db <TradionalTopGFX
  .db <TradionalBottomGFX
  .db <TradionalFirstLineGFX
  .db <EmptyLinesOptionSelect
  .db <TraditionalThirdLineGFX
  .db <EmptyLinesOptionSelect
  .db <TraditionalFithLineGFX
  .db <EmptyLinesOptionSelect
  .db <TraditionalSeventhLineGFX
  .db <TraditionalEightLineGFX
  .db <TraditionalNinhtLineGFX
  .db <TraditionalTenthLineGFX
  .db <TraditionalEleventhLineGFX
  .db <TraditionalTwelfthLineGFX
  .db <TraditionalThirteenthLineGFX
  .db <TraditionalFourteenthLineGFX

; Tag Team
  .db <TagTeamTopGFX
  .db <TagTeamBottomGFX
  .db <TagTeamFirstLineGFX
  .db <TagTeamSecondLineGFX
  .db <TagTeamThirdLineGFX
  .db <TagTeamFourthLineGFX
  .db <TagTeamFithLineGFX
  .db <TagTeamSixthLineGFX
  .db <EmptyLinesOptionSelect
  .db <TagTeamEightLineGFX
  .db <EmptyLinesOptionSelect
  .db <TagTeamTenthLineGFX
  .db <EmptyLinesOptionSelect
  .db <TagTeamTwelfthLineGFX
  .db <EmptyLinesOptionSelect
  .db <TagTeamFourteenthLineGFX

; Shared control
  .db <SharedTopGFX
  .db <SharedBottomGFX
  .db <SharedOneGFX
  .db <SharedTwoGFX
  .db <SharedThreeGFX
  .db <SharedFourGFX
  .db <SharedFiveGFX
  .db <SharedSixGFX
  .db <SharedSevenGFX
  .db <SharedEightGFX
  .db <SharedNineGFX
  .db <SharedTenGFX
  .db <SharedElevenGFX
  .db <SharedTwelveGFX
  .db <SharedThirteenGFX
  .db <SharedFourteenGFX

; Chaos Swap
  .db <ChaosTopGFX
  .db <ChaosBottomGFX
  .db <ChaosOneGFX
  .db <ChaosTwoGFX
  .db <ChaosThreeGFX
  .db <ChaosFourGFX
  .db <ChaosFiveGFX
  .db <ChaosSixGFX
  .db <ChaosSevenGFX
  .db <ChaosEightGFX
  .db <ChaosNineGFX
  .db <ChaosTenGFX
  .db <ChaosElevenGFX
  .db <ChaosTwelveGFX
  .db <ChaosThirteenGFX
  .db <ChaosFourteenGFX

; Traditional Section
  .db <TradionalTopGFX
  .db <TradionalBottomGFX
  .db <TradionalFirstLineGFX
  .db <EmptyLinesOptionSelect
  .db <TraditionalThirdLineGFX
  .db <EmptyLinesOptionSelect
  .db <TraditionalFithLineGFX
  .db <EmptyLinesOptionSelect
  .db <TraditionalSeventhLineGFX
  .db <TraditionalEightLineGFX
  .db <TraditionalNinhtLineGFX
  .db <TraditionalTenthLineGFX
  .db <TraditionalEleventhLineGFX
  .db <TraditionalTwelfthLineGFX
  .db <TraditionalThirteenthLineGFX
  .db <TraditionalFourteenthLineGFX

; Tag Team
  .db <TagTeamTopGFX
  .db <TagTeamBottomGFX
  .db <TagTeamFirstLineGFX
  .db <TagTeamSecondLineGFX
  .db <TagTeamThirdLineGFX
  .db <TagTeamFourthLineGFX
  .db <TagTeamFithLineGFX
  .db <TagTeamSixthLineGFX
  .db <EmptyLinesOptionSelect
  .db <TagTeamEightLineGFX
  .db <EmptyLinesOptionSelect
  .db <TagTeamTenthLineGFX
  .db <EmptyLinesOptionSelect
  .db <TagTeamTwelfthLineGFX
  .db <EmptyLinesOptionSelect
  .db <TagTeamFourteenthLineGFX

; Shared control
  .db <SharedTopGFX
  .db <SharedBottomGFX
  .db <SharedOneGFX
  .db <SharedTwoGFX
  .db <SharedThreeGFX
  .db <SharedFourGFX
  .db <SharedFiveGFX
  .db <SharedSixGFX
  .db <SharedSevenGFX
  .db <SharedEightGFX
  .db <SharedNineGFX
  .db <SharedTenGFX
  .db <SharedElevenGFX
  .db <SharedTwelveGFX
  .db <SharedThirteenGFX
  .db <SharedFourteenGFX

; Chaos Swap
  .db <ChaosTopGFX
  .db <ChaosBottomGFX
  .db <ChaosOneGFX
  .db <ChaosTwoGFX
  .db <ChaosThreeGFX
  .db <ChaosFourGFX
  .db <ChaosFiveGFX
  .db <ChaosSixGFX
  .db <ChaosSevenGFX
  .db <ChaosEightGFX
  .db <ChaosNineGFX
  .db <ChaosTenGFX
  .db <ChaosElevenGFX
  .db <ChaosTwelveGFX
  .db <ChaosThirteenGFX
  .db <ChaosFourteenGFX

OptionSelectHiTable:

; One Player
  .db >OnePlayerTopGFX
  .db >OnePlayerBottomGFX
  .db >OnePlayerTwoGFX
  .db >OnePlayerThirdGFX
  .db >OnePlayerFourGFX
  .db >OnePlayerFiveGFX
  .db >OnePlayerSixGFX
  .db >OnePlayerSevenGFX
  .db >OnePlayerEightGFX
  .db >OnePlayerNineGFX
  .db >OnePlayerTenGFX
  .db >OnePlayerElevenGFX
  .db >OnePlayerTwelveGFX
  .db >OnePlayerThirteenGFX
  .db >OnePlayerBottomLinesGFX
  .db >OnePlayerBottomLinesGFX

; Two Player
  .db >TwoPlayerTopGFX
  .db >TwoPlayerBottomGFX
  .db >EmptyLinesOptionSelect
  .db >TwoPlayerLineTwoGFX
  .db >TwoPlayerLineThreeGFX
  .db >TwoPlayerLineFourGFX
  .db >TwoPlayerLineFiveGFX
  .db >TwoPlayerLineSixGFX
  .db >TwoPlayerLineSevenGFX
  .db >TwoPlayerLineEightGFX
  .db >TwoPlayerLineNineGFX
  .db >EmptyLinesOptionSelect
  .db >TwoPlayerLineElevenGFX
  .db >TwoPlayerLineTwelveGFX
  .db >TwoPlayerThirteenGFX
  .db >TwoPlayerBottomLinesGFX

; Classic
  .db >ClassicLineOneGFX
  .db >ClassicLineTwoGFX
  .db >ClassicLineThreeGFX
  .db >EmptyLinesOptionSelect
  .db >ClassicLineFiveGFX
  .db >ClassicLineSixGFX
  .db >ClassicLineSevenGFX
  .db >ClassicLineEightGFX
  .db >ClassicLineNineGFX
  .db >ClassicLineTenGFX
  .db >ClassicLineElevelGFX
  .db >ClassicLineTwelveGFX
  .db >ClassicLineThirteenGFX
  .db >ClassicLineFourteenthGFX
  .db >ClassicLineBottomGFX
  .db >ClassicLineSandGFX

; Two Player
  .db >TwoPlayerTopGFX
  .db >TwoPlayerBottomGFX
  .db >EmptyLinesOptionSelect
  .db >TwoPlayerLineTwoGFX
  .db >TwoPlayerLineThreeGFX
  .db >TwoPlayerLineFourGFX
  .db >TwoPlayerLineFiveGFX
  .db >TwoPlayerLineSixGFX
  .db >TwoPlayerLineSevenGFX
  .db >TwoPlayerLineEightGFX
  .db >TwoPlayerLineNineGFX
  .db >EmptyLinesOptionSelect
  .db >TwoPlayerLineElevenGFX
  .db >TwoPlayerLineTwelveGFX
  .db >TwoPlayerThirteenGFX
  .db >TwoPlayerBottomLinesGFX

; Traditional Section
  .db >TradionalTopGFX
  .db >TradionalBottomGFX
  .db >TradionalFirstLineGFX
  .db >EmptyLinesOptionSelect
  .db >TraditionalThirdLineGFX
  .db >EmptyLinesOptionSelect
  .db >TraditionalFithLineGFX
  .db >EmptyLinesOptionSelect
  .db >TraditionalSeventhLineGFX
  .db >TraditionalEightLineGFX
  .db >TraditionalNinhtLineGFX
  .db >TraditionalTenthLineGFX
  .db >TraditionalEleventhLineGFX
  .db >TraditionalTwelfthLineGFX
  .db >TraditionalThirteenthLineGFX
  .db >TraditionalFourteenthLineGFX

; Tag Team
  .db >TagTeamTopGFX
  .db >TagTeamBottomGFX
  .db >TagTeamFirstLineGFX
  .db >TagTeamSecondLineGFX
  .db >TagTeamThirdLineGFX
  .db >TagTeamFourthLineGFX
  .db >TagTeamFithLineGFX
  .db >TagTeamSixthLineGFX
  .db >EmptyLinesOptionSelect
  .db >TagTeamEightLineGFX
  .db >EmptyLinesOptionSelect
  .db >TagTeamTenthLineGFX
  .db >EmptyLinesOptionSelect
  .db >TagTeamTwelfthLineGFX
  .db >EmptyLinesOptionSelect
  .db >TagTeamFourteenthLineGFX

; Shared control
  .db >SharedTopGFX
  .db >SharedBottomGFX
  .db >SharedOneGFX
  .db >SharedTwoGFX
  .db >SharedThreeGFX
  .db >SharedFourGFX
  .db >SharedFiveGFX
  .db >SharedSixGFX
  .db >SharedSevenGFX
  .db >SharedEightGFX
  .db >SharedNineGFX
  .db >SharedTenGFX
  .db >SharedElevenGFX
  .db >SharedTwelveGFX
  .db >SharedThirteenGFX
  .db >SharedFourteenGFX

; Chaos Swap
  .db >ChaosTopGFX
  .db >ChaosBottomGFX
  .db >ChaosOneGFX
  .db >ChaosTwoGFX
  .db >ChaosThreeGFX
  .db >ChaosFourGFX
  .db >ChaosFiveGFX
  .db >ChaosSixGFX
  .db >ChaosSevenGFX
  .db >ChaosEightGFX
  .db >ChaosNineGFX
  .db >ChaosTenGFX
  .db >ChaosElevenGFX
  .db >ChaosTwelveGFX
  .db >ChaosThirteenGFX
  .db >ChaosFourteenGFX

; Traditional Section
  .db >TradionalTopGFX
  .db >TradionalBottomGFX
  .db >TradionalFirstLineGFX
  .db >EmptyLinesOptionSelect
  .db >TraditionalThirdLineGFX
  .db >EmptyLinesOptionSelect
  .db >TraditionalFithLineGFX
  .db >EmptyLinesOptionSelect
  .db >TraditionalSeventhLineGFX
  .db >TraditionalEightLineGFX
  .db >TraditionalNinhtLineGFX
  .db >TraditionalTenthLineGFX
  .db >TraditionalEleventhLineGFX
  .db >TraditionalTwelfthLineGFX
  .db >TraditionalThirteenthLineGFX
  .db >TraditionalFourteenthLineGFX

; Tag Team
  .db >TagTeamTopGFX
  .db >TagTeamBottomGFX
  .db >TagTeamFirstLineGFX
  .db >TagTeamSecondLineGFX
  .db >TagTeamThirdLineGFX
  .db >TagTeamFourthLineGFX
  .db >TagTeamFithLineGFX
  .db >TagTeamSixthLineGFX
  .db >EmptyLinesOptionSelect
  .db >TagTeamEightLineGFX
  .db >EmptyLinesOptionSelect
  .db >TagTeamTenthLineGFX
  .db >EmptyLinesOptionSelect
  .db >TagTeamTwelfthLineGFX
  .db >EmptyLinesOptionSelect
  .db >TagTeamFourteenthLineGFX

; Shared control
  .db >SharedTopGFX
  .db >SharedBottomGFX
  .db >SharedOneGFX
  .db >SharedTwoGFX
  .db >SharedThreeGFX
  .db >SharedFourGFX
  .db >SharedFiveGFX
  .db >SharedSixGFX
  .db >SharedSevenGFX
  .db >SharedEightGFX
  .db >SharedNineGFX
  .db >SharedTenGFX
  .db >SharedElevenGFX
  .db >SharedTwelveGFX
  .db >SharedThirteenGFX
  .db >SharedFourteenGFX

; Chaos Swap
  .db >ChaosTopGFX
  .db >ChaosBottomGFX
  .db >ChaosOneGFX
  .db >ChaosTwoGFX
  .db >ChaosThreeGFX
  .db >ChaosFourGFX
  .db >ChaosFiveGFX
  .db >ChaosSixGFX
  .db >ChaosSevenGFX
  .db >ChaosEightGFX
  .db >ChaosNineGFX
  .db >ChaosTenGFX
  .db >ChaosElevenGFX
  .db >ChaosTwelveGFX
  .db >ChaosThirteenGFX
  .db >ChaosFourteenGFX


CHRBankModeSelect:
  .db CHR_Mode_OnePlayer, CHR_Mode_TwoPlayer
  .db CHR_Mode_OnePlayer, CHR_Mode_TwoPlayer
  .db CHR_Mode_Traditional, CHR_Mode_TagTeam, CHR_Mode_SharedControl, CHR_Mode_Chaos
  .db CHR_Mode_Traditional, CHR_Mode_TagTeam, CHR_Mode_SharedControl, CHR_Mode_Chaos
