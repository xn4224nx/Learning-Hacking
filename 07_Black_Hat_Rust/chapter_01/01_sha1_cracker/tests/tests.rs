/*
 * Tests for main.rs
 */

use assert_cmd::{Command, pkg_name};

#[test]
fn full_program_exp0() {
    Command::cargo_bin(pkg_name!())
        .unwrap()
        .args(&["wordlist.txt", "7c6a61c68ef8b9b6b061b28c348bc1ed7921cb53"])
        .assert()
        .success()
        .stdout("MATCH FOUND: passw0rd\n")
        .stderr("");
}
