/*
 * Scanning functions that utalise a variety of methods to investigate domains.
 */

/// Determine via a simple tcp connect scan if a port is open.
fn tcp_connect_port_scan(domain: &String, port: u16) -> bool {
    false
}

/// Test all the ports on a domain and find the open ones.
fn all_open_ports(domain: &String) -> Vec<u16> {
    Vec::new()
}

#[cfg(test)]
mod test {
    use super::*;

    #[test]
    fn tcp_connect_port_scan_exp01() {
        assert_eq!(tcp_connect_port_scan(&"bbc.co.uk".to_string(), 80), true);
    }

    #[test]
    fn tcp_connect_port_scan_exp02() {
        assert_eq!(tcp_connect_port_scan(&"cnn.com".to_string(), 80), true);
    }

    #[test]
    fn all_open_ports_exp01() {
        assert_eq!(all_open_ports(&"bbc.co.uk".to_string()), vec![80]);
    }
}
