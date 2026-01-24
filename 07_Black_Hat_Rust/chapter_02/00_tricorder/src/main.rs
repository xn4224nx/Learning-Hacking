/*
 * Chapter 2 - Tricorder
 */

mod sub_domain_lookup;

fn main() {
    println!("{:?}", sub_domain_lookup::get("bbc.co.uk").unwrap());
}
