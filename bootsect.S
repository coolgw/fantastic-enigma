.text
.globl start
.code16

start:
    jmp code

msg:
    .string "123456789god come\x0"

code:
    movw $0xb800, %ax
    movw %ax,     %es
    xorw %ax,     %ax
    movw %ax,     %ds

    movw $msg, %si
    xorw %di,  %di
    cld
    movb $0x07, %al
1:
    cmp $0, (%si)
    je 1f  #1f means find label 1 after this instruction
    movsb
    stosb
    jmp 1b
1:  jmp 1b

.org 0x1fe, 0x90
.word 0xaa55
