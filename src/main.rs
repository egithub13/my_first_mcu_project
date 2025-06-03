
#![no_std]
#![no_main]
#![allow(clippy::empty_loop)]



use core::panic::PanicInfo;

mod startup_stm32f401;

// Global array
static mut _SCORES_GLOBAL: [i32; 5] = [1, 2, 3, 4, 5];

// Constant array
const _NUMBERS: [i32; 5] = [1, 2, 3, 4, 5];

// .bss section
static mut _BUFFER: [u8; 1024] = [0; 1024];

#[unsafe(no_mangle)]
fn main() -> ! {
    let mut _total_score = 0;

    unsafe {
        for score in _SCORES_GLOBAL {
            _total_score += score;
        }
    }

    unsafe {
        _BUFFER[0] = 100;
    }
    

    loop {

    }
}

#[panic_handler]
fn panic_handler (_info: &PanicInfo) -> ! {
    loop {

    }
}