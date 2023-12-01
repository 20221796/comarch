.text
.global fib
.type fib, STT_FUNC

fib:
    SUB SP, SP, #16     // 스택에 2개의 아이템을 위한 공간을 확보
    STUR X30, [SP, #8]    // 복귀 주소를 저장
    STUR X0, [SP, #0]    // 인수 n을 저장

    SUBS XZR, X0, #1    // n < 1을 확인
    B.GE L1              // n >= 1이면 L1로 점프

    ADD X1, XZR, XZR
    ADD X1, X1, #0   // 결과값 레지스터에 0을 저장
    
    ADD SP, SP, #16     // 스택에서 2개의 아이템을 제거
    BR X30                // 호출자로 복귀

L1:
    SUBS XZR, X0, #2    // n < 2을 확인
    B.GE L2              // n >= 2이면 L2로 점프

    ADD X1, XZR, XZR
    ADD X1, X1, #1     // 결과값 레지스터에 1을 저장
    ADD SP, SP, #16     // 스택에서 2개의 아이템을 제거
    BR X30                // 호출자로 복귀

L2:
    SUB X0, X0, #1      // n을 감소시킴
    BL fib               // fib(n - 1)을 호출
    MOV X2, X1           // X2에 fib(n - 1)을 저장

    LDUR X0, [SP, #0]    // 복귀 주소를 복구
    SUB X0, X0, #1      // n을 다시 감소시킴
    BL fib               // fib(n - 2)을 호출

    ADD X1, X1, X2       // fib(n - 1) + fib(n - 2)를 계산하여 결과값 레지스터에 저장

    LDUR X30, [SP, #8]    // 복귀 주소를 복구
    ADD SP, SP, #16     // 스택에서 2개의 아이템을 제거
    BR X30                // 호출자로 복귀
