%include "include.inc"

section .text
global strchr

strchr:
    mov RAX, RDI
.loop:
    cmp byte [RAX], SIL
    je end
    cmp byte [RAX], 0x00
    je end
    inc RAX
    jmp .loop