/*
 * 4.2.1 Default Implementations
 */

pub trait Dog {
    fn bark(&self) -> String;
}

pub struct Labrador {}

impl Dog for Labrador {
    fn bark(&self) -> String {
        "wouf".to_string()
    }
}

pub struct Husky {}

impl Dog for Husky {
    fn bark(&self) -> String {
        "WOOOOOF".to_string()
    }
}

fn main() {
    println!(
        "Hello Labrador: \"{}\"\nHello Husky: \"{}\"",
        Labrador {}.bark(),
        Husky {}.bark()
    );
}
