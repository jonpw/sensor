	.cpu cortex-m4
	.eabi_attribute 27, 1
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"SEGGER_RTT.c"
	.text
.Ltext0:
	.section	.data._aTerminalId,"aw",%progbits
	.align	2
	.type	_aTerminalId, %object
	.size	_aTerminalId, 16
_aTerminalId:
	.byte	48
	.byte	49
	.byte	50
	.byte	51
	.byte	52
	.byte	53
	.byte	54
	.byte	55
	.byte	56
	.byte	57
	.byte	65
	.byte	66
	.byte	67
	.byte	68
	.byte	69
	.byte	70
	.global	_SEGGER_RTT
	.section	.bss._SEGGER_RTT,"aw",%nobits
	.align	2
	.type	_SEGGER_RTT, %object
	.size	_SEGGER_RTT, 120
_SEGGER_RTT:
	.space	120
	.section	.bss._acUpBuffer,"aw",%nobits
	.align	2
	.type	_acUpBuffer, %object
	.size	_acUpBuffer, 1024
_acUpBuffer:
	.space	1024
	.section	.bss._acDownBuffer,"aw",%nobits
	.align	2
	.type	_acDownBuffer, %object
	.size	_acDownBuffer, 16
_acDownBuffer:
	.space	16
	.section	.bss._ActiveTerminal,"aw",%nobits
	.type	_ActiveTerminal, %object
	.size	_ActiveTerminal, 1
_ActiveTerminal:
	.space	1
	.section .rodata
	.align	2
.LC0:
	.ascii	"Terminal\000"
	.align	2
.LC1:
	.ascii	"RTT\000"
	.align	2
.LC2:
	.ascii	"SEGGER\000"
	.section	.text._DoInit,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	_DoInit, %function
_DoInit:
.LFB0:
	.file 1 "C:\\Users\\Jon\\Documents\\jenkinsd2\\nrf52\\nrf52\\SEGGER_RTT.c"
	.loc 1 216 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI0:
	sub	sp, sp, #12
