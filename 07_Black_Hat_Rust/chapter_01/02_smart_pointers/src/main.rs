/*
 * Smart Pointers
 */

use std::rc::Rc;

fn main() {
    let sm_pntr0 = Rc::new(1);

    /* Access the first pointer in a differnt scope. */
    {
        let sm_pntr1 = Rc::clone(&sm_pntr0);
        println!("{}", *sm_pntr1);
    }

    println!("{}", *sm_pntr0);
}
