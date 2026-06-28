;
; Bank A & Bank B
; ===============
;
; What's inside:
;
;   - Level title card background data and palettes
;   - Bonus chance background data and palettes
;   - Character select palettes
;   - Character data (physics, palettes, etc.)
;   - Character stats bootstrapping
;

;
; This title card is used for every world from 1 to 6.
; The only difference is the loaded CHR banks.
;
World1thru6TitleCard:
	.db $FB, $FB, $B0, $B2, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
	.db $FB, $FB, $B1, $B3, $FB, $FB, $FB, $FB, $FB, $FB, $C0, $C1, $FB, $FB, $FB, $FB ; $10
	.db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B6, $B8, $BA, $B8, $BA, $BC, $FB, $FB ; $20
	.db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB ; $30
	.db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB ; $40
	.db $FB, $FB, $B4, $B5, $C0, $C1, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB ; $50
	.db $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC ; $60
	.db $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD ; $70
	.db $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF ; $80
	.db $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE ; $90

;
; This one is the special one used for World 7
;
World7TitleCard:
	.db $FB, $FB, $B0, $B2, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
	.db $FB, $FB, $B1, $B3, $FB, $FB, $FB, $FB, $FB, $FB, $C0, $C1, $FB, $FB, $FB, $FB ; $10
	.db $FB, $FB, $B1, $B3, $FB, $FB, $FB, $FB, $B6, $B8, $BA, $B8, $BA, $BC, $FB, $FB ; $20
	.db $FB, $FB, $B1, $B3, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB ; $30
	.db $FB, $FB, $B1, $B3, $FB, $FB, $FB, $FB, $CA, $FC, $FC, $FC, $FC, $CC, $FB, $FB ; $40
	.db $FB, $FB, $B1, $B3, $C0, $C1, $FB, $FB, $CA, $FC, $FC, $FC, $FC, $CC, $FB, $FB ; $50
	.db $A8, $AC, $AA, $AC, $AA, $AC, $AA, $AC, $AA, $AC, $AA, $AC, $AA, $AC, $AA, $AE ; $60
	.db $A9, $AD, $AB, $AD, $AB, $AD, $AB, $AD, $AB, $AD, $AB, $AD, $AB, $AD, $AB, $AF ; $70
	.db $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB ; $80
	.db $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB ; $90

BonusChanceLayout:
	.db $20, $00, $60, $FD
	.db $20, $20, $60, $FD
	.db $20, $40, $60, $FD
	.db $20, $60, $60, $FD
	.db $23, $40, $60, $FD
	.db $23, $60, $60, $FD
	.db $23, $80, $60, $FD
	.db $23, $A0, $60, $FD
	.db $20, $80, $D6, $FD
	.db $20, $81, $D6, $FD
	.db $20, $82, $D6, $FD
	.db $20, $9D, $D6, $FD
	.db $20, $9E, $D6, $FD
	.db $20, $9F, $D6, $FD

	.db $20, $68, $10
	.db $48, $4A, $4C, $4E, $50, $51, $52, $53, $54, $55, $56, $57, $58, $5A, $5C, $5E

	.db $20, $83, $09, $FD, $FD, $22, $23, $24, $49, $4B, $4D, $4F
	.db $20, $94, $09, $59, $5B, $5D, $5F, $2E, $2F, $30, $FD, $FD
	.db $20, $A3, $04, $FD, $25, $26, $27
	.db $20, $B9, $04, $31, $32, $33, $FD
	.db $20, $C3, $04, $FD, $28, $29, $2A
	.db $20, $D9, $04, $34, $35, $36, $FD
	.db $20, $E3, $03, $2B, $2C, $2D
	.db $20, $FA, $03, $37, $38, $39
	.db $21, $03, $02, $3A, $3B
	.db $21, $1B, $02, $40, $41
	.db $21, $23, $D0, $3C
	.db $21, $3C, $D0, $42
	.db $22, $02, $02, $3E, $3F
	.db $22, $1C, $02, $61, $62
	.db $22, $22, $02, $43, $44
	.db $22, $3C, $02, $63, $64
	.db $22, $43, $01, $45
	.db $22, $5C, $01, $65
	.db $22, $C4, $02, $A6, $A8
	.db $22, $E4, $02, $A7, $A9
	.db $22, $FA, $04, $80, $82, $88, $8A
	.db $23, $04, $02, $90, $92
	.db $23, $14, $02, $9E, $A0
	.db $23, $1A, $04, $81, $83, $89, $8B
	.db $23, $23, $03, $46, $91, $93
	.db $23, $2A, $02, $A2, $A4

	.db $23, $2E, $10
	.db $67, $6C, $6E, $70, $72, $69, $9F, $A1, $75, $98, $9A, $FB, $84, $86, $8C, $8E

	.db $23, $43, $1B
	.db $47, $94, $96, $74, $74, $74, $74, $A3, $A5, $74, $66, $68, $6D, $6F, $71, $73
	.db $6A, $6B, $74, $74, $99, $9B, $74, $85, $87, $8D, $8F

	.db $23, $64, $05, $95, $97, $FD, $AA, $AB
	.db $23, $77, $05, $9C, $9D, $AA, $AB, $AB
	.db $23, $89, $02, $AA, $AB
	.db $20, $C9, $0E, $78, $AC, $B0, $B4, $B7, $BA, $FB, $BC, $BE, $C1, $C4, $C7, $CB, $7C

	.db $20, $E8, $10
	.db $1C, $79, $AD, $B1, $B5, $B8, $BB, $FB, $BD, $BF, $C2, $C5, $C8, $CC, $7D, $1E

	.db $21, $08, $10
	.db $1D, $7A, $AE, $B2, $B6, $B9, $FB, $FB, $FB, $C0, $C3, $C6, $C9, $CD, $7E, $1F

	.db $21, $29, $03, $7B, $AF, $B3
	.db $21, $34, $03, $CA, $CE, $7F
	.db $21, $6A, $0C, $14, $10, $10, $16, $14, $10, $10, $16, $14, $10, $10, $16
	.db $21, $8A, $0C, $11, $FC, $FC, $12, $11, $FC, $FC, $12, $11, $FC, $FC, $12
	.db $21, $AA, $0C, $11, $FC, $FC, $12, $11, $FC, $FC, $12, $11, $FC, $FC, $12
	.db $21, $CA, $0C, $15, $13, $13, $17, $15, $13, $13, $17, $15, $13, $13, $17
	.db $22, $0D, $02, $18, $1A
	.db $22, $2D, $02, $19, $1B
	.db $23, $D2, $04, $80, $A0, $A0, $20
	.db $23, $DA, $04, $88, $AA, $AA, $22
	.db $23, $E4, $01, $0A
	.db $23, $EA, $05, $A0, $A0, $A0, $A0, $20
	.db $00