.LCFI1:
	.loc 1 221 0
	ldr	r3, .L2
	str	r3, [sp, #4]
	.loc 1 222 0
	ldr	r3, [sp, #4]
	movs	r2, #2
	str	r2, [r3, #16]
	.loc 1 223 0
	ldr	r3, [sp, #4]
	movs	r2, #2
	str	r2, [r3, #20]
	.loc 1 227 0
	ldr	r3, [sp, #4]
	ldr	r2, .L2+4
	str	r2, [r3, #24]
	.loc 1 228 0
	ldr	r3, [sp, #4]
	ldr	r2, .L2+8
	str	r2, [r3, #28]
	.loc 1 229 0
	ldr	r3, [sp, #4]
	mov	r2, #1024
	str	r2, [r3, #32]
	.loc 1 230 0
	ldr	r3, [sp, #4]
	movs	r2, #0
	str	r2, [r3, #40]
	.loc 1 231 0
	ldr	r3, [sp, #4]
	movs	r2, #0
	str	r2, [r3, #36]
	.loc 1 232 0
	ldr	r3, [sp, #4]
	movs	r2, #0
	str	r2, [r3, #44]
	.loc 1 236 0
	ldr	r3, [sp, #4]
	ldr	r2, .L2+4
	str	r2, [r3, #72]
	.loc 1 237 0
	ldr	r3, [sp, #4]
	ldr	r2, .L2+12
	str	r2, [r3, #76]
	.loc 1 238 0
	ldr	r3, [sp, #4]
	movs	r2, #16
	str	r2, [r3, #80]
	.loc 1 239 0
	ldr	r3, [sp, #4]
	movs	r2, #0
	str	r2, [r3, #88]
	.loc 1 240 0
	ldr	r3, [sp, #4]
	movs	r2, #0
	str	r2, [r3, #84]
	.loc 1 241 0
	ldr	r3, [sp, #4]
	movs	r2, #0
	str	r2, [r3, #92]
	.loc 1 247 0
	ldr	r3, [sp, #4]
	adds	r3, r3, #7
	ldr	r1, .L2+16
	mov	r0, r3
	bl	strcpy
	.loc 1 248 0
	ldr	r3, [sp, #4]
	ldr	r1, .L2+20
	mov	r0, r3
	bl	strcpy
	.loc 1 249 0
	ldr	r3, [sp, #4]
	movs	r2, #32
	strb	r2, [r3, #6]
	.loc 1 250 0
	nop
	add	sp, sp, #12
.LCFI2:
	@ sp needed
	ldr	pc, [sp], #4
.L3:
	.align	2
.L2:
	.word	_SEGGER_RTT
	.word	.LC0
	.word	_acUpBuffer
	.word	_acDownBuffer
	.word	.LC1
	.word	.LC2
.LFE0:
	.size	_DoInit, .-_DoInit
	.section	.text._WriteBlocking,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	_WriteBlocking, %function
_WriteBlocking:
.LFB1:
	.loc 1 271 0
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI3:
	sub	sp, sp, #36
.LCFI4:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	.loc 1 279 0
	movs	r3, #0
	str	r3, [sp, #24]
	.loc 1 280 0
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #12]
	str	r3, [sp, #20]
.L8:
	.loc 1 282 0
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #16]
	str	r3, [sp, #16]
	.loc 1 283 0
	ldr	r2, [sp, #16]
	ldr	r3, [sp, #20]
	cmp	r2, r3
	bls	.L5
	.loc 1 284 0
	ldr	r2, [sp, #16]
	ldr	r3, [sp, #20]
	subs	r3, r2, r3
	subs	r3, r3, #1
	str	r3, [sp, #28]
	b	.L6
.L5:
	.loc 1 286 0
	ldr	r3, [sp, #12]
	ldr	r2, [r3, #8]
	ldr	r1, [sp, #16]
	ldr	r3, [sp, #20]
	subs	r3, r1, r3
	add	r3, r3, r2
	subs	r3, r3, #1
	str	r3, [sp, #28]
.L6:
	.loc 1 288 0
	ldr	r3, [sp, #12]
	ldr	r2, [r3, #8]
	ldr	r3, [sp, #20]
	subs	r3, r2, r3
	ldr	r2, [sp, #28]
	cmp	r3, r2
	it	cs
	movcs	r3, r2
	str	r3, [sp, #28]
	.loc 1 289 0
	ldr	r2, [sp, #28]
	ldr	r3, [sp, #4]
	cmp	r3, r2
	it	cs
	movcs	r3, r2
	str	r3, [sp, #28]
	.loc 1 290 0
	ldr	r3, [sp, #12]
	ldr	r2, [r3, #4]
	ldr	r3, [sp, #20]
	add	r3, r3, r2
	ldr	r2, [sp, #28]
	ldr	r1, [sp, #8]
	mov	r0, r3
	bl	memcpy
	.loc 1 291 0
	ldr	r2, [sp, #24]
	ldr	r3, [sp, #28]
	add	r3, r3, r2
	str	r3, [sp, #24]
	.loc 1 292 0
	ldr	r2, [sp, #8]
	ldr	r3, [sp, #28]
	add	r3, r3, r2
	str	r3, [sp, #8]
	.loc 1 293 0
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #28]
	subs	r3, r2, r3
	str	r3, [sp, #4]
	.loc 1 294 0
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #28]
	add	r3, r3, r2
	str	r3, [sp, #20]
	.loc 1 295 0
	ldr	r3, [sp, #12]
	ldr	r2, [r3, #8]
	ldr	r3, [sp, #20]
	cmp	r2, r3
	bne	.L7
	.loc 1 296 0
	movs	r3, #0
	str	r3, [sp, #20]
.L7:
	.loc 1 298 0
	ldr	r3, [sp, #12]
	ldr	r2, [sp, #20]
	str	r2, [r3, #12]
	.loc 1 299 0
	ldr	r3, [sp, #4]
	cmp	r3, #0
	bne	.L8
	.loc 1 301 0
	ldr	r3, [sp, #24]
	.loc 1 302 0
	mov	r0, r3
	add	sp, sp, #36
.LCFI5:
	@ sp needed
	ldr	pc, [sp], #4
.LFE1:
	.size	_WriteBlocking, .-_WriteBlocking
	.section	.text._WriteNoCheck,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	_WriteNoCheck, %function
_WriteNoCheck:
.LFB2:
	.loc 1 322 0
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI6:
	sub	sp, sp, #36
.LCFI7:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	.loc 1 327 0
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #12]
	str	r3, [sp, #28]
	.loc 1 328 0
	ldr	r3, [sp, #12]
	ldr	r2, [r3, #8]
	ldr	r3, [sp, #28]
	subs	r3, r2, r3
	str	r3, [sp, #24]
	.loc 1 329 0
	ldr	r2, [sp, #24]
	ldr	r3, [sp, #4]
	cmp	r2, r3
	bls	.L11
	.loc 1 333 0
	ldr	r3, [sp, #12]
	ldr	r2, [r3, #4]
	ldr	r3, [sp, #28]
	add	r3, r3, r2
	ldr	r2, [sp, #4]
	ldr	r1, [sp, #8]
	mov	r0, r3
	bl	memcpy
	.loc 1 334 0
	ldr	r2, [sp, #28]
	ldr	r3, [sp, #4]
	add	r2, r2, r3
	ldr	r3, [sp, #12]
	str	r2, [r3, #12]
	.loc 1 345 0
	b	.L13
.L11:
	.loc 1 339 0
	ldr	r3, [sp, #24]
	str	r3, [sp, #20]
	.loc 1 340 0
	ldr	r3, [sp, #12]
	ldr	r2, [r3, #4]
	ldr	r3, [sp, #28]
	add	r3, r3, r2
	ldr	r2, [sp, #20]
	ldr	r1, [sp, #8]
	mov	r0, r3
	bl	memcpy
	.loc 1 341 0
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #24]
	subs	r3, r2, r3
	str	r3, [sp, #20]
	.loc 1 342 0
	ldr	r3, [sp, #12]
	ldr	r0, [r3, #4]
	ldr	r2, [sp, #8]
	ldr	r3, [sp, #24]
	add	r3, r3, r2
	ldr	r2, [sp, #20]
	mov	r1, r3
	bl	memcpy
	.loc 1 343 0
	ldr	r3, [sp, #12]
	ldr	r2, [sp, #20]
	str	r2, [r3, #12]
.L13:
	.loc 1 345 0
	nop
	add	sp, sp, #36
.LCFI8:
	@ sp needed
	ldr	pc, [sp], #4
.LFE2:
	.size	_WriteNoCheck, .-_WriteNoCheck
	.section	.text._PostTerminalSwitch,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	_PostTerminalSwitch, %function
_PostTerminalSwitch:
.LFB3:
	.loc 1 360 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI9:
	sub	sp, sp, #20
.LCFI10:
	str	r0, [sp, #4]
	mov	r3, r1
	strb	r3, [sp, #3]
	.loc 1 363 0
	movs	r3, #255
	strb	r3, [sp, #12]
	.loc 1 364 0
	ldrb	r3, [sp, #3]	@ zero_extendqisi2
	ldr	r2, .L15
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	strb	r3, [sp, #13]
	.loc 1 365 0
	add	r3, sp, #12
	movs	r2, #2
	mov	r1, r3
	ldr	r0, [sp, #4]
	bl	_WriteBlocking
	.loc 1 366 0
	nop
	add	sp, sp, #20
.LCFI11:
	@ sp needed
	ldr	pc, [sp], #4
.L16:
	.align	2
.L15:
	.word	_aTerminalId
.LFE3:
	.size	_PostTerminalSwitch, .-_PostTerminalSwitch
	.section	.text._GetAvailWriteSpace,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	_GetAvailWriteSpace, %function
_GetAvailWriteSpace:
.LFB4:
	.loc 1 382 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #24
.LCFI12:
	str	r0, [sp, #4]
	.loc 1 390 0
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #16]
	str	r3, [sp, #16]
	.loc 1 391 0
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #12]
	str	r3, [sp, #12]
	.loc 1 392 0
	ldr	r2, [sp, #16]
	ldr	r3, [sp, #12]
	cmp	r2, r3
	bhi	.L18
	.loc 1 393 0
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #8]
	ldr	r3, [sp, #12]
	subs	r2, r2, r3
	ldr	r3, [sp, #16]
	add	r3, r3, r2
	subs	r3, r3, #1
	str	r3, [sp, #20]
	b	.L19
.L18:
	.loc 1 395 0
	ldr	r2, [sp, #16]
	ldr	r3, [sp, #12]
	subs	r3, r2, r3
	subs	r3, r3, #1
	str	r3, [sp, #20]
.L19:
	.loc 1 397 0
	ldr	r3, [sp, #20]
	.loc 1 398 0
	mov	r0, r3
	add	sp, sp, #24
.LCFI13:
	@ sp needed
	bx	lr
.LFE4:
	.size	_GetAvailWriteSpace, .-_GetAvailWriteSpace
	.section	.text.SEGGER_RTT_ReadNoLock,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_ReadNoLock
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_ReadNoLock, %function
SEGGER_RTT_ReadNoLock:
.LFB5:
	.loc 1 423 0
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI14:
	sub	sp, sp, #44
.LCFI15:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	.loc 1 431 0
	ldr	r3, .L27
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L22
	.loc 1 431 0 is_stmt 0 discriminator 1
	bl	_DoInit
.L22:
	.loc 1 432 0 is_stmt 1
	ldr	r2, [sp, #12]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	adds	r3, r3, #72
	ldr	r2, .L27
	add	r3, r3, r2
	str	r3, [sp, #24]
	.loc 1 433 0
	ldr	r3, [sp, #8]
	str	r3, [sp, #28]
	.loc 1 434 0
	ldr	r3, [sp, #24]
	ldr	r3, [r3, #16]
	str	r3, [sp, #32]
	.loc 1 435 0
	ldr	r3, [sp, #24]
	ldr	r3, [r3, #12]
	str	r3, [sp, #20]
	.loc 1 436 0
	movs	r3, #0
	str	r3, [sp, #36]
	.loc 1 440 0
	ldr	r2, [sp, #32]
	ldr	r3, [sp, #20]
	cmp	r2, r3
	bls	.L23
	.loc 1 441 0
	ldr	r3, [sp, #24]
	ldr	r2, [r3, #8]
	ldr	r3, [sp, #32]
	subs	r3, r2, r3
	str	r3, [sp, #16]
	.loc 1 442 0
	ldr	r2, [sp, #16]
	ldr	r3, [sp, #4]
	cmp	r3, r2
	it	cs
	movcs	r3, r2
	str	r3, [sp, #16]
	.loc 1 443 0
	ldr	r3, [sp, #24]
	ldr	r2, [r3, #4]
	ldr	r3, [sp, #32]
	add	r3, r3, r2
	ldr	r2, [sp, #16]
	mov	r1, r3
	ldr	r0, [sp, #28]
	bl	memcpy
	.loc 1 444 0
	ldr	r2, [sp, #36]
	ldr	r3, [sp, #16]
	add	r3, r3, r2
	str	r3, [sp, #36]
	.loc 1 445 0
	ldr	r2, [sp, #28]
	ldr	r3, [sp, #16]
	add	r3, r3, r2
	str	r3, [sp, #28]
	.loc 1 446 0
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #16]
	subs	r3, r2, r3
	str	r3, [sp, #4]
	.loc 1 447 0
	ldr	r2, [sp, #32]
	ldr	r3, [sp, #16]
	add	r3, r3, r2
	str	r3, [sp, #32]
	.loc 1 451 0
	ldr	r3, [sp, #24]
	ldr	r2, [r3, #8]
	ldr	r3, [sp, #32]
	cmp	r2, r3
	bne	.L23
	.loc 1 452 0
	movs	r3, #0
	str	r3, [sp, #32]
.L23:
	.loc 1 458 0
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #32]
	subs	r3, r2, r3
	str	r3, [sp, #16]
	.loc 1 459 0
	ldr	r2, [sp, #16]
	ldr	r3, [sp, #4]
	cmp	r3, r2
	it	cs
	movcs	r3, r2
	str	r3, [sp, #16]
	.loc 1 460 0
	ldr	r3, [sp, #16]
	cmp	r3, #0
	beq	.L24
	.loc 1 461 0
	ldr	r3, [sp, #24]
	ldr	r2, [r3, #4]
	ldr	r3, [sp, #32]
	add	r3, r3, r2
	ldr	r2, [sp, #16]
	mov	r1, r3
	ldr	r0, [sp, #28]
	bl	memcpy
	.loc 1 462 0
	ldr	r2, [sp, #36]
	ldr	r3, [sp, #16]
	add	r3, r3, r2
	str	r3, [sp, #36]
	.loc 1 463 0
	ldr	r2, [sp, #28]
	ldr	r3, [sp, #16]
	add	r3, r3, r2
	str	r3, [sp, #28]
	.loc 1 464 0
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #16]
	subs	r3, r2, r3
	str	r3, [sp, #4]
	.loc 1 465 0
	ldr	r2, [sp, #32]
	ldr	r3, [sp, #16]
	add	r3, r3, r2
	str	r3, [sp, #32]
.L24:
	.loc 1 467 0
	ldr	r3, [sp, #36]
	cmp	r3, #0
	beq	.L25
	.loc 1 468 0
	ldr	r3, [sp, #24]
	ldr	r2, [sp, #32]
	str	r2, [r3, #16]
.L25:
	.loc 1 471 0
	ldr	r3, [sp, #36]
	.loc 1 472 0
	mov	r0, r3
	add	sp, sp, #44
.LCFI16:
	@ sp needed
	ldr	pc, [sp], #4
.L28:
	.align	2
.L27:
	.word	_SEGGER_RTT
.LFE5:
	.size	SEGGER_RTT_ReadNoLock, .-SEGGER_RTT_ReadNoLock
	.section	.text.SEGGER_RTT_Read,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_Read
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_Read, %function
SEGGER_RTT_Read:
.LFB6:
	.loc 1 490 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI17:
	sub	sp, sp, #28
.LCFI18:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
.LBB2:
	.loc 1 493 0
	.syntax unified
@ 493 "C:\Users\Jon\Documents\jenkinsd2\nrf52\nrf52\SEGGER_RTT.c" 1
	mrs   r3, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [sp, #20]
	.loc 1 497 0
	ldr	r2, [sp, #4]
	ldr	r1, [sp, #8]
	ldr	r0, [sp, #12]
	bl	SEGGER_RTT_ReadNoLock
	str	r0, [sp, #16]
	.loc 1 501 0
	ldr	r3, [sp, #20]
	.syntax unified
@ 501 "C:\Users\Jon\Documents\jenkinsd2\nrf52\nrf52\SEGGER_RTT.c" 1
	msr   basepri, r3  
	
@ 0 "" 2
	.thumb
	.syntax unified
.LBE2:
	.loc 1 503 0
	ldr	r3, [sp, #16]
	.loc 1 504 0
	mov	r0, r3
	add	sp, sp, #28
.LCFI19:
	@ sp needed
	ldr	pc, [sp], #4
.LFE6:
	.size	SEGGER_RTT_Read, .-SEGGER_RTT_Read
	.section	.text.SEGGER_RTT_WriteWithOverwriteNoLock,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_WriteWithOverwriteNoLock
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_WriteWithOverwriteNoLock, %function
SEGGER_RTT_WriteWithOverwriteNoLock:
.LFB7:
	.loc 1 529 0
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI20:
	sub	sp, sp, #36
.LCFI21:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	.loc 1 534 0
	ldr	r3, [sp, #8]
	str	r3, [sp, #28]
	.loc 1 538 0
	ldr	r3, [sp, #12]
	adds	r2, r3, #1
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	ldr	r2, .L42
	add	r3, r3, r2
	str	r3, [sp, #16]
	.loc 1 542 0
	ldr	r3, [sp, #16]
	ldr	r2, [r3, #12]
	ldr	r3, [sp, #16]
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L32
	.loc 1 543 0
	ldr	r3, [sp, #16]
	ldr	r3, [r3, #8]
	subs	r3, r3, #1
	str	r3, [sp, #24]
	b	.L33
.L32:
	.loc 1 544 0
	ldr	r3, [sp, #16]
	ldr	r2, [r3, #12]
	ldr	r3, [sp, #16]
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bcs	.L34
	.loc 1 545 0
	ldr	r3, [sp, #16]
	ldr	r2, [r3, #16]
	ldr	r3, [sp, #16]
	ldr	r3, [r3, #12]
	subs	r3, r2, r3
	subs	r3, r3, #1
	str	r3, [sp, #24]
	b	.L33
.L34:
	.loc 1 547 0
	ldr	r3, [sp, #16]
	ldr	r2, [r3, #16]
	ldr	r3, [sp, #16]
	ldr	r3, [r3, #12]
	subs	r2, r2, r3
	ldr	r3, [sp, #16]
	ldr	r3, [r3, #8]
	add	r3, r3, r2
	subs	r3, r3, #1
	str	r3, [sp, #24]
.L33:
	.loc 1 549 0
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #24]
	cmp	r2, r3
	bls	.L35
	.loc 1 550 0
	ldr	r3, [sp, #16]
	ldr	r2, [r3, #16]
	ldr	r1, [sp, #4]
	ldr	r3, [sp, #24]
	subs	r3, r1, r3
	add	r2, r2, r3
	ldr	r3, [sp, #16]
	str	r2, [r3, #16]
	.loc 1 551 0
	b	.L36
.L37:
	.loc 1 552 0
	ldr	r3, [sp, #16]
	ldr	r2, [r3, #16]
	ldr	r3, [sp, #16]
	ldr	r3, [r3, #8]
	subs	r2, r2, r3
	ldr	r3, [sp, #16]
	str	r2, [r3, #16]
.L36:
	.loc 1 551 0
	ldr	r3, [sp, #16]
	ldr	r2, [r3, #16]
	ldr	r3, [sp, #16]
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bcs	.L37
.L35:
	.loc 1 558 0
	ldr	r3, [sp, #16]
	ldr	r2, [r3, #8]
	ldr	r3, [sp, #16]
	ldr	r3, [r3, #12]
	subs	r3, r2, r3
	str	r3, [sp, #24]
.L41:
	.loc 1 560 0
	ldr	r2, [sp, #24]
	ldr	r3, [sp, #4]
	cmp	r2, r3
	bls	.L38
.LBB3:
	.loc 1 566 0
	ldr	r3, [sp, #16]
	ldr	r2, [r3, #4]
	ldr	r3, [sp, #16]
	ldr	r3, [r3, #12]
	add	r3, r3, r2
	str	r3, [sp, #20]
	.loc 1 567 0
	ldr	r3, [sp, #16]
	ldr	r2, [r3, #12]
	ldr	r3, [sp, #4]
	add	r2, r2, r3
	ldr	r3, [sp, #16]
	str	r2, [r3, #12]
.L39:
	.loc 1 569 0 discriminator 1
	ldr	r3, [sp, #20]
	adds	r2, r3, #1
	str	r2, [sp, #20]
	ldr	r2, [sp, #28]
	adds	r1, r2, #1
	str	r1, [sp, #28]
	ldrb	r2, [r2]	@ zero_extendqisi2
	strb	r2, [r3]
	.loc 1 570 0 discriminator 1
	ldr	r3, [sp, #4]
	subs	r3, r3, #1
	str	r3, [sp, #4]
	ldr	r3, [sp, #4]
	cmp	r3, #0
	bne	.L39
	.loc 1 575 0
	b	.L40
.L38:
.LBE3:
	.loc 1 580 0
	ldr	r3, [sp, #16]
	ldr	r2, [r3, #4]
	ldr	r3, [sp, #16]
	ldr	r3, [r3, #12]
	add	r3, r3, r2
	ldr	r2, [sp, #24]
	ldr	r1, [sp, #28]
	mov	r0, r3
	bl	memcpy
	.loc 1 581 0
	ldr	r2, [sp, #28]
	ldr	r3, [sp, #24]
	add	r3, r3, r2
	str	r3, [sp, #28]
	.loc 1 582 0
	ldr	r3, [sp, #16]
	movs	r2, #0
	str	r2, [r3, #12]
	.loc 1 583 0
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #24]
	subs	r3, r2, r3
	str	r3, [sp, #4]
	.loc 1 584 0
	ldr	r3, [sp, #16]
	ldr	r3, [r3, #8]
	subs	r3, r3, #1
	str	r3, [sp, #24]
	.loc 1 586 0
	ldr	r3, [sp, #4]
	cmp	r3, #0
	bne	.L41
.L40:
	.loc 1 587 0
	nop
	add	sp, sp, #36
.LCFI22:
	@ sp needed
	ldr	pc, [sp], #4
.L43:
	.align	2
.L42:
	.word	_SEGGER_RTT
.LFE7:
	.size	SEGGER_RTT_WriteWithOverwriteNoLock, .-SEGGER_RTT_WriteWithOverwriteNoLock
	.section	.text.SEGGER_RTT_WriteSkipNoLock,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_WriteSkipNoLock
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_WriteSkipNoLock, %function
SEGGER_RTT_WriteSkipNoLock:
.LFB8:
	.loc 1 613 0
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI23:
	sub	sp, sp, #52
.LCFI24:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	.loc 1 621 0
	ldr	r3, [sp, #8]
	str	r3, [sp, #44]
	.loc 1 625 0
	ldr	r3, [sp, #12]
	adds	r2, r3, #1
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	ldr	r2, .L52
	add	r3, r3, r2
	str	r3, [sp, #36]
	.loc 1 626 0
	ldr	r3, [sp, #36]
	ldr	r3, [r3, #16]
	str	r3, [sp, #32]
	.loc 1 627 0
	ldr	r3, [sp, #36]
	ldr	r3, [r3, #12]
	str	r3, [sp, #28]
	.loc 1 641 0
	ldr	r2, [sp, #32]
	ldr	r3, [sp, #28]
	cmp	r2, r3
	bhi	.L45
	.loc 1 645 0
	ldr	r3, [sp, #36]
	ldr	r2, [r3, #8]
	ldr	r3, [sp, #28]
	subs	r3, r2, r3
	subs	r3, r3, #1
	str	r3, [sp, #24]
	.loc 1 646 0
	ldr	r2, [sp, #24]
	ldr	r3, [sp, #4]
	cmp	r2, r3
	bcc	.L46
.LBB4:
	.loc 1 649 0
	ldr	r3, [sp, #36]
	ldr	r2, [r3, #4]
	ldr	r3, [sp, #28]
	add	r3, r3, r2
	str	r3, [sp, #40]
	.loc 1 650 0
	ldr	r2, [sp, #28]
	ldr	r3, [sp, #4]
	add	r3, r3, r2
	str	r3, [sp, #28]
.L47:
	.loc 1 652 0 discriminator 1
	ldr	r3, [sp, #40]
	adds	r2, r3, #1
	str	r2, [sp, #40]
	ldr	r2, [sp, #44]
	adds	r1, r2, #1
	str	r1, [sp, #44]
	ldrb	r2, [r2]	@ zero_extendqisi2
	strb	r2, [r3]
	.loc 1 653 0 discriminator 1
	ldr	r3, [sp, #4]
	subs	r3, r3, #1
	str	r3, [sp, #4]
	ldr	r3, [sp, #4]
	cmp	r3, #0
	bne	.L47
	.loc 1 654 0
	ldr	r2, [sp, #28]
	ldr	r3, [sp, #4]
	add	r2, r2, r3
	ldr	r3, [sp, #36]
	str	r2, [r3, #12]
	.loc 1 659 0
	movs	r3, #1
	b	.L48
.L46:
.LBE4:
	.loc 1 664 0
	ldr	r2, [sp, #24]
	ldr	r3, [sp, #32]
	add	r3, r3, r2
	str	r3, [sp, #24]
	.loc 1 668 0
	ldr	r2, [sp, #24]
	ldr	r3, [sp, #4]
	cmp	r2, r3
	bcc	.L49
	.loc 1 672 0
	ldr	r3, [sp, #36]
	ldr	r2, [r3, #8]
	ldr	r3, [sp, #28]
	subs	r3, r2, r3
	str	r3, [sp, #20]
	.loc 1 673 0
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #4]
	cmp	r2, r3
	bls	.L50
	.loc 1 674 0
	ldr	r3, [sp, #36]
	ldr	r2, [r3, #4]
	ldr	r3, [sp, #28]
	add	r3, r3, r2
	ldr	r2, [sp, #4]
	ldr	r1, [sp, #44]
	mov	r0, r3
	bl	memcpy
	.loc 1 675 0
	ldr	r2, [sp, #28]
	ldr	r3, [sp, #4]
	add	r2, r2, r3
	ldr	r3, [sp, #36]
	str	r2, [r3, #12]
	b	.L51
.L50:
	.loc 1 680 0
	ldr	r3, [sp, #36]
	ldr	r2, [r3, #4]
	ldr	r3, [sp, #28]
	add	r3, r3, r2
	ldr	r2, [sp, #20]
	ldr	r1, [sp, #44]
	mov	r0, r3
	bl	memcpy
	.loc 1 681 0
	ldr	r3, [sp, #36]
	ldr	r0, [r3, #4]
	ldr	r2, [sp, #44]
	ldr	r3, [sp, #20]
	adds	r1, r2, r3
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #20]
	subs	r3, r2, r3
	mov	r2, r3
	bl	memcpy
	.loc 1 682 0
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #20]
	subs	r2, r2, r3
	ldr	r3, [sp, #36]
	str	r2, [r3, #12]
.L51:
	.loc 1 684 0
	movs	r3, #1
	b	.L48
.L45:
	.loc 1 687 0
	ldr	r2, [sp, #32]
	ldr	r3, [sp, #28]
	subs	r3, r2, r3
	subs	r3, r3, #1
	str	r3, [sp, #24]
	.loc 1 688 0
	ldr	r2, [sp, #24]
	ldr	r3, [sp, #4]
	cmp	r2, r3
	bcc	.L49
	.loc 1 689 0
	ldr	r3, [sp, #36]
	ldr	r2, [r3, #4]
	ldr	r3, [sp, #28]
	add	r3, r3, r2
	ldr	r2, [sp, #4]
	ldr	r1, [sp, #44]
	mov	r0, r3
	bl	memcpy
	.loc 1 690 0
	ldr	r2, [sp, #28]
	ldr	r3, [sp, #4]
	add	r2, r2, r3
	ldr	r3, [sp, #36]
	str	r2, [r3, #12]
	.loc 1 691 0
	movs	r3, #1
	b	.L48
.L49:
	.loc 1 697 0
	movs	r3, #0
.L48:
	.loc 1 698 0
	mov	r0, r3
	add	sp, sp, #52
.LCFI25:
	@ sp needed
	ldr	pc, [sp], #4
.L53:
	.align	2
.L52:
	.word	_SEGGER_RTT
.LFE8:
	.size	SEGGER_RTT_WriteSkipNoLock, .-SEGGER_RTT_WriteSkipNoLock
	.section	.text.SEGGER_RTT_WriteNoLock,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_WriteNoLock
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_WriteNoLock, %function
SEGGER_RTT_WriteNoLock:
.LFB9:
	.loc 1 723 0
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI26:
	sub	sp, sp, #36
.LCFI27:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	.loc 1 729 0
	ldr	r3, [sp, #8]
	str	r3, [sp, #24]
	.loc 1 733 0
	ldr	r3, [sp, #12]
	adds	r2, r3, #1
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	ldr	r2, .L64
	add	r3, r3, r2
	str	r3, [sp, #20]
	.loc 1 737 0
	ldr	r3, [sp, #20]
	ldr	r3, [r3, #20]
	cmp	r3, #1
	beq	.L56
	cmp	r3, #1
	bcc	.L57
	cmp	r3, #2
	beq	.L58
	b	.L63
.L57:
	.loc 1 743 0
	ldr	r0, [sp, #20]
	bl	_GetAvailWriteSpace
	str	r0, [sp, #16]
	.loc 1 744 0
	ldr	r2, [sp, #16]
	ldr	r3, [sp, #4]
	cmp	r2, r3
	bcs	.L59
	.loc 1 745 0
	movs	r3, #0
	str	r3, [sp, #28]
	.loc 1 750 0
	b	.L61
.L59:
	.loc 1 747 0
	ldr	r3, [sp, #4]
	str	r3, [sp, #28]
	.loc 1 748 0
	ldr	r2, [sp, #4]
	ldr	r1, [sp, #24]
	ldr	r0, [sp, #20]
	bl	_WriteNoCheck
	.loc 1 750 0
	b	.L61
.L56:
	.loc 1 755 0
	ldr	r0, [sp, #20]
	bl	_GetAvailWriteSpace
	str	r0, [sp, #16]
	.loc 1 756 0
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #16]
	cmp	r3, r2
	it	cs
	movcs	r3, r2
	str	r3, [sp, #28]
	.loc 1 757 0
	ldr	r2, [sp, #28]
	ldr	r1, [sp, #24]
	ldr	r0, [sp, #20]
	bl	_WriteNoCheck
	.loc 1 758 0
	b	.L61
.L58:
	.loc 1 763 0
	ldr	r2, [sp, #4]
	ldr	r1, [sp, #24]
	ldr	r0, [sp, #20]
	bl	_WriteBlocking
	str	r0, [sp, #28]
	.loc 1 764 0
	b	.L61
.L63:
	.loc 1 766 0
	movs	r3, #0
	str	r3, [sp, #28]
	.loc 1 767 0
	nop
.L61:
	.loc 1 772 0
	ldr	r3, [sp, #28]
	.loc 1 773 0
	mov	r0, r3
	add	sp, sp, #36
.LCFI28:
	@ sp needed
	ldr	pc, [sp], #4
.L65:
	.align	2
.L64:
	.word	_SEGGER_RTT
.LFE9:
	.size	SEGGER_RTT_WriteNoLock, .-SEGGER_RTT_WriteNoLock
	.section	.text.SEGGER_RTT_Write,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_Write
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_Write, %function
SEGGER_RTT_Write:
.LFB10:
	.loc 1 794 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI29:
	sub	sp, sp, #28
.LCFI30:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	.loc 1 797 0
	ldr	r3, .L69
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L67
	.loc 1 797 0 is_stmt 0 discriminator 1
	bl	_DoInit
.L67:
.LBB5:
	.loc 1 798 0 is_stmt 1
	.syntax unified
@ 798 "C:\Users\Jon\Documents\jenkinsd2\nrf52\nrf52\SEGGER_RTT.c" 1
	mrs   r3, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [sp, #20]
	.loc 1 802 0
	ldr	r2, [sp, #4]
	ldr	r1, [sp, #8]
	ldr	r0, [sp, #12]
	bl	SEGGER_RTT_WriteNoLock
	str	r0, [sp, #16]
	.loc 1 806 0
	ldr	r3, [sp, #20]
	.syntax unified
@ 806 "C:\Users\Jon\Documents\jenkinsd2\nrf52\nrf52\SEGGER_RTT.c" 1
	msr   basepri, r3  
	
@ 0 "" 2
	.thumb
	.syntax unified
.LBE5:
	.loc 1 808 0
	ldr	r3, [sp, #16]
	.loc 1 809 0
	mov	r0, r3
	add	sp, sp, #28
.LCFI31:
	@ sp needed
	ldr	pc, [sp], #4
.L70:
	.align	2
.L69:
	.word	_SEGGER_RTT
.LFE10:
	.size	SEGGER_RTT_Write, .-SEGGER_RTT_Write
	.section	.text.SEGGER_RTT_WriteString,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_WriteString
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_WriteString, %function
SEGGER_RTT_WriteString:
.LFB11:
	.loc 1 832 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI32:
	sub	sp, sp, #20
.LCFI33:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 835 0
	ldr	r0, [sp]
	bl	strlen
	str	r0, [sp, #12]
	.loc 1 836 0
	ldr	r2, [sp, #12]
	ldr	r1, [sp]
	ldr	r0, [sp, #4]
	bl	SEGGER_RTT_Write
	mov	r3, r0
	.loc 1 837 0
	mov	r0, r3
	add	sp, sp, #20
.LCFI34:
	@ sp needed
	ldr	pc, [sp], #4
.LFE11:
	.size	SEGGER_RTT_WriteString, .-SEGGER_RTT_WriteString
	.section	.text.SEGGER_RTT_GetKey,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_GetKey
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_GetKey, %function
SEGGER_RTT_GetKey:
.LFB12:
	.loc 1 854 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI35:
	sub	sp, sp, #12
.LCFI36:
	.loc 1 858 0
	add	r3, sp, #3
	movs	r2, #1
	mov	r1, r3
	movs	r0, #0
	bl	SEGGER_RTT_Read
	mov	r3, r0
	str	r3, [sp, #4]
	.loc 1 859 0
	ldr	r3, [sp, #4]
	cmp	r3, #1
	bne	.L74
	.loc 1 860 0
	ldrb	r3, [sp, #3]	@ zero_extendqisi2
	str	r3, [sp, #4]
	b	.L75
.L74:
	.loc 1 862 0
	mov	r3, #-1
	str	r3, [sp, #4]
.L75:
	.loc 1 864 0
	ldr	r3, [sp, #4]
	.loc 1 865 0
	mov	r0, r3
	add	sp, sp, #12
.LCFI37:
	@ sp needed
	ldr	pc, [sp], #4
.LFE12:
	.size	SEGGER_RTT_GetKey, .-SEGGER_RTT_GetKey
	.section	.text.SEGGER_RTT_WaitKey,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_WaitKey
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_WaitKey, %function
SEGGER_RTT_WaitKey:
.LFB13:
	.loc 1 882 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI38:
	sub	sp, sp, #12
.LCFI39:
.L78:
	.loc 1 886 0 discriminator 1
	bl	SEGGER_RTT_GetKey
	str	r0, [sp, #4]
	.loc 1 887 0 discriminator 1
	ldr	r3, [sp, #4]
	cmp	r3, #0
	blt	.L78
	.loc 1 888 0
	ldr	r3, [sp, #4]
	.loc 1 889 0
	mov	r0, r3
	add	sp, sp, #12
.LCFI40:
	@ sp needed
	ldr	pc, [sp], #4
.LFE13:
	.size	SEGGER_RTT_WaitKey, .-SEGGER_RTT_WaitKey
	.section	.text.SEGGER_RTT_HasKey,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_HasKey
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_HasKey, %function
SEGGER_RTT_HasKey:
.LFB14:
	.loc 1 905 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI41:
	sub	sp, sp, #12
.LCFI42:
	.loc 1 909 0
	ldr	r3, .L85
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L81
	.loc 1 909 0 is_stmt 0 discriminator 1
	bl	_DoInit
.L81:
	.loc 1 910 0 is_stmt 1
	ldr	r3, .L85
	ldr	r3, [r3, #88]
	str	r3, [sp]
	.loc 1 911 0
	ldr	r3, .L85
	ldr	r2, [r3, #84]
	ldr	r3, [sp]
	cmp	r2, r3
	beq	.L82
	.loc 1 912 0
	movs	r3, #1
	str	r3, [sp, #4]
	b	.L83
.L82:
	.loc 1 914 0
	movs	r3, #0
	str	r3, [sp, #4]
.L83:
	.loc 1 916 0
	ldr	r3, [sp, #4]
	.loc 1 917 0
	mov	r0, r3
	add	sp, sp, #12
.LCFI43:
	@ sp needed
	ldr	pc, [sp], #4
.L86:
	.align	2
.L85:
	.word	_SEGGER_RTT
.LFE14:
	.size	SEGGER_RTT_HasKey, .-SEGGER_RTT_HasKey
	.section	.text.SEGGER_RTT_HasData,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_HasData
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_HasData, %function
SEGGER_RTT_HasData:
.LFB15:
	.loc 1 931 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #16
.LCFI44:
	str	r0, [sp, #4]
	.loc 1 935 0
	ldr	r2, [sp, #4]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	adds	r3, r3, #72
	ldr	r2, .L89
	add	r3, r3, r2
	str	r3, [sp, #12]
	.loc 1 936 0
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #12]
	str	r3, [sp, #8]
	.loc 1 937 0
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #16]
	ldr	r2, [sp, #8]
	subs	r3, r2, r3
	.loc 1 938 0
	mov	r0, r3
	add	sp, sp, #16
.LCFI45:
	@ sp needed
	bx	lr
.L90:
	.align	2
.L89:
	.word	_SEGGER_RTT
.LFE15:
	.size	SEGGER_RTT_HasData, .-SEGGER_RTT_HasData
	.section	.text.SEGGER_RTT_AllocDownBuffer,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_AllocDownBuffer
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_AllocDownBuffer, %function
SEGGER_RTT_AllocDownBuffer:
.LFB16:
	.loc 1 959 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI46:
	sub	sp, sp, #28
.LCFI47:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	.loc 1 962 0
	ldr	r3, .L100
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L92
	.loc 1 962 0 is_stmt 0 discriminator 1
	bl	_DoInit
.L92:
.LBB6:
	.loc 1 963 0 is_stmt 1
	.syntax unified
@ 963 "C:\Users\Jon\Documents\jenkinsd2\nrf52\nrf52\SEGGER_RTT.c" 1
	mrs   r3, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [sp, #16]
	.loc 1 964 0
	movs	r3, #0
	str	r3, [sp, #20]
.L95:
	.loc 1 966 0
	ldr	r1, .L100
	ldr	r2, [sp, #20]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #76
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L99
	.loc 1 969 0
	ldr	r3, [sp, #20]
	adds	r3, r3, #1
	str	r3, [sp, #20]
	.loc 1 970 0
	ldr	r3, .L100
	ldr	r2, [r3, #20]
	ldr	r3, [sp, #20]
	cmp	r2, r3
	bgt	.L95
	b	.L94
.L99:
	.loc 1 967 0
	nop
.L94:
	.loc 1 971 0
	ldr	r3, .L100
	ldr	r2, [r3, #20]
	ldr	r3, [sp, #20]
	cmp	r2, r3
	ble	.L96
	.loc 1 972 0
	ldr	r1, .L100
	ldr	r2, [sp, #20]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #72
	ldr	r2, [sp, #12]
	str	r2, [r3]
	.loc 1 973 0
	ldr	r1, .L100
	ldr	r2, [sp, #20]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #76
	ldr	r2, [sp, #8]
	str	r2, [r3]
	.loc 1 974 0
	ldr	r1, .L100
	ldr	r2, [sp, #20]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #80
	ldr	r2, [sp, #4]
	str	r2, [r3]
	.loc 1 975 0
	ldr	r1, .L100
	ldr	r2, [sp, #20]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #88
	movs	r2, #0
	str	r2, [r3]
	.loc 1 976 0
	ldr	r1, .L100
	ldr	r2, [sp, #20]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #84
	movs	r2, #0
	str	r2, [r3]
	.loc 1 977 0
	ldr	r1, .L100
	ldr	r2, [sp, #20]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #92
	ldr	r2, [sp]
	str	r2, [r3]
	b	.L97
.L96:
	.loc 1 979 0
	mov	r3, #-1
	str	r3, [sp, #20]
.L97:
	.loc 1 981 0
	ldr	r3, [sp, #16]
	.syntax unified
@ 981 "C:\Users\Jon\Documents\jenkinsd2\nrf52\nrf52\SEGGER_RTT.c" 1
	msr   basepri, r3  
	
@ 0 "" 2
	.thumb
	.syntax unified
.LBE6:
	.loc 1 982 0
	ldr	r3, [sp, #20]
	.loc 1 983 0
	mov	r0, r3
	add	sp, sp, #28
.LCFI48:
	@ sp needed
	ldr	pc, [sp], #4
.L101:
	.align	2
.L100:
	.word	_SEGGER_RTT
.LFE16:
	.size	SEGGER_RTT_AllocDownBuffer, .-SEGGER_RTT_AllocDownBuffer
	.section	.text.SEGGER_RTT_AllocUpBuffer,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_AllocUpBuffer
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_AllocUpBuffer, %function
SEGGER_RTT_AllocUpBuffer:
.LFB17:
	.loc 1 1004 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI49:
	sub	sp, sp, #28
.LCFI50:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	.loc 1 1007 0
	ldr	r3, .L111
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L103
	.loc 1 1007 0 is_stmt 0 discriminator 1
	bl	_DoInit
.L103:
.LBB7:
	.loc 1 1008 0 is_stmt 1
	.syntax unified
@ 1008 "C:\Users\Jon\Documents\jenkinsd2\nrf52\nrf52\SEGGER_RTT.c" 1
	mrs   r3, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [sp, #16]
	.loc 1 1009 0
	movs	r3, #0
	str	r3, [sp, #20]
.L106:
	.loc 1 1011 0
	ldr	r1, .L111
	ldr	r3, [sp, #20]
	adds	r2, r3, #1
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #4
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L110
	.loc 1 1014 0
	ldr	r3, [sp, #20]
	adds	r3, r3, #1
	str	r3, [sp, #20]
	.loc 1 1015 0
	ldr	r3, .L111
	ldr	r2, [r3, #16]
	ldr	r3, [sp, #20]
	cmp	r2, r3
	bgt	.L106
	b	.L105
.L110:
	.loc 1 1012 0
	nop
.L105:
	.loc 1 1016 0
	ldr	r3, .L111
	ldr	r2, [r3, #16]
	ldr	r3, [sp, #20]
	cmp	r2, r3
	ble	.L107
	.loc 1 1017 0
	ldr	r1, .L111
	ldr	r3, [sp, #20]
	adds	r2, r3, #1
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	ldr	r2, [sp, #12]
	str	r2, [r3]
	.loc 1 1018 0
	ldr	r1, .L111
	ldr	r3, [sp, #20]
	adds	r2, r3, #1
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #4
	ldr	r2, [sp, #8]
	str	r2, [r3]
	.loc 1 1019 0
	ldr	r1, .L111
	ldr	r2, [sp, #20]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #32
	ldr	r2, [sp, #4]
	str	r2, [r3]
	.loc 1 1020 0
	ldr	r1, .L111
	ldr	r2, [sp, #20]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #40
	movs	r2, #0
	str	r2, [r3]
	.loc 1 1021 0
	ldr	r1, .L111
	ldr	r2, [sp, #20]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #36
	movs	r2, #0
	str	r2, [r3]
	.loc 1 1022 0
	ldr	r1, .L111
	ldr	r2, [sp, #20]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #44
	ldr	r2, [sp]
	str	r2, [r3]
	b	.L108
.L107:
	.loc 1 1024 0
	mov	r3, #-1
	str	r3, [sp, #20]
.L108:
	.loc 1 1026 0
	ldr	r3, [sp, #16]
	.syntax unified
@ 1026 "C:\Users\Jon\Documents\jenkinsd2\nrf52\nrf52\SEGGER_RTT.c" 1
	msr   basepri, r3  
	
@ 0 "" 2
	.thumb
	.syntax unified
.LBE7:
	.loc 1 1027 0
	ldr	r3, [sp, #20]
	.loc 1 1028 0
	mov	r0, r3
	add	sp, sp, #28
.LCFI51:
	@ sp needed
	ldr	pc, [sp], #4
.L112:
	.align	2
.L111:
	.word	_SEGGER_RTT
.LFE17:
	.size	SEGGER_RTT_AllocUpBuffer, .-SEGGER_RTT_AllocUpBuffer
	.section	.text.SEGGER_RTT_ConfigUpBuffer,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_ConfigUpBuffer
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_ConfigUpBuffer, %function
SEGGER_RTT_ConfigUpBuffer:
.LFB18:
	.loc 1 1050 0
	@ args = 4, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI52:
	sub	sp, sp, #28
.LCFI53:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	.loc 1 1053 0
	ldr	r3, .L119
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L114
	.loc 1 1053 0 is_stmt 0 discriminator 1
	bl	_DoInit
.L114:
	.loc 1 1054 0 is_stmt 1
	ldr	r3, .L119
	ldr	r3, [r3, #16]
	mov	r2, r3
	ldr	r3, [sp, #12]
	cmp	r2, r3
	bls	.L115
.LBB8:
	.loc 1 1055 0
	.syntax unified
@ 1055 "C:\Users\Jon\Documents\jenkinsd2\nrf52\nrf52\SEGGER_RTT.c" 1
	mrs   r3, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [sp, #16]
	.loc 1 1056 0
	ldr	r3, [sp, #12]
	cmp	r3, #0
	beq	.L116
	.loc 1 1057 0
	ldr	r1, .L119
	ldr	r3, [sp, #12]
	adds	r2, r3, #1
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	ldr	r2, [sp, #8]
	str	r2, [r3]
	.loc 1 1058 0
	ldr	r1, .L119
	ldr	r3, [sp, #12]
	adds	r2, r3, #1
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #4
	ldr	r2, [sp, #4]
	str	r2, [r3]
	.loc 1 1059 0
	ldr	r1, .L119
	ldr	r2, [sp, #12]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #32
	ldr	r2, [sp]
	str	r2, [r3]
	.loc 1 1060 0
	ldr	r1, .L119
	ldr	r2, [sp, #12]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #40
	movs	r2, #0
	str	r2, [r3]
	.loc 1 1061 0
	ldr	r1, .L119
	ldr	r2, [sp, #12]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #36
	movs	r2, #0
	str	r2, [r3]
.L116:
	.loc 1 1063 0
	ldr	r1, .L119
	ldr	r2, [sp, #12]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #44
	ldr	r2, [sp, #32]
	str	r2, [r3]
	.loc 1 1064 0
	ldr	r3, [sp, #16]
	.syntax unified
@ 1064 "C:\Users\Jon\Documents\jenkinsd2\nrf52\nrf52\SEGGER_RTT.c" 1
	msr   basepri, r3  
	
@ 0 "" 2
	.thumb
	.syntax unified
.LBE8:
	.loc 1 1065 0
	movs	r3, #0
	str	r3, [sp, #20]
	b	.L117
.L115:
	.loc 1 1067 0
	mov	r3, #-1
	str	r3, [sp, #20]
.L117:
	.loc 1 1069 0
	ldr	r3, [sp, #20]
	.loc 1 1070 0
	mov	r0, r3
	add	sp, sp, #28
.LCFI54:
	@ sp needed
	ldr	pc, [sp], #4
.L120:
	.align	2
.L119:
	.word	_SEGGER_RTT
.LFE18:
	.size	SEGGER_RTT_ConfigUpBuffer, .-SEGGER_RTT_ConfigUpBuffer
	.section	.text.SEGGER_RTT_ConfigDownBuffer,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_ConfigDownBuffer
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_ConfigDownBuffer, %function
SEGGER_RTT_ConfigDownBuffer:
.LFB19:
	.loc 1 1092 0
	@ args = 4, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI55:
	sub	sp, sp, #28
.LCFI56:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	.loc 1 1095 0
	ldr	r3, .L127
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L122
	.loc 1 1095 0 is_stmt 0 discriminator 1
	bl	_DoInit
.L122:
	.loc 1 1096 0 is_stmt 1
	ldr	r3, .L127
	ldr	r3, [r3, #20]
	mov	r2, r3
	ldr	r3, [sp, #12]
	cmp	r2, r3
	bls	.L123
.LBB9:
	.loc 1 1097 0
	.syntax unified
@ 1097 "C:\Users\Jon\Documents\jenkinsd2\nrf52\nrf52\SEGGER_RTT.c" 1
	mrs   r3, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [sp, #16]
	.loc 1 1098 0
	ldr	r3, [sp, #12]
	cmp	r3, #0
	beq	.L124
	.loc 1 1099 0
	ldr	r1, .L127
	ldr	r2, [sp, #12]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #72
	ldr	r2, [sp, #8]
	str	r2, [r3]
	.loc 1 1100 0
	ldr	r1, .L127
	ldr	r2, [sp, #12]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #76
	ldr	r2, [sp, #4]
	str	r2, [r3]
	.loc 1 1101 0
	ldr	r1, .L127
	ldr	r2, [sp, #12]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #80
	ldr	r2, [sp]
	str	r2, [r3]
	.loc 1 1102 0
	ldr	r1, .L127
	ldr	r2, [sp, #12]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #88
	movs	r2, #0
	str	r2, [r3]
	.loc 1 1103 0
	ldr	r1, .L127
	ldr	r2, [sp, #12]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #84
	movs	r2, #0
	str	r2, [r3]
.L124:
	.loc 1 1105 0
	ldr	r1, .L127
	ldr	r2, [sp, #12]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #92
	ldr	r2, [sp, #32]
	str	r2, [r3]
	.loc 1 1106 0
	ldr	r3, [sp, #16]
	.syntax unified
@ 1106 "C:\Users\Jon\Documents\jenkinsd2\nrf52\nrf52\SEGGER_RTT.c" 1
	msr   basepri, r3  
	
@ 0 "" 2
	.thumb
	.syntax unified
.LBE9:
	.loc 1 1107 0
	movs	r3, #0
	str	r3, [sp, #20]
	b	.L125
.L123:
	.loc 1 1109 0
	mov	r3, #-1
	str	r3, [sp, #20]
.L125:
	.loc 1 1111 0
	ldr	r3, [sp, #20]
	.loc 1 1112 0
	mov	r0, r3
	add	sp, sp, #28
.LCFI57:
	@ sp needed
	ldr	pc, [sp], #4
.L128:
	.align	2
.L127:
	.word	_SEGGER_RTT
.LFE19:
	.size	SEGGER_RTT_ConfigDownBuffer, .-SEGGER_RTT_ConfigDownBuffer
	.section	.text.SEGGER_RTT_SetNameUpBuffer,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_SetNameUpBuffer
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_SetNameUpBuffer, %function
SEGGER_RTT_SetNameUpBuffer:
.LFB20:
	.loc 1 1130 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI58:
	sub	sp, sp, #20
.LCFI59:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 1133 0
	ldr	r3, .L134
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L130
	.loc 1 1133 0 is_stmt 0 discriminator 1
	bl	_DoInit
.L130:
	.loc 1 1134 0 is_stmt 1
	ldr	r3, .L134
	ldr	r3, [r3, #16]
	mov	r2, r3
	ldr	r3, [sp, #4]
	cmp	r2, r3
	bls	.L131
.LBB10:
	.loc 1 1135 0
	.syntax unified
@ 1135 "C:\Users\Jon\Documents\jenkinsd2\nrf52\nrf52\SEGGER_RTT.c" 1
	mrs   r3, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [sp, #8]
	.loc 1 1136 0
	ldr	r1, .L134
	ldr	r3, [sp, #4]
	adds	r2, r3, #1
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	ldr	r2, [sp]
	str	r2, [r3]
	.loc 1 1137 0
	ldr	r3, [sp, #8]
	.syntax unified
@ 1137 "C:\Users\Jon\Documents\jenkinsd2\nrf52\nrf52\SEGGER_RTT.c" 1
	msr   basepri, r3  
	
@ 0 "" 2
	.thumb
	.syntax unified
.LBE10:
	.loc 1 1138 0
	movs	r3, #0
	str	r3, [sp, #12]
	b	.L132
.L131:
	.loc 1 1140 0
	mov	r3, #-1
	str	r3, [sp, #12]
.L132:
	.loc 1 1142 0
	ldr	r3, [sp, #12]
	.loc 1 1143 0
	mov	r0, r3
	add	sp, sp, #20
.LCFI60:
	@ sp needed
	ldr	pc, [sp], #4
.L135:
	.align	2
.L134:
	.word	_SEGGER_RTT
.LFE20:
	.size	SEGGER_RTT_SetNameUpBuffer, .-SEGGER_RTT_SetNameUpBuffer
	.section	.text.SEGGER_RTT_SetNameDownBuffer,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_SetNameDownBuffer
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_SetNameDownBuffer, %function
SEGGER_RTT_SetNameDownBuffer:
.LFB21:
	.loc 1 1161 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI61:
	sub	sp, sp, #20
.LCFI62:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 1164 0
	ldr	r3, .L141
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L137
	.loc 1 1164 0 is_stmt 0 discriminator 1
	bl	_DoInit
.L137:
	.loc 1 1165 0 is_stmt 1
	ldr	r3, .L141
	ldr	r3, [r3, #20]
	mov	r2, r3
	ldr	r3, [sp, #4]
	cmp	r2, r3
	bls	.L138
.LBB11:
	.loc 1 1166 0
	.syntax unified
@ 1166 "C:\Users\Jon\Documents\jenkinsd2\nrf52\nrf52\SEGGER_RTT.c" 1
	mrs   r3, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [sp, #8]
	.loc 1 1167 0
	ldr	r1, .L141
	ldr	r2, [sp, #4]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #3
	add	r3, r3, r1
	adds	r3, r3, #72
	ldr	r2, [sp]
	str	r2, [r3]
	.loc 1 1168 0
	ldr	r3, [sp, #8]
	.syntax unified
@ 1168 "C:\Users\Jon\Documents\jenkinsd2\nrf52\nrf52\SEGGER_RTT.c" 1
	msr   basepri, r3  
	
@ 0 "" 2
	.thumb
	.syntax unified
.LBE11:
	.loc 1 1169 0
	movs	r3, #0
	str	r3, [sp, #12]
	b	.L139
.L138:
	.loc 1 1171 0
	mov	r3, #-1
	str	r3, [sp, #12]
.L139:
	.loc 1 1173 0
	ldr	r3, [sp, #12]
	.loc 1 1174 0
	mov	r0, r3
	add	sp, sp, #20
.LCFI63:
	@ sp needed
	ldr	pc, [sp], #4
.L142:
	.align	2
.L141:
	.word	_SEGGER_RTT
.LFE21:
	.size	SEGGER_RTT_SetNameDownBuffer, .-SEGGER_RTT_SetNameDownBuffer
	.section	.text.SEGGER_RTT_Init,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_Init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_Init, %function
SEGGER_RTT_Init:
.LFB22:
	.loc 1 1185 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
.LCFI64:
	.loc 1 1186 0
	bl	_DoInit
	.loc 1 1187 0
	nop
	pop	{r3, pc}
.LFE22:
	.size	SEGGER_RTT_Init, .-SEGGER_RTT_Init
	.section	.text.SEGGER_RTT_SetTerminal,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_SetTerminal
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_SetTerminal, %function
SEGGER_RTT_SetTerminal:
.LFB23:
	.loc 1 1203 0
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI65:
	sub	sp, sp, #36
.LCFI66:
	mov	r3, r0
	strb	r3, [sp, #7]
	.loc 1 1209 0
	ldr	r3, .L152
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L145
	.loc 1 1209 0 is_stmt 0 discriminator 1
	bl	_DoInit
.L145:
	.loc 1 1211 0 is_stmt 1
	movs	r3, #0
	str	r3, [sp, #28]
	.loc 1 1212 0
	movs	r3, #255
	strb	r3, [sp, #12]
	.loc 1 1213 0
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	cmp	r3, #15
	bhi	.L146
	.loc 1 1214 0
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	ldr	r2, .L152+4
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	strb	r3, [sp, #13]
	.loc 1 1215 0
	ldr	r3, .L152+8
	str	r3, [sp, #24]
.LBB12:
	.loc 1 1216 0
	.syntax unified
@ 1216 "C:\Users\Jon\Documents\jenkinsd2\nrf52\nrf52\SEGGER_RTT.c" 1
	mrs   r3, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [sp, #20]
	.loc 1 1217 0
	ldr	r3, [sp, #24]
	ldr	r3, [r3, #20]
	and	r3, r3, #3
	cmp	r3, #2
	bne	.L147
	.loc 1 1218 0
	ldr	r2, .L152+12
	ldrb	r3, [sp, #7]
	strb	r3, [r2]
	.loc 1 1219 0
	add	r3, sp, #12
	movs	r2, #2
	mov	r1, r3
	ldr	r0, [sp, #24]
	bl	_WriteBlocking
	b	.L148
.L147:
	.loc 1 1221 0
	ldr	r0, [sp, #24]
	bl	_GetAvailWriteSpace
	str	r0, [sp, #16]
	.loc 1 1222 0
	ldr	r3, [sp, #16]
	cmp	r3, #1
	bls	.L149
	.loc 1 1223 0
	ldr	r2, .L152+12
	ldrb	r3, [sp, #7]
	strb	r3, [r2]
	.loc 1 1224 0
	add	r3, sp, #12
	movs	r2, #2
	mov	r1, r3
	ldr	r0, [sp, #24]
	bl	_WriteNoCheck
	b	.L148
.L149:
	.loc 1 1226 0
	mov	r3, #-1
	str	r3, [sp, #28]
.L148:
	.loc 1 1229 0
	ldr	r3, [sp, #20]
	.syntax unified
@ 1229 "C:\Users\Jon\Documents\jenkinsd2\nrf52\nrf52\SEGGER_RTT.c" 1
	msr   basepri, r3  
	
@ 0 "" 2
	.thumb
	.syntax unified
.LBE12:
	b	.L150
.L146:
	.loc 1 1231 0
	mov	r3, #-1
	str	r3, [sp, #28]
.L150:
	.loc 1 1233 0
	ldr	r3, [sp, #28]
	.loc 1 1234 0
	mov	r0, r3
	add	sp, sp, #36
.LCFI67:
	@ sp needed
	ldr	pc, [sp], #4
.L153:
	.align	2
.L152:
	.word	_SEGGER_RTT
	.word	_aTerminalId
	.word	_SEGGER_RTT+24
	.word	_ActiveTerminal
.LFE23:
	.size	SEGGER_RTT_SetTerminal, .-SEGGER_RTT_SetTerminal
	.section	.text.SEGGER_RTT_TerminalOut,"ax",%progbits
	.align	1
	.global	SEGGER_RTT_TerminalOut
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SEGGER_RTT_TerminalOut, %function
SEGGER_RTT_TerminalOut:
.LFB24:
	.loc 1 1253 0
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI68:
	sub	sp, sp, #36
.LCFI69:
	mov	r3, r0
	str	r1, [sp]
	strb	r3, [sp, #7]
	.loc 1 1259 0
	ldr	r3, .L169
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L155
	.loc 1 1259 0 is_stmt 0 discriminator 1
	bl	_DoInit
.L155:
	.loc 1 1263 0 is_stmt 1
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	cmp	r3, #15
	bhi	.L156
	.loc 1 1267 0
	ldr	r3, .L169+4
	str	r3, [sp, #24]
	.loc 1 1272 0
	ldr	r0, [sp]
	bl	strlen
	str	r0, [sp, #20]
.LBB13:
	.loc 1 1276 0
	.syntax unified
@ 1276 "C:\Users\Jon\Documents\jenkinsd2\nrf52\nrf52\SEGGER_RTT.c" 1
	mrs   r3, basepri  
	mov   r1, #32       
	msr   basepri, r1  
	
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [sp, #16]
	.loc 1 1277 0
	ldr	r0, [sp, #24]
	bl	_GetAvailWriteSpace
	str	r0, [sp, #12]
	.loc 1 1278 0
	ldr	r3, [sp, #24]
	ldr	r3, [r3, #20]
	and	r3, r3, #3
	cmp	r3, #1
	beq	.L158
	cmp	r3, #1
	bcc	.L159
	cmp	r3, #2
	beq	.L160
	b	.L168
.L159:
	.loc 1 1284 0
	ldr	r3, [sp, #20]
	adds	r2, r3, #4
	ldr	r3, [sp, #12]
	cmp	r2, r3
	bls	.L161
	.loc 1 1285 0
	movs	r3, #0
	str	r3, [sp, #28]
	.loc 1 1291 0
	b	.L163
.L161:
	.loc 1 1287 0
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r0, [sp, #24]
	bl	_PostTerminalSwitch
	.loc 1 1288 0
	ldr	r2, [sp, #20]
	ldr	r1, [sp]
	ldr	r0, [sp, #24]
	bl	_WriteBlocking
	mov	r3, r0
	str	r3, [sp, #28]
	.loc 1 1289 0
	ldr	r3, .L169+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r0, [sp, #24]
	bl	_PostTerminalSwitch
	.loc 1 1291 0
	b	.L163
.L158:
	.loc 1 1298 0
	ldr	r3, [sp, #12]
	cmp	r3, #3
	bhi	.L164
	.loc 1 1299 0
	mov	r3, #-1
	str	r3, [sp, #28]
	.loc 1 1305 0
	b	.L163
.L164:
	.loc 1 1301 0
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r0, [sp, #24]
	bl	_PostTerminalSwitch
	.loc 1 1302 0
	ldr	r3, [sp, #12]
	subs	r2, r3, #4
	ldr	r3, [sp, #20]
	cmp	r3, r2
	it	cs
	movcs	r3, r2
	mov	r2, r3
	ldr	r1, [sp]
	ldr	r0, [sp, #24]
	bl	_WriteBlocking
	mov	r3, r0
	str	r3, [sp, #28]
	.loc 1 1303 0
	ldr	r3, .L169+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r0, [sp, #24]
	bl	_PostTerminalSwitch
	.loc 1 1305 0
	b	.L163
.L160:
	.loc 1 1310 0
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r0, [sp, #24]
	bl	_PostTerminalSwitch
	.loc 1 1311 0
	ldr	r2, [sp, #20]
	ldr	r1, [sp]
	ldr	r0, [sp, #24]
	bl	_WriteBlocking
	mov	r3, r0
	str	r3, [sp, #28]
	.loc 1 1312 0
	ldr	r3, .L169+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r0, [sp, #24]
	bl	_PostTerminalSwitch
	.loc 1 1313 0
	b	.L163
.L168:
	.loc 1 1315 0
	mov	r3, #-1
	str	r3, [sp, #28]
	.loc 1 1316 0
	nop
.L163:
	.loc 1 1321 0
	ldr	r3, [sp, #16]
	.syntax unified
@ 1321 "C:\Users\Jon\Documents\jenkinsd2\nrf52\nrf52\SEGGER_RTT.c" 1
	msr   basepri, r3  
	
@ 0 "" 2
	.thumb
	.syntax unified
.LBE13:
	b	.L166
.L156:
	.loc 1 1323 0
	mov	r3, #-1
	str	r3, [sp, #28]
.L166:
	.loc 1 1325 0
	ldr	r3, [sp, #28]
	.loc 1 1326 0
	mov	r0, r3
	add	sp, sp, #36
.LCFI70:
	@ sp needed
	ldr	pc, [sp], #4
.L170:
	.align	2
.L169:
	.word	_SEGGER_RTT
	.word	_SEGGER_RTT+24
	.word	_ActiveTerminal
.LFE24:
	.size	SEGGER_RTT_TerminalOut, .-SEGGER_RTT_TerminalOut
	.section	.debug_frame,"",%progbits
.Lframe0:
	.4byte	.LECIE0-.LSCIE0
.LSCIE0:
	.4byte	0xffffffff
	.byte	0x3
	.ascii	"\000"
	.uleb128 0x1
	.sleb128 -4
	.uleb128 0xe
	.byte	0xc
	.uleb128 0xd
	.uleb128 0
	.align	2
.LECIE0:
.LSFDE0:
	.4byte	.LEFDE0-.LASFDE0
.LASFDE0:
	.4byte	.Lframe0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x4
	.4byte	.LCFI0-.LFB0
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI2-.LCFI1
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x4
	.4byte	.LCFI3-.LFB1
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI4-.LCFI3
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI5-.LCFI4
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.byte	0x4
	.4byte	.LCFI6-.LFB2
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI7-.LCFI6
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI8-.LCFI7
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.byte	0x4
	.4byte	.LCFI9-.LFB3
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI10-.LCFI9
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI11-.LCFI10
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.byte	0x4
	.4byte	.LCFI12-.LFB4
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI13-.LCFI12
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.byte	0x4
	.4byte	.LCFI14-.LFB5
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI15-.LCFI14
	.byte	0xe
	.uleb128 0x30
	.byte	0x4
	.4byte	.LCFI16-.LCFI15
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.byte	0x4
	.4byte	.LCFI17-.LFB6
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI18-.LCFI17
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI19-.LCFI18
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.byte	0x4
	.4byte	.LCFI20-.LFB7
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI21-.LCFI20
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI22-.LCFI21
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.byte	0x4
	.4byte	.LCFI23-.LFB8
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI24-.LCFI23
	.byte	0xe
	.uleb128 0x38
	.byte	0x4
	.4byte	.LCFI25-.LCFI24
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.byte	0x4
	.4byte	.LCFI26-.LFB9
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI27-.LCFI26
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI28-.LCFI27
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.byte	0x4
	.4byte	.LCFI29-.LFB10
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI30-.LCFI29
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI31-.LCFI30
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.byte	0x4
	.4byte	.LCFI32-.LFB11
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI33-.LCFI32
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI34-.LCFI33
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.byte	0x4
	.4byte	.LCFI35-.LFB12
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI36-.LCFI35
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI37-.LCFI36
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE24:
.LSFDE26:
	.4byte	.LEFDE26-.LASFDE26
.LASFDE26:
	.4byte	.Lframe0
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.byte	0x4
	.4byte	.LCFI38-.LFB13
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI39-.LCFI38
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI40-.LCFI39
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE26:
.LSFDE28:
	.4byte	.LEFDE28-.LASFDE28
.LASFDE28:
	.4byte	.Lframe0
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.byte	0x4
	.4byte	.LCFI41-.LFB14
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI42-.LCFI41
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI43-.LCFI42
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE28:
.LSFDE30:
	.4byte	.LEFDE30-.LASFDE30
.LASFDE30:
	.4byte	.Lframe0
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.byte	0x4
	.4byte	.LCFI44-.LFB15
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI45-.LCFI44
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE30:
.LSFDE32:
	.4byte	.LEFDE32-.LASFDE32
.LASFDE32:
	.4byte	.Lframe0
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.byte	0x4
	.4byte	.LCFI46-.LFB16
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI47-.LCFI46
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI48-.LCFI47
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE32:
.LSFDE34:
	.4byte	.LEFDE34-.LASFDE34
.LASFDE34:
	.4byte	.Lframe0
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.byte	0x4
	.4byte	.LCFI49-.LFB17
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI50-.LCFI49
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI51-.LCFI50
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE34:
.LSFDE36:
	.4byte	.LEFDE36-.LASFDE36
.LASFDE36:
	.4byte	.Lframe0
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.byte	0x4
	.4byte	.LCFI52-.LFB18
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI53-.LCFI52
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI54-.LCFI53
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE36:
.LSFDE38:
	.4byte	.LEFDE38-.LASFDE38
.LASFDE38:
	.4byte	.Lframe0
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.byte	0x4
	.4byte	.LCFI55-.LFB19
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI56-.LCFI55
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI57-.LCFI56
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE38:
.LSFDE40:
	.4byte	.LEFDE40-.LASFDE40
.LASFDE40:
	.4byte	.Lframe0
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.byte	0x4
	.4byte	.LCFI58-.LFB20
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI59-.LCFI58
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI60-.LCFI59
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE40:
.LSFDE42:
	.4byte	.LEFDE42-.LASFDE42
.LASFDE42:
	.4byte	.Lframe0
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.byte	0x4
	.4byte	.LCFI61-.LFB21
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI62-.LCFI61
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI63-.LCFI62
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE42:
.LSFDE44:
	.4byte	.LEFDE44-.LASFDE44
.LASFDE44:
	.4byte	.Lframe0
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.byte	0x4
	.4byte	.LCFI64-.LFB22
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE44:
.LSFDE46:
	.4byte	.LEFDE46-.LASFDE46
.LASFDE46:
	.4byte	.Lframe0
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.byte	0x4
	.4byte	.LCFI65-.LFB23
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI66-.LCFI65
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI67-.LCFI66
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE46:
.LSFDE48:
	.4byte	.LEFDE48-.LASFDE48
.LASFDE48:
	.4byte	.Lframe0
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.byte	0x4
	.4byte	.LCFI68-.LFB24
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI69-.LCFI68
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI70-.LCFI69
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE48:
	.text
.Letext0:
	.file 2 "C:\\Users\\Jon\\Documents\\jenkinsd2\\nrf52\\nrf52\\SEGGER_RTT.h"
	.file 3 "C:/Program Files/SEGGER/SEGGER Embedded Studio for ARM 3.34a/include/__crossworks.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x114b
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF590
	.byte	0xc
	.4byte	.LASF591
	.4byte	.LASF592
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.4byte	.Ldebug_macro0
	.uleb128 0x2
	.byte	0x18
	.byte	0x2
	.byte	0x4e
	.4byte	0x7a
	.uleb128 0x3
	.4byte	.LASF453
	.byte	0x2
	.byte	0x4f
	.4byte	0x7a
	.byte	0
	.uleb128 0x3
	.4byte	.LASF454
	.byte	0x2
	.byte	0x50
	.4byte	0x8c
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF455
	.byte	0x2
	.byte	0x51
	.4byte	0x92
	.byte	0x8
	.uleb128 0x3
	.4byte	.LASF456
	.byte	0x2
	.byte	0x52
	.4byte	0x92
	.byte	0xc
	.uleb128 0x3
	.4byte	.LASF457
	.byte	0x2
	.byte	0x53
	.4byte	0x99
	.byte	0x10
	.uleb128 0x3
	.4byte	.LASF458
	.byte	0x2
	.byte	0x54
	.4byte	0x92
	.byte	0x14
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.4byte	0x87
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.4byte	.LASF459
	.uleb128 0x6
	.4byte	0x80
	.uleb128 0x4
	.byte	0x4
	.4byte	0x80
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.4byte	.LASF460
	.uleb128 0x7
	.4byte	0x92
	.uleb128 0x8
	.4byte	.LASF461
	.byte	0x2
	.byte	0x55
	.4byte	0x29
	.uleb128 0x2
	.byte	0x18
	.byte	0x2
	.byte	0x5b
	.4byte	0xfa
	.uleb128 0x3
	.4byte	.LASF453
	.byte	0x2
	.byte	0x5c
	.4byte	0x7a
	.byte	0
	.uleb128 0x3
	.4byte	.LASF454
	.byte	0x2
	.byte	0x5d
	.4byte	0x8c
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF455
	.byte	0x2
	.byte	0x5e
	.4byte	0x92
	.byte	0x8
	.uleb128 0x3
	.4byte	.LASF456
	.byte	0x2
	.byte	0x5f
	.4byte	0x99
	.byte	0xc
	.uleb128 0x3
	.4byte	.LASF457
	.byte	0x2
	.byte	0x60
	.4byte	0x92
	.byte	0x10
	.uleb128 0x3
	.4byte	.LASF458
	.byte	0x2
	.byte	0x61
	.4byte	0x92
	.byte	0x14
	.byte	0
	.uleb128 0x8
	.4byte	.LASF462
	.byte	0x2
	.byte	0x62
	.4byte	0xa9
	.uleb128 0x2
	.byte	0x78
	.byte	0x2
	.byte	0x69
	.4byte	0x14a
	.uleb128 0x3
	.4byte	.LASF463
	.byte	0x2
	.byte	0x6a
	.4byte	0x14a
	.byte	0
	.uleb128 0x3
	.4byte	.LASF464
	.byte	0x2
	.byte	0x6b
	.4byte	0x161
	.byte	0x10
	.uleb128 0x3
	.4byte	.LASF465
	.byte	0x2
	.byte	0x6c
	.4byte	0x161
	.byte	0x14
	.uleb128 0x9
	.ascii	"aUp\000"
	.byte	0x2
	.byte	0x6d
	.4byte	0x168
	.byte	0x18
	.uleb128 0x3
	.4byte	.LASF466
	.byte	0x2
	.byte	0x6e
	.4byte	0x178
	.byte	0x48
	.byte	0
	.uleb128 0xa
	.4byte	0x80
	.4byte	0x15a
	.uleb128 0xb
	.4byte	0x15a
	.byte	0xf
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.4byte	.LASF467
	.uleb128 0xc
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0xa
	.4byte	0x9e
	.4byte	0x178
	.uleb128 0xb
	.4byte	0x15a
	.byte	0x1
	.byte	0
	.uleb128 0xa
	.4byte	0xfa
	.4byte	0x188
	.uleb128 0xb
	.4byte	0x15a
	.byte	0x1
	.byte	0
	.uleb128 0x8
	.4byte	.LASF468
	.byte	0x2
	.byte	0x6f
	.4byte	0x105
	.uleb128 0xd
	.4byte	.LASF522
	.byte	0x2
	.byte	0x77
	.4byte	0x188
	.uleb128 0xe
	.byte	0x4
	.uleb128 0xf
	.4byte	.LASF519
	.byte	0x8
	.byte	0x3
	.byte	0x5e
	.4byte	0x1c5
	.uleb128 0x3
	.4byte	.LASF469
	.byte	0x3
	.byte	0x5f
	.4byte	0x161
	.byte	0
	.uleb128 0x3
	.4byte	.LASF470
	.byte	0x3
	.byte	0x60
	.4byte	0x1c5
	.byte	0x4
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.4byte	.LASF471
	.uleb128 0x10
	.4byte	0x161
	.4byte	0x1e5
	.uleb128 0x11
	.4byte	0x8c
	.uleb128 0x11
	.4byte	0x92
	.uleb128 0x11
	.4byte	0x1e5
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.4byte	0x1a0
	.uleb128 0x10
	.4byte	0x161
	.4byte	0x209
	.uleb128 0x11
	.4byte	0x209
	.uleb128 0x11
	.4byte	0x7a
	.uleb128 0x11
	.4byte	0x92
	.uleb128 0x11
	.4byte	0x1e5
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.4byte	0x92
	.uleb128 0x2
	.byte	0x58
	.byte	0x3
	.byte	0x66
	.4byte	0x398
	.uleb128 0x3
	.4byte	.LASF472
	.byte	0x3
	.byte	0x68
	.4byte	0x7a
	.byte	0
	.uleb128 0x3
	.4byte	.LASF473
	.byte	0x3
	.byte	0x69
	.4byte	0x7a
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF474
	.byte	0x3
	.byte	0x6a
	.4byte	0x7a
	.byte	0x8
	.uleb128 0x3
	.4byte	.LASF475
	.byte	0x3
	.byte	0x6c
	.4byte	0x7a
	.byte	0xc
	.uleb128 0x3
	.4byte	.LASF476
	.byte	0x3
	.byte	0x6d
	.4byte	0x7a
	.byte	0x10
	.uleb128 0x3
	.4byte	.LASF477
	.byte	0x3
	.byte	0x6e
	.4byte	0x7a
	.byte	0x14
	.uleb128 0x3
	.4byte	.LASF478
	.byte	0x3
	.byte	0x6f
	.4byte	0x7a
	.byte	0x18
	.uleb128 0x3
	.4byte	.LASF479
	.byte	0x3
	.byte	0x70
	.4byte	0x7a
	.byte	0x1c
	.uleb128 0x3
	.4byte	.LASF480
	.byte	0x3
	.byte	0x71
	.4byte	0x7a
	.byte	0x20
	.uleb128 0x3
	.4byte	.LASF481
	.byte	0x3
	.byte	0x72
	.4byte	0x7a
	.byte	0x24
	.uleb128 0x3
	.4byte	.LASF482
	.byte	0x3
	.byte	0x74
	.4byte	0x80
	.byte	0x28
	.uleb128 0x3
	.4byte	.LASF483
	.byte	0x3
	.byte	0x75
	.4byte	0x80
	.byte	0x29
	.uleb128 0x3
	.4byte	.LASF484
	.byte	0x3
	.byte	0x76
	.4byte	0x80
	.byte	0x2a
	.uleb128 0x3
	.4byte	.LASF485
	.byte	0x3
	.byte	0x77
	.4byte	0x80
	.byte	0x2b
	.uleb128 0x3
	.4byte	.LASF486
	.byte	0x3
	.byte	0x78
	.4byte	0x80
	.byte	0x2c
	.uleb128 0x3
	.4byte	.LASF487
	.byte	0x3
	.byte	0x79
	.4byte	0x80
	.byte	0x2d
	.uleb128 0x3
	.4byte	.LASF488
	.byte	0x3
	.byte	0x7a
	.4byte	0x80
	.byte	0x2e
	.uleb128 0x3
	.4byte	.LASF489
	.byte	0x3
	.byte	0x7b
	.4byte	0x80
	.byte	0x2f
	.uleb128 0x3
	.4byte	.LASF490
	.byte	0x3
	.byte	0x7c
	.4byte	0x80
	.byte	0x30
	.uleb128 0x3
	.4byte	.LASF491
	.byte	0x3
	.byte	0x7d
	.4byte	0x80
	.byte	0x31
	.uleb128 0x3
	.4byte	.LASF492
	.byte	0x3
	.byte	0x7e
	.4byte	0x80
	.byte	0x32
	.uleb128 0x3
	.4byte	.LASF493
	.byte	0x3
	.byte	0x7f
	.4byte	0x80
	.byte	0x33
	.uleb128 0x3
	.4byte	.LASF494
	.byte	0x3
	.byte	0x80
	.4byte	0x80
	.byte	0x34
	.uleb128 0x3
	.4byte	.LASF495
	.byte	0x3
	.byte	0x81
	.4byte	0x80
	.byte	0x35
	.uleb128 0x3
	.4byte	.LASF496
	.byte	0x3
	.byte	0x86
	.4byte	0x7a
	.byte	0x38
	.uleb128 0x3
	.4byte	.LASF497
	.byte	0x3
	.byte	0x87
	.4byte	0x7a
	.byte	0x3c
	.uleb128 0x3
	.4byte	.LASF498
	.byte	0x3
	.byte	0x88
	.4byte	0x7a
	.byte	0x40
	.uleb128 0x3
	.4byte	.LASF499
	.byte	0x3
	.byte	0x89
	.4byte	0x7a
	.byte	0x44
	.uleb128 0x3
	.4byte	.LASF500
	.byte	0x3
	.byte	0x8a
	.4byte	0x7a
	.byte	0x48
	.uleb128 0x3
	.4byte	.LASF501
	.byte	0x3
	.byte	0x8b
	.4byte	0x7a
	.byte	0x4c
	.uleb128 0x3
	.4byte	.LASF502
	.byte	0x3
	.byte	0x8c
	.4byte	0x7a
	.byte	0x50
	.uleb128 0x3
	.4byte	.LASF503
	.byte	0x3
	.byte	0x8d
	.4byte	0x7a
	.byte	0x54
	.byte	0
	.uleb128 0x8
	.4byte	.LASF504
	.byte	0x3
	.byte	0x8e
	.4byte	0x20f
	.uleb128 0x6
	.4byte	0x398
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.4byte	.LASF505
	.uleb128 0x6
	.4byte	0x3a8
	.uleb128 0x2
	.byte	0x20
	.byte	0x3
	.byte	0xa4
	.4byte	0x41d
	.uleb128 0x3
	.4byte	.LASF506
	.byte	0x3
	.byte	0xa6
	.4byte	0x431
	.byte	0
	.uleb128 0x3
	.4byte	.LASF507
	.byte	0x3
	.byte	0xa7
	.4byte	0x446
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF508
	.byte	0x3
	.byte	0xa8
	.4byte	0x446
	.byte	0x8
	.uleb128 0x3
	.4byte	.LASF509
	.byte	0x3
	.byte	0xab
	.4byte	0x460
	.byte	0xc
	.uleb128 0x3
	.4byte	.LASF510
	.byte	0x3
	.byte	0xac
	.4byte	0x475
	.byte	0x10
	.uleb128 0x3
	.4byte	.LASF511
	.byte	0x3
	.byte	0xad
	.4byte	0x475
	.byte	0x14
	.uleb128 0x3
	.4byte	.LASF512
	.byte	0x3
	.byte	0xb0
	.4byte	0x47b
	.byte	0x18
	.uleb128 0x3
	.4byte	.LASF513
	.byte	0x3
	.byte	0xb1
	.4byte	0x481
	.byte	0x1c
	.byte	0
	.uleb128 0x10
	.4byte	0x161
	.4byte	0x431
	.uleb128 0x11
	.4byte	0x161
	.uleb128 0x11
	.4byte	0x161
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.4byte	0x41d
	.uleb128 0x10
	.4byte	0x161
	.4byte	0x446
	.uleb128 0x11
	.4byte	0x161
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.4byte	0x437
	.uleb128 0x10
	.4byte	0x161
	.4byte	0x460
	.uleb128 0x11
	.4byte	0x1c5
	.uleb128 0x11
	.4byte	0x161
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.4byte	0x44c
	.uleb128 0x10
	.4byte	0x1c5
	.4byte	0x475
	.uleb128 0x11
	.4byte	0x1c5
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.4byte	0x466
	.uleb128 0x4
	.byte	0x4
	.4byte	0x1cc
	.uleb128 0x4
	.byte	0x4
	.4byte	0x1eb
	.uleb128 0x8
	.4byte	.LASF514
	.byte	0x3
	.byte	0xb2
	.4byte	0x3b4
	.uleb128 0x6
	.4byte	0x487
	.uleb128 0x2
	.byte	0xc
	.byte	0x3
	.byte	0xb4
	.4byte	0x4c4
	.uleb128 0x3
	.4byte	.LASF515
	.byte	0x3
	.byte	0xb5
	.4byte	0x7a
	.byte	0
	.uleb128 0x3
	.4byte	.LASF516
	.byte	0x3
	.byte	0xb6
	.4byte	0x4c4
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF517
	.byte	0x3
	.byte	0xb7
	.4byte	0x4ca
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.4byte	0x3a3
	.uleb128 0x4
	.byte	0x4
	.4byte	0x492
	.uleb128 0x8
	.4byte	.LASF518
	.byte	0x3
	.byte	0xb8
	.4byte	0x497
	.uleb128 0x6
	.4byte	0x4d0
	.uleb128 0xf
	.4byte	.LASF520
	.byte	0x14
	.byte	0x3
	.byte	0xbc
	.4byte	0x4f9
	.uleb128 0x3
	.4byte	.LASF521
	.byte	0x3
	.byte	0xbd
	.4byte	0x4f9
	.byte	0
	.byte	0
	.uleb128 0xa
	.4byte	0x509
	.4byte	0x509
	.uleb128 0xb
	.4byte	0x15a
	.byte	0x4
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.4byte	0x4db
	.uleb128 0xd
	.4byte	.LASF523
	.byte	0x3
	.byte	0xe6
	.4byte	0x4e0
	.uleb128 0xd
	.4byte	.LASF524
	.byte	0x3
	.byte	0xed
	.4byte	0x4db
	.uleb128 0xd
	.4byte	.LASF525
	.byte	0x3
	.byte	0xf0
	.4byte	0x492
	.uleb128 0xd
	.4byte	.LASF526
	.byte	0x3
	.byte	0xf1
	.4byte	0x492
	.uleb128 0xa
	.4byte	0x3af
	.4byte	0x54b
	.uleb128 0xb
	.4byte	0x15a
	.byte	0x7f
	.byte	0
	.uleb128 0x6
	.4byte	0x53b
	.uleb128 0xd
	.4byte	.LASF527
	.byte	0x3
	.byte	0xf3
	.4byte	0x54b
	.uleb128 0xa
	.4byte	0x87
	.4byte	0x566
	.uleb128 0x12
	.byte	0
	.uleb128 0x6
	.4byte	0x55b
	.uleb128 0xd
	.4byte	.LASF528
	.byte	0x3
	.byte	0xf5
	.4byte	0x566
	.uleb128 0xd
	.4byte	.LASF529
	.byte	0x3
	.byte	0xf6
	.4byte	0x566
	.uleb128 0xd
	.4byte	.LASF530
	.byte	0x3
	.byte	0xf7
	.4byte	0x566
	.uleb128 0xd
	.4byte	.LASF531
	.byte	0x3
	.byte	0xf8
	.4byte	0x566
	.uleb128 0xd
	.4byte	.LASF532
	.byte	0x3
	.byte	0xfa
	.4byte	0x566
	.uleb128 0xd
	.4byte	.LASF533
	.byte	0x3
	.byte	0xfb
	.4byte	0x566
	.uleb128 0xd
	.4byte	.LASF534
	.byte	0x3
	.byte	0xfc
	.4byte	0x566
	.uleb128 0xd
	.4byte	.LASF535
	.byte	0x3
	.byte	0xfd
	.4byte	0x566
	.uleb128 0xd
	.4byte	.LASF536
	.byte	0x3
	.byte	0xfe
	.4byte	0x566
	.uleb128 0xd
	.4byte	.LASF537
	.byte	0x3
	.byte	0xff
	.4byte	0x566
	.uleb128 0x10
	.4byte	0x161
	.4byte	0x5e8
	.uleb128 0x11
	.4byte	0x5e8
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.4byte	0x5f3
	.uleb128 0x13
	.4byte	.LASF593
	.uleb128 0x6
	.4byte	0x5ee
	.uleb128 0x14
	.4byte	.LASF538
	.byte	0x3
	.2byte	0x115
	.4byte	0x604
	.uleb128 0x4
	.byte	0x4
	.4byte	0x5d9
	.uleb128 0x10
	.4byte	0x161
	.4byte	0x619
	.uleb128 0x11
	.4byte	0x619
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.4byte	0x5ee
	.uleb128 0x14
	.4byte	.LASF539
	.byte	0x3
	.2byte	0x116
	.4byte	0x62b
	.uleb128 0x4
	.byte	0x4
	.4byte	0x60a
	.uleb128 0x5
	.byte	0x2
	.byte	0x7
	.4byte	.LASF540
	.uleb128 0x15
	.4byte	.LASF541
	.byte	0x3
	.2byte	0x12d
	.4byte	0x644
	.uleb128 0x4
	.byte	0x4
	.4byte	0x64a
	.uleb128 0x10
	.4byte	0x7a
	.4byte	0x659
	.uleb128 0x11
	.4byte	0x161
	.byte	0
	.uleb128 0x16
	.4byte	.LASF542
	.byte	0x8
	.byte	0x3
	.2byte	0x12f
	.4byte	0x681
	.uleb128 0x17
	.4byte	.LASF543
	.byte	0x3
	.2byte	0x131
	.4byte	0x638
	.byte	0
	.uleb128 0x17
	.4byte	.LASF544
	.byte	0x3
	.2byte	0x132
	.4byte	0x681
	.byte	0x4
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.4byte	0x659
	.uleb128 0x15
	.4byte	.LASF545
	.byte	0x3
	.2byte	0x133
	.4byte	0x659
	.uleb128 0x14
	.4byte	.LASF546
	.byte	0x3
	.2byte	0x137
	.4byte	0x69f
	.uleb128 0x4
	.byte	0x4
	.4byte	0x687
	.uleb128 0xa
	.4byte	0x3a8
	.4byte	0x6b5
	.uleb128 0xb
	.4byte	0x15a
	.byte	0xf
	.byte	0
	.uleb128 0x18
	.4byte	.LASF547
	.byte	0x1
	.byte	0x94
	.4byte	0x6a5
	.uleb128 0x5
	.byte	0x3
	.4byte	_aTerminalId
	.uleb128 0x19
	.4byte	0x193
	.byte	0x1
	.byte	0xab
	.uleb128 0x5
	.byte	0x3
	.4byte	_SEGGER_RTT
	.uleb128 0xa
	.4byte	0x80
	.4byte	0x6e4
	.uleb128 0x1a
	.4byte	0x15a
	.2byte	0x3ff
	.byte	0
	.uleb128 0x18
	.4byte	.LASF548
	.byte	0x1
	.byte	0xbf
	.4byte	0x6d3
	.uleb128 0x5
	.byte	0x3
	.4byte	_acUpBuffer
	.uleb128 0x18
	.4byte	.LASF549
	.byte	0x1
	.byte	0xc0
	.4byte	0x14a
	.uleb128 0x5
	.byte	0x3
	.4byte	_acDownBuffer
	.uleb128 0x18
	.4byte	.LASF550
	.byte	0x1
	.byte	0xc3
	.4byte	0x80
	.uleb128 0x5
	.byte	0x3
	.4byte	_ActiveTerminal
	.uleb128 0x1b
	.4byte	.LASF557
	.byte	0x1
	.2byte	0x4e5
	.4byte	0x161
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7a3
	.uleb128 0x1c
	.4byte	.LASF551
	.byte	0x1
	.2byte	0x4e5
	.4byte	0x80
	.uleb128 0x2
	.byte	0x91
	.sleb128 -33
	.uleb128 0x1d
	.ascii	"s\000"
	.byte	0x1
	.2byte	0x4e5
	.4byte	0x7a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1e
	.4byte	.LASF552
	.byte	0x1
	.2byte	0x4e6
	.4byte	0x161
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1e
	.4byte	.LASF553
	.byte	0x1
	.2byte	0x4e7
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1e
	.4byte	.LASF554
	.byte	0x1
	.2byte	0x4e8
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1e
	.4byte	.LASF555
	.byte	0x1
	.2byte	0x4e9
	.4byte	0x7a3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1f
	.4byte	.LBB13
	.4byte	.LBE13-.LBB13
	.uleb128 0x1e
	.4byte	.LASF556
	.byte	0x1
	.2byte	0x4fc
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.4byte	0x9e
	.uleb128 0x1b
	.4byte	.LASF558
	.byte	0x1
	.2byte	0x4b3
	.4byte	0x161
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x825
	.uleb128 0x1c
	.4byte	.LASF551
	.byte	0x1
	.2byte	0x4b3
	.4byte	0x80
	.uleb128 0x2
	.byte	0x91
	.sleb128 -33
	.uleb128 0x20
	.ascii	"ac\000"
	.byte	0x1
	.2byte	0x4b4
	.4byte	0x825
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1e
	.4byte	.LASF555
	.byte	0x1
	.2byte	0x4b5
	.4byte	0x7a3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1e
	.4byte	.LASF554
	.byte	0x1
	.2byte	0x4b6
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x20
	.ascii	"r\000"
	.byte	0x1
	.2byte	0x4b7
	.4byte	0x161
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1f
	.4byte	.LBB12
	.4byte	.LBE12-.LBB12
	.uleb128 0x1e
	.4byte	.LASF556
	.byte	0x1
	.2byte	0x4c0
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0xa
	.4byte	0x80
	.4byte	0x835
	.uleb128 0xb
	.4byte	0x15a
	.byte	0x1
	.byte	0
	.uleb128 0x21
	.4byte	.LASF594
	.byte	0x1
	.2byte	0x4a1
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1b
	.4byte	.LASF559
	.byte	0x1
	.2byte	0x489
	.4byte	0x161
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8a6
	.uleb128 0x1c
	.4byte	.LASF560
	.byte	0x1
	.2byte	0x489
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.4byte	.LASF453
	.byte	0x1
	.2byte	0x489
	.4byte	0x7a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x20
	.ascii	"r\000"
	.byte	0x1
	.2byte	0x48a
	.4byte	0x161
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1f
	.4byte	.LBB11
	.4byte	.LBE11-.LBB11
	.uleb128 0x1e
	.4byte	.LASF556
	.byte	0x1
	.2byte	0x48e
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF561
	.byte	0x1
	.2byte	0x46a
	.4byte	0x161
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x905
	.uleb128 0x1c
	.4byte	.LASF560
	.byte	0x1
	.2byte	0x46a
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.4byte	.LASF453
	.byte	0x1
	.2byte	0x46a
	.4byte	0x7a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x20
	.ascii	"r\000"
	.byte	0x1
	.2byte	0x46b
	.4byte	0x161
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1f
	.4byte	.LBB10
	.4byte	.LBE10-.LBB10
	.uleb128 0x1e
	.4byte	.LASF556
	.byte	0x1
	.2byte	0x46f
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF562
	.byte	0x1
	.2byte	0x444
	.4byte	0x161
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x991
	.uleb128 0x1c
	.4byte	.LASF560
	.byte	0x1
	.2byte	0x444
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.4byte	.LASF453
	.byte	0x1
	.2byte	0x444
	.4byte	0x7a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1c
	.4byte	.LASF454
	.byte	0x1
	.2byte	0x444
	.4byte	0x19e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1c
	.4byte	.LASF563
	.byte	0x1
	.2byte	0x444
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1c
	.4byte	.LASF458
	.byte	0x1
	.2byte	0x444
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x20
	.ascii	"r\000"
	.byte	0x1
	.2byte	0x445
	.4byte	0x161
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1f
	.4byte	.LBB9
	.4byte	.LBE9-.LBB9
	.uleb128 0x1e
	.4byte	.LASF556
	.byte	0x1
	.2byte	0x449
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF564
	.byte	0x1
	.2byte	0x41a
	.4byte	0x161
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa1d
	.uleb128 0x1c
	.4byte	.LASF560
	.byte	0x1
	.2byte	0x41a
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.4byte	.LASF453
	.byte	0x1
	.2byte	0x41a
	.4byte	0x7a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1c
	.4byte	.LASF454
	.byte	0x1
	.2byte	0x41a
	.4byte	0x19e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1c
	.4byte	.LASF563
	.byte	0x1
	.2byte	0x41a
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1c
	.4byte	.LASF458
	.byte	0x1
	.2byte	0x41a
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x20
	.ascii	"r\000"
	.byte	0x1
	.2byte	0x41b
	.4byte	0x161
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1f
	.4byte	.LBB8
	.4byte	.LBE8-.LBB8
	.uleb128 0x1e
	.4byte	.LASF556
	.byte	0x1
	.2byte	0x41f
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF565
	.byte	0x1
	.2byte	0x3ec
	.4byte	0x161
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa9c
	.uleb128 0x1c
	.4byte	.LASF453
	.byte	0x1
	.2byte	0x3ec
	.4byte	0x7a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.4byte	.LASF454
	.byte	0x1
	.2byte	0x3ec
	.4byte	0x19e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1c
	.4byte	.LASF563
	.byte	0x1
	.2byte	0x3ec
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1c
	.4byte	.LASF458
	.byte	0x1
	.2byte	0x3ec
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1e
	.4byte	.LASF560
	.byte	0x1
	.2byte	0x3ed
	.4byte	0x161
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1f
	.4byte	.LBB7
	.4byte	.LBE7-.LBB7
	.uleb128 0x1e
	.4byte	.LASF556
	.byte	0x1
	.2byte	0x3f0
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF566
	.byte	0x1
	.2byte	0x3bf
	.4byte	0x161
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb1b
	.uleb128 0x1c
	.4byte	.LASF453
	.byte	0x1
	.2byte	0x3bf
	.4byte	0x7a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.4byte	.LASF454
	.byte	0x1
	.2byte	0x3bf
	.4byte	0x19e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1c
	.4byte	.LASF563
	.byte	0x1
	.2byte	0x3bf
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1c
	.4byte	.LASF458
	.byte	0x1
	.2byte	0x3bf
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1e
	.4byte	.LASF560
	.byte	0x1
	.2byte	0x3c0
	.4byte	0x161
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1f
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.uleb128 0x1e
	.4byte	.LASF556
	.byte	0x1
	.2byte	0x3c3
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.byte	0
	.uleb128 0x22
	.4byte	.LASF567
	.byte	0x1
	.2byte	0x3a3
	.4byte	0x92
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb61
	.uleb128 0x1c
	.4byte	.LASF560
	.byte	0x1
	.2byte	0x3a3
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1e
	.4byte	.LASF555
	.byte	0x1
	.2byte	0x3a4
	.4byte	0xb61
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x20
	.ascii	"v\000"
	.byte	0x1
	.2byte	0x3a5
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.4byte	0xfa
	.uleb128 0x1b
	.4byte	.LASF568
	.byte	0x1
	.2byte	0x389
	.4byte	0x161
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb9e
	.uleb128 0x1e
	.4byte	.LASF457
	.byte	0x1
	.2byte	0x38a
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x20
	.ascii	"r\000"
	.byte	0x1
	.2byte	0x38b
	.4byte	0x161
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF569
	.byte	0x1
	.2byte	0x372
	.4byte	0x161
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xbc6
	.uleb128 0x20
	.ascii	"r\000"
	.byte	0x1
	.2byte	0x373
	.4byte	0x161
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF570
	.byte	0x1
	.2byte	0x356
	.4byte	0x161
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xbfb
	.uleb128 0x20
	.ascii	"c\000"
	.byte	0x1
	.2byte	0x357
	.4byte	0x80
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.uleb128 0x20
	.ascii	"r\000"
	.byte	0x1
	.2byte	0x358
	.4byte	0x161
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF571
	.byte	0x1
	.2byte	0x340
	.4byte	0x92
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc41
	.uleb128 0x1c
	.4byte	.LASF560
	.byte	0x1
	.2byte	0x340
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1d
	.ascii	"s\000"
	.byte	0x1
	.2byte	0x340
	.4byte	0x7a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x20
	.ascii	"Len\000"
	.byte	0x1
	.2byte	0x341
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF572
	.byte	0x1
	.2byte	0x31a
	.4byte	0x92
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xcb1
	.uleb128 0x1c
	.4byte	.LASF560
	.byte	0x1
	.2byte	0x31a
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.4byte	.LASF454
	.byte	0x1
	.2byte	0x31a
	.4byte	0xcb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1c
	.4byte	.LASF573
	.byte	0x1
	.2byte	0x31a
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1e
	.4byte	.LASF552
	.byte	0x1
	.2byte	0x31b
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1f
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.uleb128 0x1e
	.4byte	.LASF556
	.byte	0x1
	.2byte	0x31e
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.4byte	0xcb7
	.uleb128 0x23
	.uleb128 0x1b
	.4byte	.LASF574
	.byte	0x1
	.2byte	0x2d3
	.4byte	0x92
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd3c
	.uleb128 0x1c
	.4byte	.LASF560
	.byte	0x1
	.2byte	0x2d3
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1c
	.4byte	.LASF454
	.byte	0x1
	.2byte	0x2d3
	.4byte	0xcb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1c
	.4byte	.LASF573
	.byte	0x1
	.2byte	0x2d3
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1e
	.4byte	.LASF552
	.byte	0x1
	.2byte	0x2d4
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1e
	.4byte	.LASF554
	.byte	0x1
	.2byte	0x2d5
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1e
	.4byte	.LASF575
	.byte	0x1
	.2byte	0x2d6
	.4byte	0x7a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1e
	.4byte	.LASF555
	.byte	0x1
	.2byte	0x2d7
	.4byte	0x7a3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF576
	.byte	0x1
	.2byte	0x265
	.4byte	0x92
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xdf7
	.uleb128 0x1c
	.4byte	.LASF560
	.byte	0x1
	.2byte	0x265
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1c
	.4byte	.LASF454
	.byte	0x1
	.2byte	0x265
	.4byte	0xcb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1c
	.4byte	.LASF573
	.byte	0x1
	.2byte	0x265
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x1e
	.4byte	.LASF575
	.byte	0x1
	.2byte	0x266
	.4byte	0x7a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1e
	.4byte	.LASF555
	.byte	0x1
	.2byte	0x267
	.4byte	0x7a3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1e
	.4byte	.LASF554
	.byte	0x1
	.2byte	0x268
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1e
	.4byte	.LASF457
	.byte	0x1
	.2byte	0x269
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1e
	.4byte	.LASF456
	.byte	0x1
	.2byte	0x26a
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x20
	.ascii	"Rem\000"
	.byte	0x1
	.2byte	0x26b
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1f
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.uleb128 0x1e
	.4byte	.LASF577
	.byte	0x1
	.2byte	0x288
	.4byte	0x8c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.byte	0
	.uleb128 0x24
	.4byte	.LASF595
	.byte	0x1
	.2byte	0x211
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe81
	.uleb128 0x1c
	.4byte	.LASF560
	.byte	0x1
	.2byte	0x211
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1c
	.4byte	.LASF454
	.byte	0x1
	.2byte	0x211
	.4byte	0xcb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1c
	.4byte	.LASF573
	.byte	0x1
	.2byte	0x211
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1e
	.4byte	.LASF575
	.byte	0x1
	.2byte	0x212
	.4byte	0x7a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1e
	.4byte	.LASF555
	.byte	0x1
	.2byte	0x213
	.4byte	0x7a3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1e
	.4byte	.LASF554
	.byte	0x1
	.2byte	0x214
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1f
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0x1e
	.4byte	.LASF577
	.byte	0x1
	.2byte	0x235
	.4byte	0x8c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF578
	.byte	0x1
	.2byte	0x1ea
	.4byte	0x92
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xef1
	.uleb128 0x1c
	.4byte	.LASF560
	.byte	0x1
	.2byte	0x1ea
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.4byte	.LASF454
	.byte	0x1
	.2byte	0x1ea
	.4byte	0x19e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1c
	.4byte	.LASF563
	.byte	0x1
	.2byte	0x1ea
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1e
	.4byte	.LASF579
	.byte	0x1
	.2byte	0x1eb
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1f
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x1e
	.4byte	.LASF556
	.byte	0x1
	.2byte	0x1ed
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF580
	.byte	0x1
	.2byte	0x1a7
	.4byte	0x92
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xf93
	.uleb128 0x1c
	.4byte	.LASF560
	.byte	0x1
	.2byte	0x1a7
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1c
	.4byte	.LASF575
	.byte	0x1
	.2byte	0x1a7
	.4byte	0x19e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1c
	.4byte	.LASF563
	.byte	0x1
	.2byte	0x1a7
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1e
	.4byte	.LASF581
	.byte	0x1
	.2byte	0x1a8
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1e
	.4byte	.LASF579
	.byte	0x1
	.2byte	0x1a9
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1e
	.4byte	.LASF457
	.byte	0x1
	.2byte	0x1aa
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1e
	.4byte	.LASF456
	.byte	0x1
	.2byte	0x1ab
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1e
	.4byte	.LASF454
	.byte	0x1
	.2byte	0x1ac
	.4byte	0xf93
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1e
	.4byte	.LASF555
	.byte	0x1
	.2byte	0x1ad
	.4byte	0xb61
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.4byte	0x3a8
	.uleb128 0x25
	.4byte	.LASF585
	.byte	0x1
	.2byte	0x17e
	.4byte	0x92
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xfee
	.uleb128 0x1c
	.4byte	.LASF555
	.byte	0x1
	.2byte	0x17e
	.4byte	0x7a3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1e
	.4byte	.LASF457
	.byte	0x1
	.2byte	0x17f
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x1e
	.4byte	.LASF456
	.byte	0x1
	.2byte	0x180
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x20
	.ascii	"r\000"
	.byte	0x1
	.2byte	0x181
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x26
	.4byte	.LASF582
	.byte	0x1
	.2byte	0x168
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1031
	.uleb128 0x1c
	.4byte	.LASF555
	.byte	0x1
	.2byte	0x168
	.4byte	0x7a3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.4byte	.LASF551
	.byte	0x1
	.2byte	0x168
	.4byte	0x3a8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x20
	.ascii	"ac\000"
	.byte	0x1
	.2byte	0x169
	.4byte	0x825
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x26
	.4byte	.LASF583
	.byte	0x1
	.2byte	0x142
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x10a2
	.uleb128 0x1c
	.4byte	.LASF555
	.byte	0x1
	.2byte	0x142
	.4byte	0x7a3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1c
	.4byte	.LASF575
	.byte	0x1
	.2byte	0x142
	.4byte	0x7a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1c
	.4byte	.LASF573
	.byte	0x1
	.2byte	0x142
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1e
	.4byte	.LASF584
	.byte	0x1
	.2byte	0x143
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1e
	.4byte	.LASF456
	.byte	0x1
	.2byte	0x144
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x20
	.ascii	"Rem\000"
	.byte	0x1
	.2byte	0x145
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x27
	.4byte	.LASF586
	.byte	0x1
	.2byte	0x10f
	.4byte	0x92
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1126
	.uleb128 0x1c
	.4byte	.LASF555
	.byte	0x1
	.2byte	0x10f
	.4byte	0x7a3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1c
	.4byte	.LASF454
	.byte	0x1
	.2byte	0x10f
	.4byte	0x7a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1c
	.4byte	.LASF573
	.byte	0x1
	.2byte	0x10f
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1e
	.4byte	.LASF587
	.byte	0x1
	.2byte	0x110
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1e
	.4byte	.LASF588
	.byte	0x1
	.2byte	0x111
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1e
	.4byte	.LASF457
	.byte	0x1
	.2byte	0x112
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1e
	.4byte	.LASF456
	.byte	0x1
	.2byte	0x113
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x28
	.4byte	.LASF589
	.byte	0x1
	.byte	0xd8
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1148
	.uleb128 0x29
	.ascii	"p\000"
	.byte	0x1
	.byte	0xd9
	.4byte	0x1148
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.4byte	0x188
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.uleb128 0x2119
	.uleb128 0x17
	.uleb128 0x2134
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x34
	.byte	0
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x32a
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x114f
	.4byte	0x6b5
	.ascii	"_aTerminalId\000"
	.4byte	0x6c6
	.ascii	"_SEGGER_RTT\000"
	.4byte	0x6e4
	.ascii	"_acUpBuffer\000"
	.4byte	0x6f5
	.ascii	"_acDownBuffer\000"
	.4byte	0x706
	.ascii	"_ActiveTerminal\000"
	.4byte	0x6e4
	.ascii	"_acUpBuffer\000"
	.4byte	0x6f5
	.ascii	"_acDownBuffer\000"
	.4byte	0x706
	.ascii	"_ActiveTerminal\000"
	.4byte	0x6c6
	.ascii	"_SEGGER_RTT\000"
	.4byte	0x717
	.ascii	"SEGGER_RTT_TerminalOut\000"
	.4byte	0x7a9
	.ascii	"SEGGER_RTT_SetTerminal\000"
	.4byte	0x835
	.ascii	"SEGGER_RTT_Init\000"
	.4byte	0x847
	.ascii	"SEGGER_RTT_SetNameDownBuffer\000"
	.4byte	0x8a6
	.ascii	"SEGGER_RTT_SetNameUpBuffer\000"
	.4byte	0x905
	.ascii	"SEGGER_RTT_ConfigDownBuffer\000"
	.4byte	0x991
	.ascii	"SEGGER_RTT_ConfigUpBuffer\000"
	.4byte	0xa1d
	.ascii	"SEGGER_RTT_AllocUpBuffer\000"
	.4byte	0xa9c
	.ascii	"SEGGER_RTT_AllocDownBuffer\000"
	.4byte	0xb1b
	.ascii	"SEGGER_RTT_HasData\000"
	.4byte	0xb67
	.ascii	"SEGGER_RTT_HasKey\000"
	.4byte	0xb9e
	.ascii	"SEGGER_RTT_WaitKey\000"
	.4byte	0xbc6
	.ascii	"SEGGER_RTT_GetKey\000"
	.4byte	0xbfb
	.ascii	"SEGGER_RTT_WriteString\000"
	.4byte	0xc41
	.ascii	"SEGGER_RTT_Write\000"
	.4byte	0xcb8
	.ascii	"SEGGER_RTT_WriteNoLock\000"
	.4byte	0xd3c
	.ascii	"SEGGER_RTT_WriteSkipNoLock\000"
	.4byte	0xdf7
	.ascii	"SEGGER_RTT_WriteWithOverwriteNoLock\000"
	.4byte	0xe81
	.ascii	"SEGGER_RTT_Read\000"
	.4byte	0xef1
	.ascii	"SEGGER_RTT_ReadNoLock\000"
	.4byte	0xf99
	.ascii	"_GetAvailWriteSpace\000"
	.4byte	0xfee
	.ascii	"_PostTerminalSwitch\000"
	.4byte	0x1031
	.ascii	"_WriteNoCheck\000"
	.4byte	0x10a2
	.ascii	"_WriteBlocking\000"
	.4byte	0x1126
	.ascii	"_DoInit\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x16f
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x114f
	.4byte	0x80
	.ascii	"char\000"
	.4byte	0x92
	.ascii	"unsigned int\000"
	.4byte	0x9e
	.ascii	"SEGGER_RTT_BUFFER_UP\000"
	.4byte	0xfa
	.ascii	"SEGGER_RTT_BUFFER_DOWN\000"
	.4byte	0x15a
	.ascii	"sizetype\000"
	.4byte	0x161
	.ascii	"int\000"
	.4byte	0x188
	.ascii	"SEGGER_RTT_CB\000"
	.4byte	0x1c5
	.ascii	"long int\000"
	.4byte	0x1a0
	.ascii	"__mbstate_s\000"
	.4byte	0x398
	.ascii	"__RAL_locale_data_t\000"
	.4byte	0x3a8
	.ascii	"unsigned char\000"
	.4byte	0x487
	.ascii	"__RAL_locale_codeset_t\000"
	.4byte	0x4d0
	.ascii	"__RAL_locale_t\000"
	.4byte	0x4e0
	.ascii	"__locale_s\000"
	.4byte	0x631
	.ascii	"short unsigned int\000"
	.4byte	0x638
	.ascii	"__RAL_error_decoder_fn_t\000"
	.4byte	0x659
	.ascii	"__RAL_error_decoder_s\000"
	.4byte	0x687
	.ascii	"__RAL_error_decoder_t\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0xdc
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB0
	.4byte	.LFE0
	.4byte	.LFB1
	.4byte	.LFE1
	.4byte	.LFB2
	.4byte	.LFE2
	.4byte	.LFB3
	.4byte	.LFE3
	.4byte	.LFB4
	.4byte	.LFE4
	.4byte	.LFB5
	.4byte	.LFE5
	.4byte	.LFB6
	.4byte	.LFE6
	.4byte	.LFB7
	.4byte	.LFE7
	.4byte	.LFB8
	.4byte	.LFE8
	.4byte	.LFB9
	.4byte	.LFE9
	.4byte	.LFB10
	.4byte	.LFE10
	.4byte	.LFB11
	.4byte	.LFE11
	.4byte	.LFB12
	.4byte	.LFE12
	.4byte	.LFB13
	.4byte	.LFE13
	.4byte	.LFB14
	.4byte	.LFE14
	.4byte	.LFB15
	.4byte	.LFE15
	.4byte	.LFB16
	.4byte	.LFE16
	.4byte	.LFB17
	.4byte	.LFE17
	.4byte	.LFB18
	.4byte	.LFE18
	.4byte	.LFB19
	.4byte	.LFE19
	.4byte	.LFB20
	.4byte	.LFE20
	.4byte	.LFB21
	.4byte	.LFE21
	.4byte	.LFB22
	.4byte	.LFE22
	.4byte	.LFB23
	.4byte	.LFE23
	.4byte	.LFB24
	.4byte	.LFE24
	.4byte	0
	.4byte	0
	.section	.debug_macro,"",%progbits
.Ldebug_macro0:
	.2byte	0x4
	.byte	0x2
	.4byte	.Ldebug_line0
	.byte	0x7
	.4byte	.Ldebug_macro1
	.byte	0x3
	.uleb128 0
	.uleb128 0x1
	.byte	0x3
	.uleb128 0x4a
	.uleb128 0x2
	.byte	0x5
	.uleb128 0x38
	.4byte	.LASF374
	.file 4 "C:\\Users\\Jon\\Documents\\jenkinsd2\\nrf52\\nrf52\\SEGGER_RTT_Conf.h"
	.byte	0x3
	.uleb128 0x3a
	.uleb128 0x4
	.byte	0x7
	.4byte	.Ldebug_macro2
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro3
	.byte	0x4
	.file 5 "C:/Program Files/SEGGER/SEGGER Embedded Studio for ARM 3.34a/include/string.h"
	.byte	0x3
	.uleb128 0x4c
	.uleb128 0x5
	.byte	0x5
	.uleb128 0xd
	.4byte	.LASF424
	.byte	0x3
	.uleb128 0xf
	.uleb128 0x3
	.byte	0x7
	.4byte	.Ldebug_macro4
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro5
	.byte	0x4
	.byte	0x5
	.uleb128 0x78
	.4byte	.LASF448
	.byte	0x5
	.uleb128 0x7c
	.4byte	.LASF449
	.byte	0x5
	.uleb128 0x80
	.4byte	.LASF450
	.byte	0x5
	.uleb128 0x84
	.4byte	.LASF451
	.byte	0x5
	.uleb128 0xd5
	.4byte	.LASF452
	.byte	0x4
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.0.fb0f4b7eb55688faa009d5ed3372cbfb,comdat
.Ldebug_macro1:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0
	.4byte	.LASF0
	.byte	0x5
	.uleb128 0
	.4byte	.LASF1
	.byte	0x5
	.uleb128 0
	.4byte	.LASF2
	.byte	0x5
	.uleb128 0
	.4byte	.LASF3
	.byte	0x5
	.uleb128 0
	.4byte	.LASF4
	.byte	0x5
	.uleb128 0
	.4byte	.LASF5
	.byte	0x5
	.uleb128 0
	.4byte	.LASF6
	.byte	0x5
	.uleb128 0
	.4byte	.LASF7
	.byte	0x5
	.uleb128 0
	.4byte	.LASF8
	.byte	0x5
	.uleb128 0
	.4byte	.LASF9
	.byte	0x5
	.uleb128 0
	.4byte	.LASF10
	.byte	0x5
	.uleb128 0
	.4byte	.LASF11
	.byte	0x5
	.uleb128 0
	.4byte	.LASF12
	.byte	0x5
	.uleb128 0
	.4byte	.LASF13
	.byte	0x5
	.uleb128 0
	.4byte	.LASF14
	.byte	0x5
	.uleb128 0
	.4byte	.LASF15
	.byte	0x5
	.uleb128 0
	.4byte	.LASF16
	.byte	0x5
	.uleb128 0
	.4byte	.LASF17
	.byte	0x5
	.uleb128 0
	.4byte	.LASF18
	.byte	0x5
	.uleb128 0
	.4byte	.LASF19
	.byte	0x5
	.uleb128 0
	.4byte	.LASF20
	.byte	0x5
	.uleb128 0
	.4byte	.LASF21
	.byte	0x5
	.uleb128 0
	.4byte	.LASF22
	.byte	0x5
	.uleb128 0
	.4byte	.LASF23
	.byte	0x5
	.uleb128 0
	.4byte	.LASF24
	.byte	0x5
	.uleb128 0
	.4byte	.LASF25
	.byte	0x5
	.uleb128 0
	.4byte	.LASF26
	.byte	0x5
	.uleb128 0
	.4byte	.LASF27
	.byte	0x5
	.uleb128 0
	.4byte	.LASF28
	.byte	0x5
	.uleb128 0
	.4byte	.LASF29
	.byte	0x5
	.uleb128 0
	.4byte	.LASF30
	.byte	0x5
	.uleb128 0
	.4byte	.LASF31
	.byte	0x5
	.uleb128 0
	.4byte	.LASF32
	.byte	0x5
	.uleb128 0
	.4byte	.LASF33
	.byte	0x5
	.uleb128 0
	.4byte	.LASF34
	.byte	0x5
	.uleb128 0
	.4byte	.LASF35
	.byte	0x5
	.uleb128 0
	.4byte	.LASF36
	.byte	0x5
	.uleb128 0
	.4byte	.LASF37
	.byte	0x5
	.uleb128 0
	.4byte	.LASF38
	.byte	0x5
	.uleb128 0
	.4byte	.LASF39
	.byte	0x5
	.uleb128 0
	.4byte	.LASF40
	.byte	0x5
	.uleb128 0
	.4byte	.LASF41
	.byte	0x5
	.uleb128 0
	.4byte	.LASF42
	.byte	0x5
	.uleb128 0
	.4byte	.LASF43
	.byte	0x5
	.uleb128 0
	.4byte	.LASF44
	.byte	0x5
	.uleb128 0
	.4byte	.LASF45
	.byte	0x5
	.uleb128 0
	.4byte	.LASF46
	.byte	0x5
	.uleb128 0
	.4byte	.LASF47
	.byte	0x5
	.uleb128 0
	.4byte	.LASF48
	.byte	0x5
	.uleb128 0
	.4byte	.LASF49
	.byte	0x5
	.uleb128 0
	.4byte	.LASF50
	.byte	0x5
	.uleb128 0
	.4byte	.LASF51
	.byte	0x5
	.uleb128 0
	.4byte	.LASF52
	.byte	0x5
	.uleb128 0
	.4byte	.LASF53
	.byte	0x5
	.uleb128 0
	.4byte	.LASF54
	.byte	0x5
	.uleb128 0
	.4byte	.LASF55
	.byte	0x5
	.uleb128 0
	.4byte	.LASF56
	.byte	0x5
	.uleb128 0
	.4byte	.LASF57
	.byte	0x5
	.uleb128 0
	.4byte	.LASF58
	.byte	0x5
	.uleb128 0
	.4byte	.LASF59
	.byte	0x5
	.uleb128 0
	.4byte	.LASF60
	.byte	0x5
	.uleb128 0
	.4byte	.LASF61
	.byte	0x5
	.uleb128 0
	.4byte	.LASF62
	.byte	0x5
	.uleb128 0
	.4byte	.LASF63
	.byte	0x5
	.uleb128 0
	.4byte	.LASF64
	.byte	0x5
	.uleb128 0
	.4byte	.LASF65
	.byte	0x5
	.uleb128 0
	.4byte	.LASF66
	.byte	0x5
	.uleb128 0
	.4byte	.LASF67
	.byte	0x5
	.uleb128 0
	.4byte	.LASF68
	.byte	0x5
	.uleb128 0
	.4byte	.LASF69
	.byte	0x5
	.uleb128 0
	.4byte	.LASF70
	.byte	0x5
	.uleb128 0
	.4byte	.LASF71
	.byte	0x5
	.uleb128 0
	.4byte	.LASF72
	.byte	0x5
	.uleb128 0
	.4byte	.LASF73
	.byte	0x5
	.uleb128 0
	.4byte	.LASF74
	.byte	0x5
	.uleb128 0
	.4byte	.LASF75
	.byte	0x5
	.uleb128 0
	.4byte	.LASF76
	.byte	0x5
	.uleb128 0
	.4byte	.LASF77
	.byte	0x5
	.uleb128 0
	.4byte	.LASF78
	.byte	0x5
	.uleb128 0
	.4byte	.LASF79
	.byte	0x5
	.uleb128 0
	.4byte	.LASF80
	.byte	0x5
	.uleb128 0
	.4byte	.LASF81
	.byte	0x5
	.uleb128 0
	.4byte	.LASF82
	.byte	0x5
	.uleb128 0
	.4byte	.LASF83
	.byte	0x5
	.uleb128 0
	.4byte	.LASF84
	.byte	0x5
	.uleb128 0
	.4byte	.LASF85
	.byte	0x5
	.uleb128 0
	.4byte	.LASF86
	.byte	0x5
	.uleb128 0
	.4byte	.LASF87
	.byte	0x5
	.uleb128 0
	.4byte	.LASF88
	.byte	0x5
	.uleb128 0
	.4byte	.LASF89
	.byte	0x5
	.uleb128 0
	.4byte	.LASF90
	.byte	0x5
	.uleb128 0
	.4byte	.LASF91
	.byte	0x5
	.uleb128 0
	.4byte	.LASF92
	.byte	0x5
	.uleb128 0
	.4byte	.LASF93
	.byte	0x5
	.uleb128 0
	.4byte	.LASF94
	.byte	0x5
	.uleb128 0
	.4byte	.LASF95
	.byte	0x5
	.uleb128 0
	.4byte	.LASF96
	.byte	0x5
	.uleb128 0
	.4byte	.LASF97
	.byte	0x5
	.uleb128 0
	.4byte	.LASF98
	.byte	0x5
	.uleb128 0
	.4byte	.LASF99
	.byte	0x5
	.uleb128 0
	.4byte	.LASF100
	.byte	0x5
	.uleb128 0
	.4byte	.LASF101
	.byte	0x5
	.uleb128 0
	.4byte	.LASF102
	.byte	0x5
	.uleb128 0
	.4byte	.LASF103
	.byte	0x5
	.uleb128 0
	.4byte	.LASF104
	.byte	0x5
	.uleb128 0
	.4byte	.LASF105
	.byte	0x5
	.uleb128 0
	.4byte	.LASF106
	.byte	0x5
	.uleb128 0
	.4byte	.LASF107
	.byte	0x5
	.uleb128 0
	.4byte	.LASF108
	.byte	0x5
	.uleb128 0
	.4byte	.LASF109
	.byte	0x5
	.uleb128 0
	.4byte	.LASF110
	.byte	0x5
	.uleb128 0
	.4byte	.LASF111
	.byte	0x5
	.uleb128 0
	.4byte	.LASF112
	.byte	0x5
	.uleb128 0
	.4byte	.LASF113
	.byte	0x5
	.uleb128 0
	.4byte	.LASF114
	.byte	0x5
	.uleb128 0
	.4byte	.LASF115
	.byte	0x5
	.uleb128 0
	.4byte	.LASF116
	.byte	0x5
	.uleb128 0
	.4byte	.LASF117
	.byte	0x5
	.uleb128 0
	.4byte	.LASF118
	.byte	0x5
	.uleb128 0
	.4byte	.LASF119
	.byte	0x5
	.uleb128 0
	.4byte	.LASF120
	.byte	0x5
	.uleb128 0
	.4byte	.LASF121
	.byte	0x5
	.uleb128 0
	.4byte	.LASF122
	.byte	0x5
	.uleb128 0
	.4byte	.LASF123
	.byte	0x5
	.uleb128 0
	.4byte	.LASF124
	.byte	0x5
	.uleb128 0
	.4byte	.LASF125
	.byte	0x5
	.uleb128 0
	.4byte	.LASF126
	.byte	0x5
	.uleb128 0
	.4byte	.LASF127
	.byte	0x5
	.uleb128 0
	.4byte	.LASF128
	.byte	0x5
	.uleb128 0
	.4byte	.LASF129
	.byte	0x5
	.uleb128 0
	.4byte	.LASF130
	.byte	0x5
	.uleb128 0
	.4byte	.LASF131
	.byte	0x5
	.uleb128 0
	.4byte	.LASF132
	.byte	0x5
	.uleb128 0
	.4byte	.LASF133
	.byte	0x5
	.uleb128 0
	.4byte	.LASF134
	.byte	0x5
	.uleb128 0
	.4byte	.LASF135
	.byte	0x5
	.uleb128 0
	.4byte	.LASF136
	.byte	0x5
	.uleb128 0
	.4byte	.LASF137
	.byte	0x5
	.uleb128 0
	.4byte	.LASF138
	.byte	0x5
	.uleb128 0
	.4byte	.LASF139
	.byte	0x5
	.uleb128 0
	.4byte	.LASF140
	.byte	0x5
	.uleb128 0
	.4byte	.LASF141
	.byte	0x5
	.uleb128 0
	.4byte	.LASF142
	.byte	0x5
	.uleb128 0
	.4byte	.LASF143
	.byte	0x5
	.uleb128 0
	.4byte	.LASF144
	.byte	0x5
	.uleb128 0
	.4byte	.LASF145
	.byte	0x5
	.uleb128 0
	.4byte	.LASF146
	.byte	0x5
	.uleb128 0
	.4byte	.LASF147
	.byte	0x5
	.uleb128 0
	.4byte	.LASF148
	.byte	0x5
	.uleb128 0
	.4byte	.LASF149
	.byte	0x5
	.uleb128 0
	.4byte	.LASF150
	.byte	0x5
	.uleb128 0
	.4byte	.LASF151
	.byte	0x5
	.uleb128 0
	.4byte	.LASF152
	.byte	0x5
	.uleb128 0
	.4byte	.LASF153
	.byte	0x5
	.uleb128 0
	.4byte	.LASF154
	.byte	0x5
	.uleb128 0
	.4byte	.LASF155
	.byte	0x5
	.uleb128 0
	.4byte	.LASF156
	.byte	0x5
	.uleb128 0
	.4byte	.LASF157
	.byte	0x5
	.uleb128 0
	.4byte	.LASF158
	.byte	0x5
	.uleb128 0
	.4byte	.LASF159
	.byte	0x5
	.uleb128 0
	.4byte	.LASF160
	.byte	0x5
	.uleb128 0
	.4byte	.LASF161
	.byte	0x5
	.uleb128 0
	.4byte	.LASF162
	.byte	0x5
	.uleb128 0
	.4byte	.LASF163
	.byte	0x5
	.uleb128 0
	.4byte	.LASF164
	.byte	0x5
	.uleb128 0
	.4byte	.LASF165
	.byte	0x5
	.uleb128 0
	.4byte	.LASF166
	.byte	0x5
	.uleb128 0
	.4byte	.LASF167
	.byte	0x5
	.uleb128 0
	.4byte	.LASF168
	.byte	0x5
	.uleb128 0
	.4byte	.LASF169
	.byte	0x5
	.uleb128 0
	.4byte	.LASF170
	.byte	0x5
	.uleb128 0
	.4byte	.LASF171
	.byte	0x5
	.uleb128 0
	.4byte	.LASF172
	.byte	0x5
	.uleb128 0
	.4byte	.LASF173
	.byte	0x5
	.uleb128 0
	.4byte	.LASF174
	.byte	0x5
	.uleb128 0
	.4byte	.LASF175
	.byte	0x5
	.uleb128 0
	.4byte	.LASF176
	.byte	0x5
	.uleb128 0
	.4byte	.LASF177
	.byte	0x5
	.uleb128 0
	.4byte	.LASF178
	.byte	0x5
	.uleb128 0
	.4byte	.LASF179
	.byte	0x5
	.uleb128 0
	.4byte	.LASF180
	.byte	0x5
	.uleb128 0
	.4byte	.LASF181
	.byte	0x5
	.uleb128 0
	.4byte	.LASF182
	.byte	0x5
	.uleb128 0
	.4byte	.LASF183
	.byte	0x5
	.uleb128 0
	.4byte	.LASF184
	.byte	0x5
	.uleb128 0
	.4byte	.LASF185
	.byte	0x5
	.uleb128 0
	.4byte	.LASF186
	.byte	0x5
	.uleb128 0
	.4byte	.LASF187
	.byte	0x5
	.uleb128 0
	.4byte	.LASF188
	.byte	0x5
	.uleb128 0
	.4byte	.LASF189
	.byte	0x5
	.uleb128 0
	.4byte	.LASF190
	.byte	0x5
	.uleb128 0
	.4byte	.LASF191
	.byte	0x5
	.uleb128 0
	.4byte	.LASF192
	.byte	0x5
	.uleb128 0
	.4byte	.LASF193
	.byte	0x5
	.uleb128 0
	.4byte	.LASF194
	.byte	0x5
	.uleb128 0
	.4byte	.LASF195
	.byte	0x5
	.uleb128 0
	.4byte	.LASF196
	.byte	0x5
	.uleb128 0
	.4byte	.LASF197
	.byte	0x5
	.uleb128 0
	.4byte	.LASF198
	.byte	0x5
	.uleb128 0
	.4byte	.LASF199
	.byte	0x5
	.uleb128 0
	.4byte	.LASF200
	.byte	0x5
	.uleb128 0
	.4byte	.LASF201
	.byte	0x5
	.uleb128 0
	.4byte	.LASF202
	.byte	0x5
	.uleb128 0
	.4byte	.LASF203
	.byte	0x5
	.uleb128 0
	.4byte	.LASF204
	.byte	0x5
	.uleb128 0
	.4byte	.LASF205
	.byte	0x5
	.uleb128 0
	.4byte	.LASF206
	.byte	0x5
	.uleb128 0
	.4byte	.LASF207
	.byte	0x5
	.uleb128 0
	.4byte	.LASF208
	.byte	0x5
	.uleb128 0
	.4byte	.LASF209
	.byte	0x5
	.uleb128 0
	.4byte	.LASF210
	.byte	0x5
	.uleb128 0
	.4byte	.LASF211
	.byte	0x5
	.uleb128 0
	.4byte	.LASF212
	.byte	0x5
	.uleb128 0
	.4byte	.LASF213
	.byte	0x5
	.uleb128 0
	.4byte	.LASF214
	.byte	0x5
	.uleb128 0
	.4byte	.LASF215
	.byte	0x5
	.uleb128 0
	.4byte	.LASF216
	.byte	0x5
	.uleb128 0
	.4byte	.LASF217
	.byte	0x5
	.uleb128 0
	.4byte	.LASF218
	.byte	0x5
	.uleb128 0
	.4byte	.LASF219
	.byte	0x5
	.uleb128 0
	.4byte	.LASF220
	.byte	0x5
	.uleb128 0
	.4byte	.LASF221
	.byte	0x5
	.uleb128 0
	.4byte	.LASF222
	.byte	0x5
	.uleb128 0
	.4byte	.LASF223
	.byte	0x5
	.uleb128 0
	.4byte	.LASF224
	.byte	0x5
	.uleb128 0
	.4byte	.LASF225
	.byte	0x5
	.uleb128 0
	.4byte	.LASF226
	.byte	0x5
	.uleb128 0
	.4byte	.LASF227
	.byte	0x5
	.uleb128 0
	.4byte	.LASF228
	.byte	0x5
	.uleb128 0
	.4byte	.LASF229
	.byte	0x5
	.uleb128 0
	.4byte	.LASF230
	.byte	0x5
	.uleb128 0
	.4byte	.LASF231
	.byte	0x5
	.uleb128 0
	.4byte	.LASF232
	.byte	0x5
	.uleb128 0
	.4byte	.LASF233
	.byte	0x5
	.uleb128 0
	.4byte	.LASF234
	.byte	0x5
	.uleb128 0
	.4byte	.LASF235
	.byte	0x5
	.uleb128 0
	.4byte	.LASF236
	.byte	0x5
	.uleb128 0
	.4byte	.LASF237
	.byte	0x5
	.uleb128 0
	.4byte	.LASF238
	.byte	0x5
	.uleb128 0
	.4byte	.LASF239
	.byte	0x5
	.uleb128 0
	.4byte	.LASF240
	.byte	0x5
	.uleb128 0
	.4byte	.LASF241
	.byte	0x5
	.uleb128 0
	.4byte	.LASF242
	.byte	0x5
	.uleb128 0
	.4byte	.LASF243
	.byte	0x5
	.uleb128 0
	.4byte	.LASF244
	.byte	0x5
	.uleb128 0
	.4byte	.LASF245
	.byte	0x5
	.uleb128 0
	.4byte	.LASF246
	.byte	0x5
	.uleb128 0
	.4byte	.LASF247
	.byte	0x5
	.uleb128 0
	.4byte	.LASF248
	.byte	0x5
	.uleb128 0
	.4byte	.LASF249
	.byte	0x5
	.uleb128 0
	.4byte	.LASF250
	.byte	0x5
	.uleb128 0
	.4byte	.LASF251
	.byte	0x5
	.uleb128 0
	.4byte	.LASF252
	.byte	0x5
	.uleb128 0
	.4byte	.LASF253
	.byte	0x5
	.uleb128 0
	.4byte	.LASF254
	.byte	0x5
	.uleb128 0
	.4byte	.LASF255
	.byte	0x5
	.uleb128 0
	.4byte	.LASF256
	.byte	0x5
	.uleb128 0
	.4byte	.LASF257
	.byte	0x5
	.uleb128 0
	.4byte	.LASF258
	.byte	0x5
	.uleb128 0
	.4byte	.LASF259
	.byte	0x5
	.uleb128 0
	.4byte	.LASF260
	.byte	0x5
	.uleb128 0
	.4byte	.LASF261
	.byte	0x5
	.uleb128 0
	.4byte	.LASF262
	.byte	0x5
	.uleb128 0
	.4byte	.LASF263
	.byte	0x5
	.uleb128 0
	.4byte	.LASF264
	.byte	0x5
	.uleb128 0
	.4byte	.LASF265
	.byte	0x5
	.uleb128 0
	.4byte	.LASF266
	.byte	0x5
	.uleb128 0
	.4byte	.LASF267
	.byte	0x5
	.uleb128 0
	.4byte	.LASF268
	.byte	0x5
	.uleb128 0
	.4byte	.LASF269
	.byte	0x5
	.uleb128 0
	.4byte	.LASF270
	.byte	0x5
	.uleb128 0
	.4byte	.LASF271
	.byte	0x5
	.uleb128 0
	.4byte	.LASF272
	.byte	0x5
	.uleb128 0
	.4byte	.LASF273
	.byte	0x5
	.uleb128 0
	.4byte	.LASF274
	.byte	0x5
	.uleb128 0
	.4byte	.LASF275
	.byte	0x5
	.uleb128 0
	.4byte	.LASF276
	.byte	0x5
	.uleb128 0
	.4byte	.LASF277
	.byte	0x5
	.uleb128 0
	.4byte	.LASF278
	.byte	0x5
	.uleb128 0
	.4byte	.LASF279
	.byte	0x5
	.uleb128 0
	.4byte	.LASF280
	.byte	0x5
	.uleb128 0
	.4byte	.LASF281
	.byte	0x5
	.uleb128 0
	.4byte	.LASF282
	.byte	0x5
	.uleb128 0
	.4byte	.LASF283
	.byte	0x5
	.uleb128 0
	.4byte	.LASF284
	.byte	0x5
	.uleb128 0
	.4byte	.LASF285
	.byte	0x5
	.uleb128 0
	.4byte	.LASF286
	.byte	0x5
	.uleb128 0
	.4byte	.LASF287
	.byte	0x5
	.uleb128 0
	.4byte	.LASF288
	.byte	0x5
	.uleb128 0
	.4byte	.LASF289
	.byte	0x5
	.uleb128 0
	.4byte	.LASF290
	.byte	0x5
	.uleb128 0
	.4byte	.LASF291
	.byte	0x5
	.uleb128 0
	.4byte	.LASF292
	.byte	0x5
	.uleb128 0
	.4byte	.LASF293
	.byte	0x5
	.uleb128 0
	.4byte	.LASF294
	.byte	0x5
	.uleb128 0
	.4byte	.LASF295
	.byte	0x5
	.uleb128 0
	.4byte	.LASF296
	.byte	0x5
	.uleb128 0
	.4byte	.LASF297
	.byte	0x5
	.uleb128 0
	.4byte	.LASF298
	.byte	0x5
	.uleb128 0
	.4byte	.LASF299
	.byte	0x5
	.uleb128 0
	.4byte	.LASF300
	.byte	0x5
	.uleb128 0
	.4byte	.LASF301
	.byte	0x5
	.uleb128 0
	.4byte	.LASF302
	.byte	0x5
	.uleb128 0
	.4byte	.LASF303
	.byte	0x5
	.uleb128 0
	.4byte	.LASF304
	.byte	0x5
	.uleb128 0
	.4byte	.LASF305
	.byte	0x5
	.uleb128 0
	.4byte	.LASF306
	.byte	0x5
	.uleb128 0
	.4byte	.LASF307
	.byte	0x5
	.uleb128 0
	.4byte	.LASF308
	.byte	0x5
	.uleb128 0
	.4byte	.LASF309
	.byte	0x5
	.uleb128 0
	.4byte	.LASF310
	.byte	0x5
	.uleb128 0
	.4byte	.LASF311
	.byte	0x5
	.uleb128 0
	.4byte	.LASF312
	.byte	0x5
	.uleb128 0
	.4byte	.LASF313
	.byte	0x5
	.uleb128 0
	.4byte	.LASF314
	.byte	0x5
	.uleb128 0
	.4byte	.LASF315
	.byte	0x5
	.uleb128 0
	.4byte	.LASF316
	.byte	0x5
	.uleb128 0
	.4byte	.LASF317
	.byte	0x5
	.uleb128 0
	.4byte	.LASF318
	.byte	0x5
	.uleb128 0
	.4byte	.LASF319
	.byte	0x5
	.uleb128 0
	.4byte	.LASF320
	.byte	0x5
	.uleb128 0
	.4byte	.LASF321
	.byte	0x5
	.uleb128 0
	.4byte	.LASF322
	.byte	0x5
	.uleb128 0
	.4byte	.LASF323
	.byte	0x5
	.uleb128 0
	.4byte	.LASF324
	.byte	0x5
	.uleb128 0
	.4byte	.LASF325
	.byte	0x5
	.uleb128 0
	.4byte	.LASF326
	.byte	0x5
	.uleb128 0
	.4byte	.LASF327
	.byte	0x5
	.uleb128 0
	.4byte	.LASF328
	.byte	0x5
	.uleb128 0
	.4byte	.LASF329
	.byte	0x5
	.uleb128 0
	.4byte	.LASF330
	.byte	0x5
	.uleb128 0
	.4byte	.LASF331
	.byte	0x6
	.uleb128 0
	.4byte	.LASF332
	.byte	0x5
	.uleb128 0
	.4byte	.LASF333
	.byte	0x6
	.uleb128 0
	.4byte	.LASF334
	.byte	0x5
	.uleb128 0
	.4byte	.LASF335
	.byte	0x5
	.uleb128 0
	.4byte	.LASF336
	.byte	0x5
	.uleb128 0
	.4byte	.LASF337
	.byte	0x5
	.uleb128 0
	.4byte	.LASF338
	.byte	0x5
	.uleb128 0
	.4byte	.LASF339
	.byte	0x5
	.uleb128 0
	.4byte	.LASF340
	.byte	0x5
	.uleb128 0
	.4byte	.LASF341
	.byte	0x5
	.uleb128 0
	.4byte	.LASF342
	.byte	0x5
	.uleb128 0
	.4byte	.LASF343
	.byte	0x5
	.uleb128 0
	.4byte	.LASF344
	.byte	0x5
	.uleb128 0
	.4byte	.LASF345
	.byte	0x5
	.uleb128 0
	.4byte	.LASF346
	.byte	0x5
	.uleb128 0
	.4byte	.LASF347
	.byte	0x5
	.uleb128 0
	.4byte	.LASF348
	.byte	0x5
	.uleb128 0
	.4byte	.LASF349
	.byte	0x5
	.uleb128 0
	.4byte	.LASF350
	.byte	0x5
	.uleb128 0
	.4byte	.LASF351
	.byte	0x5
	.uleb128 0
	.4byte	.LASF352
	.byte	0x6
	.uleb128 0
	.4byte	.LASF353
	.byte	0x6
	.uleb128 0
	.4byte	.LASF354
	.byte	0x6
	.uleb128 0
	.4byte	.LASF355
	.byte	0x5
	.uleb128 0
	.4byte	.LASF356
	.byte	0x5
	.uleb128 0
	.4byte	.LASF357
	.byte	0x5
	.uleb128 0
	.4byte	.LASF358
	.byte	0x5
	.uleb128 0
	.4byte	.LASF359
	.byte	0x5
	.uleb128 0
	.4byte	.LASF360
	.byte	0x5
	.uleb128 0
	.4byte	.LASF361
	.byte	0x5
	.uleb128 0
	.4byte	.LASF362
	.byte	0x5
	.uleb128 0
	.4byte	.LASF363
	.byte	0x5
	.uleb128 0
	.4byte	.LASF364
	.byte	0x5
	.uleb128 0
	.4byte	.LASF365
	.byte	0x5
	.uleb128 0
	.4byte	.LASF366
	.byte	0x5
	.uleb128 0
	.4byte	.LASF357
	.byte	0x5
	.uleb128 0
	.4byte	.LASF367
	.byte	0x5
	.uleb128 0
	.4byte	.LASF368
	.byte	0x5
	.uleb128 0
	.4byte	.LASF369
	.byte	0x5
	.uleb128 0
	.4byte	.LASF370
	.byte	0x5
	.uleb128 0
	.4byte	.LASF371
	.byte	0x5
	.uleb128 0
	.4byte	.LASF372
	.byte	0x5
	.uleb128 0
	.4byte	.LASF373
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.SEGGER_RTT_Conf.h.56.86f851413dca7d892f9d369abcb6a2b9,comdat
.Ldebug_macro2:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x38
	.4byte	.LASF375
	.byte	0x5
	.uleb128 0x45
	.4byte	.LASF376
	.byte	0x5
	.uleb128 0x46
	.4byte	.LASF377
	.byte	0x5
	.uleb128 0x48
	.4byte	.LASF378
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF379
	.byte	0x5
	.uleb128 0x4b
	.4byte	.LASF380
	.byte	0x5
	.uleb128 0x4d
	.4byte	.LASF381
	.byte	0x5
	.uleb128 0x5d
	.4byte	.LASF382
	.byte	0x5
	.uleb128 0x7b
	.4byte	.LASF383
	.byte	0x5
	.uleb128 0x85
	.4byte	.LASF384
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.SEGGER_RTT.h.151.720f4e2bf8415f625d74736a00890344,comdat
.Ldebug_macro3:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x97
	.4byte	.LASF385
	.byte	0x5
	.uleb128 0xb7
	.4byte	.LASF386
	.byte	0x5
	.uleb128 0xb8
	.4byte	.LASF387
	.byte	0x5
	.uleb128 0xb9
	.4byte	.LASF388
	.byte	0x5
	.uleb128 0xba
	.4byte	.LASF389
	.byte	0x5
	.uleb128 0xc0
	.4byte	.LASF390
	.byte	0x5
	.uleb128 0xc1
	.4byte	.LASF391
	.byte	0x5
	.uleb128 0xc3
	.4byte	.LASF392
	.byte	0x5
	.uleb128 0xc4
	.4byte	.LASF393
	.byte	0x5
	.uleb128 0xc5
	.4byte	.LASF394
	.byte	0x5
	.uleb128 0xc6
	.4byte	.LASF395
	.byte	0x5
	.uleb128 0xc7
	.4byte	.LASF396
	.byte	0x5
	.uleb128 0xc8
	.4byte	.LASF397
	.byte	0x5
	.uleb128 0xc9
	.4byte	.LASF398
	.byte	0x5
	.uleb128 0xca
	.4byte	.LASF399
	.byte	0x5
	.uleb128 0xcc
	.4byte	.LASF400
	.byte	0x5
	.uleb128 0xcd
	.4byte	.LASF401
	.byte	0x5
	.uleb128 0xce
	.4byte	.LASF402
	.byte	0x5
	.uleb128 0xcf
	.4byte	.LASF403
	.byte	0x5
	.uleb128 0xd0
	.4byte	.LASF404
	.byte	0x5
	.uleb128 0xd1
	.4byte	.LASF405
	.byte	0x5
	.uleb128 0xd2
	.4byte	.LASF406
	.byte	0x5
	.uleb128 0xd3
	.4byte	.LASF407
	.byte	0x5
	.uleb128 0xd5
	.4byte	.LASF408
	.byte	0x5
	.uleb128 0xd6
	.4byte	.LASF409
	.byte	0x5
	.uleb128 0xd7
	.4byte	.LASF410
	.byte	0x5
	.uleb128 0xd8
	.4byte	.LASF411
	.byte	0x5
	.uleb128 0xd9
	.4byte	.LASF412
	.byte	0x5
	.uleb128 0xda
	.4byte	.LASF413
	.byte	0x5
	.uleb128 0xdb
	.4byte	.LASF414
	.byte	0x5
	.uleb128 0xdc
	.4byte	.LASF415
	.byte	0x5
	.uleb128 0xde
	.4byte	.LASF416
	.byte	0x5
	.uleb128 0xdf
	.4byte	.LASF417
	.byte	0x5
	.uleb128 0xe0
	.4byte	.LASF418
	.byte	0x5
	.uleb128 0xe1
	.4byte	.LASF419
	.byte	0x5
	.uleb128 0xe2
	.4byte	.LASF420
	.byte	0x5
	.uleb128 0xe3
	.4byte	.LASF421
	.byte	0x5
	.uleb128 0xe4
	.4byte	.LASF422
	.byte	0x5
	.uleb128 0xe5
	.4byte	.LASF423
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.__crossworks.h.13.c3cdfeca0c65bfeeeafcbc919abafa26,comdat
.Ldebug_macro4:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xd
	.4byte	.LASF425
	.byte	0x5
	.uleb128 0x21
	.4byte	.LASF426
	.byte	0x6
	.uleb128 0x23
	.4byte	.LASF427
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF428
	.byte	0x5
	.uleb128 0x29
	.4byte	.LASF429
	.byte	0x5
	.uleb128 0x2b
	.4byte	.LASF430
	.byte	0x5
	.uleb128 0x3c
	.4byte	.LASF431
	.byte	0x5
	.uleb128 0x43
	.4byte	.LASF426
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF432
	.byte	0x5
	.uleb128 0x4a
	.4byte	.LASF433
	.byte	0x5
	.uleb128 0x4b
	.4byte	.LASF434
	.byte	0x5
	.uleb128 0x4c
	.4byte	.LASF435
	.byte	0x5
	.uleb128 0x4d
	.4byte	.LASF436
	.byte	0x5
	.uleb128 0x4e
	.4byte	.LASF437
	.byte	0x5
	.uleb128 0x4f
	.4byte	.LASF438
	.byte	0x5
	.uleb128 0x50
	.4byte	.LASF439
	.byte	0x5
	.uleb128 0x53
	.4byte	.LASF440
	.byte	0x5
	.uleb128 0x54
	.4byte	.LASF441
	.byte	0x5
	.uleb128 0x55
	.4byte	.LASF442
	.byte	0x5
	.uleb128 0x56
	.4byte	.LASF443
	.byte	0x5
	.uleb128 0x5b
	.4byte	.LASF444
	.byte	0x5
	.uleb128 0xba
	.4byte	.LASF445
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.string.h.22.cda10d8e370d892a37152512dd464b42,comdat
.Ldebug_macro5:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x16
	.4byte	.LASF446
	.byte	0x5
	.uleb128 0x1b
	.4byte	.LASF447
	.byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF85:
	.ascii	"__SIG_ATOMIC_MAX__ 0x7fffffff\000"
.LASF296:
	.ascii	"__TA_FBIT__ 63\000"
.LASF182:
	.ascii	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD\000"
.LASF147:
	.ascii	"__DBL_DECIMAL_DIG__ 17\000"
.LASF61:
	.ascii	"__UINT_FAST8_TYPE__ unsigned int\000"
.LASF367:
	.ascii	"__SES_ARM 1\000"
.LASF357:
	.ascii	"__ARM_ARCH_7EM__ 1\000"
.LASF374:
	.ascii	"SEGGER_RTT_H \000"
.LASF323:
	.ascii	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1\000"
.LASF181:
	.ascii	"__DEC64_EPSILON__ 1E-15DD\000"
.LASF259:
	.ascii	"__ULACCUM_EPSILON__ 0x1P-32ULK\000"
.LASF233:
	.ascii	"__SACCUM_MAX__ 0X7FFFP-7HK\000"
.LASF104:
	.ascii	"__UINT8_C(c) c\000"
.LASF353:
	.ascii	"__ARM_NEON__\000"
.LASF327:
	.ascii	"__SIZEOF_WINT_T__ 4\000"
.LASF271:
	.ascii	"__QQ_IBIT__ 0\000"
.LASF553:
	.ascii	"FragLen\000"
.LASF372:
	.ascii	"ARM_MATH_CM4 1\000"
.LASF270:
	.ascii	"__QQ_FBIT__ 7\000"
.LASF562:
	.ascii	"SEGGER_RTT_ConfigDownBuffer\000"
.LASF143:
	.ascii	"__DBL_MIN_EXP__ (-1021)\000"
.LASF461:
	.ascii	"SEGGER_RTT_BUFFER_UP\000"
.LASF68:
	.ascii	"__has_include_next(STR) __has_include_next__(STR)\000"
.LASF340:
	.ascii	"__ARM_SIZEOF_WCHAR_T 4\000"
.LASF397:
	.ascii	"RTT_CTRL_TEXT_MAGENTA \"\033[2;35m\"\000"
.LASF221:
	.ascii	"__LLFRACT_IBIT__ 0\000"
.LASF418:
	.ascii	"RTT_CTRL_BG_BRIGHT_GREEN \"\033[4;42m\"\000"
.LASF117:
	.ascii	"__UINT_FAST32_MAX__ 0xffffffffU\000"
.LASF197:
	.ascii	"__USFRACT_MIN__ 0.0UHR\000"
.LASF330:
	.ascii	"__ARM_FEATURE_QBIT 1\000"
.LASF6:
	.ascii	"__GNUC_MINOR__ 3\000"
.LASF565:
	.ascii	"SEGGER_RTT_AllocUpBuffer\000"
.LASF362:
	.ascii	"__ARM_ASM_SYNTAX_UNIFIED__ 1\000"
.LASF460:
	.ascii	"unsigned int\000"
.LASF458:
	.ascii	"Flags\000"
.LASF552:
	.ascii	"Status\000"
.LASF106:
	.ascii	"__UINT16_C(c) c\000"
.LASF23:
	.ascii	"__SIZEOF_SIZE_T__ 4\000"
.LASF38:
	.ascii	"__CHAR16_TYPE__ short unsigned int\000"
.LASF22:
	.ascii	"__SIZEOF_LONG_DOUBLE__ 8\000"
.LASF239:
	.ascii	"__USACCUM_EPSILON__ 0x1P-8UHK\000"
.LASF133:
	.ascii	"__FLT_MAX__ 1.1\000"
.LASF111:
	.ascii	"__INT_FAST8_MAX__ 0x7fffffff\000"
.LASF499:
	.ascii	"abbrev_month_names\000"
.LASF228:
	.ascii	"__ULLFRACT_MAX__ 0XFFFFFFFFFFFFFFFFP-64ULLR\000"
.LASF550:
	.ascii	"_ActiveTerminal\000"
.LASF588:
	.ascii	"NumBytesWritten\000"
.LASF329:
	.ascii	"__ARM_FEATURE_DSP 1\000"
.LASF401:
	.ascii	"RTT_CTRL_TEXT_BRIGHT_RED \"\033[1;31m\"\000"
.LASF304:
	.ascii	"__UTA_FBIT__ 64\000"
.LASF141:
	.ascii	"__DBL_MANT_DIG__ 53\000"
.LASF56:
	.ascii	"__UINT_LEAST64_TYPE__ long long unsigned int\000"
.LASF72:
	.ascii	"__INT_MAX__ 0x7fffffff\000"
.LASF12:
	.ascii	"__ATOMIC_RELEASE 3\000"
.LASF33:
	.ascii	"__PTRDIFF_TYPE__ int\000"
.LASF310:
	.ascii	"__CHAR_UNSIGNED__ 1\000"
.LASF457:
	.ascii	"RdOff\000"
.LASF42:
	.ascii	"__INT16_TYPE__ short int\000"
.LASF334:
	.ascii	"__ARM_FEATURE_QRDMX\000"
.LASF174:
	.ascii	"__DEC32_EPSILON__ 1E-6DF\000"
.LASF156:
	.ascii	"__LDBL_DIG__ 15\000"
.LASF476:
	.ascii	"currency_symbol\000"
.LASF261:
	.ascii	"__LLACCUM_IBIT__ 32\000"
.LASF10:
	.ascii	"__ATOMIC_SEQ_CST 5\000"
.LASF493:
	.ascii	"int_n_sep_by_space\000"
.LASF585:
	.ascii	"_GetAvailWriteSpace\000"
.LASF582:
	.ascii	"_PostTerminalSwitch\000"
.LASF164:
	.ascii	"__LDBL_EPSILON__ 1.1\000"
.LASF492:
	.ascii	"int_p_sep_by_space\000"
.LASF49:
	.ascii	"__INT_LEAST8_TYPE__ signed char\000"
.LASF335:
	.ascii	"__ARM_32BIT_STATE 1\000"
.LASF477:
	.ascii	"mon_decimal_point\000"
.LASF84:
	.ascii	"__UINTMAX_C(c) c ## ULL\000"
.LASF375:
	.ascii	"SEGGER_RTT_CONF_H \000"
.LASF454:
	.ascii	"pBuffer\000"
.LASF29:
	.ascii	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__\000"
.LASF175:
	.ascii	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF\000"
.LASF211:
	.ascii	"__LFRACT_IBIT__ 0\000"
.LASF531:
	.ascii	"__RAL_c_locale_abbrev_month_names\000"
.LASF343:
	.ascii	"__ARM_ARCH 7\000"
.LASF3:
	.ascii	"__STDC_UTF_32__ 1\000"
.LASF53:
	.ascii	"__UINT_LEAST8_TYPE__ unsigned char\000"
.LASF572:
	.ascii	"SEGGER_RTT_Write\000"
.LASF398:
	.ascii	"RTT_CTRL_TEXT_CYAN \"\033[2;36m\"\000"
.LASF70:
	.ascii	"__SCHAR_MAX__ 0x7f\000"
.LASF266:
	.ascii	"__ULLACCUM_IBIT__ 32\000"
.LASF189:
	.ascii	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000"
	.ascii	"000000001E-6143DL\000"
.LASF226:
	.ascii	"__ULLFRACT_IBIT__ 0\000"
.LASF9:
	.ascii	"__ATOMIC_RELAXED 0\000"
.LASF51:
	.ascii	"__INT_LEAST32_TYPE__ long int\000"
.LASF472:
	.ascii	"decimal_point\000"
.LASF80:
	.ascii	"__SIZE_MAX__ 0xffffffffU\000"
.LASF252:
	.ascii	"__LACCUM_MIN__ (-0X1P31LK-0X1P31LK)\000"
.LASF268:
	.ascii	"__ULLACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULLK\000"
.LASF257:
	.ascii	"__ULACCUM_MIN__ 0.0ULK\000"
.LASF351:
	.ascii	"__ARM_FP 4\000"
.LASF487:
	.ascii	"n_sep_by_space\000"
.LASF138:
	.ascii	"__FLT_HAS_INFINITY__ 1\000"
.LASF332:
	.ascii	"__ARM_FEATURE_CRYPTO\000"
.LASF349:
	.ascii	"__ARMEL__ 1\000"
.LASF303:
	.ascii	"__UDA_IBIT__ 32\000"
.LASF60:
	.ascii	"__INT_FAST64_TYPE__ long long int\000"
.LASF234:
	.ascii	"__SACCUM_EPSILON__ 0x1P-7HK\000"
.LASF96:
	.ascii	"__INT8_C(c) c\000"
.LASF346:
	.ascii	"__thumb2__ 1\000"
.LASF371:
	.ascii	"__nRF_FAMILY 1\000"
.LASF555:
	.ascii	"pRing\000"
.LASF382:
	.ascii	"SEGGER_RTT_MAX_INTERRUPT_PRIORITY (0x20)\000"
.LASF267:
	.ascii	"__ULLACCUM_MIN__ 0.0ULLK\000"
.LASF595:
	.ascii	"SEGGER_RTT_WriteWithOverwriteNoLock\000"
.LASF509:
	.ascii	"__iswctype\000"
.LASF560:
	.ascii	"BufferIndex\000"
.LASF485:
	.ascii	"p_sep_by_space\000"
.LASF66:
	.ascii	"__UINTPTR_TYPE__ unsigned int\000"
.LASF135:
	.ascii	"__FLT_EPSILON__ 1.1\000"
.LASF427:
	.ascii	"__RAL_SIZE_T\000"
.LASF311:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1\000"
.LASF426:
	.ascii	"__THREAD __thread\000"
.LASF504:
	.ascii	"__RAL_locale_data_t\000"
.LASF293:
	.ascii	"__SA_IBIT__ 16\000"
.LASF223:
	.ascii	"__LLFRACT_MAX__ 0X7FFFFFFFFFFFFFFFP-63LLR\000"
.LASF576:
	.ascii	"SEGGER_RTT_WriteSkipNoLock\000"
.LASF140:
	.ascii	"__FP_FAST_FMAF 1\000"
.LASF127:
	.ascii	"__FLT_DIG__ 6\000"
.LASF112:
	.ascii	"__INT_FAST16_MAX__ 0x7fffffff\000"
.LASF312:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1\000"
.LASF446:
	.ascii	"__RAL_SIZE_T_DEFINED \000"
.LASF294:
	.ascii	"__DA_FBIT__ 31\000"
.LASF339:
	.ascii	"__ARM_SIZEOF_MINIMAL_ENUM 1\000"
.LASF172:
	.ascii	"__DEC32_MIN__ 1E-95DF\000"
.LASF352:
	.ascii	"__ARM_FEATURE_FMA 1\000"
.LASF229:
	.ascii	"__ULLFRACT_EPSILON__ 0x1P-64ULLR\000"
.LASF536:
	.ascii	"__RAL_data_utf8_minus\000"
.LASF79:
	.ascii	"__PTRDIFF_MAX__ 0x7fffffff\000"
.LASF400:
	.ascii	"RTT_CTRL_TEXT_BRIGHT_BLACK \"\033[1;30m\"\000"
.LASF105:
	.ascii	"__UINT_LEAST16_MAX__ 0xffff\000"
.LASF208:
	.ascii	"__UFRACT_MAX__ 0XFFFFP-16UR\000"
.LASF193:
	.ascii	"__SFRACT_MAX__ 0X7FP-7HR\000"
.LASF19:
	.ascii	"__SIZEOF_SHORT__ 2\000"
.LASF533:
	.ascii	"__RAL_data_utf8_comma\000"
.LASF103:
	.ascii	"__UINT_LEAST8_MAX__ 0xff\000"
.LASF184:
	.ascii	"__DEC128_MIN_EXP__ (-6142)\000"
.LASF87:
	.ascii	"__INT8_MAX__ 0x7f\000"
.LASF219:
	.ascii	"__ULFRACT_EPSILON__ 0x1P-32ULR\000"
.LASF510:
	.ascii	"__towupper\000"
.LASF216:
	.ascii	"__ULFRACT_IBIT__ 0\000"
.LASF260:
	.ascii	"__LLACCUM_FBIT__ 31\000"
.LASF109:
	.ascii	"__UINT_LEAST64_MAX__ 0xffffffffffffffffULL\000"
.LASF125:
	.ascii	"__FLT_RADIX__ 2\000"
.LASF538:
	.ascii	"__user_set_time_of_day\000"
.LASF114:
	.ascii	"__INT_FAST64_MAX__ 0x7fffffffffffffffLL\000"
.LASF495:
	.ascii	"int_n_sign_posn\000"
.LASF227:
	.ascii	"__ULLFRACT_MIN__ 0.0ULLR\000"
.LASF154:
	.ascii	"__DBL_HAS_QUIET_NAN__ 1\000"
.LASF247:
	.ascii	"__UACCUM_MIN__ 0.0UK\000"
.LASF546:
	.ascii	"__RAL_error_decoder_head\000"
.LASF214:
	.ascii	"__LFRACT_EPSILON__ 0x1P-31LR\000"
.LASF482:
	.ascii	"int_frac_digits\000"
.LASF57:
	.ascii	"__INT_FAST8_TYPE__ int\000"
.LASF425:
	.ascii	"__crossworks_H \000"
.LASF62:
	.ascii	"__UINT_FAST16_TYPE__ unsigned int\000"
.LASF368:
	.ascii	"__ARM_ARCH_FPV4_SP_D16__ 1\000"
.LASF551:
	.ascii	"TerminalId\000"
.LASF432:
	.ascii	"__CTYPE_UPPER 0x01\000"
.LASF230:
	.ascii	"__SACCUM_FBIT__ 7\000"
.LASF378:
	.ascii	"BUFFER_SIZE_UP (1024)\000"
.LASF341:
	.ascii	"__ARM_ARCH_PROFILE 77\000"
.LASF557:
	.ascii	"SEGGER_RTT_TerminalOut\000"
.LASF180:
	.ascii	"__DEC64_MAX__ 9.999999999999999E384DD\000"
.LASF202:
	.ascii	"__FRACT_MIN__ (-0.5R-0.5R)\000"
.LASF429:
	.ascii	"__RAL_SIZE_MAX 4294967295UL\000"
.LASF320:
	.ascii	"__GCC_ATOMIC_INT_LOCK_FREE 2\000"
.LASF81:
	.ascii	"__INTMAX_MAX__ 0x7fffffffffffffffLL\000"
.LASF207:
	.ascii	"__UFRACT_MIN__ 0.0UR\000"
.LASF249:
	.ascii	"__UACCUM_EPSILON__ 0x1P-16UK\000"
.LASF275:
	.ascii	"__SQ_IBIT__ 0\000"
.LASF186:
	.ascii	"__DEC128_MIN__ 1E-6143DL\000"
.LASF277:
	.ascii	"__DQ_IBIT__ 0\000"
.LASF406:
	.ascii	"RTT_CTRL_TEXT_BRIGHT_CYAN \"\033[1;36m\"\000"
.LASF558:
	.ascii	"SEGGER_RTT_SetTerminal\000"
.LASF235:
	.ascii	"__USACCUM_FBIT__ 8\000"
.LASF26:
	.ascii	"__ORDER_LITTLE_ENDIAN__ 1234\000"
.LASF328:
	.ascii	"__SIZEOF_PTRDIFF_T__ 4\000"
.LASF593:
	.ascii	"timeval\000"
.LASF470:
	.ascii	"__wchar\000"
.LASF301:
	.ascii	"__USA_IBIT__ 16\000"
.LASF287:
	.ascii	"__UDQ_IBIT__ 0\000"
.LASF183:
	.ascii	"__DEC128_MANT_DIG__ 34\000"
.LASF360:
	.ascii	"__ARM_ARCH_EXT_IDIV__ 1\000"
.LASF333:
	.ascii	"__ARM_FEATURE_UNALIGNED 1\000"
.LASF442:
	.ascii	"__CTYPE_GRAPH (__CTYPE_PUNCT | __CTYPE_UPPER | __CT"
	.ascii	"YPE_LOWER | __CTYPE_DIGIT)\000"
.LASF488:
	.ascii	"p_sign_posn\000"
.LASF590:
	.ascii	"GNU C99 6.3.1 20170620 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 249437] -fmessage-length=0 -mcpu=cort"
	.ascii	"ex-m4 -mlittle-endian -mfloat-abi=hard -mfpu=fpv4-s"
	.ascii	"p-d16 -mthumb -mtp=soft -g3 -gpubnames -std=gnu99 -"
	.ascii	"fomit-frame-pointer -fno-dwarf2-cfi-asm -fno-builti"
	.ascii	"n -ffunction-sections -fdata-sections -fshort-enums"
	.ascii	" -fno-common\000"
.LASF238:
	.ascii	"__USACCUM_MAX__ 0XFFFFP-8UHK\000"
.LASF108:
	.ascii	"__UINT32_C(c) c ## UL\000"
.LASF171:
	.ascii	"__DEC32_MAX_EXP__ 97\000"
.LASF452:
	.ascii	"INIT() do { if (_SEGGER_RTT.acID[0] == '\\0') { _Do"
	.ascii	"Init(); } } while (0)\000"
.LASF390:
	.ascii	"RTT_CTRL_RESET \"\033[0m\"\000"
.LASF490:
	.ascii	"int_p_cs_precedes\000"
.LASF466:
	.ascii	"aDown\000"
.LASF411:
	.ascii	"RTT_CTRL_BG_YELLOW \"\033[24;43m\"\000"
.LASF5:
	.ascii	"__GNUC__ 6\000"
.LASF575:
	.ascii	"pData\000"
.LASF568:
	.ascii	"SEGGER_RTT_HasKey\000"
.LASF347:
	.ascii	"__THUMBEL__ 1\000"
.LASF163:
	.ascii	"__LDBL_MIN__ 1.1\000"
.LASF295:
	.ascii	"__DA_IBIT__ 32\000"
.LASF25:
	.ascii	"__BIGGEST_ALIGNMENT__ 8\000"
.LASF251:
	.ascii	"__LACCUM_IBIT__ 32\000"
.LASF256:
	.ascii	"__ULACCUM_IBIT__ 32\000"
.LASF198:
	.ascii	"__USFRACT_MAX__ 0XFFP-8UHR\000"
.LASF115:
	.ascii	"__UINT_FAST8_MAX__ 0xffffffffU\000"
.LASF262:
	.ascii	"__LLACCUM_MIN__ (-0X1P31LLK-0X1P31LLK)\000"
.LASF236:
	.ascii	"__USACCUM_IBIT__ 8\000"
.LASF548:
	.ascii	"_acUpBuffer\000"
.LASF292:
	.ascii	"__SA_FBIT__ 15\000"
.LASF569:
	.ascii	"SEGGER_RTT_WaitKey\000"
.LASF556:
	.ascii	"LockState\000"
.LASF381:
	.ascii	"SEGGER_RTT_MODE_DEFAULT SEGGER_RTT_MODE_NO_BLOCK_SK"
	.ascii	"IP\000"
.LASF521:
	.ascii	"__category\000"
.LASF380:
	.ascii	"SEGGER_RTT_PRINTF_BUFFER_SIZE (64u)\000"
.LASF566:
	.ascii	"SEGGER_RTT_AllocDownBuffer\000"
.LASF58:
	.ascii	"__INT_FAST16_TYPE__ int\000"
.LASF433:
	.ascii	"__CTYPE_LOWER 0x02\000"
.LASF449:
	.ascii	"MEMCPY(pDest,pSrc,NumBytes) memcpy((pDest), (pSrc),"
	.ascii	" (NumBytes))\000"
.LASF370:
	.ascii	"NRF52832_XXAA 1\000"
.LASF46:
	.ascii	"__UINT16_TYPE__ short unsigned int\000"
.LASF491:
	.ascii	"int_n_cs_precedes\000"
.LASF308:
	.ascii	"__GNUC_STDC_INLINE__ 1\000"
.LASF283:
	.ascii	"__UHQ_IBIT__ 0\000"
.LASF205:
	.ascii	"__UFRACT_FBIT__ 16\000"
.LASF337:
	.ascii	"__ARM_FEATURE_CLZ 1\000"
.LASF74:
	.ascii	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL\000"
.LASF439:
	.ascii	"__CTYPE_XDIGIT 0x80\000"
.LASF44:
	.ascii	"__INT64_TYPE__ long long int\000"
.LASF131:
	.ascii	"__FLT_MAX_10_EXP__ 38\000"
.LASF494:
	.ascii	"int_p_sign_posn\000"
.LASF481:
	.ascii	"negative_sign\000"
.LASF408:
	.ascii	"RTT_CTRL_BG_BLACK \"\033[24;40m\"\000"
.LASF264:
	.ascii	"__LLACCUM_EPSILON__ 0x1P-31LLK\000"
.LASF414:
	.ascii	"RTT_CTRL_BG_CYAN \"\033[24;46m\"\000"
.LASF574:
	.ascii	"SEGGER_RTT_WriteNoLock\000"
.LASF309:
	.ascii	"__NO_INLINE__ 1\000"
.LASF522:
	.ascii	"_SEGGER_RTT\000"
.LASF217:
	.ascii	"__ULFRACT_MIN__ 0.0ULR\000"
.LASF126:
	.ascii	"__FLT_MANT_DIG__ 24\000"
.LASF474:
	.ascii	"grouping\000"
.LASF306:
	.ascii	"__REGISTER_PREFIX__ \000"
.LASF376:
	.ascii	"SEGGER_RTT_MAX_NUM_UP_BUFFERS (2)\000"
.LASF542:
	.ascii	"__RAL_error_decoder_s\000"
.LASF246:
	.ascii	"__UACCUM_IBIT__ 16\000"
.LASF116:
	.ascii	"__UINT_FAST16_MAX__ 0xffffffffU\000"
.LASF435:
	.ascii	"__CTYPE_SPACE 0x08\000"
.LASF69:
	.ascii	"__GXX_ABI_VERSION 1010\000"
.LASF459:
	.ascii	"char\000"
.LASF137:
	.ascii	"__FLT_HAS_DENORM__ 1\000"
.LASF584:
	.ascii	"NumBytesAtOnce\000"
.LASF200:
	.ascii	"__FRACT_FBIT__ 15\000"
.LASF518:
	.ascii	"__RAL_locale_t\000"
.LASF123:
	.ascii	"__FLT_EVAL_METHOD__ 0\000"
.LASF356:
	.ascii	"__THUMB_INTERWORK__ 1\000"
.LASF537:
	.ascii	"__RAL_data_empty_string\000"
.LASF101:
	.ascii	"__INT_LEAST64_MAX__ 0x7fffffffffffffffLL\000"
.LASF240:
	.ascii	"__ACCUM_FBIT__ 15\000"
.LASF587:
	.ascii	"NumBytesToWrite\000"
.LASF177:
	.ascii	"__DEC64_MIN_EXP__ (-382)\000"
.LASF563:
	.ascii	"BufferSize\000"
.LASF373:
	.ascii	"FLASH_PLACEMENT 1\000"
.LASF220:
	.ascii	"__LLFRACT_FBIT__ 63\000"
.LASF511:
	.ascii	"__towlower\000"
.LASF516:
	.ascii	"data\000"
.LASF300:
	.ascii	"__USA_FBIT__ 16\000"
.LASF91:
	.ascii	"__UINT8_MAX__ 0xff\000"
.LASF92:
	.ascii	"__UINT16_MAX__ 0xffff\000"
.LASF369:
	.ascii	"DEBUG 1\000"
.LASF134:
	.ascii	"__FLT_MIN__ 1.1\000"
.LASF441:
	.ascii	"__CTYPE_ALNUM (__CTYPE_UPPER | __CTYPE_LOWER | __CT"
	.ascii	"YPE_DIGIT)\000"
.LASF245:
	.ascii	"__UACCUM_FBIT__ 16\000"
.LASF412:
	.ascii	"RTT_CTRL_BG_BLUE \"\033[24;44m\"\000"
.LASF173:
	.ascii	"__DEC32_MAX__ 9.999999E96DF\000"
.LASF210:
	.ascii	"__LFRACT_FBIT__ 31\000"
.LASF386:
	.ascii	"SEGGER_RTT_MODE_NO_BLOCK_SKIP (0U)\000"
.LASF434:
	.ascii	"__CTYPE_DIGIT 0x04\000"
.LASF50:
	.ascii	"__INT_LEAST16_TYPE__ short int\000"
.LASF142:
	.ascii	"__DBL_DIG__ 15\000"
.LASF462:
	.ascii	"SEGGER_RTT_BUFFER_DOWN\000"
.LASF95:
	.ascii	"__INT_LEAST8_MAX__ 0x7f\000"
.LASF250:
	.ascii	"__LACCUM_FBIT__ 31\000"
.LASF289:
	.ascii	"__UTQ_IBIT__ 0\000"
.LASF151:
	.ascii	"__DBL_DENORM_MIN__ ((double)1.1)\000"
.LASF321:
	.ascii	"__GCC_ATOMIC_LONG_LOCK_FREE 2\000"
.LASF419:
	.ascii	"RTT_CTRL_BG_BRIGHT_YELLOW \"\033[4;43m\"\000"
.LASF244:
	.ascii	"__ACCUM_EPSILON__ 0x1P-15K\000"
.LASF286:
	.ascii	"__UDQ_FBIT__ 64\000"
.LASF348:
	.ascii	"__ARM_ARCH_ISA_THUMB 2\000"
.LASF453:
	.ascii	"sName\000"
.LASF288:
	.ascii	"__UTQ_FBIT__ 128\000"
.LASF100:
	.ascii	"__INT32_C(c) c ## L\000"
.LASF500:
	.ascii	"am_pm_indicator\000"
.LASF314:
	.ascii	"__GCC_ATOMIC_BOOL_LOCK_FREE 2\000"
.LASF444:
	.ascii	"__RAL_WCHAR_T unsigned\000"
.LASF581:
	.ascii	"NumBytesRem\000"
.LASF567:
	.ascii	"SEGGER_RTT_HasData\000"
.LASF342:
	.ascii	"__arm__ 1\000"
.LASF122:
	.ascii	"__GCC_IEC_559_COMPLEX 0\000"
.LASF155:
	.ascii	"__LDBL_MANT_DIG__ 53\000"
.LASF279:
	.ascii	"__TQ_IBIT__ 0\000"
.LASF298:
	.ascii	"__UHA_FBIT__ 8\000"
.LASF579:
	.ascii	"NumBytesRead\000"
.LASF479:
	.ascii	"mon_grouping\000"
.LASF464:
	.ascii	"MaxNumUpBuffers\000"
.LASF178:
	.ascii	"__DEC64_MAX_EXP__ 385\000"
.LASF365:
	.ascii	"__ELF__ 1\000"
.LASF258:
	.ascii	"__ULACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULK\000"
.LASF98:
	.ascii	"__INT16_C(c) c\000"
.LASF97:
	.ascii	"__INT_LEAST16_MAX__ 0x7fff\000"
.LASF94:
	.ascii	"__UINT64_MAX__ 0xffffffffffffffffULL\000"
.LASF456:
	.ascii	"WrOff\000"
.LASF113:
	.ascii	"__INT_FAST32_MAX__ 0x7fffffff\000"
.LASF150:
	.ascii	"__DBL_EPSILON__ ((double)1.1)\000"
.LASF11:
	.ascii	"__ATOMIC_ACQUIRE 2\000"
.LASF331:
	.ascii	"__ARM_FEATURE_SAT 1\000"
.LASF90:
	.ascii	"__INT64_MAX__ 0x7fffffffffffffffLL\000"
.LASF363:
	.ascii	"__ARM_FEATURE_COPROC 15\000"
.LASF0:
	.ascii	"__STDC__ 1\000"
.LASF440:
	.ascii	"__CTYPE_ALPHA (__CTYPE_UPPER | __CTYPE_LOWER)\000"
.LASF17:
	.ascii	"__SIZEOF_LONG__ 4\000"
.LASF145:
	.ascii	"__DBL_MAX_EXP__ 1024\000"
.LASF14:
	.ascii	"__ATOMIC_CONSUME 1\000"
.LASF384:
	.ascii	"SEGGER_RTT_UNLOCK() __asm volatile (\"msr   basepri"
	.ascii	", %0  \\n\\t\" : : \"r\" (LockState) : ); }\000"
.LASF389:
	.ascii	"SEGGER_RTT_MODE_MASK (3U)\000"
.LASF35:
	.ascii	"__WINT_TYPE__ unsigned int\000"
.LASF73:
	.ascii	"__LONG_MAX__ 0x7fffffffL\000"
.LASF88:
	.ascii	"__INT16_MAX__ 0x7fff\000"
.LASF215:
	.ascii	"__ULFRACT_FBIT__ 32\000"
.LASF34:
	.ascii	"__WCHAR_TYPE__ unsigned int\000"
.LASF451:
	.ascii	"MAX(a,b) (((a) > (b)) ? (a) : (b))\000"
.LASF377:
	.ascii	"SEGGER_RTT_MAX_NUM_DOWN_BUFFERS (2)\000"
.LASF242:
	.ascii	"__ACCUM_MIN__ (-0X1P15K-0X1P15K)\000"
.LASF21:
	.ascii	"__SIZEOF_DOUBLE__ 8\000"
.LASF7:
	.ascii	"__GNUC_PATCHLEVEL__ 1\000"
.LASF541:
	.ascii	"__RAL_error_decoder_fn_t\000"
.LASF203:
	.ascii	"__FRACT_MAX__ 0X7FFFP-15R\000"
.LASF78:
	.ascii	"__WINT_MIN__ 0U\000"
.LASF255:
	.ascii	"__ULACCUM_FBIT__ 32\000"
.LASF496:
	.ascii	"day_names\000"
.LASF366:
	.ascii	"__SIZEOF_WCHAR_T 4\000"
.LASF355:
	.ascii	"__ARM_NEON_FP\000"
.LASF2:
	.ascii	"__STDC_UTF_16__ 1\000"
.LASF201:
	.ascii	"__FRACT_IBIT__ 0\000"
.LASF253:
	.ascii	"__LACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LK\000"
.LASF167:
	.ascii	"__LDBL_HAS_INFINITY__ 1\000"
.LASF64:
	.ascii	"__UINT_FAST64_TYPE__ long long unsigned int\000"
.LASF93:
	.ascii	"__UINT32_MAX__ 0xffffffffUL\000"
.LASF157:
	.ascii	"__LDBL_MIN_EXP__ (-1021)\000"
.LASF225:
	.ascii	"__ULLFRACT_FBIT__ 64\000"
.LASF326:
	.ascii	"__SIZEOF_WCHAR_T__ 4\000"
.LASF527:
	.ascii	"__RAL_ascii_ctype_map\000"
.LASF30:
	.ascii	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__\000"
.LASF243:
	.ascii	"__ACCUM_MAX__ 0X7FFFFFFFP-15K\000"
.LASF206:
	.ascii	"__UFRACT_IBIT__ 0\000"
.LASF169:
	.ascii	"__DEC32_MANT_DIG__ 7\000"
.LASF443:
	.ascii	"__CTYPE_PRINT (__CTYPE_BLANK | __CTYPE_PUNCT | __CT"
	.ascii	"YPE_UPPER | __CTYPE_LOWER | __CTYPE_DIGIT)\000"
.LASF503:
	.ascii	"date_time_format\000"
.LASF86:
	.ascii	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)\000"
.LASF224:
	.ascii	"__LLFRACT_EPSILON__ 0x1P-63LLR\000"
.LASF396:
	.ascii	"RTT_CTRL_TEXT_BLUE \"\033[2;34m\"\000"
.LASF573:
	.ascii	"NumBytes\000"
.LASF519:
	.ascii	"__mbstate_s\000"
.LASF190:
	.ascii	"__SFRACT_FBIT__ 7\000"
.LASF39:
	.ascii	"__CHAR32_TYPE__ long unsigned int\000"
.LASF191:
	.ascii	"__SFRACT_IBIT__ 0\000"
.LASF513:
	.ascii	"__mbtowc\000"
.LASF336:
	.ascii	"__ARM_FEATURE_LDREX 7\000"
.LASF273:
	.ascii	"__HQ_IBIT__ 0\000"
.LASF409:
	.ascii	"RTT_CTRL_BG_RED \"\033[24;41m\"\000"
.LASF525:
	.ascii	"__RAL_codeset_ascii\000"
.LASF307:
	.ascii	"__USER_LABEL_PREFIX__ \000"
.LASF383:
	.ascii	"SEGGER_RTT_LOCK() { unsigned int LockState; __asm v"
	.ascii	"olatile (\"mrs   %0, basepri  \\n\\t\" \"mov   r1, "
	.ascii	"%1       \\n\\t\" \"msr   basepri, r1  \\n\\t\" : \""
	.ascii	"=r\" (LockState) : \"i\"(SEGGER_RTT_MAX_INTERRUPT_P"
	.ascii	"RIORITY) : \"r1\" );\000"
.LASF580:
	.ascii	"SEGGER_RTT_ReadNoLock\000"
.LASF55:
	.ascii	"__UINT_LEAST32_TYPE__ long unsigned int\000"
.LASF276:
	.ascii	"__DQ_FBIT__ 63\000"
.LASF192:
	.ascii	"__SFRACT_MIN__ (-0.5HR-0.5HR)\000"
.LASF394:
	.ascii	"RTT_CTRL_TEXT_GREEN \"\033[2;32m\"\000"
.LASF325:
	.ascii	"__PRAGMA_REDEFINE_EXTNAME 1\000"
.LASF437:
	.ascii	"__CTYPE_CNTRL 0x20\000"
.LASF448:
	.ascii	"STRLEN(a) strlen((a))\000"
.LASF27:
	.ascii	"__ORDER_BIG_ENDIAN__ 4321\000"
.LASF71:
	.ascii	"__SHRT_MAX__ 0x7fff\000"
.LASF318:
	.ascii	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2\000"
.LASF591:
	.ascii	"C:\\Users\\Jon\\Documents\\jenkinsd2\\nrf52\\nrf52\\"
	.ascii	"SEGGER_RTT.c\000"
.LASF28:
	.ascii	"__ORDER_PDP_ENDIAN__ 3412\000"
.LASF422:
	.ascii	"RTT_CTRL_BG_BRIGHT_CYAN \"\033[4;46m\"\000"
.LASF54:
	.ascii	"__UINT_LEAST16_TYPE__ short unsigned int\000"
.LASF463:
	.ascii	"acID\000"
.LASF514:
	.ascii	"__RAL_locale_codeset_t\000"
.LASF517:
	.ascii	"codeset\000"
.LASF89:
	.ascii	"__INT32_MAX__ 0x7fffffffL\000"
.LASF507:
	.ascii	"__toupper\000"
.LASF188:
	.ascii	"__DEC128_EPSILON__ 1E-33DL\000"
.LASF280:
	.ascii	"__UQQ_FBIT__ 8\000"
.LASF285:
	.ascii	"__USQ_IBIT__ 0\000"
.LASF523:
	.ascii	"__RAL_global_locale\000"
.LASF209:
	.ascii	"__UFRACT_EPSILON__ 0x1P-16UR\000"
.LASF543:
	.ascii	"decode\000"
.LASF512:
	.ascii	"__wctomb\000"
.LASF282:
	.ascii	"__UHQ_FBIT__ 16\000"
.LASF43:
	.ascii	"__INT32_TYPE__ long int\000"
.LASF475:
	.ascii	"int_curr_symbol\000"
.LASF471:
	.ascii	"long int\000"
.LASF361:
	.ascii	"__ARM_FEATURE_IDIV 1\000"
.LASF564:
	.ascii	"SEGGER_RTT_ConfigUpBuffer\000"
.LASF483:
	.ascii	"frac_digits\000"
.LASF159:
	.ascii	"__LDBL_MAX_EXP__ 1024\000"
.LASF274:
	.ascii	"__SQ_FBIT__ 31\000"
.LASF212:
	.ascii	"__LFRACT_MIN__ (-0.5LR-0.5LR)\000"
.LASF185:
	.ascii	"__DEC128_MAX_EXP__ 6145\000"
.LASF431:
	.ascii	"__CODE \000"
.LASF107:
	.ascii	"__UINT_LEAST32_MAX__ 0xffffffffUL\000"
.LASF544:
	.ascii	"next\000"
.LASF345:
	.ascii	"__thumb__ 1\000"
.LASF168:
	.ascii	"__LDBL_HAS_QUIET_NAN__ 1\000"
.LASF41:
	.ascii	"__INT8_TYPE__ signed char\000"
.LASF77:
	.ascii	"__WINT_MAX__ 0xffffffffU\000"
.LASF589:
	.ascii	"_DoInit\000"
.LASF420:
	.ascii	"RTT_CTRL_BG_BRIGHT_BLUE \"\033[4;44m\"\000"
.LASF547:
	.ascii	"_aTerminalId\000"
.LASF278:
	.ascii	"__TQ_FBIT__ 127\000"
.LASF199:
	.ascii	"__USFRACT_EPSILON__ 0x1P-8UHR\000"
.LASF468:
	.ascii	"SEGGER_RTT_CB\000"
.LASF118:
	.ascii	"__UINT_FAST64_MAX__ 0xffffffffffffffffULL\000"
.LASF594:
	.ascii	"SEGGER_RTT_Init\000"
.LASF195:
	.ascii	"__USFRACT_FBIT__ 8\000"
.LASF102:
	.ascii	"__INT64_C(c) c ## LL\000"
.LASF272:
	.ascii	"__HQ_FBIT__ 15\000"
.LASF299:
	.ascii	"__UHA_IBIT__ 8\000"
.LASF526:
	.ascii	"__RAL_codeset_utf8\000"
.LASF75:
	.ascii	"__WCHAR_MAX__ 0xffffffffU\000"
.LASF18:
	.ascii	"__SIZEOF_LONG_LONG__ 8\000"
.LASF281:
	.ascii	"__UQQ_IBIT__ 0\000"
.LASF45:
	.ascii	"__UINT8_TYPE__ unsigned char\000"
.LASF450:
	.ascii	"MIN(a,b) (((a) < (b)) ? (a) : (b))\000"
.LASF67:
	.ascii	"__has_include(STR) __has_include__(STR)\000"
.LASF413:
	.ascii	"RTT_CTRL_BG_MAGENTA \"\033[24;45m\"\000"
.LASF322:
	.ascii	"__GCC_ATOMIC_LLONG_LOCK_FREE 1\000"
.LASF404:
	.ascii	"RTT_CTRL_TEXT_BRIGHT_BLUE \"\033[1;34m\"\000"
.LASF52:
	.ascii	"__INT_LEAST64_TYPE__ long long int\000"
.LASF480:
	.ascii	"positive_sign\000"
.LASF47:
	.ascii	"__UINT32_TYPE__ long unsigned int\000"
.LASF158:
	.ascii	"__LDBL_MIN_10_EXP__ (-307)\000"
.LASF515:
	.ascii	"name\000"
.LASF424:
	.ascii	"__string_H \000"
.LASF31:
	.ascii	"__SIZEOF_POINTER__ 4\000"
.LASF532:
	.ascii	"__RAL_data_utf8_period\000"
.LASF338:
	.ascii	"__ARM_FEATURE_SIMD32 1\000"
.LASF350:
	.ascii	"__VFP_FP__ 1\000"
.LASF403:
	.ascii	"RTT_CTRL_TEXT_BRIGHT_YELLOW \"\033[1;33m\"\000"
.LASF218:
	.ascii	"__ULFRACT_MAX__ 0XFFFFFFFFP-32ULR\000"
.LASF290:
	.ascii	"__HA_FBIT__ 7\000"
.LASF232:
	.ascii	"__SACCUM_MIN__ (-0X1P7HK-0X1P7HK)\000"
.LASF407:
	.ascii	"RTT_CTRL_TEXT_BRIGHT_WHITE \"\033[1;37m\"\000"
.LASF324:
	.ascii	"__GCC_ATOMIC_POINTER_LOCK_FREE 2\000"
.LASF110:
	.ascii	"__UINT64_C(c) c ## ULL\000"
.LASF385:
	.ascii	"SEGGER_RTT_HASDATA(n) (_SEGGER_RTT.aDown[n].WrOff -"
	.ascii	" _SEGGER_RTT.aDown[n].RdOff)\000"
.LASF254:
	.ascii	"__LACCUM_EPSILON__ 0x1P-31LK\000"
.LASF194:
	.ascii	"__SFRACT_EPSILON__ 0x1P-7HR\000"
.LASF379:
	.ascii	"BUFFER_SIZE_DOWN (16)\000"
.LASF467:
	.ascii	"sizetype\000"
.LASF284:
	.ascii	"__USQ_FBIT__ 32\000"
.LASF291:
	.ascii	"__HA_IBIT__ 8\000"
.LASF359:
	.ascii	"__ARM_EABI__ 1\000"
.LASF529:
	.ascii	"__RAL_c_locale_abbrev_day_names\000"
.LASF317:
	.ascii	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2\000"
.LASF1:
	.ascii	"__STDC_VERSION__ 199901L\000"
.LASF455:
	.ascii	"SizeOfBuffer\000"
.LASF559:
	.ascii	"SEGGER_RTT_SetNameDownBuffer\000"
.LASF136:
	.ascii	"__FLT_DENORM_MIN__ 1.1\000"
.LASF24:
	.ascii	"__CHAR_BIT__ 8\000"
.LASF417:
	.ascii	"RTT_CTRL_BG_BRIGHT_RED \"\033[4;41m\"\000"
.LASF204:
	.ascii	"__FRACT_EPSILON__ 0x1P-15R\000"
.LASF4:
	.ascii	"__STDC_HOSTED__ 1\000"
.LASF119:
	.ascii	"__INTPTR_MAX__ 0x7fffffff\000"
.LASF392:
	.ascii	"RTT_CTRL_TEXT_BLACK \"\033[2;30m\"\000"
.LASF578:
	.ascii	"SEGGER_RTT_Read\000"
.LASF149:
	.ascii	"__DBL_MIN__ ((double)1.1)\000"
.LASF577:
	.ascii	"pDst\000"
.LASF561:
	.ascii	"SEGGER_RTT_SetNameUpBuffer\000"
.LASF430:
	.ascii	"__RAL_PTRDIFF_T int\000"
.LASF478:
	.ascii	"mon_thousands_sep\000"
.LASF405:
	.ascii	"RTT_CTRL_TEXT_BRIGHT_MAGENTA \"\033[1;35m\"\000"
.LASF15:
	.ascii	"__FINITE_MATH_ONLY__ 0\000"
.LASF313:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1\000"
.LASF130:
	.ascii	"__FLT_MAX_EXP__ 128\000"
.LASF534:
	.ascii	"__RAL_data_utf8_space\000"
.LASF364:
	.ascii	"__GXX_TYPEINFO_EQUALITY_INLINE 0\000"
.LASF241:
	.ascii	"__ACCUM_IBIT__ 16\000"
.LASF505:
	.ascii	"unsigned char\000"
.LASF170:
	.ascii	"__DEC32_MIN_EXP__ (-94)\000"
.LASF37:
	.ascii	"__UINTMAX_TYPE__ long long unsigned int\000"
.LASF428:
	.ascii	"__RAL_SIZE_T unsigned\000"
.LASF528:
	.ascii	"__RAL_c_locale_day_names\000"
.LASF524:
	.ascii	"__RAL_c_locale\000"
.LASF65:
	.ascii	"__INTPTR_TYPE__ int\000"
.LASF358:
	.ascii	"__ARM_PCS_VFP 1\000"
.LASF124:
	.ascii	"__DEC_EVAL_METHOD__ 2\000"
.LASF248:
	.ascii	"__UACCUM_MAX__ 0XFFFFFFFFP-16UK\000"
.LASF237:
	.ascii	"__USACCUM_MIN__ 0.0UHK\000"
.LASF196:
	.ascii	"__USFRACT_IBIT__ 0\000"
.LASF473:
	.ascii	"thousands_sep\000"
.LASF554:
	.ascii	"Avail\000"
.LASF399:
	.ascii	"RTT_CTRL_TEXT_WHITE \"\033[2;37m\"\000"
.LASF63:
	.ascii	"__UINT_FAST32_TYPE__ unsigned int\000"
.LASF395:
	.ascii	"RTT_CTRL_TEXT_YELLOW \"\033[2;33m\"\000"
.LASF410:
	.ascii	"RTT_CTRL_BG_GREEN \"\033[24;42m\"\000"
.LASF165:
	.ascii	"__LDBL_DENORM_MIN__ 1.1\000"
.LASF421:
	.ascii	"RTT_CTRL_BG_BRIGHT_MAGENTA \"\033[4;45m\"\000"
.LASF447:
	.ascii	"NULL 0\000"
.LASF32:
	.ascii	"__SIZE_TYPE__ unsigned int\000"
.LASF502:
	.ascii	"time_format\000"
.LASF265:
	.ascii	"__ULLACCUM_FBIT__ 32\000"
.LASF391:
	.ascii	"RTT_CTRL_CLEAR \"\033[2J\"\000"
.LASF354:
	.ascii	"__ARM_NEON\000"
.LASF506:
	.ascii	"__isctype\000"
.LASF319:
	.ascii	"__GCC_ATOMIC_SHORT_LOCK_FREE 2\000"
.LASF8:
	.ascii	"__VERSION__ \"6.3.1 20170620 (release) [ARM/embedde"
	.ascii	"d-6-branch revision 249437]\"\000"
.LASF497:
	.ascii	"abbrev_day_names\000"
.LASF129:
	.ascii	"__FLT_MIN_10_EXP__ (-37)\000"
.LASF571:
	.ascii	"SEGGER_RTT_WriteString\000"
.LASF76:
	.ascii	"__WCHAR_MIN__ 0U\000"
.LASF153:
	.ascii	"__DBL_HAS_INFINITY__ 1\000"
.LASF148:
	.ascii	"__DBL_MAX__ ((double)1.1)\000"
.LASF59:
	.ascii	"__INT_FAST32_TYPE__ int\000"
.LASF316:
	.ascii	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2\000"
.LASF231:
	.ascii	"__SACCUM_IBIT__ 8\000"
.LASF139:
	.ascii	"__FLT_HAS_QUIET_NAN__ 1\000"
.LASF16:
	.ascii	"__SIZEOF_INT__ 4\000"
.LASF36:
	.ascii	"__INTMAX_TYPE__ long long int\000"
.LASF82:
	.ascii	"__INTMAX_C(c) c ## LL\000"
.LASF393:
	.ascii	"RTT_CTRL_TEXT_RED \"\033[2;31m\"\000"
.LASF344:
	.ascii	"__APCS_32__ 1\000"
.LASF402:
	.ascii	"RTT_CTRL_TEXT_BRIGHT_GREEN \"\033[1;32m\"\000"
.LASF48:
	.ascii	"__UINT64_TYPE__ long long unsigned int\000"
.LASF146:
	.ascii	"__DBL_MAX_10_EXP__ 308\000"
.LASF535:
	.ascii	"__RAL_data_utf8_plus\000"
.LASF416:
	.ascii	"RTT_CTRL_BG_BRIGHT_BLACK \"\033[4;40m\"\000"
.LASF540:
	.ascii	"short unsigned int\000"
.LASF315:
	.ascii	"__GCC_ATOMIC_CHAR_LOCK_FREE 2\000"
.LASF297:
	.ascii	"__TA_IBIT__ 64\000"
.LASF20:
	.ascii	"__SIZEOF_FLOAT__ 4\000"
.LASF570:
	.ascii	"SEGGER_RTT_GetKey\000"
.LASF465:
	.ascii	"MaxNumDownBuffers\000"
.LASF486:
	.ascii	"n_cs_precedes\000"
.LASF549:
	.ascii	"_acDownBuffer\000"
.LASF530:
	.ascii	"__RAL_c_locale_month_names\000"
.LASF128:
	.ascii	"__FLT_MIN_EXP__ (-125)\000"
.LASF423:
	.ascii	"RTT_CTRL_BG_BRIGHT_WHITE \"\033[4;47m\"\000"
.LASF436:
	.ascii	"__CTYPE_PUNCT 0x10\000"
.LASF187:
	.ascii	"__DEC128_MAX__ 9.999999999999999999999999999999999E"
	.ascii	"6144DL\000"
.LASF586:
	.ascii	"_WriteBlocking\000"
.LASF161:
	.ascii	"__DECIMAL_DIG__ 17\000"
.LASF539:
	.ascii	"__user_get_time_of_day\000"
.LASF388:
	.ascii	"SEGGER_RTT_MODE_BLOCK_IF_FIFO_FULL (2U)\000"
.LASF489:
	.ascii	"n_sign_posn\000"
.LASF160:
	.ascii	"__LDBL_MAX_10_EXP__ 308\000"
.LASF592:
	.ascii	"C:\\Users\\Jon\\Documents\\jenkinsd2\\nrf52\\nrf52\000"
.LASF120:
	.ascii	"__UINTPTR_MAX__ 0xffffffffU\000"
.LASF152:
	.ascii	"__DBL_HAS_DENORM__ 1\000"
.LASF387:
	.ascii	"SEGGER_RTT_MODE_NO_BLOCK_TRIM (1U)\000"
.LASF305:
	.ascii	"__UTA_IBIT__ 64\000"
.LASF469:
	.ascii	"__state\000"
.LASF213:
	.ascii	"__LFRACT_MAX__ 0X7FFFFFFFP-31LR\000"
.LASF13:
	.ascii	"__ATOMIC_ACQ_REL 4\000"
.LASF302:
	.ascii	"__UDA_FBIT__ 32\000"
.LASF263:
	.ascii	"__LLACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LLK\000"
.LASF415:
	.ascii	"RTT_CTRL_BG_WHITE \"\033[24;47m\"\000"
.LASF501:
	.ascii	"date_format\000"
.LASF99:
	.ascii	"__INT_LEAST32_MAX__ 0x7fffffffL\000"
.LASF162:
	.ascii	"__LDBL_MAX__ 1.1\000"
.LASF179:
	.ascii	"__DEC64_MIN__ 1E-383DD\000"
.LASF583:
	.ascii	"_WriteNoCheck\000"
.LASF520:
	.ascii	"__locale_s\000"
.LASF83:
	.ascii	"__UINTMAX_MAX__ 0xffffffffffffffffULL\000"
.LASF40:
	.ascii	"__SIG_ATOMIC_TYPE__ int\000"
.LASF445:
	.ascii	"__MAX_CATEGORY 5\000"
.LASF438:
	.ascii	"__CTYPE_BLANK 0x40\000"
.LASF222:
	.ascii	"__LLFRACT_MIN__ (-0.5LLR-0.5LLR)\000"
.LASF144:
	.ascii	"__DBL_MIN_10_EXP__ (-307)\000"
.LASF498:
	.ascii	"month_names\000"
.LASF484:
	.ascii	"p_cs_precedes\000"
.LASF545:
	.ascii	"__RAL_error_decoder_t\000"
.LASF166:
	.ascii	"__LDBL_HAS_DENORM__ 1\000"
.LASF132:
	.ascii	"__FLT_DECIMAL_DIG__ 9\000"
.LASF269:
	.ascii	"__ULLACCUM_EPSILON__ 0x1P-32ULLK\000"
.LASF176:
	.ascii	"__DEC64_MANT_DIG__ 16\000"
.LASF121:
	.ascii	"__GCC_IEC_559 0\000"
.LASF508:
	.ascii	"__tolower\000"
	.ident	"GCC: (GNU) 6.3.1 20170620 (release) [ARM/embedded-6-branch revision 249437]"
