OptionSelectInit:
  JSR WaitForNMI_Menu_TurnOffPPU

; I have to wait to be in vblank to turn rendering off
;	LDA #$00
;	STA PPUMASK
	JSR DisableNMI ; Disable NMI since I won't need it for now

  LDA #CHRStartExpand
  STA SpriteCHR1
  LDA #CHRStartExpand + 1
  STA SpriteCHR2
  LDA #CHRStartOption
  STA SpriteCHR3
  LDA #CHRStartOptionAnimation
  STA SpriteCHR4
  LDA #$9C
  STA BackgroundCHR1
  LDA #$9E
  STA BackgroundCHR2

  LDA #CHRAnimationSpeedOption
  STA CHRTableTimer

  JSR SetScrollXYTo0

	JSR ClearNametablesAndSprites

  LDA #BorderPPUBuffer
  STA ScreenUpdateIndex
  LDA PPUSTATUS

  JSR EnableNMI_OptionSelect

  JSR WaitForNMI_Menu

  LDX #TraditionalPPUBuffer
  STX CursorLocation ; Setup cursor right away
;  JSR UpdateGFXMenuOption
  LDA #$04
  STA ScreenUpdateIndex
  JSR WaitForNMI_Menu

  JSR DumpSpriteOptionSelect

  JSR WaitForNMI_Menu_TurnOnPPU

  ; Fade in the colors
  LDA #<OptionMenuBackgroundPalettes
  STA LoPaletteAddress
  LDA #>OptionMenuBackgroundPalettes
  STA HiPaletteAddress
  JSR PaletteFadeIn
  LDA #Music1_Subspace
	STA MusicQueue1
;  RTS
;  JMP OptionSelectQuit