;
; Copies the Bonus Chance PPU data
;
; This copies in two $100 byte chunks, the second of which includes extra data
; that is never used because of the terminating $00
;
CopyBonusChanceLayoutToRAM:
	LDY #$00
CopyBonusChanceLayoutToRAM_Loop1:
	LDA BonusChanceLayout, Y ; Blindly copy $100 bytes from $8140 to $7400
	STA PPUBuffer_BonusChanceLayout, Y
	DEY
	BNE CopyBonusChanceLayoutToRAM_Loop1

	LDY #$00
CopyBonusChanceLayoutToRAM_Loop2:
	; Blindly copy $100 more bytes from $8240 to $7500
	; That range includes this code! clap. clap.
	LDA BonusChanceLayout + $100, Y
	STA PPUBuffer_BonusChanceLayout + $100, Y
	DEY
	BNE CopyBonusChanceLayoutToRAM_Loop2

	RTS

; =============== S U B R O U T I N E =======================================

DrawTitleCardWorldImage:
	LDA CurrentWorld
	CMP #6
	BEQ loc_BANKA_8392 ; Special case for World 7's title card

	LDA #$25
	STA byte_RAM_0
	LDA #$C8
	STA byte_RAM_1
	LDY #$00

loc_BANKA_8338:
	LDX #$0F
	LDA PPUSTATUS
	LDA byte_RAM_0
	STA PPUADDR

loc_BANKA_8342:
	LDA byte_RAM_1
	STA PPUADDR

loc_BANKA_8347:
	LDA World1thru6TitleCard, Y
	STA PPUDATA
	INY
	DEX
	BPL loc_BANKA_8347

	CPY #$A0
	BCS loc_BANKA_8364

	LDA byte_RAM_1
	ADC #$20
	STA byte_RAM_1
	LDA byte_RAM_0
	ADC #0
	STA byte_RAM_0
	JMP loc_BANKA_8338

; ---------------------------------------------------------------------------

loc_BANKA_8364:
	LDA CurrentWorld
	CMP #1
	BEQ loc_BANKA_8371

	CMP #5
	BEQ loc_BANKA_8371

	BNE loc_BANKA_8389

loc_BANKA_8371:
	AND #$80
	BNE loc_BANKA_8389

	LDA #$26
	STA byte_RAM_0
	LDA #$88
	STA byte_RAM_1
	LDA CurrentWorld
	ORA #$80
	STA CurrentWorld
	LDY #$80
	BNE loc_BANKA_8338

