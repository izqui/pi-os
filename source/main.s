.section .init
.globl _start
_start:

ldr r0,=0x20200000 // Set a pointer to the address in memory which handles GPIO to r0, the general porpuse register in the processor.

// Enabling output to the 16th GPIO pin 
mov r1,#1 // Move 1 to register r1
lsl r1,#18 // Do a left shift logical 18 so 1 turns into 1000000000000000000 
str r1,[r0,#4] // Store the value of r1 in the address given by r0 

//Turn pin off, which is the same as turning the LED on
mov r1,#1
lsl r1,#16
str r1,[r0,#40]

loop$: 
b loop$