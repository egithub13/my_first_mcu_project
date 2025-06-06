
ENTRY(reset_handler)

/* Define memory regions */
MEMORY
{
  FLASH (rx)  : ORIGIN = 0x08000000, LENGTH = 512K
  RAM (rwx)   : ORIGIN = 0x20000000, LENGTH = 96K
}

_start_of_stack = ORIGIN(RAM) + LENGTH(RAM);
_min_stack_size = 0x400;
_min_heap_size = 0x400;

/*
 * SECTIONS
   SECTIONS command in a linker script specifies where each sections
   (.text, .data, .bss) should placed in memory.
*/

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
        . = ORIGIN(FLASH);
        LONG(_start_of_stack);
        KEEP(*(.isr_vector));
        *(.text)
        *(.text*)
        . = ALIGN(4);
    } > FLASH

    /* Constant data will go into FLASH */
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

    .ram_usage_check :
    {
        . = ALIGN(8);
        . = . + _min_stack_size;
        . = . + _min_heap_size;
        . = ALIGN(8);
    } > RAM
}

PROVIDE(reset_handler = Default_Handler);
PROVIDE(NMI_Handler = Default_Handler);
PROVIDE(HardFault_Handler = Default_Handler);
PROVIDE(BusFault_Handler = Default_Handler);
PROVIDE(MemManage_Handler = Default_Handler);
PROVIDE(PendSV_Handler = Default_Handler);
PROVIDE(SVCall_Handler = Default_Handler);
PROVIDE(SysTick_Handler = Default_Handler);
PROVIDE(UsageFault_Handler = Default_Handler);
PROVIDE(ADC_Handler = Default_Handler);
PROVIDE(DebugMon_Handler = Default_Handler);
PROVIDE(DMA1_Stream0_Handler = Default_Handler);
PROVIDE(DMA1_Stream1_Handler = Default_Handler);
PROVIDE(DMA1_Stream2_Handler = Default_Handler);
PROVIDE(DMA1_Stream3_Handler = Default_Handler);
PROVIDE(DMA1_Stream4_Handler = Default_Handler);
PROVIDE(DMA1_Stream5_Handler = Default_Handler);
PROVIDE(DMA1_Stream6_Handler = Default_Handler);
PROVIDE(DMA1_Stream7_Handler = Default_Handler);
PROVIDE(DMA2_Stream0_Handler = Default_Handler);
PROVIDE(DMA2_Stream1_Handler = Default_Handler);
PROVIDE(DMA2_Stream2_Handler = Default_Handler);
PROVIDE(DMA2_Stream3_Handler = Default_Handler);
PROVIDE(DMA2_Stream4_Handler = Default_Handler);
PROVIDE(DMA2_Stream5_Handler = Default_Handler);
PROVIDE(DMA2_Stream6_Handler = Default_Handler);
PROVIDE(DMA2_Stream7_Handler = Default_Handler);
PROVIDE(EXTI0_Handler = Default_Handler);
PROVIDE(EXTI15_10_Handler = Default_Handler);
PROVIDE(EXTI16_PVD_Handler = Default_Handler);
PROVIDE(EXTI17_RTC_Alarm_Handler = Default_Handler);
PROVIDE(EXTI18_OTG_FS_WKUP_Handler = Default_Handler);
PROVIDE(EXTI1_Handler = Default_Handler);
PROVIDE(EXTI22_RTC_WKUP_Handler = Default_Handler);
PROVIDE(EXTI2_Handler = Default_Handler);
PROVIDE(EXTI3_Handler = Default_Handler);
PROVIDE(EXTI4_Handler = Default_Handler);
PROVIDE(EXTI9_5_Handler = Default_Handler);
PROVIDE(FLASH_Handler = Default_Handler);
PROVIDE(FPU_Handler = Default_Handler);
PROVIDE(I2C1_ER_Handler = Default_Handler);
PROVIDE(I2C1_EV_Handler = Default_Handler);
PROVIDE(I2C2_ER_Handler = Default_Handler);
PROVIDE(I2C2_EV_Handler = Default_Handler);
PROVIDE(I2C3_ER_Handler = Default_Handler);
PROVIDE(I2C3_EV_Handler = Default_Handler);
PROVIDE(OTG_FS_Handler = Default_Handler);
PROVIDE(RCC_Handler = Default_Handler);
PROVIDE(SDIO_Handler = Default_Handler);
PROVIDE(SPI1_Handler = Default_Handler);
PROVIDE(SPI2_Handler = Default_Handler);
PROVIDE(SPI3_Handler = Default_Handler);
PROVIDE(SPI4_Handler = Default_Handler);
PROVIDE(TAMP_STAMP_Handler = Default_Handler);
PROVIDE(TIM1_BRK_TIM9_Handler = Default_Handler);
PROVIDE(TIM1_CC_Handler = Default_Handler);
PROVIDE(TIM1_TRG_COM_TIM11_Handler = Default_Handler);
PROVIDE(TIM1_UP_TIM10_Handler = Default_Handler);
PROVIDE(TIM2_Handler = Default_Handler);
PROVIDE(TIM3_Handler = Default_Handler);
PROVIDE(TIM4_Handler = Default_Handler);
PROVIDE(TIM5_Handler = Default_Handler);
PROVIDE(USART1_Handler = Default_Handler);
PROVIDE(USART2_Handler = Default_Handler);
PROVIDE(USART6_Handler = Default_Handler);
PROVIDE(WWDG_Handler = Default_Handler);