%include "include.inc"

section .text
global memset

memset:
    xor RCX, RCX
    mov RAX, RDI
.loop:
    cmp RCX, RDX
    je end
    mov byte [RAX + RCX], SIL
    inc RCX
    jmp .loop