CharacterStatsLo:
  .db <MarioStats
  .db <LuigiStats
  .db <ToadStats
  .db <PrincessStats

  .db <ImajinStats
  .db <MamaStats
  .db <PapaStats
  .db <LinaStats

  .db <WarioStats
  .db <WaluigiStats
  .db <ToadetteStats
  .db <DaisyStats

  .db <MerioStats
  .db <GarfieldStats
  .db <BirdoStats
  .db <RosalinaStats

CharacterStatsHi:
  .db >MarioStats
  .db >LuigiStats
  .db >ToadStats
  .db >PrincessStats

  .db >ImajinStats
  .db >MamaStats
  .db >PapaStats
  .db >LinaStats

  .db >WarioStats
  .db >WaluigiStats
  .db >ToadetteStats
  .db >DaisyStats

  .db >MerioStats
  .db >GarfieldStats
  .db >BirdoStats
  .db >RosalinaStats

CharacterStats:
MarioStats:
	.db $00 ; Pick-up Speed, frame 1/6 - pulling
	.db $04 ; Pick-up Speed, frame 2/6 - pulling
	.db $02 ; Pick-up Speed, frame 3/6 - ducking
	.db $01 ; Pick-up Speed, frame 4/6 - ducking
	.db $04 ; Pick-up Speed, frame 5/6 - ducking
	.db $07 ; Pick-up Speed, frame 6/6 - ducking
	.db $B0 ; Jump Speed, still - no object
	.db $B0 ; Jump Speed, still - with object
	.db $98 ; Jump Speed, charged - no object
	.db $98 ; Jump Speed, charged - with object
	.db $A6 ; Jump Speed, running - no object
	.db $AA ; Jump Speed, running - with object
	.db $E0 ; Jump Speed - in quicksand
	.db $00 ; Floating Time
	.db $07 ; Gravity without Jump button pressed
	.db $04 ; Gravity with Jump button pressed
	.db $08 ; Gravity in quicksand
	.db $18 ; Running Speed, right - no object
	.db $18 ; Running Speed, right - with object
	.db $04 ; Running Speed, right - in quicksand
	.db $E8 ; Running Speed, left - no object
	.db $E8 ; Running Speed, left - with object
	.db $FC ; Running Speed, left - in quicksand
  .db CanRun | Shrink | RegularFloat | NoStomp | RegularDig | RegularPickups ; Special attributes

ToadStats:
	.db $00 ; Pick-up Speed, frame 1/6 - pulling
	.db $01 ; Pick-up Speed, frame 2/6 - pulling
	.db $01 ; Pick-up Speed, frame 3/6 - ducking
	.db $01 ; Pick-up Speed, frame 4/6 - ducking
	.db $01 ; Pick-up Speed, frame 5/6 - ducking
	.db $02 ; Pick-up Speed, frame 6/6 - ducking
	.db $B2 ; Jump Speed, still - no object
	.db $B2 ; Jump Speed, still - with object
	.db $98 ; Jump Speed, charged - no object
	.db $98 ; Jump Speed, charged - with object
	.db $AD ; Jump Speed, running - no object
	.db $AD ; Jump Speed, running - with object
	.db $E0 ; Jump Speed - in quicksand
	.db $00 ; Floating Time
	.db $07 ; Gravity without Jump button pressed
	.db $04 ; Gravity with Jump button pressed
	.db $08 ; Gravity in quicksand
	.db $18 ; Running Speed, right - no object
	.db $1D ; Running Speed, right - with object
	.db $04 ; Running Speed, right - in quicksand
	.db $E8 ; Running Speed, left - no object
	.db $E3 ; Running Speed, left - with object
	.db $FC ; Running Speed, left - in quicksand
  .db CanRun | Shrink | RegularFloat | NoStomp | RegularDig | RegularPickups ; Special attributes

