%include "include.asm"

section .text
global strcspn

strcspn:
    xor RAX, RAX
.loop:
    cmp byte RDI, 0x00