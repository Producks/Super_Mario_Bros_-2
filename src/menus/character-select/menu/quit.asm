QuitSubMenuCharacterEditor:
  JSR FadeOutColorsCharacterEditorMenu

  JSR HideAllSprites

  LDA #<EraseName
  STA FuncLoTemp
  LDA #>EraseName
  STA FuncHiTemp

  JSR DumpTextLine
  JSR DumpTextLine
  JSR DumpTextLine

  JSR DumpCharacterSpritesSelect

	LDA #CHRBank_CharacterSelectSprites
	STA SpriteCHR1
  LDA #CHRBank_CharacterSelectSprites + 1
  STA SpriteCHR2
  LDA #CHRBank_CharacterSelectSprites + 2
  STA SpriteCHR3

  LDA #$02
  STA ScreenUpdateIndex

  JSR WaitForNMI

  JSR PrintTextCharSelect

  LDX #$01
  JSR SetCharacter_OAM_Palette

  JSR FadeInColorsCharacterEditorMenu

  JMP CharacterSelectMenuLoop
