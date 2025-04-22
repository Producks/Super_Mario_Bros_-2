; All of the title screen code and option select reside here.
; This all fit in Bank D

.pad $a000, $ff

.include "src/menu/gfx.asm"

.include "src/menu/global.asm"

.include "src/menu/title-screen/sprite.asm"

.include "src/menu/title-screen/init.asm"

.include "src/menu/title-screen/loop.asm"

.include "src/menu/title-screen/quit.asm"

.include "src/menu/title-screen/irq.asm"

.pad $b0ff, $ff

.include "src/menu/option-select/sprites.asm"

.include "src/menu/option-select/init.asm"

.include "src/menu/option-select/loop.asm"

.include "src/menu/option-select/quit.asm"
