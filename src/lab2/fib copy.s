.text
.global fib
.type fib, STT_FUNC

fib:
    sub sp, sp, #32               // 스택에 4개의 아이템을 위한 공간을 확보
    stur x30, [sp, #24]           // x30을 저장 (Link Register)
    stur x29, [sp, #16]           // x29을 저장 (Frame Pointer)
    add x29, sp, #0               // x29 (Frame Pointer)를 갱신
    stur x19, [sp, #8]            // x19를 저장
    stur x0, [sp, #0]             // 인수 n을 저장

    subs xzr, x0, #0              // n == 0을 확인
    b.ne L1                       // n != 0이면 L1로 점프
    mov x0, xzr                   // 결과값 레지스터에 0을 저장
    b L3                          // L3로 점프

L1:
    ldur x0, [sp, #0]             // 인수 n을 x0로 로드
    subs xzr, x0, #1              // n == 1을 확인
    b.ne L2                       // n != 1이면 L2로 점프
    mov x0, #1                    // 결과값 레지스터에 1을 저장
    b L3                          // L3로 점프

L2:
    ldur x0, [sp, #0]             // 인수 n을 x0로 로드
    sub x0, x0, #1                // n을 감소시킴
    bl fib                        // fib(n - 1)을 호출
    mov x19, x0                   // x19에 fib(n - 1)을 저장

    ldur x0, [sp, #0]             // 인수 n을 x0로 로드
    sub x0, x0, #2                // n을 다시 감소시킴
    bl fib                        // fib(n - 2)을 호출

    add x0, x0, x19               // fib(n - 1) + fib(n - 2)를 계산하여 결과값 레지스터에 저장

L3:
    ldur x19, [sp, #8]            // x19를 복구
    ldur x30, [sp, #24]           // x30를 복구 (Link Register)
    ldur x29, [sp, #16]           // x29를 복구 (Frame Pointer)
    add sp, sp, #32               // 스택에서 4개의 아이템을 제거
    ret                           // 호출자로 복귀
