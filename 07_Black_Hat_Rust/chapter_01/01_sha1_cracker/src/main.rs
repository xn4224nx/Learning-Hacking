/*
 * ch_01/sha1_cracker/src/main.rs
 */

use sha1::Digest;
use std::fs::File;
use std::io::{BufRead, BufReader};

const SHA1_STR_LEN: usize = 40;

fn main() {
    /* Read the inputed the hash from the command line. */
    let cmd_args: Vec<String> = std::env::args().collect();

    /* Ensure the program is being used correctly. */
    if cmd_args.len() != 3 {
        println!("Usage:\nsha1_cracker: <wordlist.txt> <sha1_hash_digest>");
        return;
    }

    let hash_digest = cmd_args[2].trim_end();

    /* Ensure that the hash digest is the correct length. */
    if hash_digest.len() != SHA1_STR_LEN {
        println!("Hash digest must be {} chars long.", SHA1_STR_LEN);
        return;
    }

    /* Open the wordlist file. */
    let wl_file = File::open(&cmd_args[1]).expect("Wordlist file could not be opened!");
    let mut wl_fp = BufReader::new(&wl_file);
    let mut buffer = String::new();

    /* Read the wordlist, line by line. */
    while wl_fp.read_line(&mut buffer).unwrap() > 0 {
        let potential_pass = buffer.trim_end();
        let potential_digest = hex::encode(sha1::Sha1::digest(potential_pass.as_bytes()));

        if potential_digest == hash_digest {
            println!("MATCH FOUND: {}", potential_pass);
            return;
        }
        buffer.clear();
    }
    println!("UNKNOWN HASH")
}
