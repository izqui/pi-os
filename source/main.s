.section .init
	.globl _start
_start:

b main

main:

mov sp,#0x8000

pinNum .req r0
pinVal .req r1
mov pinNum,#16
mov pinVal,#1
bl SetGPIOFunction 
.unreq pinNum
.unreq pinVal

pinNum .req r0
pinVal .req r1
mov pinNum,#16
mov pinVal,#1
bl SetGPIOValue
.unreq pinNum
.unreq pinVal
