
/* Define memory regions */
MEMORY
{
  FLASH (rx)  : ORIGIN = 0x08000000, LENGTH = 512K
  SRAM (rwx)   : ORIGIN = 0x20000000, LENGTH = 96K
}

SECTIONS
{
    /*
    1. Defines where each program section is placed in the MCU's memory.

    2. The linker assigns addresses based on the SECTIONS command,
        creating an ELF fille with exact memory locations. For example, 
        if FLASH starts att 0x08000000 and the .text section is placed in FLASH,
        the linker will assign address starting from 0x0800000 for the .text section

    3. The ELF file guides the programming tool to correctly place the sections in the
        micro controller ensuring proper execution of the code.    

    */

    .text :
    {
        /* Here you should collect all executable code */
        . = ALIGN(4);
        *(.text)
        *(.text*)
        . = ALIGN(4);
    } > FLASH

    /* Constant data will go into FLASH
    .rodata :
    {
        . = ALIGN(4);
        *(.rodata)
        *(.rodata*)
        . = ALIGN(4);
    } > FLASH

    /* Initialized data will be in FLASH and it will also be in RAM during runtime */
    .data :
    {
        _sidata = LOADADDR(.data);  /* this returns the FLASH (LMA) */
        . = ALIGN(4);
        _sdata = .;                 /* start of data section in vma(RAM) */
        *(.data)
        *(.data*)
        . = ALIGN(4);
        _edata = .;
    } > RAM AT> FLASH

    /* Un-initialized data will be RAM */
    .bss :
    {
        . = ALIGN(4);
        _sbss = .;
        *(.bss)
        *(.bss*)
        . = ALIGN(4);
        _ebss = .;
    } > RAM 
}
