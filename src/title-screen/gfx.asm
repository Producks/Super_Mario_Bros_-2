TitleLayout:
	; SUPER
	.db $20, $4B, $0A, $00, $01, $08, $08, $FC, $01, $FC, $08, $FC, $01
	.db $20, $6B, $0A, $02, $03, $08, $08, $0A, $05, $0B, $0C, $0A, $0D
	.db $20, $8B, $0A, $04, $05, $04, $05, $0E, $07, $FC, $08, $0E, $08
	.db $20, $AB, $05, $06, $07, $06, $07, $09
	.db $20, $B1, $04, $22, $09, $09, $09

	; MARIO
	.db $20, $C6, $0A, $00, $0F, $01, $00, $01, $FC, $01, $08, $00, $01
	.db $20, $E6, $0A, $10, $10, $08, $10, $08, $10, $08, $08, $10, $08
	.db $21, $06, $0A, $08, $08, $08, $08, $08, $13, $0D, $08, $08, $08
	.db $21, $26, $0A, $08, $08, $08, $FC, $08, $0E, $08, $08, $08, $08
	.db $21, $46, $0A, $08, $08, $08, $10, $08, $08, $08, $08, $04, $05
	.db $21, $66, $0A, $09, $09, $09, $09, $09, $09, $09, $09, $06, $07

	; BROS
	.db $20, $D1, $08, $FC, $01, $FC, $01, $00, $01, $00, $01
	.db $20, $F1, $08, $10, $08, $10, $08, $10, $08, $10, $08
	.db $21, $11, $08, $13, $0D, $13, $0D, $08, $08, $24, $03
	.db $21, $31, $08, $0E, $08, $0E, $08, $08, $08, $12, $08
	.db $21, $51, $09, $13, $05, $08, $08, $04, $05, $04, $05, $08
	.db $21, $71, $09, $11, $07, $09, $09, $06, $07, $06, $07, $09

	; 2
	.db $21, $8E, $04, $14, $15, $16, $17
	.db $21, $AE, $04, $18, $19, $1A, $1B
	.db $21, $CE, $04, $1C, $1D, $1E, $1F
	.db $21, $EE, $04, $FC, $FC, $FC, $20
	.db $22, $0E, $04, $22, $22, $22, $21

; test for scrolling
  .db $22, $50, $02, $B0, $B1
  .db $22, $70, $04, $98, $9A, $9C, $9E
  .db $22, $90, $04, $99, $9B, $9D, $9F
  .db $23, $A0, $60, $A9
  .db $27, $A0, $60, $A9
  .db $23, $80, $60, $A9
  .db $27, $80, $60, $A9
  .db $23, $60, $60, $E8
  .db $27, $60, $60, $E8

; Attribute table
;	.db $23, $CA, $04, $80, $A0, $A0, $20
;	.db $23, $D1, $0E, $80, $A8, $AA, $AA, $A2, $22, $00, $00, $88, $AA, $AA, $AA, $AA, $22
;	.db $23, $E3, $02, $88, $22
;	.db $23, $EA, $04, $F0, $F8, $F2, $F0

; End
	.db $00

IFDEF PAD_TITLE_SCREEN_PPU_DATA
	.pad TitleLayout + $300, $00
ENDIF

TitleBackgroundPalettes:
	.db $22, $37, $16, $07 ; Most of screen, outline, etc.
	.db $22, $30, $31, $0F ; Unused
	.db $22, $30, $0F, $0F ; Logo
	.db $22, $30, $0F, $0F ; Copyright, Story

TitleSpritePalettes:
	.db $22, $30, $28, $0F ; Unused DDP character palettes
	.db $22, $30, $25, $0F ; There are no sprites on the title screen,
	.db $22, $30, $12, $0F ; so these are totally unused
	.db $22, $30, $23, $0F

TitleAttributeData1:
	.db $23, $CB, $42, $FF
	.db $23, $D1, $01, $CC
	.db $23, $D2, $44, $FF
	.db $23, $D6, $01, $33
	.db $23, $D9, $01, $CC
	.db $23, $DA, $44, $FF

TitleAttributeData2:
	.db $23, $DE, $01, $33
	.db $23, $E1, $01, $CC
	.db $23, $E2, $44, $FF
	.db $23, $E6, $01, $33
	.db $23, $EA, $44, $FF
	.db $23, $E9, $01, $CC
	.db $23, $EE, $01, $33

UpdateTableTitleScreen:
  .db $3F, $1D, $01, $27 ; Color palette for the sprite
  .db $00


PaletteColorTableTitleScreen:
  .db $35, $34, $33, $32, $31, $3C, $3B, $3A, $39, $38, $37, $36
