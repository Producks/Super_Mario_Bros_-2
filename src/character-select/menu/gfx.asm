
CharacterNameLo:
  .db <MarioName
  .db <LuigiName
  .db <ToadName
  .db <PrincessName
  .db <ImajinName
  .db <MamaName
  .db <PapaName
  .db <LinaName
  .db <WarioName
  .db <WaluigiName
  .db <ToadetteName
  .db <DaisyName
  .db <MerioName
  .db <GarfieldName
  .db <BirdoName
  .db <RosalinaName

CharacterNameHi:
  .db >MarioName
  .db >LuigiName
  .db >ToadName
  .db >PrincessName
  .db >ImajinName
  .db >MamaName
  .db >PapaName
  .db >LinaName
  .db >WarioName
  .db >WaluigiName
  .db >ToadetteName
  .db >DaisyName
  .db >MerioName
  .db >GarfieldName
  .db >BirdoName
  .db >RosalinaName

CharacterName:
MarioName:
  .db $20, $ED, $05, $E6, $DA, $EB, $E2, $E8, $00 ; Mario
LuigiName:
  .db $20, $ED, $05, $E5, $EE, $E2, $E0, $E2, $00 ; Luigi
ToadName:
  .db $20, $EE, $04, $ED, $E8, $DA, $DD, $00 ; Toad 
PrincessName:
  .db $20, $EC, $08, $E9, $EB, $E2, $E7, $DC, $DE, $EC, $EC, $00 ; Princess
ImajinName:
  .db $20, $ED, $06, $E2, $E6, $DA, $E3, $E2, $E7, $00
MamaName:
  .db $20, $EE, $04, $E6, $DA, $E6, $DA, $00
PapaName:
  .db $20, $EE, $04, $E9, $DA, $E9, $DA, $00
LinaName:
  .db $20, $EE, $04, $E5, $E2, $E7, $DA, $00
WarioName:
  .db $20, $ED, $05, $F0, $DA, $EB, $E2, $E8, $00
WaluigiName:
  .db $20, $EC, $07, $F0, $DA, $E5, $EE, $E2, $E0, $E2, $00
ToadetteName:
  .db $20, $EC, $08, $ED, $E8, $DA, $DD, $DE, $ED, $ED, $DE, $00
DaisyName:
  .db $20, $ED, $05, $DD, $DA, $E2, $EC, $F2, $00
MerioName:
  .db $20, $ED, $05, $E6, $DE, $EB, $E2, $E8, $00
GarfieldName:
  .db $20, $EC, $08, $E0, $DA, $EB, $DF, $E2, $DE, $E5, $DD, $00
BirdoName:
  .db $20, $ED, $05, $DB, $E2, $EB, $DD, $E8, $00
RosalinaName:
  .db $20, $EC, $08, $EB, $E8, $EC, $DA, $E5, $E2, $E7, $DA, $00

CharacterDescriptionLo:
  .db <MarioDescription
  .db <LuigiDescription
  .db <ToadDescription
  .db <PrincessDescription
  .db <ImajinDescription
  .db <MamaDescription
  .db <PapaDescription
  .db <LinaDescription
  .db <WarioDescription
  .db <WaluigiDescription
  .db <ToadetteDescription
  .db <DaisyDescription
  .db <MerioDescription
  .db <GarfieldDescription
  .db <BirdoDescription
  .db <RosalinaDescription

CharacterDescriptionHi:
  .db >MarioDescription
  .db >LuigiDescription
  .db >ToadDescription
  .db >PrincessDescription
  .db >ImajinDescription
  .db >MamaDescription
  .db >PapaDescription
  .db >LinaDescription
  .db >WarioDescription
  .db >WaluigiDescription
  .db >ToadetteDescription
  .db >DaisyDescription
  .db >MerioDescription
  .db >GarfieldDescription
  .db >BirdoDescription
  .db >RosalinaDescription

CharacterDescription:
MarioDescription:
  .db $22, $E6, $0C, $DA, $E5, $E5, $F4, $EB, $E8, $EE, $E7, $DD, $DE, $EB, $F9, $00 ; All-rounder
  .db $23, $26, $12, $E7, $E8, $FB, $EC, $E9, $DE, $DC, $E2, $DA, $E5, $FB, $DA, $DB, $E2, $E5, $E2, $ED, $F2, $00 ; No special ability
  .db $23, $66, $54, $FB, $00
