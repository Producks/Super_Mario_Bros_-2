TitleScreen_Exit:
	LDA #Music2_StopMusic
	STA MusicQueue2
	JSR WaitForNMI_Menu

  JSR PaletteFadeOut

  SEI ; Disable IRQ

  LDA CursorLocation
; If 2 player is the selection, jump to the option select menu
  BNE GoToOptionSelect 
; This is located at the end of option select
  JMP OptionSelectInit
  JMP CleanupBeforeCharacterSelect
GoToOptionSelect:
