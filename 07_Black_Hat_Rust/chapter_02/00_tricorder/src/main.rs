/*
 * Chapter 2 - Tricorder
 */

use std::collections::HashSet;

fn main() {
    let scrape_url = String::from("https://crt.sh/?q=%25.bbc.co.uk&output=json");

    /* Get the raw request from the site. */
    let req_result = reqwest::blocking::get(scrape_url).expect("Request failed to get a response!");
    let req_body = req_result
        .text()
        .expect("Request failed to get a response!");

    println!("{:?}", extract_subdomains(&req_body).unwrap());
}

/// Take the raw body result and extract the subdomains
fn extract_subdomains(raw_body: &String) -> Option<Vec<String>> {
    let mut sub_domains = HashSet::new();

    /* Parse the raw text into a Json. */
    let all_dom_info: serde_json::Value = serde_json::from_str(raw_body).ok()?;

    /* From the parsed data extract the subdomains. */
    for dom_info in all_dom_info.as_array()?.into_iter() {
        for pote_key_nm in vec!["common_name", "name_value"] {
            let Some(s_dom) = dom_info.get(pote_key_nm).and_then(|x| x.as_str()) else {
                continue;
            };

            /* Ignore wild card and inalid domains */
            if s_dom.contains("*") || s_dom.contains("\n") {
                continue;
            }
            sub_domains.insert(s_dom.trim().to_string());
        }
    }

    /* Ensure sub-domains have been found. */
    return if sub_domains.is_empty() {
        None
    } else {
        Some(sub_domains.into_iter().collect())
    };
}
