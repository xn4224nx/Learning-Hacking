/*
 * Chapter 2 - Tricorder
 */

mod parse_args;
mod scanner;
mod sub_domain_lookup;

fn main() {
    let root_domain = parse_args::get();

    println!(
        "\nDOMAIN: {}\n{}",
        root_domain.to_ascii_uppercase(),
        "=".repeat(root_domain.len() + 8)
    );

    /* Consult the API and try and get the related sub-domains. */
    let subdomains = sub_domain_lookup::cont_get(&root_domain);

    println!("\tSUBDOMAINS = {}", subdomains.len());
}
