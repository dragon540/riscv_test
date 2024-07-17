OUTPUT_ARCH( "riscv" )
ENTRY( _boot )

SECTIONS
{
  . = 0x80000000;
  .text.init :
  {
    *(.text.init)
    . = ALIGN(0x1000);
    *(trampsec)
  }

  . = ALIGN(0x1000);
  PROVIDE(etext = .);

  /*
   * make sure end is after data and bss.
   */
  .data : {
    *(.data)
  }
  .bss : {
    *(.bss)
    *(.sbss*)
     PROVIDE(end = .);
  }
}
