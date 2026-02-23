/*
 * Options & Results
 */

fn main() {
    let myst: Vec<Option<usize>> = vec![None, None, Some(10), None, Some(0)];

    /* Will crash the program on a None value. */
    println!("{}", myst[2].unwrap());

    /* Provide a default if the option is None. */
    println!("{:?}", myst[0].or_else(|| Some(1)).unwrap());

    /* Call a function on a some value or ignore a None. */
    println!("{:?}", myst[4].and_then(|x| Some(x + 100)));
    println!("{:?}", myst[1].and_then(|x| Some(x + 100)));

    /* Test what an option is. */
    if myst[3].is_none() {
        println!("None found!");
    }
    if myst[2].is_some() {
        println!("Some found!");
    }

    /* Extract values and use them */
    for idx in 0..myst.len() {
        println!(
            "value = {}",
            if let Some(extracted) = myst[idx] {
                2 * (extracted + 100)
            } else {
                0
            }
        );
    }

    /* Loop avoiding the Nones */
    for idx in 0..myst.len() {
        let Some(extracted) = myst[idx] else {
            continue;
        };
        println!("{}", extracted);
    }
}
