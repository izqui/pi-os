.section .init
	.globl _start
_start:

b main

.section .text
main:

mov sp,#0x8000

pinNum .req r0
pinVal .req r1
mov pinNum,#16
mov pinVal,#1
bl SetGPIOFunction 
.unreq pinNum
.unreq pinVal

start$:

	pinNum .req r0
	pinVal .req r1
	mov pinNum,#16
	mov pinVal,#1
	bl SetGPIOValue
	.unreq pinNum
	.unreq pinVal

	time .req r0
	ldr time,=1000000
	bl Sleep
	.unreq time

	pinNum .req r0
	pinVal .req r1
	mov pinNum,#16
	mov pinVal,#0
	bl SetGPIOValue
	.unreq pinNum
	.unreq pinVal

	time .req r0
	ldr time,=1000000
	bl Sleep
	.unreq time

	b start$