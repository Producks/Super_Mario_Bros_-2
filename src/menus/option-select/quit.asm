OptionSelectQuit:
  PLA
  PLA ; This was a temp fix but it got left in. It works so i'll leave it for now
  LDA #Music2_StopMusic
	STA MusicQueue2

  JSR BlackOutDSTPaletterBuffer
  LDA #FadeOut
  JSR ColorFade

  LDX CursorLocation
  INX
  STX GamePlayMode

CleanupBeforeCharacterSelect:
; Set the gameplay function before wiping out the memory
  LDX GamePlayMode
  LDA GameplayInputFuncLoTable, X
  STA FuncPointerLo
  LDA GameplayInputFuncHiTable, X
  STA FuncPointerHi

	LDA #$00
	TAY
; This would be usually done in the title screen
; Since the option menu doesn't need it, we end up doing it here
CleanupZeroOut:
	STA byte_RAM_0, Y
	INY
	CPY #$F0
	BCC CleanupZeroOut
  STX GamePlayMode
  LDA #$00
  STA CurrentCharacter
  STA CurrentCharacterPTwo ; Zero out ram for characters incase there left overs

; Set random number
  LDA TitleScreenSeedCounter
  BNE SetSeedCounter
  LDA #$69 ; if it's 0, just start at nice
SetSeedCounter:
  STA Seed
  AND #$0F
  STA SecondsToWait
  LDA OptionSelectSeedCounter
  STA SeedHi
  LDA #$3C
  STA SecondsTimer

; Flip if are playing traditional mode so it start has player 1
  LDA GamePlayMode
  CMP #kTraditionalMode
  BNE QuitCleanup
  LDA #$01
  STA CurrentPlayer
QuitCleanup:
	JMP HideAllSprites
