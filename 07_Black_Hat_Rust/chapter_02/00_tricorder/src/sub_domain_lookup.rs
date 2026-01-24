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

#[cfg(test)]
mod test {
    use super::*;

    #[test]
    fn extract_subdomains_exp01() {
        assert_eq!(
            extract_subdomains(&String::from(
                r###"[{
    "issuer_ca_id": 107462,
    "issuer_name": "C=BE, O=GlobalSign nv-sa, CN=GlobalSign RSA OV SSL CA 2018",
    "common_name": "training.test.appsec.tools.bbc.co.uk",
    "name_value": "training.test.appsec.tools.bbc.co.uk",
    "id": 2140472224,
    "entry_timestamp": "2019-11-22T08:21:05.796",
    "not_before": "2019-11-22T08:21:04",
    "not_after": "2020-11-22T08:21:04",
    "serial_number": "46dce252667042c43e9b5c37",
    "result_count": 2
  }]"###
            ))
            .unwrap(),
            vec!["training.test.appsec.tools.bbc.co.uk".to_string()]
        );
    }

    #[test]
    fn extract_subdomains_exp02() {
        assert_eq!(
            extract_subdomains(&String::from(
                r###"[{
    "issuer_ca_id": 107462,
    "issuer_name": "C=BE, O=GlobalSign nv-sa, CN=GlobalSign RSA OV SSL CA 2018",
    "common_name": "training.test.appsec.tools.bbc.co.uk",
    "name_value": "training.test.appsec.tools.bbc.co.uk",
    "id": 2140472224,
    "entry_timestamp": "2019-11-22T08:21:05.796",
    "not_before": "2019-11-22T08:21:04",
    "not_after": "2020-11-22T08:21:04",
    "serial_number": "46dce252667042c43e9b5c37",
    "result_count": 2
  },
  {
    "issuer_ca_id": 107462,
    "issuer_name": "C=BE, O=GlobalSign nv-sa, CN=GlobalSign RSA OV SSL CA 2018",
    "common_name": "training.appsec.tools.bbc.co.uk",
    "name_value": "training.appsec.tools.bbc.co.uk",
    "id": 2140460592,
    "entry_timestamp": "2019-11-22T08:16:16.804",
    "not_before": "2019-11-22T08:16:14",
    "not_after": "2020-11-22T08:16:14",
    "serial_number": "4ed82742e2267f3e5f61d19b",
    "result_count": 2
  }]"###
            ))
            .unwrap()
            .into_iter()
            .collect::<HashSet<String>>(),
            HashSet::from([
                "training.appsec.tools.bbc.co.uk".to_string(),
                "training.test.appsec.tools.bbc.co.uk".to_string()
            ])
        );
    }

    #[test]
    fn extract_subdomains_exp03() {
        assert_eq!(
            extract_subdomains(&String::from(
                r###"[{
    "issuer_ca_id": 107462,
    "issuer_name": "C=BE, O=GlobalSign nv-sa, CN=GlobalSign RSA OV SSL CA 2018",
    "name_value": "training.test.appsec.tools.bbc.co.uk",
    "id": 2140472224,
    "entry_timestamp": "2019-11-22T08:21:05.796",
    "not_before": "2019-11-22T08:21:04",
    "not_after": "2020-11-22T08:21:04",
    "serial_number": "46dce252667042c43e9b5c37",
    "result_count": 2
  },
  {
    "issuer_ca_id": 107462,
    "issuer_name": "C=BE, O=GlobalSign nv-sa, CN=GlobalSign RSA OV SSL CA 2018",
    "name_value": "training.appsec.tools.bbc.co.uk",
    "id": 2140460592,
    "entry_timestamp": "2019-11-22T08:16:16.804",
    "not_before": "2019-11-22T08:16:14",
    "not_after": "2020-11-22T08:16:14",
    "serial_number": "4ed82742e2267f3e5f61d19b",
    "result_count": 2
  }]"###
            ))
            .unwrap()
            .into_iter()
            .collect::<HashSet<String>>(),
            HashSet::from([
                "training.appsec.tools.bbc.co.uk".to_string(),
                "training.test.appsec.tools.bbc.co.uk".to_string()
            ])
        );
    }

    #[test]
    fn extract_subdomains_exp04() {
        assert_eq!(
            extract_subdomains(&String::from(
                r###"[{
    "issuer_ca_id": 107462,
    "issuer_name": "C=BE, O=GlobalSign nv-sa, CN=GlobalSign RSA OV SSL CA 2018",
    "common_name": "training.test.appsec.tools.bbc.co.uk",
    "id": 2140472224,
    "entry_timestamp": "2019-11-22T08:21:05.796",
    "not_before": "2019-11-22T08:21:04",
    "not_after": "2020-11-22T08:21:04",
    "serial_number": "46dce252667042c43e9b5c37",
    "result_count": 2
  },
  {
    "issuer_ca_id": 107462,
    "issuer_name": "C=BE, O=GlobalSign nv-sa, CN=GlobalSign RSA OV SSL CA 2018",
    "common_name": "training.appsec.tools.bbc.co.uk",
    "id": 2140460592,
    "entry_timestamp": "2019-11-22T08:16:16.804",
    "not_before": "2019-11-22T08:16:14",
    "not_after": "2020-11-22T08:16:14",
    "serial_number": "4ed82742e2267f3e5f61d19b",
    "result_count": 2
  }]"###
            ))
            .unwrap()
            .into_iter()
            .collect::<HashSet<String>>(),
            HashSet::from([
                "training.appsec.tools.bbc.co.uk".to_string(),
                "training.test.appsec.tools.bbc.co.uk".to_string()
            ])
        );
    }

    #[test]
    #[should_panic]
    fn extract_subdomains_exp05() {
        extract_subdomains(&String::from(
            r###"[{
    "issuer_ca_id": 107462,
    "issuer_name": "C=BE, O=GlobalSign nv-sa, CN=GlobalSign RSA OV SSL CA 2018",
    "id": 2140472224,
    "entry_timestamp": "2019-11-22T08:21:05.796",
    "not_before": "2019-11-22T08:21:04",
    "not_after": "2020-11-22T08:21:04",
    "serial_number": "46dce252667042c43e9b5c37",
    "result_count": 2
  },
  {
    "issuer_ca_id": 107462,
    "issuer_name": "C=BE, O=GlobalSign nv-sa, CN=GlobalSign RSA OV SSL CA 2018",
    "id": 2140460592,
    "entry_timestamp": "2019-11-22T08:16:16.804",
    "not_before": "2019-11-22T08:16:14",
    "not_after": "2020-11-22T08:16:14",
    "serial_number": "4ed82742e2267f3e5f61d19b",
    "result_count": 2
  }]"###,
        ))
        .unwrap();
    }
}
