/*
 * Chapter 2 - Tricorder
 */

use std::collections::HashSet;

fn main() {
    let mut sub_domains = HashSet::new();
    let scrape_url = String::from("https://crt.sh/?q=%25.bbc.co.uk&output=json");

    /* Get the raw request from the site. */
    let req_result = reqwest::blocking::get(scrape_url).expect("Request failed to get a response!");
    let req_body = req_result
        .text()
        .expect("Request failed to get a response!");

    /* Parse the raw text into a structured form. */
    let all_dom_info: serde_json::Value =
        serde_json::from_str(&req_body).expect("Request text could not be parsed.");

    /* From the parsed data extract the subdomains. */
    for dom_info in all_dom_info.as_array().unwrap().into_iter() {
        for pote_key_nm in vec!["common_name", "name_value"] {
            let Some(s_dom) = dom_info.get(pote_key_nm).and_then(|x| x.as_str()) else {
                continue;
            };

            /* Ignore wild card domains */
            if s_dom.contains("*") {
                continue;
            }

            sub_domains.insert(s_dom.to_string());
        }
    }

    println!("{:?}", sub_domains);
}
