.text
.global copyarray
.type copyarray,STT_FUNC

copyarray:
	sub  sp, sp, #32
	stur x19, [sp,#0]
 	stur x20, [sp,#8] 
	stur x21, [sp,#16]
	stur x22, [sp,#24]
	add  x19, xzr, xzr 

cwhile:
	cmp x2, x19
	b.le cexit
  	lsl x20, x19, #3
	add x21, x0, x20
	ldur x22, [x21,#0]
	add x21, x1, x20
	stur x22, [x21,#0]
	add x19, x19, #1
	b cwhile

cexit:
	ldur x22, [sp,#24]	
	ldur x21, [sp,#16]
	ldur x20, [sp,#8]
	ldur x19, [sp,#0]
	add sp, sp, #32
	br  x30	
		
.end	