LuigiStats:
	.db $00 ; Pick-up Speed, frame 1/6 - pulling
	.db $04 ; Pick-up Speed, frame 2/6 - pulling
	.db $02 ; Pick-up Speed, frame 3/6 - ducking
	.db $01 ; Pick-up Speed, frame 4/6 - ducking
	.db $04 ; Pick-up Speed, frame 5/6 - ducking
	.db $07 ; Pick-up Speed, frame 6/6 - ducking
	.db $D6 ; Jump Speed, still - no object
	.db $D6 ; Jump Speed, still - with object
	.db $C9 ; Jump Speed, charged - no object
	.db $C9 ; Jump Speed, charged - with object
	.db $D0 ; Jump Speed, running - no object
	.db $D4 ; Jump Speed, running - with object
	.db $E0 ; Jump Speed - in quicksand
	.db $00 ; Floating Time
	.db $02 ; Gravity without Jump button pressed
	.db $01 ; Gravity with Jump button pressed
	.db $08 ; Gravity in quicksand
	.db $18 ; Running Speed, right - no object
	.db $16 ; Running Speed, right - with object
	.db $04 ; Running Speed, right - in quicksand
	.db $E8 ; Running Speed, left - no object
	.db $EA ; Running Speed, left - with object
	.db $FC ; Running Speed, left - in quicksand
  .db CanRun | Shrink | RegularFloat | NoStomp | RegularDig | RegularPickups ; Special attributes

PrincessStats:
	.db $00 ; Pick-up Speed, frame 1/6 - pulling
	.db $06 ; Pick-up Speed, frame 2/6 - pulling
	.db $04 ; Pick-up Speed, frame 3/6 - ducking
	.db $02 ; Pick-up Speed, frame 4/6 - ducking
	.db $06 ; Pick-up Speed, frame 5/6 - ducking
	.db $0C ; Pick-up Speed, frame 6/6 - ducking
	.db $B3 ; Jump Speed, still - no object
	.db $B3 ; Jump Speed, still - with object
	.db $98 ; Jump Speed, charged - no object
	.db $98 ; Jump Speed, charged - with object
	.db $AC ; Jump Speed, running - no object
	.db $B3 ; Jump Speed, running - with object
	.db $E0 ; Jump Speed - in quicksand
	.db $3C ; Floating Time
	.db $07 ; Gravity without Jump button pressed
	.db $04 ; Gravity with Jump button pressed
	.db $08 ; Gravity in quicksand
	.db $18 ; Running Speed, right - no object
	.db $15 ; Running Speed, right - with object
	.db $04 ; Running Speed, right - in quicksand
	.db $E8 ; Running Speed, left - no object
	.db $EB ; Running Speed, left - with object
	.db $FC ; Running Speed, left - in quicksand
  .db CanRun | Shrink | RegularFloat | NoStomp | RegularDig | RegularPickups ; Special attributes

ImajinStats:
	.db $00 ; Pick-up Speed, frame 1/6 - pulling
	.db $04 ; Pick-up Speed, frame 2/6 - pulling
	.db $02 ; Pick-up Speed, frame 3/6 - ducking
	.db $01 ; Pick-up Speed, frame 4/6 - ducking
	.db $04 ; Pick-up Speed, frame 5/6 - ducking
	.db $07 ; Pick-up Speed, frame 6/6 - ducking
	.db $B0 ; Jump Speed, still - no object
	.db $B0 ; Jump Speed, still - with object
	.db $98 ; Jump Speed, charged - no object
	.db $98 ; Jump Speed, charged - with object
	.db $A6 ; Jump Speed, running - no object
	.db $AA ; Jump Speed, running - with object
	.db $E0 ; Jump Speed - in quicksand
	.db $00 ; Floating Time
	.db $07 ; Gravity without Jump button pressed
	.db $04 ; Gravity with Jump button pressed
	.db $08 ; Gravity in quicksand
	.db $18 ; Running Speed, right - no object
	.db $18 ; Running Speed, right - with object
	.db $04 ; Running Speed, right - in quicksand
	.db $E8 ; Running Speed, left - no object
	.db $E8 ; Running Speed, left - with object
	.db $FC ; Running Speed, left - in quicksand
  .db CannotRun | DoesNotShrink | RegularFloat | NoStomp | RegularDig | RegularPickups ; Special attributes

