/*
 * Using the `crt.sh` certificate search site, look up related subdomains.
 */

use std::collections::HashSet;

/// Use the site to get a distint list of sub-domains
pub fn get(root_domain: &str) -> Option<Vec<String>> {
    return extract_subdomains(
        &reqwest::blocking::get(format!("https://crt.sh/?q=%25.{}&output=json", root_domain))
            .ok()?
            .text()
            .ok()?,
    );
}

/// Take the raw body result and extract the subdomains
pub fn extract_subdomains(raw_body: &String) -> Option<Vec<String>> {
    let mut sub_domains = HashSet::new();

    /* Parse the raw text into a Json. */
    let all_dom_info: serde_json::Value = serde_json::from_str(raw_body).ok()?;

    /* From the parsed data extract the subdomains. */
    for dom_info in all_dom_info.as_array()?.into_iter() {
        for pote_key_nm in vec!["common_name", "name_value"] {
            let Some(s_dom) = dom_info.get(pote_key_nm).and_then(|x| x.as_str()) else {
                continue;
            };

            /* Ignore wild card and invalid domains */
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
