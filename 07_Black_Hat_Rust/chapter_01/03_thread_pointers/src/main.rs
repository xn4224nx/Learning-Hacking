/*
 * Thread Safe Smart Pointers
 */

use std::sync::{Arc, Mutex};
use std::{thread, time};

fn main() {
    let thr_pntr0 = Arc::new(5);
    let thr_pntr1 = Arc::clone(&thr_pntr0);

    thread::spawn(move || {
        println!("{}", *thr_pntr1);
    });

    thread::sleep(time::Duration::from_secs(1));
    println!("{}", *thr_pntr0);

    let thr_pntr2 = Arc::new(Mutex::new(5));
    let thr_pntr3 = Arc::clone(&thr_pntr2);

    thread::spawn(move || {
        let mut thr_pntr4 = thr_pntr3.lock().unwrap();
        *thr_pntr4 = 1;
    });
    thread::sleep(time::Duration::from_secs(1));

    let ret_pntr = thr_pntr2.lock().unwrap();
    println!("{}", ret_pntr);
}
