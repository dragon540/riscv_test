.option norvc
.section .data

.section .text.init
.global _boot

_boot:

   # setting MPP bits to 0b11 and setting MPIE and MIE bits to 0b01
   # and then writing to mstatus register
   li t3, (0b11 << 11) | (0b01 << 7) | (0b01 << 3)
   csrw mstatus, t3

   # setting mepc register to denote where execution will go to after trap is handled
   la t1, kmain
   csrw mepc, t1

   # setting up trap handler address to mtvec csr
   la t2, asm_trap_vector
   csrw mtvec, t2

