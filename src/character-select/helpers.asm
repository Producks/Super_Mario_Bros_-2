;
; Global functions that can help with certain things...
;

MultiplyBy16:
  ASL A
  ASL A
  ASL A
  ASL A
  RTS

;
; X = Value to set
;
SetCharacter_OAM_Palette:
  LDA CursorLocation
  JSR MultiplyBy16
  TAY
  TXA
  STA SpriteDMAArea + 2, Y
  STA SpriteDMAArea + 6, Y
  STA SpriteDMAArea + 10, Y
  STA SpriteDMAArea + 14, Y
  RTS

;
; Check game mode
; Check which player is playing
;
PrintTextCharSelect:
  LDY byte_RAM_300
  LDA #$23
  STA PPUBuffer_301, Y
  INY
  LDA #$66
  STA PPUBuffer_301, Y
  INY
;  LDA #$10
  LDA #$15
  STA PPUBuffer_301, Y
  INY

  LDX #$05
  JSR PrintWordCharSelect

  LDX #$03
  JSR PrintWordCharSelect

  LDX #$01
  JSR PrintWordCharSelect ; ; bug bug check here late to fix ovefrflow

  LDA #$00
  STA PPUBuffer_301, Y

  STY byte_RAM_300

  RTS

PrintWordCharSelect:
  LDA WordListIndexCharSelect, X
  TAX
PrintWordCharSelectLoop:
  LDA WordListCharSelect, X
  BEQ LeavePRintWordCharSelect
  STA PPUBuffer_301, Y
  INY
  INX
  BNE PrintWordCharSelectLoop
LeavePRintWordCharSelect:
  RTS

; End of helpers
;Select Character One