MamaStats:
	.db $00 ; Pick-up Speed, frame 1/6 - pulling
	.db $04 ; Pick-up Speed, frame 2/6 - pulling
	.db $02 ; Pick-up Speed, frame 3/6 - ducking
	.db $01 ; Pick-up Speed, frame 4/6 - ducking
	.db $04 ; Pick-up Speed, frame 5/6 - ducking
	.db $07 ; Pick-up Speed, frame 6/6 - ducking
	.db $D8 ; Jump Speed, still - no object
	.db $D8 ; Jump Speed, still - with object
	.db $CB ; Jump Speed, charged - no object
	.db $CB ; Jump Speed, charged - with object
	.db $D2 ; Jump Speed, running - no object
	.db $D6 ; Jump Speed, running - with object
	.db $E0 ; Jump Speed - in quicksand
	.db $00 ; Floating Time
	.db $02 ; Gravity without Jump button pressed
	.db $01 ; Gravity with Jump button pressed
	.db $08 ; Gravity in quicksand
	.db $18 ; Running Speed, right - no object
	.db $16 ; Running Speed, right - with object
	.db $04 ; Running Speed, right - in quicksand
	.db $E8 ; Running Speed, left - no object
	.db $EA ; Running Speed, left - with object
	.db $FC ; Running Speed, left - in quicksand
  .db CannotRun | DoesNotShrink | RegularFloat | NoStomp | RegularDig | RegularPickups ; Special attributes

PapaStats:
	.db $00 ; Pick-up Speed, frame 1/6 - pulling
	.db $01 ; Pick-up Speed, frame 2/6 - pulling
	.db $01 ; Pick-up Speed, frame 3/6 - ducking
	.db $01 ; Pick-up Speed, frame 4/6 - ducking
	.db $01 ; Pick-up Speed, frame 5/6 - ducking
	.db $02 ; Pick-up Speed, frame 6/6 - ducking
	.db $B2 ; Jump Speed, still - no object
	.db $B2 ; Jump Speed, still - with object
	.db $98 ; Jump Speed, charged - no object
	.db $98 ; Jump Speed, charged - with object
	.db $AD ; Jump Speed, running - no object
	.db $AD ; Jump Speed, running - with object
	.db $E0 ; Jump Speed - in quicksand
	.db $00 ; Floating Time
	.db $07 ; Gravity without Jump button pressed
	.db $04 ; Gravity with Jump button pressed
	.db $08 ; Gravity in quicksand
	.db $18 ; Running Speed, right - no object
	.db $1D ; Running Speed, right - with object
	.db $04 ; Running Speed, right - in quicksand
	.db $E8 ; Running Speed, left - no object
	.db $E3 ; Running Speed, left - with object
	.db $FC ; Running Speed, left - in quicksand
  .db CannotRun | DoesNotShrink | RegularFloat | NoStomp | RegularDig | RegularPickups ; Special attributes

LinaStats:
	.db $00 ; Pick-up Speed, frame 1/6 - pulling
	.db $06 ; Pick-up Speed, frame 2/6 - pulling
	.db $04 ; Pick-up Speed, frame 3/6 - ducking
	.db $02 ; Pick-up Speed, frame 4/6 - ducking
	.db $06 ; Pick-up Speed, frame 5/6 - ducking
	.db $0C ; Pick-up Speed, frame 6/6 - ducking
	.db $B3 ; Jump Speed, still - no object
	.db $B3 ; Jump Speed, still - with object
	.db $98 ; Jump Speed, charged - no object
	.db $98 ; Jump Speed, charged - with object
	.db $AC ; Jump Speed, running - no object
	.db $B3 ; Jump Speed, running - with object
	.db $E0 ; Jump Speed - in quicksand
	.db $3C ; Floating Time
	.db $07 ; Gravity without Jump button pressed
	.db $04 ; Gravity with Jump button pressed
	.db $08 ; Gravity in quicksand
	.db $18 ; Running Speed, right - no object
	.db $15 ; Running Speed, right - with object
	.db $04 ; Running Speed, right - in quicksand
	.db $E8 ; Running Speed, left - no object
	.db $EB ; Running Speed, left - with object
	.db $FC ; Running Speed, left - in quicksand
  .db CannotRun | DoesNotShrink | RegularFloat | NoStomp | RegularDig | RegularPickups ; Special attributes

