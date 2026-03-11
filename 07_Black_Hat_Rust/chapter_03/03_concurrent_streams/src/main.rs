/*
 * 3.9.5.2 StreamExt
 */

use futures::{StreamExt, stream};
use rand::prelude::*;
use std::time::Duration;

const NUM_THREADS: usize = 1000;
const MAX_ACTIVE_THREADS: usize = 20;
const MAX_WAIT_MS: u64 = 20;

#[tokio::main(flavor = "multi_thread")]
async fn main() {
    /* Create a number of threads. */
    stream::iter(0..NUM_THREADS)
        .for_each_concurrent(MAX_ACTIVE_THREADS, |thred_idx| async move {
            let mut rng = rand::rng();

            /* Wait a random number of milli seconds. */
            let sleep_ms: u64 = rng.random_range(0..MAX_WAIT_MS);
            tokio::time::sleep(Duration::from_millis(sleep_ms)).await;

            /* Each thread reports back after it has waited. */
            println!("Hello from thread {}, I waited {}ms!", thred_idx, sleep_ms);
        })
        .await;

    println!("All {} threads completed.", NUM_THREADS);
}