loc_BANKA_8389:
	LDA CurrentWorld
	AND #$F
	STA CurrentWorld
	RTS

; ---------------------------------------------------------------------------

loc_BANKA_8392:
	LDA #$25
	STA byte_RAM_0
	LDA #$C8
	STA byte_RAM_1
	LDY #0

loc_BANKA_839C:
	LDX #$F
	LDA PPUSTATUS
	LDA byte_RAM_0
	STA PPUADDR
	LDA byte_RAM_1
	STA PPUADDR

loc_BANKA_83AB:
	LDA World7TitleCard, Y
	STA PPUDATA
	INY
	DEX
	BPL loc_BANKA_83AB

	CPY #$A0
	BCS locret_BANKA_83C8

	LDA byte_RAM_1
	ADC #$20
	STA byte_RAM_1
	LDA byte_RAM_0
	ADC #0
	STA byte_RAM_0
	JMP loc_BANKA_839C

; ---------------------------------------------------------------------------

locret_BANKA_83C8:
	RTS

SkyFlashColorsNoFlash:
	.db $26
	.db $26
	.db $26
	.db $26

  .db $00, $00, $00, $00 ; Pad bytes for code logic

SkyFlashColorsVanilla:
	.db $26
	.db $22
	.db $2A
	.db $26

FlyingCarpetAcceleration:
	.db $00
	.db $01
	.db $FF
	.db $00

WartOAMOffsets:
	.db $00
	.db $E0
	.db $FF ; Cycled in code ($7267)
	.db $D0
	.db $00
	.db $E0
	.db $FF ; Cycled in code ($726B)

BonusChanceText_X_1:
	.db $22, $30, $03
	.db $EA, $FB, $D1
BonusChanceText_EXTRA_LIFE_1:
	.db $22, $C9, $0F
	.db $DE, $F1, $ED, $EB, $DA, $FB, $E5, $E2, $DF, $DE ; EXTRA LIFE
	.db $F9, $F9, $F9, $FB, $D1 ; ... 1
	.db $00

BonusChanceBackgroundPalettes:
	.db $0F, $27, $17, $07 ; $00
	.db $0F, $37, $16, $12 ; $04
	.db $0F, $30, $10, $00 ; $08
	.db $0F, $21, $12, $01 ; $0C

BonusChanceReel1Order:
	.db Slot_Snifit ; $00
	.db Slot_Turnip ; $01 ; Graphics exist for a mushroom (not used)
	.db Slot_Star   ; $02
	.db Slot_Turnip ; $03
	.db Slot_Snifit ; $04
	.db Slot_Star   ; $05
	.db Slot_Cherry ; $06
	.db Slot_Turnip ; $07
BonusChanceReel2Order:
	.db Slot_Star   ; $00
	.db Slot_Snifit ; $01
	.db Slot_Cherry ; $02
	.db Slot_Snifit ; $03
	.db Slot_Turnip ; $04
	.db Slot_Star   ; $05
	.db Slot_Snifit ; $06
	.db Slot_Turnip ; $07
BonusChanceReel3Order:
	.db Slot_Star   ; $00
	.db Slot_Snifit ; $01
	.db Slot_Star   ; $02
	.db Slot_Turnip ; $03
	.db Slot_Star   ; $04
	.db Slot_Cherry ; $05
	.db Slot_Turnip ; $06
	.db Slot_Snifit ; $07

BonusChanceUnusedCoinSprite:
	.db $F8, $19, $01, $60, $F8, $1B, $01, $68
BonusChanceUnusedImajinHead:
	.db $CB, $B0, $00, $A0, $CB, $B0, $40, $A8
BonusChanceUnusedLinaHead:
	.db $CB, $B2, $00, $A0, $CB, $B2, $40, $A8
BonusChanceUnusedMamaHead:
	.db $CB, $B6, $00, $A0, $CB, $B6, $40, $A8
BonusChanceUnusedPapaHead:
	.db $CB, $B4, $00, $A0, $CB, $B4, $40, $A8

;
; Based on the position and the number of tiles, this probably used to say...
;
; --- BONUS CHANCE ---
;
BonusChanceUnused_BONUS_CHANCE:
	.db $20, $C6, $14
	.db $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
	.db $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
	.db $00

BonusChanceText_NO_BONUS:
	.db $22, $86, $14
	.db $FB, $FB, $FB, $FB, $FB, $FB
	.db $E7, $E8, $FB, $DB, $E8, $E7, $EE, $EC ; NO BONUS
	.db $FB, $FB, $FB, $FB, $FB, $FB
	.db $00

