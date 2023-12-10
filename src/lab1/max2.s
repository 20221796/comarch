.text
.global max
.type max, STT_FUNC

max:
	sub sp, sp, #56
	stur x19, [sp, #0]
	stur x20, [sp, #8]
	stur x21, [sp, #16]
	stur x22, [sp, #24]
	stur x23, [sp, #32]
	stur x24, [sp, #40]
	stur x25, [sp, #48]

	mov x19, x0             
	mov x20, x1             
	mov x21, x2             
	mov x22, x3             
	mov x23, xzr            

lock:
	ldaxr x24, [x19]
	cbnz x24, lock
	mov x24, #1
	stlxr w24, w24, [x19]
	cbnz w24, lock //컴파일하면 r24 사용 불가라고 떠서 w24로 변경

mwhile:
	cmp x22, x23
	b.le free
	ldr x24, [x21, x23, LSL #3]
	ldr x25, [x20]
	cmp x24, x25
	b.le continue
	str x24, [x20]
continue:
	add x23, x23, #1
	b mwhile

free:
	mov x24, xzr
	stlr x24, [x19]

cexit:
	ldur x25, [sp, #48]
	ldur x24, [sp, #40]
	ldur x23, [sp, #32]
	ldur x22, [sp, #24]
	ldur x21, [sp, #16]
	ldur x20, [sp, #8]
	ldur x19, [sp, #0]
	add sp, sp, #56
	br x30

.end
