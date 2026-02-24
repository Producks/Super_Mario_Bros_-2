SpriteTableMenuCharacterSelect:
  .db $60, $0F, $03, $50
  .db $60, $0F, $03, $58 ; First number

  .db $60, $0F, $03, $78
  .db $60, $0F, $03, $80 ; Second number

  .db $60, $0F, $03, $A0
  .db $60, $0F, $03, $A8 ; Third number

  .db $46, $20, $03, $3C ; Cursor

  .db $F8, $20, $03, $47 ; Sub cursor

  .db $26, $40, $01, $B0 ; Top Right
  .db $26, $42, $01, $B8 ; Top Left
  .db $36, $44, $01, $B0 ; Bottom Right
  .db $36, $46, $01, $B8 ; Bottom Left

  .db $26, $80, $01, $40 ; Top right
  .db $26, $82, $01, $48 ; Top left
  .db $36, $84, $01, $40 ; Bottom right
  .db $36, $86, $01, $48 ; Bottom left

  .db $26, $7E, $03, $B0 ; Eye

CursorCharSelectMenuYPosition:
  .db $46, $6E, $86
  
CursorCharSelectMenuEditorXPosition:
  .db $47, $70, $97

TableSpriteOAMIndexTilePositionCharacterEditor:
  .db $01, $09, $11
