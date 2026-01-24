/*
 * Chapter 2 - Tricorder
 */

fn main() {
    let scrape_url = String::from("https://crt.sh/?q=%25.bbc.co.uk&output=json");

    /* Get the raw request from the site. */
    let req_result = reqwest::blocking::get(scrape_url).expect("Request failed to get a response!");
    let req_body = req_result
        .text()
        .expect("Request failed to get a response!");

    /* Parse the raw text into a structured form. */
    let dom_info: serde_json::Value =
        serde_json::from_str(&req_body).expect("Request text could not be parsed.");

    println!("{:?}", dom_info);
}
