/*
 * 4.1 Generics
 */

use std::fmt::Display;
use std::ops::Add;

fn add<T: Add<Output = T>>(x: T, y: T) -> T {
    return x + y;
}

fn generic_display<T: Display>(object: T) {
    println!("This object is '{}'", object);
}

fn main() {
    println!(
        "Adding floats: {}\nAdding integers: {}\nAdding unsigned integers: {}",
        add(1.0_f64, 2.3_f64),
        add(-77_i32, -122_i32),
        add(45664_usize, 3400_usize),
    );

    generic_display(12.23_f32);
    generic_display("Hello, world!")
}