BonusChanceText_PUSH_A_BUTTON:
	.db $22, $89, $0E
	.db $E9, $EE, $EC, $E1, $FB, $0E, $F,$FB, $DB, $EE, $ED, $ED, $E8, $E7 ; PUSH (A) BUTTON
	.db $00

BonusChanceText_PLAYER_1UP:
	.db $22, $8B, $0B
	.db $E9, $E5, $DA, $F2, $DE, $EB, $FB, $FB, $D1, $EE, $E9 ; PLAYER  1UP
	.db $00

Text_PAUSE:
	.db $25, $ED, $05
	.db $E9, $DA, $EE, $EC, $DE ; PAUSE
	.db $27, $DB, $02, $AA, $AA ; attribute data
	.db $00

; Erases NO BONUS / PUSH (A) BUTTON / PLAYER 1UP
BonusChanceText_Message_Erase:
	.db $22, $86, $54, $FB
	.db $00

; This would erase the "PUSH (A) BUTTON" text, but the placement is wrong.
; The placement matches the original Doki Doki Panic Bonus Chance screen.
BonusChanceText_PUSH_A_BUTTON_Erase:
	.db $22, $AA, $4D, $FB
	.db $00

; More leftovers. The placement matches the original Doki Doki Panic Bonus Chance screen's placement
; of the "PLAYER  1UP" message.
BonusChanceText_Message_Erase_Unused:
	.db $22, $EB, $4B, $FB
	.db $00

Text_PAUSE_Erase:
	.db $25, $ED, $05
	.db $FB, $FB, $FB, $FB, $FB
	.db $00

TitleCardText:
	; Level indicator dots
	.db $25, $0E, $07
	.db $FB, $FB, $FB, $FB, $FB, $FB, $FB
	; WORLD  1-1
	.db $24, $CA, $0B
	.db $FB, $F0, $E8, $EB, $E5, $DD, $FB, $FB, $D1, $F3, $D1
	; EXTRA LIFE...  0
	.db $23, $68, $10
	.db $DE, $F1, $ED, $EB, $DA, $FB, $E5, $E2, $DF, $DE
	.db $F9, $F9, $F9, $FB, $FB, $D0
	.db $00

Text_WARP:
	.db $21, $8E, $04, $F0, $DA, $EB, $E9

; Doki Doki Panic pseudo-leftover
; This actually has extra spaces on either end:
; "-WORLD-" ... It originally said "CHAPTER"
Text_WORLD_1:
	.db $22, $0C, $09
	.db $FB, $F0, $E8, $EB, $E5, $DD, $FB, $FB, $D1
	.db $00
Text_Unknown6:
	.db $21, $6A, $01, $FB
Text_Unknown7:
	.db $21, $AA, $01, $FB
	.db $00
Text_Unknown8:
	.db $21, $97, $C6, $FB
	.db $00
UnusedText_THANK_YOU:
	.db $21, $0C, $09
	.db $ED, $E1, $3A, $E7, $E4, $FB, $F2, $E8, $EE
UnusedText_Blank214D:
	.db $21, $4D, $06
	.db $FB, $FB, $FB, $FB, $FB, $FB
	.db $00

;
; ## Object vertical collision bounding box
;
; These hitboxes are copied to RAM and used when determining collision between objects. This allows
; the hitboxes to change dynamically, which is used when Hawkmouth (offset $0B) opens and closes.
;
ObjectCollisionHitboxLeft:
	.db $02 ; $00
	.db $02 ; $01
	.db $03 ; $02
	.db $00 ; $03
	.db $03 ; $04
	.db $03 ; $05
	.db $F8 ; $06
	.db $00 ; $07
	.db $03 ; $08
	.db $01 ; $09
	.db $F3 ; $0A
	.db $04 ; $0B
	.db $03 ; $0C
	.db $03 ; $0D
	.db $03 ; $0E
	.db $F2 ; $0F
	.db $03 ; $10
	.db $03 ; $11
	.db $05 ; $12
	.db $03 ; $13

ObjectCollisionHitboxTop:
	.db $0B ; $00
	.db $10 ; $01
	.db $03 ; $02
	.db $00 ; $03
	.db $03 ; $04
	.db $03 ; $05
	.db $F8 ; $06
	.db $00 ; $07
	.db $09 ; $08
	.db $04 ; $09
	.db $03 ; $0A
	.db $03 ; $0B
	.db $0E ; $0C
	.db $03 ; $0D
	.db $03 ; $0E
	.db $03 ; $0F
	.db $F6 ; $10
	.db $0C ; $11
	.db $02 ; $12
	.db $03 ; $13