LuigiDescription:
  .db $22, $E6, $0F, $DF, $E5, $E8, $DA, $ED, $F2, $FB, $E3, $EE, $E6, $E9, $FB, $DA, $E7, $DD, $00
  .db $23, $26, $0F, $E1, $E2, $E0, $E1, $DE, $EC, $ED, $FB, $E3, $EE, $E6, $E9, $E2, $E7, $E0, $00
  .db $23, $66, $05, $E9, $E8, $F0, $DE, $EB, $00
ToadDescription:
  .db $22, $E6, $10, $EB, $EE, $E7, $FB, $DF, $DA, $EC, $ED, $DE, $EB, $FB, $F0, $E1, $E2, $E5, $DE, $00 ; Run faster while
  .db $23, $26, $0E, $DC, $DA, $EB, $EB, $F2, $E2, $E7, $E0, $FB, $E1, $DE, $DA, $EF, $F2, $00 ; carrying heavy
  .db $23, $66, $12, $E8, $DB, $E3, $DE, $DC, $ED, $EC, $FB, $E8, $EB, $FB, $DE, $E7, $DE, $E6, $E2, $DE, $EC, $00 ; objects or enemies
PrincessDescription:
  .db $22, $E6, $11, $DF, $E5, $E8, $DA, $ED, $FB, $DF, $E8, $EB, $FB, $DA, $FB, $EC, $E1, $E8, $EB, $ED, $00 ; Float for a short
  .db $23, $26, $13, $DD, $EE, $EB, $DA, $ED, $E2, $E8, $E7, $FB, $E2, $E7, $FB, $ED, $E1, $DE, $FB, $DA, $E2, $EB, $00 ; duration in the air
  .db $23, $66, $0E, $F0, $E1, $DE, $E7, $FB, $E1, $E8, $E5, $DD, $E2, $E7, $E0, $FB, $DA, $00 ; when holding A
ImajinDescription:
  .db $22, $E6, $13, $DA, $E5, $E5, $F4, $EB, $E8, $EE, $E7, $DD, $DE, $EB, $F9, $FB, $DC, $DA, $E7, $E7, $E8, $ED, $00
  .db $23, $26, $0E, $EB, $EE, $E7, $FB, $DA, $E7, $DD, $FB, $EC, $E1, $EB, $E2, $E7, $E4, $00
  .db $23, $66, $54, $FB, $00
MamaDescription:
  .db $22, $E6, $13, $E1, $E2, $E0, $E1, $FB, $E3, $EE, $E6, $E9, $FB, $E9, $E8, $F0, $DE, $EB, $FB, $DA, $E7, $DD, $00
  .db $23, $26, $13, $DF, $E5, $E8, $DA, $ED, $F2, $FB, $E3, $EE, $E6, $E9, $F6, $FB, $DC, $DA, $E7, $E7, $E8, $ED, $00
  .db $23, $66, $0E, $EB, $EE, $E7, $FB, $DA, $E7, $DD, $FB, $EC, $E1, $EB, $E2, $E7, $E4, $00
PapaDescription:
  .db $22, $E6, $14, $ED, $E8, $DA, $DD, $FB, $EC, $E9, $DE, $DC, $E2, $DA, $E5, $F9, $FB, $DC, $DA, $E7, $E7, $E8, $ED, $00
  .db $23, $26, $0E, $EB, $EE, $E7, $FB, $DA, $E7, $DD, $FB, $EC, $E1, $EB, $E2, $E7, $E4, $00
  .db $23, $66, $54, $FB, $00
LinaDescription:
  .db $22, $E6, $11, $E9, $EB, $E2, $E7, $DC, $DE, $EC, $EC, $FB, $EC, $E9, $DE, $DC, $E2, $DA, $E5, $F9, $00
  .db $23, $26, $0E, $DC, $DA, $E7, $E7, $E8, $ED, $FB, $EB, $EE, $E7, $FB, $DA, $E7, $DD, $00
  .db $23, $66, $06, $EC, $E1, $EB, $E2, $E7, $E4, $00
WarioDescription:
  .db $22, $E6, $54, $FB, $00
  .db $23, $26, $54, $FB, $00
  .db $23, $66, $54, $FB, $00
WaluigiDescription:
  .db $22, $E6, $54, $FB, $00
  .db $23, $26, $54, $FB, $00
  .db $23, $66, $54, $FB, $00
ToadetteDescription:
  .db $22, $E6, $11, $DC, $DA, $E7, $FB, $DD, $E2, $E0, $FB, $DA, $E7, $F2, $F0, $E1, $DE, $EB, $DE, $F9, $00 ; Can Dig anywhere.
  .db $23, $26, $12, $E1, $E8, $E5, $DD, $E2, $E7, $E0, $FB, $EE, $E9, $FB, $DD, $E2, $EC, $DA, $DB, $E5, $DE, $00 ; HOLDING UP DISABLE
  .db $23, $66, $0B, $ED, $E1, $DE, $FB, $DD, $E2, $E0, $E0, $E2, $E7, $E0, $00 ; The digging
