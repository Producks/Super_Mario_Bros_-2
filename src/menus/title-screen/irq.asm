; ------------------------------------------------------------
; Desc:
;       IRQ fun is here! Use indirect JMP pointer to control
;       the flow of all IRQ for the title screen. The first
;       IRQ call should always call DoNothing first to avoid
;       a graphical glitch on the title screen!
; ------------------------------------------------------------
IRQ:
  ; Save all register and the PS
  PHP
  PHA
  TXA
  PHA
  TYA
  PHA

  JMP (FuncLoTemp) ; Jump table

; ------------------------------------------------------------
; Desc:
;      This IRQ responsability is to make the clouds scroll
;      right. It also setup the next IRQ timing to fire, and
;      setup the indirect JMP pointer for the next call.   
; ------------------------------------------------------------
FirstIRQ:
  LDA #$1A
  STA MMC3_IRQDisable
  STA MMC3_IRQLatch
  STA MMC3_IRQReload
  STA MMC3_IRQEnable

LoadFirstIRQParams:
  LDA #$F3
  STA MMC3_BankSelect
  LDA #CHRBank_BackgroundGrass + 1
  STA MMC3_BankData

  LDA PPUCTRLForIRQ
  LDX XPositionFirstIRQ
  LDY #$08 ; Loop to wait
  JSR WaitSubRoutineIRQ
;  NOP
;  NOP
;  NOP

; Magic happen here!
  STX PPUSCROLL ; X Position
  STY PPUSCROLL ; Y Position
  STA PPUCTRL ; Swap between PPUCtrl_Base2000 and PPUCtrl_Base2400

TimerHandlerFirstIRQ:
  DEC FirstIRQTimer
  BPL SetupSecondIRQPointer ; Branch if timer >= 0
  LDY #FirstIRQScrollTimer
  STY FirstIRQTimer

ScrollFirstIRQ:
  INC XPositionFirstIRQ
  BNE SetPPUCtrlFirstIRQ ; if Xposition == 0, flip the nametable screen PPUCTRL
  LDA PPUCTRLForIRQ
  EOR #$01

SetPPUCtrlFirstIRQ:
  STA PPUCTRLForIRQ

SetupSecondIRQPointer:
  LDA #<SecondIRQ
  STA FuncLoTemp
  LDA #>SecondIRQ
  STA FuncHiTemp

Exit_IRQ:
  ; Restore all register and the PS
  PLA
  TAY
  PLA
  TAX
  PLA
  PLP
  RTI

; ------------------------------------------------------------
; Second IRQ
; Disable the IRQ
; Scroll the screen on a timer
; ------------------------------------------------------------
SecondIRQ:
  LDA PPUCtrlSecondIRQ
  STA MMC3_IRQDisable ; Acknowledge the IRQ by disabling it

IRQLoadScroll:
  LDA PPUCtrlSecondIRQ
  LDX XPositionSecondIRQ
  LDY #$0A ; Loop to wait
  JSR WaitSubRoutineIRQ
  NOP
  NOP
  NOP
  NOP

; It's magic!
  STX PPUSCROLL ; X Position
  STY PPUSCROLL ; Y Position
  STA PPUCTRL ; Swap between PPUCtrl_Base2000 and PPUCtrl_Base2400

TimerHandlerSecondIRQ:
  DEC SecondIRQTimer
  BPL SetFirstPointerIRQ
  LDY #SecondIRQScrollTimer
  STY SecondIRQTimer ; Reset scroll timer

  DEC XPositionSecondIRQ
  LDA XPositionSecondIRQ
  CMP #$FF
  BNE SetFirstPointerIRQ
  LDA PPUCtrlSecondIRQ
  EOR #$01
  STA PPUCtrlSecondIRQ

SetFirstPointerIRQ:
  LDA #<FirstIRQ
  STA FuncLoTemp
  LDA #>FirstIRQ
  STA FuncHiTemp ; Setup next IRQ subroutine for next frame

  JMP Exit_IRQ

; X the amount of loop to do
WaitSubRoutineIRQ:
  DEY
  BNE WaitSubRoutineIRQ
  RTS
