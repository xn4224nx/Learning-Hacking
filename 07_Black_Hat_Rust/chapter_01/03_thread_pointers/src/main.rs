/*
 * Thread Safe Smart Pointers
 */

use std::sync::Arc;
use std::{thread, time};

fn main() {
    let thr_pntr0 = Arc::new(5);
    let thr_pntr1 = Arc::clone(&thr_pntr0);

    thread::spawn(move || {
        println!("{}", *thr_pntr1);
    });

    thread::sleep(time::Duration::from_secs(1));
    println!("{}", *thr_pntr0);
}