WarioStats:
	.db $00 ; Pick-up Speed, frame 1/6 - pulling
	.db $04 ; Pick-up Speed, frame 2/6 - pulling
	.db $02 ; Pick-up Speed, frame 3/6 - ducking
	.db $01 ; Pick-up Speed, frame 4/6 - ducking
	.db $04 ; Pick-up Speed, frame 5/6 - ducking
	.db $07 ; Pick-up Speed, frame 6/6 - ducking
	.db $B0 ; Jump Speed, still - no object
	.db $B0 ; Jump Speed, still - with object
	.db $98 ; Jump Speed, charged - no object
	.db $98 ; Jump Speed, charged - with object
	.db $A6 ; Jump Speed, running - no object
	.db $AA ; Jump Speed, running - with object
	.db $E0 ; Jump Speed - in quicksand
	.db $00 ; Floating Time
	.db $07 ; Gravity without Jump button pressed
	.db $04 ; Gravity with Jump button pressed
	.db $08 ; Gravity in quicksand
	.db $18 ; Running Speed, right - no object
	.db $18 ; Running Speed, right - with object
	.db $04 ; Running Speed, right - in quicksand
	.db $E8 ; Running Speed, left - no object
	.db $E8 ; Running Speed, left - with object
	.db $FC ; Running Speed, left - in quicksand
  .db CanRun | Shrink | RegularFloat | StompEnemies | RegularDig | RegularPickups ; Special attributes

WaluigiStats:
	.db $00 ; Pick-up Speed, frame 1/6 - pulling
	.db $04 ; Pick-up Speed, frame 2/6 - pulling
	.db $02 ; Pick-up Speed, frame 3/6 - ducking
	.db $01 ; Pick-up Speed, frame 4/6 - ducking
	.db $04 ; Pick-up Speed, frame 5/6 - ducking
	.db $07 ; Pick-up Speed, frame 6/6 - ducking
	.db $D6 ; Jump Speed, still - no object
	.db $D6 ; Jump Speed, still - with object
	.db $C9 ; Jump Speed, charged - no object
	.db $C9 ; Jump Speed, charged - with object
	.db $D0 ; Jump Speed, running - no object
	.db $D4 ; Jump Speed, running - with object
	.db $E0 ; Jump Speed - in quicksand
	.db $00 ; Floating Time
	.db $02 ; Gravity without Jump button pressed
	.db $01 ; Gravity with Jump button pressed
	.db $08 ; Gravity in quicksand
	.db $18 ; Running Speed, right - no object
	.db $16 ; Running Speed, right - with object
	.db $04 ; Running Speed, right - in quicksand
	.db $E8 ; Running Speed, left - no object
	.db $EA ; Running Speed, left - with object
	.db $FC ; Running Speed, left - in quicksand
  .db CanRun | Shrink | RegularFloat | NoStomp | RegularDig | RandomizePickups  ; Special attributes

ToadetteStats:
	.db $00 ; Pick-up Speed, frame 1/6 - pulling
	.db $00 ; Pick-up Speed, frame 2/6 - pulling
	.db $00 ; Pick-up Speed, frame 3/6 - ducking
	.db $00 ; Pick-up Speed, frame 4/6 - ducking
	.db $00 ; Pick-up Speed, frame 5/6 - ducking
	.db $00 ; Pick-up Speed, frame 6/6 - ducking
	.db $B2 ; Jump Speed, still - no object
	.db $B2 ; Jump Speed, still - with object
	.db $98 ; Jump Speed, charged - no object
	.db $98 ; Jump Speed, charged - with object
	.db $AD ; Jump Speed, running - no object
	.db $AD ; Jump Speed, running - with object
	.db $E0 ; Jump Speed - in quicksand
	.db $00 ; Floating Time
	.db $07 ; Gravity without Jump button pressed
	.db $04 ; Gravity with Jump button pressed
	.db $08 ; Gravity in quicksand
	.db $18 ; Running Speed, right - no object
	.db $1D ; Running Speed, right - with object
	.db $04 ; Running Speed, right - in quicksand
	.db $E8 ; Running Speed, left - no object
	.db $E3 ; Running Speed, left - with object
	.db $FC ; Running Speed, left - in quicksand
  .db CanRun | Shrink | RegularFloat | NoStomp | DigEverything | RegularPickups ; Special attributes

