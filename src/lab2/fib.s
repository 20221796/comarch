.text
.global fib
.type fib, STT_FUNC

fib:
    sub sp, sp, #32
    stur x30, [sp, #24]
    stur x29, [sp, #16]
    add x29, sp, #0
    stur x19, [sp, #8]
    stur x0, [sp, #0]

    subs xzr, x0, #0
    b.ne L1
    mov x0, xzr
    b L3

L1:
    ldur x0, [sp, #0]
    subs xzr, x0, #1
    b.ne L2
    mov x0, #1
    b L3

L2:
    ldur x0, [sp, #0]
    sub x0, x0, #1
    bl fib
    mov x19, x0

    ldur x0, [sp, #0]
    sub x0, x0, #2
    bl fib

    add x0, x0, x19

L3:
    ldur x19, [sp, #8]
    ldur x30, [sp, #24]
    ldur x29, [sp, #16]
    add sp, sp, #32
    ret
