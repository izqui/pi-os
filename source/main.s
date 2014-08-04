.section .init
	.globl _start
_start:
/*
ldr r0,=0x20200000 // Set a pointer to the address in memory which handles GPIO to r0, the general porpuse register in the processor.

// Enabling output to the 16th GPIO pin 
mov r1,#1 // Move 1 to register r1
lsl r1,#21 // Do a left shift logical 18 so 1 turns into 1000000000000000000 
str r1,[r0,#4] // Store the value of r1 in the address given by r0 

//PIN 16
mov r1,#1
lsl r1,#17

turnon$:
str r1,[r0,#40] //ON

//Wait by having a big number and substracting 1 from it until it is 0
mov r2,#0x3F0000
wait1$:
sub r2,#1
cmp r2,#0
bne wait1$

str r1,[r0,#28] //OFF

mov r2,#0xFF0000
wait2$:
sub r2,#1
cmp r2,#0
bne wait2$

b turnon$
*/

ldr r0,=0x20200000

mov r1,#1
lsl r1,#21
str r1,[r0,#4]

loop$:
ldr in,[r0]

mov r1,#1
lsl r1,#17
str r1,[r0,#28]

b loop$