DaisyStats:
	.db $00 ; Pick-up Speed, frame 1/6 - pulling
	.db $06 ; Pick-up Speed, frame 2/6 - pulling
	.db $04 ; Pick-up Speed, frame 3/6 - ducking
	.db $02 ; Pick-up Speed, frame 4/6 - ducking
	.db $06 ; Pick-up Speed, frame 5/6 - ducking
	.db $0C ; Pick-up Speed, frame 6/6 - ducking
	.db $B3 ; Jump Speed, still - no object
	.db $B3 ; Jump Speed, still - with object
	.db $98 ; Jump Speed, charged - no object
	.db $98 ; Jump Speed, charged - with object
	.db $AC ; Jump Speed, running - no object
	.db $B3 ; Jump Speed, running - with object
	.db $E0 ; Jump Speed - in quicksand
	.db $3C ; Floating Time
	.db $07 ; Gravity without Jump button pressed
	.db $04 ; Gravity with Jump button pressed
	.db $08 ; Gravity in quicksand
	.db $18 ; Running Speed, right - no object
	.db $15 ; Running Speed, right - with object
	.db $04 ; Running Speed, right - in quicksand
	.db $E8 ; Running Speed, left - no object
	.db $EB ; Running Speed, left - with object
	.db $FC ; Running Speed, left - in quicksand
  .db CanRun | Shrink | UpwardFloat | NoStomp | RegularDig | RegularPickups ; Special attributes

MerioStats:
	.db $00 ; Pick-up Speed, frame 1/6 - pulling
	.db $04 ; Pick-up Speed, frame 2/6 - pulling
	.db $02 ; Pick-up Speed, frame 3/6 - ducking
	.db $01 ; Pick-up Speed, frame 4/6 - ducking
	.db $04 ; Pick-up Speed, frame 5/6 - ducking
	.db $07 ; Pick-up Speed, frame 6/6 - ducking
	.db $B0 ; Jump Speed, still - no object
	.db $B0 ; Jump Speed, still - with object
	.db $98 ; Jump Speed, charged - no object
	.db $98 ; Jump Speed, charged - with object
	.db $A6 ; Jump Speed, running - no object
	.db $AA ; Jump Speed, running - with object
	.db $E0 ; Jump Speed - in quicksand
	.db $00 ; Floating Time
	.db $07 ; Gravity without Jump button pressed
	.db $04 ; Gravity with Jump button pressed
	.db $08 ; Gravity in quicksand
	.db $18 ; Running Speed, right - no object
	.db $18 ; Running Speed, right - with object
	.db $04 ; Running Speed, right - in quicksand
	.db $E8 ; Running Speed, left - no object
	.db $E8 ; Running Speed, left - with object
	.db $FC ; Running Speed, left - in quicksand
  .db CanRun | Shrink | RegularFloat | StompEnemies | RegularDig | RegularPickups ; Special attributes


GarfieldStats:
	.db $00 ; Pick-up Speed, frame 1/6 - pulling
	.db $04 ; Pick-up Speed, frame 2/6 - pulling
	.db $02 ; Pick-up Speed, frame 3/6 - ducking
	.db $01 ; Pick-up Speed, frame 4/6 - ducking
	.db $04 ; Pick-up Speed, frame 5/6 - ducking
	.db $07 ; Pick-up Speed, frame 6/6 - ducking
	.db $D6 ; Jump Speed, still - no object
	.db $D6 ; Jump Speed, still - with object
	.db $C9 ; Jump Speed, charged - no object
	.db $C9 ; Jump Speed, charged - with object
	.db $D0 ; Jump Speed, running - no object
	.db $D4 ; Jump Speed, running - with object
	.db $E0 ; Jump Speed - in quicksand
	.db $00 ; Floating Time
	.db $02 ; Gravity without Jump button pressed
	.db $01 ; Gravity with Jump button pressed
	.db $08 ; Gravity in quicksand
	.db $18 ; Running Speed, right - no object
	.db $16 ; Running Speed, right - with object
	.db $04 ; Running Speed, right - in quicksand
	.db $E8 ; Running Speed, left - no object
	.db $EA ; Running Speed, left - with object
	.db $FC ; Running Speed, left - in quicksand
  .db CanRun | Shrink | RegularFloat | NoStomp | RegularDig | RandomizePickups  ; Special attributes

