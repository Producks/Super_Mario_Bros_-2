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

  LDA #PPUCtrl_Base2000 | PPUCtrl_WriteHorizontal | PPUCtrl_Sprite1000 | PPUCtrl_Background0000 | PPUCtrl_SpriteSize8x16 | PPUCtrl_NMIEnabled
  JSR SetEnableNMI

  JSR WaitForNMI_Menu

  LDA #$00
  STA CursorLocation ; Setup cursor right away

  JSR InitContextWindow_OptionSelect

  JSR DumpSpriteOptionSelect

;  Color fade in option-select
  LDY #$1F
-
  LDA OptionMenuBackgroundPalettes, Y
  STA PaletteFadeOutBuffer, Y
  DEY
  BPL -

  LDA #JMP_ABS_OPCODE
  STA FadeOptionalFuncOP
  LDA #<FrameUpdateOptionSelect
  STA FadeOptionalFuncLo
  LDA #>FrameUpdateOptionSelect
  STA FadeOptionalFuncHi

  LDA #FadeIn
  JSR ColorFade

  LDA #Music1_Subspace
	STA MusicQueue1
