	.arch armv6
	.eabi_attribute 27, 3
	.eabi_attribute 28, 1
	.fpu vfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"pipelined.c"
	.global	z_table
	.data
	.align	2
	.type	z_table, %object
	.size	z_table, 60
z_table:
	.word	25735
	.word	15192
	.word	8027
	.word	4074
	.word	2045
	.word	1023
	.word	511
	.word	255
	.word	127
	.word	63
	.word	31
	.word	15
	.word	7
	.word	3
	.word	1
	.comm	op_z_table,32,4
	.text
	.align	2
	.global	cordic_V_fixed_point
	.type	cordic_V_fixed_point, %function
cordic_V_fixed_point:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp}
	add	fp, sp, #24
	sub	sp, sp, #20
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	str	r2, [fp, #-40]
	ldr	r3, [fp, #-32]
	ldr	r5, [r3]
	ldr	r3, [fp, #-36]
	ldr	r4, [r3]
	mov	r6, #0
	ldr	r3, .L8
	ldr	r8, [r3]
	mov	r7, #0
	b	.L2
.L5:
	cmp	r4, #0
	ble	.L3
	mov	r3, r4, asr r7
	add	r9, r3, r5
	mov	r3, r5, asr r7
	rsb	r4, r3, r4
	add	r6, r6, r8
	b	.L4
.L3:
	mov	r3, r4, asr r7
	rsb	r9, r3, r5
	mov	r3, r5, asr r7
	add	r4, r4, r3
	rsb	r6, r8, r6
.L4:
	add	r3, r7, #1
	ldr	r2, .L8
	ldr	r8, [r2, r3, asl #2]
	mov	r5, r9
	add	r7, r7, #1
.L2:
	cmp	r7, #13
	ble	.L5
	cmp	r4, #0
	ble	.L6
	mov	r3, r4, asr #14
	add	r5, r5, r3
	mov	r3, r5, asr #14
	rsb	r4, r3, r4
	add	r6, r6, r8
	b	.L7
.L6:
	mov	r3, r4, asr #14
	rsb	r5, r3, r5
	mov	r3, r5, asr #14
	add	r4, r4, r3
	rsb	r6, r8, r6
.L7:
	ldr	r3, [fp, #-32]
	str	r5, [r3]
	ldr	r3, [fp, #-36]
	str	r4, [r3]
	ldr	r3, [fp, #-40]
	str	r6, [r3]
	sub	sp, fp, #24
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, fp}
	bx	lr
.L9:
	.align	2
.L8:
	.word	z_table
	.size	cordic_V_fixed_point, .-cordic_V_fixed_point
	.section	.rodata
	.align	2
.LC0:
	.ascii	"results.txt\000"
	.align	2
.LC1:
	.ascii	"a\000"
	.align	2
.LC2:
	.ascii	"Could not create output file. Printing results to c"
	.ascii	"onsole...\012\000"
	.align	2
.LC3:
	.ascii	"x_i_init = %5i\011x_d_init = %f\012\000"
	.align	2
.LC4:
	.ascii	"y_i_init = %5i\011y_d_init = %f\012\000"
	.align	2
.LC5:
	.ascii	"z_i_init = %5i\011z_d_init = %f (rad)\012\012\000"
	.align	2
.LC6:
	.ascii	"x_i_calc = %5i\011x_d_calc = %f\012\000"
	.align	2
.LC7:
	.ascii	"y_i_calc = %5i\011y_d_calc = %f\012\000"
	.align	2
.LC8:
	.ascii	"z_i_calc = %5i\011z_d_calc = %f (rad)\012\012\000"
	.align	2
.LC9:
	.ascii	"Modulus = SQRT(x_d_init^2 + y_d_init^2) = %f\012\000"
	.text
	.align	2
	.global	verify
	.type	verify, %function
verify:
	@ args = 8, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #80
	str	r0, [fp, #-64]
	str	r1, [fp, #-68]
	str	r2, [fp, #-72]
	str	r3, [fp, #-76]
	ldr	r3, [fp, #-64]
	fmsr	s15, r3	@ int
	fsitod	d7, s15
	fldd	d6, .L13
	fdivd	d7, d7, d6
	fstd	d7, [fp, #-12]
	ldr	r3, [fp, #-68]
	fmsr	s15, r3	@ int
	fsitod	d7, s15
	fldd	d6, .L13
	fdivd	d7, d7, d6
	fstd	d7, [fp, #-20]
	ldr	r3, [fp, #-72]
	fmsr	s15, r3	@ int
	fsitod	d7, s15
	fldd	d6, .L13
	fdivd	d7, d7, d6
	fstd	d7, [fp, #-28]
	ldr	r3, [fp, #-76]
	fmsr	s15, r3	@ int
	fsitod	d7, s15
	fldd	d6, .L13
	fdivd	d7, d7, d6
	fldd	d6, .L13+8
	fmuld	d7, d7, d6
	fstd	d7, [fp, #-36]
	ldr	r3, [fp, #4]
	fmsr	s15, r3	@ int
	fsitod	d7, s15
	fldd	d6, .L13
	fdivd	d7, d7, d6
	fldd	d6, .L13+8
	fmuld	d7, d7, d6
	fstd	d7, [fp, #-44]
	ldr	r3, [fp, #8]
	fmsr	s15, r3	@ int
	fsitod	d7, s15
	fldd	d6, .L13
	fdivd	d7, d7, d6
	fstd	d7, [fp, #-52]
	ldr	r0, .L13+16
	ldr	r1, .L13+20
	bl	fopen
	str	r0, [fp, #-56]
	ldr	r3, [fp, #-56]
	cmp	r3, #0
	bne	.L11
	ldr	r0, .L13+24
	bl	puts
	ldr	r0, .L13+28
	ldr	r1, [fp, #-64]
	ldrd	r2, [fp, #-12]
	bl	printf
	ldr	r0, .L13+32
	ldr	r1, [fp, #-68]
	ldrd	r2, [fp, #-20]
	bl	printf
	ldr	r0, .L13+36
	ldr	r1, [fp, #-72]
	ldrd	r2, [fp, #-28]
	bl	printf
	ldr	r0, .L13+40
	ldr	r1, [fp, #-76]
	ldrd	r2, [fp, #-36]
	bl	printf
	ldr	r0, .L13+44
	ldr	r1, [fp, #4]
	ldrd	r2, [fp, #-44]
	bl	printf
	ldr	r0, .L13+48
	ldr	r1, [fp, #8]
	ldrd	r2, [fp, #-52]
	bl	printf
	fldd	d6, [fp, #-12]
	fldd	d7, [fp, #-12]
	fmuld	d6, d6, d7
	fldd	d5, [fp, #-20]
	fldd	d7, [fp, #-20]
	fmuld	d7, d5, d7
	faddd	d7, d6, d7
	fcpyd	d0, d7
	bl	sqrt
	fmrrd	r2, r3, d0
	ldr	r0, .L13+52
	bl	printf
	b	.L12
.L11:
	ldrd	r2, [fp, #-12]
	strd	r2, [sp]
	ldr	r0, [fp, #-56]
	ldr	r1, .L13+28
	ldr	r2, [fp, #-64]
	bl	fprintf
	ldrd	r2, [fp, #-20]
	strd	r2, [sp]
	ldr	r0, [fp, #-56]
	ldr	r1, .L13+32
	ldr	r2, [fp, #-68]
	bl	fprintf
	ldrd	r2, [fp, #-28]
	strd	r2, [sp]
	ldr	r0, [fp, #-56]
	ldr	r1, .L13+36
	ldr	r2, [fp, #-72]
	bl	fprintf
	ldrd	r2, [fp, #-36]
	strd	r2, [sp]
	ldr	r0, [fp, #-56]
	ldr	r1, .L13+40
	ldr	r2, [fp, #-76]
	bl	fprintf
	ldrd	r2, [fp, #-44]
	strd	r2, [sp]
	ldr	r0, [fp, #-56]
	ldr	r1, .L13+44
	ldr	r2, [fp, #4]
	bl	fprintf
	ldrd	r2, [fp, #-52]
	strd	r2, [sp]
	ldr	r0, [fp, #-56]
	ldr	r1, .L13+48
	ldr	r2, [fp, #8]
	bl	fprintf
	fldd	d6, [fp, #-12]
	fldd	d7, [fp, #-12]
	fmuld	d6, d6, d7
	fldd	d5, [fp, #-20]
	fldd	d7, [fp, #-20]
	fmuld	d7, d5, d7
	faddd	d7, d6, d7
	fcpyd	d0, d7
	bl	sqrt
	fmrrd	r2, r3, d0
	ldr	r0, [fp, #-56]
	ldr	r1, .L13+52
	bl	fprintf
.L12:
	ldr	r0, [fp, #-56]
	bl	fclose
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, pc}
.L14:
	.align	3
.L13:
	.word	0
	.word	1088421888
	.word	-1257819312
	.word	1071869597
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.size	verify, .-verify
	.section	.rodata
	.align	2
.LC10:
	.ascii	"Expected 1 argument, %d given\012\012\000"
	.align	2
.LC11:
	.ascii	"Usage: cordic_main.exe <input_file>  , where input_"
	.ascii	"file is the name of a text file, comma delimited,\012"
	.ascii	"where each row has a value for x,y,z\012\000"
	.align	2
.LC12:
	.ascii	"r\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 304
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #312
	str	r0, [fp, #-304]
	str	r1, [fp, #-308]
	mov	r3, #44
	strh	r3, [fp, #-40]	@ movhi
	ldr	r3, [fp, #-304]
	cmp	r3, #1
	bgt	.L16
	ldr	r0, .L21
	ldr	r1, [fp, #-304]
	bl	printf
	ldr	r0, .L21+4
	bl	puts
	mov	r0, #0
	bl	exit
.L16:
	ldr	r3, [fp, #-308]
	add	r3, r3, #4
	ldr	r3, [r3]
	mov	r0, r3
	ldr	r1, .L21+8
	bl	fopen
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L17
	ldr	r3, [fp, #-308]
	add	r3, r3, #4
	ldr	r3, [r3]
	mov	r0, r3
	bl	perror
	mov	r0, #1
	bl	exit
.L17:
	b	.L18
.L19:
	sub	r2, fp, #296
	sub	r3, fp, #40
	mov	r0, r2
	mov	r1, r3
	bl	strtok
	str	r0, [fp, #-12]
	ldr	r0, [fp, #-12]
	mov	r1, #0
	mov	r2, #10
	bl	strtol
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-28]
	sub	r3, fp, #40
	mov	r0, #0
	mov	r1, r3
	bl	strtok
	str	r0, [fp, #-12]
	ldr	r0, [fp, #-12]
	mov	r1, #0
	mov	r2, #10
	bl	strtol
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-32]
	sub	r3, fp, #40
	mov	r0, #0
	mov	r1, r3
	bl	strtok
	str	r0, [fp, #-12]
	ldr	r0, [fp, #-12]
	mov	r1, #0
	mov	r2, #10
	bl	strtol
	str	r0, [fp, #-24]
	sub	r1, fp, #28
	sub	r2, fp, #32
	sub	r3, fp, #36
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	cordic_V_fixed_point
	ldr	ip, [fp, #-28]
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-36]
	str	r2, [sp]
	str	r3, [sp, #4]
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-20]
	ldr	r2, [fp, #-24]
	mov	r3, ip
	bl	verify
.L18:
	sub	r3, fp, #296
	mov	r0, r3
	mov	r1, #256
	ldr	r2, [fp, #-8]
	bl	fgets
	mov	r3, r0
	cmp	r3, #0
	bne	.L19
	ldr	r0, [fp, #-8]
	bl	fclose
	mov	r0, r0	@ nop
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, pc}
.L22:
	.align	2
.L21:
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.size	main, .-main
	.ident	"GCC: (Raspbian 4.9.2-10) 4.9.2"
	.section	.note.GNU-stack,"",%progbits
