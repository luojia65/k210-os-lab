#![no_std]
#![no_main]
#![feature(asm)]

use core::panic::PanicInfo;

#[panic_handler]
fn start_panic(_info: &PanicInfo) -> ! {
    loop {}
}

#[export_name = "_start"]
#[link_section = ".init"]
unsafe fn start() -> ! {
    asm!(
        r#"
    .set 	i, 1
    .rept	30
	    li  %i, 0
	    .set	i, i+1
    .endr
        
        la  ra, 0x80200000
        jr  ra
        "#,
        options(noreturn)
    )
}
