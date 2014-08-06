.globl GetGPIOAddress
GetGPIOAddress:
push {lr}
ldr r0,=0x20200000
pop {pc}

.globl SetGPIOFunction
SetGPIOFunction:
	push {lr}
	mov r2,r0

	pinVal .req r1
	pinNumber .req r2

	cmp pinNumber,#53
	cmpls pinVal,#7
	pophi {pc}

	bl GetGPIOAddress
	mov r3,r0
	address .req r3

	loop$:
		cmp pinNumber,#9
		subhi pinNumber,#10
		addhi address,#4
		bhi loop$

	add pinNumber,pinNumber,lsl #1 //Multiply pin number by 3
	lsl pinVal,pinNumber
	str pinVal,[address]

	.unreq pinVal
	.unreq pinNumber
	.unreq address

	pop {pc}

.globl SetGPIOValue
SetGPIOValue:
	push {lr}

	mov r2,r0

	pinNumber .req r2
	pinVal .req r1
	
	cmp pinNumber,#53
	pophi {pc}

	bl GetGPIOAddress
	address .req r0

	cmp pinVal,#0
	addhi address,#40
	bhi set$

	add address,#28

	set$:
		mov r4,#1
		lsl r4,pinNumber
		str r4,[address]

		.unreq pinVal
		.unreq pinNumber
		.unreq address

		pop {pc}
