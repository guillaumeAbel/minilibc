%include "include.inc"

section .text
global strlen

strlen:
    xor RAX, RAX
.loop:
    cmp byte [RDI], 0x00
    je end
    inc RAX
    inc RDI
    jmp .loop