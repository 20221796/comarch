.text
.global max
.type max, STT_FUNC

max:
	sub  sp, sp, #40
	stur x19, [sp, #0]
	stur x20, [sp, #8]
	stur x21, [sp, #16]
	stur x22, [sp, #24]
	stur x23, [sp, #32]

	add x19, xzr, xzr
	ldr x22, [x1, x19, LSL #3]
	str x22, [x0]

mwhile:
	cmp x2, x19
	b.le mexit

again: 
	// lock 획득
	ldxr x10, [x0]
	cbnz x10, again
	add x11, xzr, xzr
	add x11, x11, #1 //add x11, xzr, #1 하면 오류뜸
	stxr w9, x11, [x0]
	cbnz w9, again

	ldr x23, [x1, x19, LSL #3]
	ldr x22, [x0]
	cmp x23, x22
	b.le release_lock
	str x23, [x0]

release_lock:
	// lock 해제
	stur xzr, [x0, #0]

	add x19, x19, #1
	b mwhile

mexit:
	ldur x23, [sp, #32]
	ldur x22, [sp, #24]
	ldur x21, [sp, #16]
	ldur x20, [sp, #8]
	ldur x19, [sp, #0]
	add sp, sp, #40
	br x30
.end