BirdoStats:
	.db $00 ; Pick-up Speed, frame 1/6 - pulling
	.db $06 ; Pick-up Speed, frame 2/6 - pulling
	.db $04 ; Pick-up Speed, frame 3/z6 - ducking
	.db $02 ; Pick-up Speed, frame 4/6 - ducking
	.db $06 ; Pick-up Speed, frame 5/6 - ducking
	.db $0C ; Pick-up Speed, frame 6/6 - ducking
	.db $B3 ; Jump Speed, still - no object
	.db $B3 ; Jump Speed, still - with object
	.db $98 ; Jump Speed, charged - no object
	.db $98 ; Jump Speed, charged - with object
	.db $AC ; Jump Speed, running - no object
	.db $B3 ; Jump Speed, running - with object
	.db $E0 ; Jump Speed - in quicksand
	.db $3C ; Floating Time
	.db $07 ; Gravity without Jump button pressed
	.db $04 ; Gravity with Jump button pressed
	.db $08 ; Gravity in quicksand
	.db $18 ; Running Speed, right - no object
	.db $15 ; Running Speed, right - with object
	.db $04 ; Running Speed, right - in quicksand
	.db $E8 ; Running Speed, left - no object
	.db $EB ; Running Speed, left - with object
	.db $FC ; Running Speed, left - in quicksand
  .db CanRun | Shrink | UpwardFloat | NoStomp | RegularDig | RegularPickups ; Special attributes

RosalinaStats:
	.db $00 ; Pick-up Speed, frame 1/6 - pulling
	.db $06 ; Pick-up Speed, frame 2/6 - pulling
	.db $04 ; Pick-up Speed, frame 3/6 - ducking
	.db $02 ; Pick-up Speed, frame 4/6 - ducking
	.db $06 ; Pick-up Speed, frame 5/6 - ducking
	.db $0C ; Pick-up Speed, frame 6/6 - ducking
	.db $B3 ; Jump Speed, still - no object
	.db $B3 ; Jump Speed, still - with object
	.db $98 ; Jump Speed, charged - no object
	.db $98 ; Jump Speed, charged - with object
	.db $AC ; Jump Speed, running - no object
	.db $B3 ; Jump Speed, running - with object
	.db $E0 ; Jump Speed - in quicksand
	.db $3C ; Floating Time
	.db $07 ; Gravity without Jump button pressed
	.db $04 ; Gravity with Jump button pressed
	.db $08 ; Gravity in quicksand
	.db $18 ; Running Speed, right - no object
	.db $15 ; Running Speed, right - with object
	.db $04 ; Running Speed, right - in quicksand
	.db $E8 ; Running Speed, left - no object
	.db $EB ; Running Speed, left - with object
	.db $FC ; Running Speed, left - in quicksand
  .db CanRun | Shrink | UpwardFloat | NoStomp | RegularDig | RegularPickups ; Special attributes

; Used to be 3 bytes only. But working with something that isn't a power of 2 fucking sucks
CharacterPaletteDefaultTable:
MarioPalette:
	.db $0F, $01, $16, $27
LuigiPalette:
	.db $0F, $01, $2A, $36
ToadPalette:
	.db $0F, $01, $30, $27
PrincessPalette:
	.db $0F, $06, $25, $36
ImajinPalette:
	.db $0F, $01, $27, $30
MamaPalette:
  .db $0F, $01, $36, $12
PapaPalette:
  .db $0F, $06, $27, $37
LinaPalette:
  .db $0F, $06, $36, $25
WarioPalette:
	.db $0F, $06, $27, $37
WaluigiPalette:
  .db $0F, $03, $13, $36
ToadettePalette:
  .db $0F, $0D, $24, $36
DaisyPalette:
  .db $0F, $06, $27, $37
MerioPalette:
	.db $0F, $01, $16, $27
GarfieldPalette:
  .db $0F, $06, $27, $30 
BirdoPalette:
  .db $0F, $05, $25, $30
RosalinaPalette:
  .db $0F, $08, $2C, $36

; Player 2 player palette
MarioPaletteAlt:
	.db $0F, $01, $13, $27
LuigiPaletteAlt:
	.db $0F, $01, $30, $36
ToadPaletteAlt:
	.db $0F, $16, $30, $27
PrincessPaletteAlt:
	.db $0F, $06, $27, $36
ImajinPaletteAlt:
	.db $0F, $07, $17, $27
MamaPaletteAlt:
  .db $0F, $00, $10, $36
