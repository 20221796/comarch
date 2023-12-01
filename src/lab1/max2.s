.text
.global max
.type max, STT_FUNC

;ADDI X11, XZR, #1
;again: LDXR X10, [X20, #0]
;CBNZ X10, again
;STXR R9, X11, [X20]
;CBNZ R9, again
;STUR XZR, [X20, #0]

max:
	sub  sp, sp, #48
	stur x19, [sp, #0]
	stur x20, [sp, #8]
	stur x21, [sp, #16]
	stur x22, [sp, #24]
	stur x23, [sp, #32]
	stur x24, [sp, #40]

	add x19, xzr, xzr
	ldr x22, [x2, x19, LSL #3]
	str x22, [x1]

mwhile:
	cmp x3, x19
	b.le mexit
	ldr x24, [x0]
	cbnz x24, mwhile
	addi x24, xzr, #1
	stxr x23, x24, [x0]  
	cbnz x23, mwhile
	ldr x23, [x2, x19, LSL #3]
	ldr x22, [x1]
	cmp x23, x22
	b.le continue
	str x23, [x1]
continue:
	stur xzr, [x0]  
	add x19, x19, #1
	b mwhile

mexit:
	ldur x24, [sp, #40]
	ldur x23, [sp, #32]
	ldur x22, [sp, #24]
	ldur x21, [sp, #16]
	ldur x20, [sp, #8]
	ldur x19, [sp, #0]
	add sp, sp, #48
	br x30

.end
