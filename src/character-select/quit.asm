QuitCharacterSelect:

  LDA CursorLocation
  JSR MultiplyBy16
  TAY
  LDX #$03
-
  LDA SpriteDMAArea + 1, Y
  ORA #$20
  STA SpriteDMAArea + 1, Y
  INY
  INY
  INY
  INY
  DEX
  BPL -

.include "src/character-select/character-setter.asm"

WaitFixedAmountNMICharSelect:
	LDA #$40
	STA byte_RAM_10

WaitFixedAmountNMICharacterSelect:
	JSR WaitForNMI

	DEC byte_RAM_10
	BPL WaitFixedAmountNMICharacterSelect

LeaveCharacterSelect:
	LDA #Music2_StopMusic
	STA MusicQueue2
	RTS
