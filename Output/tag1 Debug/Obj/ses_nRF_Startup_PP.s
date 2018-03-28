# 1 "C:\\Users\\Jon\\Documents\\jenkinsd2\\nrf52\\nrf52\\ses_nRF_Startup.s"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "C:\\Users\\Jon\\Documents\\jenkinsd2\\nrf52\\nrf52\\ses_nRF_Startup.s"
# 51 "C:\\Users\\Jon\\Documents\\jenkinsd2\\nrf52\\nrf52\\ses_nRF_Startup.s"
  .syntax unified

  .global Reset_Handler



  .extern _vectors

  .section .init, "ax"
  .thumb_func

  .equ VTOR_REG, 0xE000ED08
  .equ FPU_CPACR_REG, 0xE000ED88





Reset_Handler:


  ldr r0, =__RAM_segment_end__
  ldr r1, =0x7
  bics r0, r1
  mov sp, r0




  ldr r0, =SystemInit
  blx r0
# 107 "C:\\Users\\Jon\\Documents\\jenkinsd2\\nrf52\\nrf52\\ses_nRF_Startup.s"
  ldr r0, =VTOR_REG



  ldr r1, =_vectors

  str r1, [r0]




  ldr r0, =FPU_CPACR_REG
  ldr r1, [r0]
  orr r1, r1, #(0xF << 20)
  str r1, [r0]
  dsb
  isb



  b _start
