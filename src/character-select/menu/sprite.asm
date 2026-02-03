SpriteTableMenuCharacterSelect:
  .db $60, $0F, $00, $50
  .db $60, $0F, $00, $58 ; First number

  .db $60, $0F, $01, $78
  .db $60, $0F, $01, $80 ; Second number

  .db $60, $0F, $02, $A0
  .db $60, $0F, $02, $A8 ; Third number

  .db $46, $20, $03, $3C ; Cursor

  .db $F8, $20, $03, $47 ; Sub cursor

  .db $26, $40, $00, $B0 ; Top Right
  .db $26, $42, $00, $B8 ; Top Left
  .db $36, $44, $00, $B0 ; Bottom Right
  .db $36, $46, $00, $B8 ; Bottom Left

  .db $26, $80, $00, $40 ; Top right
  .db $26, $82, $00, $48 ; Top left
  .db $36, $84, $00, $40 ; Bottom right
  .db $36, $86, $00, $48 ; Bottom left

  .db $26, $7E, $03, $B0 ; Eye


CursorCharSelectMenuYPosition:
  .db $46, $6E, $86
  
CursorCharSelectMenuEditorXPosition:
  .db $47, $70, $97

TableSpriteOAMIndexTilePositionCharacterEditor:
  .db $01, $09, $11
