.section .text
.global asm_trap_vector

# this function is called when trap occurs
asm_trap_vector:
	# for now just return back
	li s11, 44
	mret

	
