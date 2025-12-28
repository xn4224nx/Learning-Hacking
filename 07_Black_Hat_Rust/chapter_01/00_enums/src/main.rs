/*
 * ch_01/snippets/enums/src/lib.rs
 */

enum Status {
    Queued,
    Running,
    Failed,
    Succeeded,
}

fn show_status(proc_state: Status) {
    println!(
        "{}",
        match proc_state {
            Status::Queued => "queued",
            Status::Running => "running",
            Status::Failed => "failed",
            Status::Succeeded => "succeeded",
        }
    );
}

fn main() {
    for exp in vec![
        Status::Queued,
        Status::Running,
        Status::Failed,
        Status::Succeeded,
    ]
    .into_iter()
    {
        show_status(exp);
    }
}
