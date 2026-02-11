/*
 * Chapter 2 - Tricorder
 */

mod parse_args;
mod scanner;
mod sub_domain_lookup;

const RETRY_NUM: usize = 5;

fn main() {
    let root_domain = parse_args::get();

    println!("\nSub-domain Search\n=================");

    /* Consult the API and try and get the related sub-domains. */
    for atm_idx in 0..RETRY_NUM {
        let Some(sdom) = sub_domain_lookup::get(&root_domain) else {
            println!("\tAttempt {} Failed.", atm_idx + 1);
            continue;
        };
        println!("\tAPI Search Complete: {} URLs found.\n", sdom.len());
    }
}
