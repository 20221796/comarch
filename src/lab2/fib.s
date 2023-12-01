.text
.global fib
.type fib, STT_FUNC

fib:
    SUB SP, SP, #48               // 스택에 6개의 아이템을 위한 공간을 확보
    STUR X30, [SP, #40]           // X30을 저장 (Link Register)
    STUR X29, [SP, #32]           // X29을 저장 (Frame Pointer)
    ADD X29, SP, #0               // X29 (Frame Pointer)를 갱신
    STUR X19, [SP, #16]           // X19를 저장
    STUR X0, [SP, #0]             // 인수 n을 저장

    LDUR X0, [SP, #0]             // 인수 n을 X0로 로드
    CMP X0, #0                    // n == 0을 확인
    B.NE L1                       // n != 0이면 L1로 점프
    MOV X0, XZR                   // 결과값 레지스터에 0을 저장
    B L3                          // L3로 점프

L1:
    LDUR X0, [SP, #0]             // 인수 n을 X0로 로드
    CMP X0, #1                    // n == 1을 확인
    B.NE L2                       // n != 1이면 L2로 점프
    MOV X0, #1                    // 결과값 레지스터에 1을 저장
    B L3                          // L3로 점프

L2:
    LDUR X0, [SP, #0]             // 인수 n을 X0로 로드
    SUB X0, X0, #1                // n을 감소시킴
    BL fib                        // fib(n - 1)을 호출
    MOV X19, X0                   // X19에 fib(n - 1)을 저장

    LDUR X0, [SP, #0]             // 인수 n을 X0로 로드
    SUB X0, X0, #2                // n을 다시 감소시킴
    BL fib                        // fib(n - 2)을 호출

    ADD X0, X0, X19               // fib(n - 1) + fib(n - 2)를 계산하여 결과값 레지스터에 저장

L3:
    LDUR X19, [SP, #16]           // X19를 복구
    LDUR X30, [SP, #40]           // X30를 복구 (Link Register)
    LDUR X29, [SP, #32]           // X29를 복구 (Frame Pointer)
    ADD SP, SP, #48               // 스택에서 6개의 아이템을 제거
    RET                           // 호출자로 복귀
