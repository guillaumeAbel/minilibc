%include "include.inc"

section .text
global strstr

strstr:
    mov RAX, RDI
    cmp byte [RSI], 0x00
    je end
.loop:
    cmp byte [RAX], 0x00
    je .retNull
    xor RCX, RCX
.iterate:
    cmp byte [RSI + RCX], 0x00
    je end
    cmp byte [RAX + RCX], 0x00
    je .notEqual
    mov R8B, [RSI + RCX]
    cmp byte [RAX + RCX], R8B
    jne .notEqual
    inc RCX
    jmp .iterate
.notEqual:
    inc RAX
    jmp .loop

.retNull:
    xor RAX, RAX
    ret