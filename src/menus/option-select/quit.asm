OptionSelectQuit:
  PLA
  PLA ; This was a temp fix but it got left in. It works so i'll leave it for now
  LDA #Music2_StopMusic
	STA MusicQueue2
  JSR PaletteFadeOut
  LDX CursorLocation
  INX
  STX GamePlayMode
  JMP CleanupBeforeCharacterSelect
