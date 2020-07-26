OUTPUT_ARCH(riscv)
ENTRY(_start)

BASE_ADDRESS = 0x80000000;

SECTIONS
{
    /* Load the kernel at this address: "." means the current address */
    . = BASE_ADDRESS;
    start = .;

    .text : {
        stext = .;
        KEEP(*(.init))
        *(.text .text.*)
        . = ALIGN(4);
        etext = .;
    }

    .rodata : {
        srodata = .;
        *(.rodata .rodata.*)
        . = ALIGN(4);
        erodata = .;
    }

    .data : {
        sdata = .;
        *(.data .data.*)
        edata = .;
    }

    .stack : {
        *(.bss.stack)
    }

    .bss : {
        sbss = .;
        *(.bss .bss.*)
        ebss = .;
    }

    PROVIDE(end = .);
}
