QuitCharacterSelect:
  JSR SetCharacterPickPose

.include "src/menus/character-select/character-setter.asm"

	LDA #$40
  JSR DelayFrames

  LDY #$1F
  LDA #$0F
-
  STA PaletteFadeOutBuffer, Y
  DEY
  BPL -

  LDA #FadeOut
  JSR ColorFade

LeaveCharacterSelect:
	LDA #Music2_StopMusic
	STA MusicQueue2
	RTS
