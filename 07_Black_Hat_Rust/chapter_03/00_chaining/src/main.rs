/*
 * 3.9 Combinators
 */

fn main() {
    let mut letters = vec!['a', 'b', 'c', 'd', 'e'];
    let nums = vec![1, 2, 3];

    /* Consume the vector. */
    println!("Sum = {}", nums.into_iter().map(|x| x * x).sum::<usize>());

    /* Operate on each element of the vector. */
    letters
        .iter_mut()
        .for_each(|ltr| ltr.make_ascii_uppercase());
    println!("Uppercase Letters = {:?}", letters);

    /* Reduce an iterator. */
    println!(
        "Sum = {:?}",
        vec![12, 12, 13, 14, 15, 16, 17, 18, 19, 20]
            .into_iter()
            .reduce(|acc, x| acc + x)
    );

    /* Folding an iterator. */
    println!(
        "Phrase = \"{}\"",
        vec!["Goodbye", "cruel", "world", "!"]
            .into_iter()
            .fold(String::new(), |acc, x| acc + x + " ")
    );

    /* Filter an interator. */
    let raw_nums = vec![-3, -2, -1, 0, 1, 2, 3];
    println!("\nBefore the filter: {:?}\n", raw_nums);
    let postv_nums: Vec<i32> = raw_nums
        .into_iter()
        .inspect(|x| println!("\tBefore the filter: {}", x))
        .filter(|&x: &i32| x.is_positive())
        .inspect(|x| println!("\tAfter the filter: {}", x))
        .collect();
    println!("\nAfter the filter: {:?}", postv_nums);

    /* Using map with an iterator. */
    println!(
        "Words = {:?}",
        vec!["test_1", "test_2", "test_3", "test_4"]
            .into_iter()
            .map(String::from)
            .collect::<Vec<String>>()
    );

    /* Filter failures with filter_map. */
    println!(
        "Correctly parsed numbers = {:?}",
        vec!["0", "-1", "3", "op", "test", "889"]
            .into_iter()
            .filter_map(|x| x.parse::<usize>().ok())
            .collect::<Vec<usize>>()
    );

    /* Concaternate two iterators with a chain. */
    println!(
        "Merged vector = {:?}",
        vec![1, 2, 3]
            .into_iter()
            .chain(vec![4, 5, 6].into_iter())
            .collect::<Vec<usize>>()
    );

    /* Flatten nested iterators. */
    println!(
        "Flattened vector: {:?}",
        vec![vec![1, 2, 3], vec![4, 5, 6], vec![7, 8, 9]]
            .into_iter()
            .flatten()
            .collect::<Vec<usize>>()
    );
}
