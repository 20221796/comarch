.text
.global isEven
.type isEven, STT_FUNC

isEven:
    mov x1, x0
    mov x0, #0
    mov x2, #0

loop:
    and x3, x1, #1
    add x0, x0, x3
    lsr x1, x1, #1
    cbnz x1, loop

    and x0, x0, #1
    eor x0, x0, #1
    ret
