/*
 * Chapter 2 - Tricorder
 */

mod parse_args;
mod scanner;
mod sub_domain_lookup;

fn main() {
    let root_domain = parse_args::get();
    println!("{:?}", sub_domain_lookup::get(&root_domain).unwrap());
}