ObjectCollisionHitboxWidth:
	.db $0B ; $00
	.db $0B ; $01
	.db $09 ; $02
	.db $10 ; $03
	.db $09 ; $04
	.db $19 ; $05
	.db $20 ; $06
	.db $20 ; $07
	.db $03 ; $08
	.db $1E ; $09
	.db $19 ; $0A
	.db $08 ; $0B
	.db $09 ; $0C
	.db $09 ; $0D
	.db $09 ; $0E
	.db $18 ; $0F
	.db $09 ; $10
	.db $1A ; $11
	.db $06 ; $12
	.db $15 ; $13

ObjectCollisionHitboxHeight:
	.db $16 ; $00
	.db $11 ; $01
	.db $0D ; $02
	.db $10 ; $03
	.db $1A ; $04
	.db $19 ; $05
	.db $24 ; $06
	.db $10 ; $07
	.db $03 ; $08
	.db $04 ; $09
	.db $2D ; $0A
	.db $30 ; $0B
	.db $0F ; $0C
	.db $2E ; $0D
	.db $3E ; $0E
	.db $1E ; $0F
	.db $28 ; $10
	.db $13 ; $11
	.db $48 ; $12
	.db $26 ; $13

ItemCarryYOffsets:
	.db $F9
	.db $FF
	.db $00
	.db $08
	.db $0C
	.db $18
	.db $1A
	.db $01
	.db $06
	.db $0A
	.db $0C
	.db $18
	.db $1A
	.db $1C
	.db $FF
	.db $FF
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00

;
; This copies the selected character's stats
; into memory for use later, but also a bunch
; of other unrelated crap like the
; Bonus Chance slot reels (???) and
; god knows what else.
;
CopyGeneralData_Mutable:
	LDY #$63
loc_BANKA_8493:
	LDA TitleCardText, Y
	STA PPUBuffer_TitleCardText, Y
	DEY
	CPY #$FF
	BNE loc_BANKA_8493

	; Copy flying carpet acceleration table
	LDY #$03
loc_BANKA_84B6:
	LDA FlyingCarpetAcceleration, Y
	STA FlyingCarpetAcceleration_RAM, Y
	DEY
	BPL loc_BANKA_84B6

	; Copy object collision type table
	;
	; The fact that it's in RAM is used to toggle the Boss Hawkmouth between an
	; object and an enemy.
	LDY #$49
loc_BANKA_84C1:
	LDA EnemyPlayerCollisionTable, Y
	STA EnemyPlayerCollisionTable_RAM, Y
	DEY
	BPL loc_BANKA_84C1

	; Copy end of level door PPU data to RAM
	;
	; The fact that it's in RAM is actually taken advantage of when defeating Clawgrip, since the
	; door needs to be drawn in a slightly different spot.
	LDY #$20
loc_BANKA_84CC:
	LDA EndOfLevelDoor, Y
	STA PPUBuffer_EndOfLevelDoor, Y
	DEY
	BPL loc_BANKA_84CC

	; Copy Wart's OAM address table
	LDY #$06
loc_BANKA_84D7:
	LDA WartOAMOffsets, Y
	STA WartOAMOffsets_RAM, Y
	DEY
	BPL loc_BANKA_84D7

	RTS


; Only copied once
CopyGeneralData_NonMutable:
; Copy bonus chance wheel
	LDY #$B6
loc_BANKA_8486:
	LDA BonusChanceReel1Order, Y
	STA SlotMachineReelOrder1RAM, Y
	DEY
	CPY #$FF
	BNE loc_BANKA_8486

; Copy object collision hitbox table
;
; The fact that it's in RAM is taken advantage of to programmatically change
; the hitbox for Hawkmouth after picking up the crystal.
; Whatever get modify in ram by sprites here get modified by the init function of the hawkmouth. So it's fine being here
	LDY #$4F
loc_BANKA_84AB:
	LDA ObjectCollisionHitboxLeft, Y
	STA ObjectCollisionHitboxLeft_RAM, Y
	DEY
	BPL loc_BANKA_84AB

	LDY #$1B
AreaInitialization_CarryYOffsetLoop:
	; Copy the global carrying Y offsets to memory
	; These are used for every character for different frames of the pickup animation
	LDA ItemCarryYOffsets, Y
	STA ItemCarryYOffsetsRAM, Y
	DEY
	BPL AreaInitialization_CarryYOffsetLoop

  RTS

.include "src/menus/character-select/main.asm"

.include "src/menus/title-screen/main.asm"

.include "src/menus/option-select/main.asm"
