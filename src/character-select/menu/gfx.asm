
CharacterNameLo:
  .db <MarioName
  .db <LuigiName
CharacterNameHi:
  .db >MarioName
  .db >LuigiName

CharacterName:
MarioName:
  .db $20, $ED, $05, $E6, $DA, $EB, $E2, $E8, $00 ; Mario
LuigiName:
  .db $20, $EC, $05, $E5, $EE, $E2, $E0, $E2, $00 ; Luigi

CharacterDescriptionLo:
  .db <MarioDescription
CharacterDescriptionHi:
  .db >MarioDescription

CharacterDescription:
MarioDescription:
  .db $22, $E6, $54, $FB, $00
  .db $23, $26, $54, $FB, $00
  .db $23, $66, $54, $FB, $00

PaletteEditorText:
  .db $21, $49, $0E, $E9, $DA, $E5, $DE, $ED, $ED, $DE, $FB, $DE, $DD, $E2, $ED, $E8, $EB, $00

RestorePaletteText:
  .db $21, $E9, $0F, $EB, $DE, $EC, $ED, $E8, $EB, $DE, $FB, $E9, $DA, $E5, $DE, $ED, $ED, $DE, $00

ExitMenuText:
  .db $22, $49, $09, $DE, $F1, $E2, $ED, $FB, $E6, $DE, $E7, $EE, $00

CharacterInfoText:
  .db $22, $A9, $0E, $DC, $E1, $DA, $EB, $DA, $DC, $ED, $DE, $EB, $FB, $E2, $E7, $DF, $E8, $00
