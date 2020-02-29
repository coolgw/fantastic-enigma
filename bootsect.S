.text
.globl start
.code16

start:
    jmp start

.org 0x1fe, 0x90
.word 0xaa55
