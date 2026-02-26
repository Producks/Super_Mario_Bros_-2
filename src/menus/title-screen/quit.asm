TitleScreen_Exit:
	LDA #Music2_StopMusic
	STA MusicQueue2
	JSR WaitForNMI_Menu

  LDY #$1F
  LDA #$0F
-
  STA PaletteFadeOutBuffer, Y
  DEY
  BPL -

  LDA #FadeOut
  JSR ColorFade

  SEI ; Disable IRQ

  JMP OptionSelectInit
