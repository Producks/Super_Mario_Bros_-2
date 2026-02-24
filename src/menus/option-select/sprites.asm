SpritesOptionSelectTable:

; Top left corner sprites to hide the top part of rendering
  .db $00, $F4, $00, $00
  .db $00, $F4, $00, $00
  .db $00, $F4, $00, $00
  .db $00, $F4, $00, $00
  .db $00, $F4, $00, $00
  .db $00, $F4, $00, $00
  .db $00, $F4, $00, $00
  .db $00, $F4, $00, $00

; Scroll down left 2 sprites
	.db $1F, $01, $30, $44
	.db $1F, $03, $30, $4C
	.db $60, $05, $31, $B8
	.db $60, $07, $31, $C0

; Scroll down right 2 sprites
	.db $75, $09, $32, $AA
	.db $75, $0B, $32, $B2
	.db $02, $0D, $33, $02
	.db $02, $0F, $33, $0A

; Scroll up left 1 sprite
	.db $2C, $11, $30, $A1
	.db $2C, $13, $30, $A9

; Scroll up right 1 sprite
	.db $A5, $1D, $30, $DB
	.db $A5, $1F, $30, $E3

; Scroll Up left (big sprite)
	.db $37, $15, $30, $46
	.db $37, $17, $30, $4E
	.db $47, $35, $30, $46
	.db $47, $37, $30, $4E

; Scroll Up right (big sprite)
	.db $B4, $19, $33, $43
	.db $B4, $1B, $33, $4B
	.db $C4, $39, $33, $43
	.db $C4, $3B, $33, $4B

UpdateSpriteLogicOptionSelect:
  LDA OptionSelectSeedCounter
  AND #$01 ; Update the sprites half the time
  BEQ ScrollDowndLeft
  RTS

ScrollDowndLeft:
  INC SpriteDMAArea + 32
  DEC SpriteDMAArea + 35
  INC SpriteDMAArea + 36
  DEC SpriteDMAArea + 39
; Second Sprite
  INC SpriteDMAArea + 40
  DEC SpriteDMAArea + 43
  INC SpriteDMAArea + 44
  DEC SpriteDMAArea + 47

ScrollDownRight:
  INC SpriteDMAArea + 48
  INC SpriteDMAArea + 51
  INC SpriteDMAArea + 52
  INC SpriteDMAArea + 55
; Second Sprite
  INC SpriteDMAArea + 56
  INC SpriteDMAArea + 59
  INC SpriteDMAArea + 60
  INC SpriteDMAArea + 63

ScrollUpLeft:
  DEC SpriteDMAArea + 64
  DEC SpriteDMAArea + 67
  DEC SpriteDMAArea + 68
  DEC SpriteDMAArea + 71

ScrollUpRight:
  DEC SpriteDMAArea + 72
  INC SpriteDMAArea + 75
  DEC SpriteDMAArea + 76
  INC SpriteDMAArea + 79

ScrollBigUpRight:
  DEC SpriteDMAArea + 80
  INC SpriteDMAArea + 83
  DEC SpriteDMAArea + 84
  INC SpriteDMAArea + 87
  DEC SpriteDMAArea + 88
  INC SpriteDMAArea + 91
  DEC SpriteDMAArea + 92
  INC SpriteDMAArea + 95


ScrollBigDownLeft:
  INC SpriteDMAArea + 96
  DEC SpriteDMAArea + 99

  INC SpriteDMAArea + 100
  DEC SpriteDMAArea + 103

  INC SpriteDMAArea + 104
  DEC SpriteDMAArea + 107

  INC SpriteDMAArea + 108
  DEC SpriteDMAArea + 111


  LDA OptionSelectSeedCounter
  AND #$0F
  BNE SwapSprites ; temp fix

  LDY #RowNumberToProcessOptionSelect ; Counter to know how many times XOR we do to animate
  LDX #StartingIndexSpriteOptionSelectTile
AnimateSprites:
  LDA SpriteDMAArea, X
  EOR #$20 ; Flip back and forth to the tile below
  STA SpriteDMAArea, X
  INX
  INX
  INX
  INX
  DEY
  BPL AnimateSprites

  LDY #RowNumberToProcessOptionSelectBig
AnimateBigSpritesLoop:
  LDA SpriteDMAArea, X
  EOR #$40
  STA SpriteDMAArea, X
  INX
  INX
  INX
  INX
  DEY
  BPL AnimateBigSpritesLoop

SwapSprites:
  LDY #RowNumberToProcessOptionSelect
  LDX #StartingIndexSpriteOptionSelectY
SwapSpritesLoop:
  LDA SpriteDMAArea, X
  CMP #$EF ; What scanliner we do the gfx swap for the Y position
  BNE SwapSpritesInc
  LDA SpriteDMAArea + 1, X
  CLC
  ADC #$40
  STA SpriteDMAArea + 1, X
SwapSpritesInc:
  INX
  INX
  INX
  INX
  DEY
  BPL SwapSpritesLoop

SwapSpritesBig:
  LDY #RowNumberToProcessOptionSelectBig
SwapSpritesBigLoop:
  LDA SpriteDMAArea, X
  CMP #$EF
  BNE SwapSpritesIncBig
  LDA SpriteDMAArea + 1, X
  CLC
  ADc #$80
  STa SpriteDMAArea + 1, X 
SwapSpritesIncBig:
  INX
  INX
  INX
  INX
  DEY
  BPL SwapSpritesBigLoop
 
LeaveUpdateSpriteLogicOptionSelect:
  RTS

; Read the routine name
DumpSpriteOptionSelect:
  LDY #$00
SpriteDumpOptionSelectLoop:
  LDA SpritesOptionSelectTable, Y
  STA SpriteDMAArea, Y
  INY
  CPY #TotalSizeOptionSelectSprite
  BNE SpriteDumpOptionSelectLoop
  RTS
