/*
 * 4.2.1 Default Implementations
 */

pub trait Hello {
    fn greeting(&self) -> String {
        "Hello, world!".to_string()
    }
}

pub struct Syvain {}

impl Hello for Syvain {
    fn greeting(&self) -> String {
        "Hello, I am Syvain.".to_string()
    }
}

pub struct Anonymous {}

impl Hello for Anonymous {}

fn main() {
    println!("{}\n{}", Syvain {}.greeting(), Anonymous {}.greeting());
}
