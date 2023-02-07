%include "include.inc"

section .text
global strncmp

strncmp:
    xor RCX, RCX
.loop:
    cmp RCX, RDX
    je .ret0
    mov R8B, [RSI + RCX]
    cmp byte [RDI + RCX], R8B
    jl .ret1
    mov R8B, [RDI + RCX]
    cmp byte [RSI + RCX], R8B
    jl .retneg1
    cmp byte [RDI + RCX], 0x00
    je .ret0
    inc RCX
    jmp .loop

.retneg1:
    mov RAX, -1
    ret
.ret0:
    mov RAX, 0
    ret
.ret1:
    mov RAX, 1
    ret