DaisyDescription:
  .db $22, $E6, $54, $FB, $00
  .db $23, $26, $54, $FB, $00
  .db $23, $66, $54, $FB, $00
MerioDescription:
  .db $22, $E6, $12, $EC, $ED, $E8, $E6, $E9, $FB, $DE, $E7, $DE, $E6, $E2, $DE, $EC, $FB, $ED, $E1, $DA, $ED, $00
  .db $23, $26, $12, $DC, $DA, $E7, $FB, $DB, $DE, $FB, $E0, $EB, $DA, $DB, $DB, $DE, $DD, $FB, $DA, $E7, $DD, $00
  .db $23, $66, $0F, $DB, $E8, $EE, $E7, $DC, $DE, $FB, $E8, $DF, $DF, $FB, $ED, $E1, $DE, $E6, $00
GarfieldDescription:
  .db $22, $E6, $13, $E0, $DE, $ED, $FB, $EB, $DA, $E7, $DD, $E8, $E6, $FB, $E8, $EE, $ED, $DC, $E8, $E6, $DE, $EC, $00
  .db $23, $26, $0E, $DF, $EB, $E8, $E6, $FB, $E0, $EB, $DA, $EC, $EC, $FB, $DA, $E7, $DD, $00
  .db $23, $66, $08, $DC, $E1, $DE, $EB, $EB, $E2, $DE, $EC, $00
BirdoDescription:
  .db $22, $E6, $13, $EC, $E1, $E8, $E8, $ED, $FB, $DA, $E7, $FB, $DE, $E0, $E0, $FB, $F0, $E2, $ED, $E1, $FB, $DB, $00 ; Shoot an egg with B
  .db $23, $26, $14, $F0, $E1, $DE, $E7, $FB, $DA, $FB, $EC, $EE, $E9, $DE, $EB, $FB, $E3, $EE, $E6, $E9, $FB, $E2, $EC, $00
  .db $23, $66, $07, $DC, $E1, $DA, $EB, $E0, $DE, $DD, $00 ; charged
RosalinaDescription:
  .db $22, $E6, $14, $E5, $DE, $EF, $E2, $ED, $DA, $ED, $DE, $FB, $DF, $E8, $EB, $FB, $DA, $FB, $EC, $E1, $E8, $EB, $ED, $00 ; Levitate for a short
  .db $23, $26, $13, $DD, $EE, $EB, $DA, $ED, $E2, $E8, $E7, $FB, $E2, $E7, $FB, $ED, $E1, $DE, $FB, $DA, $E2, $EB, $00 ; duration in the air
  .db $23, $66, $0E, $F0, $E1, $DE, $E7, $FB, $E1, $E8, $E5, $DD, $E2, $E7, $E0, $FB, $DA, $00 ; when holding A

PaletteEditorText:
  .db $21, $49, $0E, $E9, $DA, $E5, $DE, $ED, $ED, $DE, $FB, $DE, $DD, $E2, $ED, $E8, $EB, $00

RestorePaletteText:
  .db $21, $E9, $0F, $EB, $DE, $EC, $ED, $E8, $EB, $DE, $FB, $E9, $DA, $E5, $DE, $ED, $ED, $DE, $00

ExitMenuText:
  .db $22, $49, $09, $DE, $F1, $E2, $ED, $FB, $E6, $DE, $E7, $EE, $00

CharacterInfoText:
  .db $00
;  .db $22, $A9, $0E, $DC, $E1, $DA, $EB, $DA, $DC, $ED, $DE, $EB, $FB, $E2, $E7, $DF, $E8, $00

; Erase section!
EraseName:
  .db $20, $EA, $4F, $FA, $00

ErasePaletteEditorText:
  .db $21, $49, $4E, $FB, $00

EraseRestorePaletteText
  .db $21, $E9, $4F, $FB, $00

EraseExitMenuText:
  .db $22, $49, $49, $FB, $00

EraseCharacterInfoText:
  .db $22, $A9, $4E, $FB, $00

EraseDescriptionLineOne:
  .db $2A, $E6, $54, $FB, $00

EraseDescriptionLineTwo:
  .db $2B, $26, $54, $FB, $00

EraseDescriptionLineThree:
  .db $2B, $66, $54, $FB, $00
