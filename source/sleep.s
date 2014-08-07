GetTimestamp:
	push {lr}
	ldr r3,=0x20003000
	ldrd r0,r1,[r3,#4]
	pop {pc}

.globl Sleep
Sleep:
	push {lr}
	target .req r2
	mov target,r0

	bl GetTimestamp
	time .req r0
			
	add target,time

	check$:
		bl GetTimestamp
		cmp time,target
		ble check$

	.unreq time
	.unreq target

	pop {pc}