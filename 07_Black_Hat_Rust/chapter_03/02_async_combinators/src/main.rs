/*
 * 3.9.5 Async combinators
 */

use futures::future::FutureExt;

async fn compute_a() -> usize {
    return 42;
}

async fn compute_b(a: usize) -> usize {
    return a + 1;
}

#[tokio::main(flavor = "multi_thread")]
async fn main() {
    println!("b = {}", compute_a().then(compute_b).await);
}