PapaPaletteAlt:
  .db $0F, $06, $30, $27
LinaPaletteAlt:
  .db $0F, $08, $28, $36
WarioPaletteAlt:
	.db $0F, $07, $16, $36
WaluigiPaletteAlt:
  .db $0F, $0C, $1C, $36
ToadettePaletteAlt:
  .db $0F, $0D, $16, $36
DaisyPaletteAlt:
  .db $0F, $0D, $16, $36
MerioPaletteAlt:
	.db $0F, $01, $1A, $27
GarfieldPaletteAlt:
  .db $0F, $06, $26, $30
BirdoPaletteAlt:
  .db $0F, $06, $26, $30
RosalinaPaletteAlt:
  .db $0F, $08, $13, $36

PlayerSelectMarioSprites1:
	.db $2E, $00, $48
	.db $2E, $02, $50
	.db $3E, $04, $48
	.db $3E, $06, $50

PlayerSelectLuigiSprites1:
	.db $2E, $08, $68
	.db $2E, $0A, $70
	.db $3E, $0C, $68
	.db $3E, $0E, $70

PlayerSelectToadSprites1:
	.db $2E, $10, $88
	.db $2E, $12, $90
	.db $3E, $14, $88
	.db $3E, $16, $90

PlayerSelectPrincessSprites1:
	.db $2E, $18, $A8
	.db $2E, $1A, $B0
	.db $3E, $1C, $A8
	.db $3E, $1E, $B0

PlayerSelectImajinSprites1:
	.db $58, $40, $48
	.db $58, $42, $50
	.db $68, $44, $48
	.db $68, $46, $50

PlayerSelectMamaSprites1:
	.db $58, $48, $68
	.db $58, $4A, $70
	.db $68, $4C, $68
	.db $68, $4E, $70

PlayerSelectPapaSprites1:
	.db $58, $50, $88
	.db $58, $52, $90
	.db $68, $54, $88
	.db $68, $56, $90

PlayerSelectLinaSprites1:
	.db $58, $58, $A8
	.db $58, $5A, $B0
	.db $68, $5C, $A8
	.db $68, $5E, $B0

PlayerSelectWarioSprites1:
	.db $82, $80, $48
	.db $82, $82, $50
	.db $92, $84, $48
	.db $92, $86, $50

PlayerSelectWaluigiSprites1:
	.db $82, $88, $68
	.db $82, $8A, $70
	.db $92, $8C, $68
	.db $92, $8E, $70

PlayerSelectToadetteSprites1:
	.db $82, $90, $88
	.db $82, $92, $90
	.db $92, $94, $88
	.db $92, $96, $90

PlayerSelectDaisySprites1:
	.db $82, $98, $A8
	.db $82, $9A, $B0
	.db $92, $9C, $A8
	.db $92, $9E, $B0

PlayerSelectMerioSprites1:
	.db $AC, $C0, $48
	.db $AC, $C2, $50
	.db $BC, $C4, $48
	.db $BC, $C6, $50

PlayerSelectGarfieldSprites1:
	.db $AC, $C8, $68
	.db $AC, $CA, $70
	.db $BC, $CC, $68
	.db $BC, $CE, $70

PlayerSelectBirdoSprites1:
	.db $AC, $D0, $88
	.db $AC, $D2, $90
	.db $BC, $D4, $88
	.db $BC, $D6, $90

PlayerSelectRosalinaSprites1:
	.db $AC, $D8, $A8
	.db $AC, $DA, $B0
	.db $BC, $DC, $A8
	.db $BC, $DE, $B0

PlayerConfirmSpriteArray:
PlayerSelectMarioSprites2:
	.db $20

PlayerSelectLuigiSprites2:
	.db $28

PlayerSelectToadSprites2:
	.db $30

PlayerSelectPrincessSprites2:
	.db $38

PlayerSelectImajinSprites2:
	.db $60

PlayerSelectMamaSprites2:
	.db $68

PlayerSelectPapaSprites2:
	.db $70

PlayerSelectLinaSprites2:
	.db $78

PlayerSelectMerioSprites2:
	.db $A0

PlayerSelectGarfieldSprites2:
	.db $A8

PlayerSelectToadetteSprites2:
	.db $B0

PlayerSelectRosalinaSprites2:
	.db $B8
