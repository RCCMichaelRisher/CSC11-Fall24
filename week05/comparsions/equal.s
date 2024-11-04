@ EQ (equal) When Z is enabled (Z is 1)
@ NEQ (not equal). When Z is disabled. (Z is 0)
@ GE (greater or equal than, in two’s complement). When both V and N are enabled or disabled (V is N)
@ LT (lower than, in two’s complement). This is the opposite of GE, so when V and N are not both enabled or disabled (V is not N)
@ GT (greather than, in two’s complement). When Z is disabled and N and V are both enabled or disabled (Z is 0, N is V)
@ LE (lower or equal than, in two’s complement). When Z is enabled or if not that, N and V are both enabled or disabled 
@ 	(Z is 1. If Z is not 1 then N is V)
@ MI (minus/negative) When N is enabled (N is 1)
@ PL (plus/positive or zero) When N is disabled (N is 0)
@ VS (overflow set) When V is enabled (V is 1)
@ VC (overflow clear) When V is disabled (V is 0)
@ HI (higher) When C is enabled and Z is disabled (C is 1 and Z is 0)
@ LS (lower or same) When C is disabled or Z is enabled (C is 0 or Z is 1)
@ CS/HS (carry set/higher or same) When C is enabled (C is 1)
@ CC/LO (carry clear/lower) When C is disabled (C is 0)

.global _start

.section .data

.text
_start:
    mov r0, #10
    mov r1, #10

    cmp r0, r1
    moveq r0, #100
    movne r0, #200

    mov r7, #1
    swi 0

    