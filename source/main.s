.section .init
	.globl _start
_start:

ldr r0,=0x20200000

//Setting the GPIO mode for pin 16 (10 + 6 -> 6*3 = 16)
mov r1,#1
lsl r1,#18
str r1,[r0,#4]

loop$:

ldr r3,[r0,#52]
mov r4,#1
lsl r4,#17

and r5,r3,r4
cmp r5,#0
bne turnon$

turnoff$:
mov r1,#1
lsl r1,#16
str r1,[r0,#40]
b endloop$

turnon$:
mov r1,#1
lsl r1,#16
str r1,[r0,#28]

endloop$:
b loop$
