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
	.eabi_attribute 30, 1
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"pipelined.c"
	.text
	.align	2
	.global	cordic_V_fixed_point
	.type	cordic_V_fixed_point, %function
cordic_V_fixed_point:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	mov r11, #0
	ldr	lr, [r0]
	ldr	ip, [r1]
	ldr	r5, .L9
	ldr	r6, [r5]
	mov	r3, #0
	mov	r4, r3
.L4:
	cmp	ip, r11
	addgt	r7, lr, ip, asr r3
	subgt	ip, ip, lr, asr r3
	addgt	r4, r4, r6
	suble	r7, lr, ip, asr r3
	addle	ip, ip, lr, asr r3
	rsble	r4, r6, r4
	mov	lr, r7
	add	r3, r3, #1
	ldr	r6, [r5, #4]!
	cmp	r3, #14
	bne	.L4
	cmp	ip, r11
	addgt	lr, r7, ip, asr #14
	subgt	ip, ip, lr, asr #14
	addgt	r4, r6, r4
	suble	lr, lr, ip, asr #14
	addle	ip, ip, lr, asr #14
	rsble	r4, r6, r4
	str	lr, [r0]
	str	ip, [r1]
	str	r4, [r2]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L10:
	.align	2
.L9:
	.word	.LANCHOR0
	.size	cordic_V_fixed_point, .-cordic_V_fixed_point
	.align	2
	.global	verify
	.type	verify, %function
verify:
	@ args = 8, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	fstmfdd	sp!, {d8, d9, d10, d11, d12, d13}
	sub	sp, sp, #24
	str	r0, [sp, #8]
	str	r1, [sp, #12]
	str	r2, [sp, #16]
	str	r3, [sp, #20]
	fmsr	s15, r0	@ int
	fsitod	d9, s15
	fldd	d7, .L17
	fmuld	d9, d9, d7
	fmsr	s13, r1	@ int
	fsitod	d8, s13
	fmuld	d8, d8, d7
	fmsr	s13, r2	@ int
	fsitod	d12, s13
	fmuld	d12, d12, d7
	fmsr	s13, r3	@ int
	fsitod	d10, s13
	fmuld	d10, d10, d7
	fldd	d13, .L17+8
	fmuld	d10, d10, d13
	flds	s13, [sp, #80]	@ int
	fsitod	d6, s13
	fmuld	d6, d6, d7
	fmuld	d13, d6, d13
	flds	s13, [sp, #84]	@ int
	fsitod	d11, s13
	fmuld	d11, d11, d7
	ldr	r0, .L17+16
	ldr	r1, .L17+20
	bl	fopen
	subs	r4, r0, #0
	bne	.L12
	ldr	r0, .L17+24
	bl	puts
	ldr	r0, .L17+28
	ldr	r1, [sp, #8]
	fmrrd	r2, r3, d9
	bl	printf
	ldr	r0, .L17+32
	ldr	r1, [sp, #12]
	fmrrd	r2, r3, d8
	bl	printf
	ldr	r0, .L17+36
	ldr	r1, [sp, #16]
	fmrrd	r2, r3, d12
	bl	printf
	ldr	r0, .L17+40
	ldr	r1, [sp, #20]
	fmrrd	r2, r3, d10
	bl	printf
	ldr	r0, .L17+44
	ldr	r1, [sp, #80]
	fmrrd	r2, r3, d13
	bl	printf
	ldr	r0, .L17+48
	ldr	r1, [sp, #84]
	fmrrd	r2, r3, d11
	bl	printf
	fmuld	d0, d8, d8
	fmacd	d0, d9, d9
	fsqrtd	d0, d0
	fcmpd	d0, d0
	fmstat
	beq	.L13
	fmuld	d0, d8, d8
	fmacd	d0, d9, d9
	bl	sqrt
.L13:
	ldr	r0, .L17+52
	fmrrd	r2, r3, d0
	bl	printf
	b	.L14
.L12:
	fstd	d9, [sp]
	mov	r0, r4
	ldr	r1, .L17+28
	ldr	r2, [sp, #8]
	bl	fprintf
	fstd	d8, [sp]
	mov	r0, r4
	ldr	r1, .L17+32
	ldr	r2, [sp, #12]
	bl	fprintf
	fstd	d12, [sp]
	mov	r0, r4
	ldr	r1, .L17+36
	ldr	r2, [sp, #16]
	bl	fprintf
	fstd	d10, [sp]
	mov	r0, r4
	ldr	r1, .L17+40
	ldr	r2, [sp, #20]
	bl	fprintf
	fstd	d13, [sp]
	mov	r0, r4
	ldr	r1, .L17+44
	ldr	r2, [sp, #80]
	bl	fprintf
	fstd	d11, [sp]
	mov	r0, r4
	ldr	r1, .L17+48
	ldr	r2, [sp, #84]
	bl	fprintf
	fmuld	d0, d8, d8
	fmacd	d0, d9, d9
	fsqrtd	d0, d0
	fcmpd	d0, d0
	fmstat
	beq	.L15
	fmuld	d0, d8, d8
	fmacd	d0, d9, d9
	bl	sqrt
.L15:
	mov	r0, r4
	ldr	r1, .L17+52
	fmrrd	r2, r3, d0
	bl	fprintf
.L14:
	mov	r0, r4
	bl	fclose
	add	sp, sp, #24
	@ sp needed
	fldmfdd	sp!, {d8-d13}
	ldmfd	sp!, {r4, pc}
.L18:
	.align	3
.L17:
	.word	0
	.word	1056964608
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
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 272
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #284
	mov	r3, r0
	mov	r4, r1
	mov	r2, #44
	add	r1, sp, #264
	strh	r2, [r1]	@ movhi
	cmp	r0, #1
	bgt	.L20
	ldr	r0, .L25
	mov	r1, r3
	bl	printf
	ldr	r0, .L25+4
	bl	puts
	mov	r0, #0
	bl	exit
.L20:
	ldr	r0, [r4, #4]
	ldr	r1, .L25+8
	bl	fopen
	subs	r10, r0, #0
	movne	fp, #256
	movne	r4, #0
	movne	r6, #10
	bne	.L23
	ldr	r0, [r4, #4]
	bl	perror
	mov	r0, #1
	bl	exit
.L22:
	add	r0, sp, #8
	add	r1, sp, #264
	bl	strtok
	mov	r1, r4
	mov	r2, r6
	bl	strtol
	mov	r8, r0
	str	r0, [sp, #276]
	mov	r0, r4
	add	r1, sp, #264
	bl	strtok
	mov	r1, r4
	mov	r2, r6
	bl	strtol
	mov	r7, r0
	add	r5, sp, #280
	str	r0, [r5, #-8]!
	mov	r0, r4
	add	r1, sp, #264
	bl	strtok
	mov	r1, r4
	mov	r2, r6
	bl	strtol
	mov	r9, r0
	add	r0, sp, #276
	mov	r1, r5
	add	r2, sp, #268
	bl	cordic_V_fixed_point
	ldr	r3, [sp, #272]
	str	r3, [sp]
	ldr	r3, [sp, #268]
	str	r3, [sp, #4]
	mov	r0, r8
	mov	r1, r7
	mov	r2, r9
	ldr	r3, [sp, #276]
	bl	verify
	b	.L23
.L23:
	add	r0, sp, #8
	mov	r1, fp
	mov	r2, r10
	bl	fgets
	cmp	r0, #0
	bne	.L22
	mov	r0, r10
	bl	fclose
	add	sp, sp, #284
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L26:
	.align	2
.L25:
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.size	main, .-main
	.comm	op_z_table,32,4
	.global	z_table
	.data
	.align	2
.LANCHOR0 = . + 0
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
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"results.txt\000"
.LC1:
	.ascii	"a\000"
	.space	2
.LC2:
	.ascii	"Could not create output file. Printing results to c"
	.ascii	"onsole...\012\000"
	.space	2
.LC3:
	.ascii	"x_i_init = %5i\011x_d_init = %f\012\000"
	.space	2
.LC4:
	.ascii	"y_i_init = %5i\011y_d_init = %f\012\000"
	.space	2
.LC5:
	.ascii	"z_i_init = %5i\011z_d_init = %f (rad)\012\012\000"
	.space	3
.LC6:
	.ascii	"x_i_calc = %5i\011x_d_calc = %f\012\000"
	.space	2
.LC7:
	.ascii	"y_i_calc = %5i\011y_d_calc = %f\012\000"
	.space	2
.LC8:
	.ascii	"z_i_calc = %5i\011z_d_calc = %f (rad)\012\012\000"
	.space	3
.LC9:
	.ascii	"Modulus = SQRT(x_d_init^2 + y_d_init^2) = %f\012\000"
	.space	2
.LC10:
	.ascii	"Expected 1 argument, %d given\012\012\000"
.LC11:
	.ascii	"Usage: cordic_main.exe <input_file>  , where input_"
	.ascii	"file is the name of a text file, comma delimited,\012"
	.ascii	"where each row has a value for x,y,z\012\000"
	.space	1
.LC12:
	.ascii	"r\000"
	.ident	"GCC: (Raspbian 4.9.2-10) 4.9.2"
	.section	.note.GNU-stack,"",%progbits
