/*
 * Smart Pointers
 */

use std::cell::{RefCell, RefMut};
use std::rc::Rc;

fn main() {
    let sm_pntr0 = Rc::new(1);
    let shared_msg = Rc::new(RefCell::new("Hello".to_string()));

    {
        /* Modify the shared message. */
        let mut modify_msg: RefMut<String> = shared_msg.borrow_mut();
        modify_msg.push_str(" World!");

        /* Access the first pointer in a different scope. */
        let sm_pntr1 = Rc::clone(&sm_pntr0);
        println!("{}", *sm_pntr1);
    }

    println!("{}", *sm_pntr0);

    /* Show the modified string. */
    println!("{}", shared_msg.take());
}
