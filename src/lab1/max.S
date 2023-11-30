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
	ldr x23, [x1, x19, LSL #3]
	ldr x22, [x0]
	cmp x23, x22
	b.le increase_counter
	str x23, [x0]
increase_counter:
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
