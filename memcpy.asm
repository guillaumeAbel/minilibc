%include "include.inc"

section .text
global memcpy

memcpy:
    xor RCX, RCX
    mov RAX, RDI
.loop:
    cmp RCX, RDX
    je end
    mov byte R8B, [RSI + RCX]
    mov byte [RAX + RCX], R8B
    inc RCX
    jmp .loop