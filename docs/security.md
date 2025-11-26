# Security Overview

This document summarizes the security posture of the **IPv6 Migration Dual-Stack** architecture.

## IPv6 Security Considerations

### Address Space

- **No NAT obscurity**: IPv6 addresses are globally routable
- **Larger attack surface**: More addresses to potentially scan
- **Privacy extensions**: Temporary addresses for clients

### Security Controls

#### Network Security

- **Security groups**: Same functionality for IPv6
- **Network ACLs**: Dual-stack rule support
- **Network Firewall**: IPv6 inspection capabilities
- **WAF**: IPv6 request filtering

#### Perimeter Security

- **No implicit NAT protection**: Explicit firewall rules required
- **Egress filtering**: Control outbound IPv6 traffic
- **Ingress filtering**: Block spoofed source addresses
- **DDoS protection**: Shield Advanced for IPv6

### Encryption

- **IPsec**: Native IPv6 support
- **TLS**: Protocol-agnostic, works with IPv6
- **VPN**: Site-to-site and client VPN support IPv6

## Migration Security

### During Transition

- Maintain security parity between IPv4 and IPv6
- Audit both protocol stacks
- Monitor for IPv6-specific attacks
- Test security controls on dual-stack

### IPv6-Specific Threats

- **Router advertisement attacks**: Mitigate with RA Guard
- **Extension header abuse**: Filter malformed headers
- **Fragmentation attacks**: Limit fragment reassembly
- **Reconnaissance**: Larger address space helps

## Compliance

The architecture maintains compliance with:

- SOC 2 Type II
- PCI-DSS (with dual-stack controls)
- HIPAA network security requirements

> For detailed security configurations, see `SECURITY.md` in the project root.
