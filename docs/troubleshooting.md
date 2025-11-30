# Troubleshooting

Common issues and resolutions for the **IPv6 Migration Dual-Stack** architecture.

## Connectivity Issues

### 1. IPv6 Not Working on Instance

**Symptom:** Instance has IPv6 address but cannot connect.

**Resolution:**
- Verify subnet has IPv6 CIDR assigned
- Check security group has IPv6 rules
- Verify route table has IPv6 routes
- Check instance OS has IPv6 enabled

### 2. DNS64 Not Resolving

**Symptom:** IPv4-only endpoints not accessible from IPv6-only.

**Resolution:**
- Verify DNS64 resolver is configured
- Check Route 53 Resolver rules
- Verify NAT64 prefix is correct
- Test with `dig AAAA` for IPv4-only domain

### 3. NAT64 Translation Failing

**Symptom:** IPv6 clients cannot reach IPv4 services.

**Resolution:**
- Check NAT64 gateway status
- Verify route table points to NAT64
- Check security group allows NAT64 traffic
- Review NAT64 CloudWatch metrics

## Application Issues

### 4. Application Only Listens on IPv4

**Symptom:** Application not responding to IPv6 requests.

**Resolution:**
- Update application to bind to `::` (all interfaces)
- Check application configuration for IP version
- Verify load balancer has IPv6 target group
- Test with `netstat -an | grep LISTEN`

### 5. Load Balancer IPv6 Issues

**Symptom:** ALB/NLB not serving IPv6 traffic.

**Resolution:**
- Enable dualstack on load balancer
- Verify target group supports IPv6
- Check security group for IPv6 ingress
- Verify DNS returns AAAA records

## Security Issues

### 6. IPv6 Traffic Blocked

**Symptom:** IPv6 connections being dropped.

**Resolution:**
- Review security group IPv6 rules
- Check Network ACL for IPv6 entries
- Verify Network Firewall IPv6 policies
- Review VPC Flow Logs for drops

### 7. Security Group Missing IPv6

**Symptom:** IPv4 works but IPv6 doesn't.

**Resolution:**
- Add explicit IPv6 CIDR rules (`::/0`)
- Don't rely on `0.0.0.0/0` for IPv6
- Update both ingress and egress rules

## Migration Issues

### 8. Dual-Stack Performance Degradation

**Symptom:** Slower performance after enabling IPv6.

**Resolution:**
- Check Happy Eyeballs implementation
- Verify both protocols have similar latency
- Review DNS resolution times
- Check for MTU issues (IPv6 minimum 1280)

### 9. IPv4 Dependencies Remain

**Symptom:** Cannot move to IPv6-only.

**Resolution:**
- Audit NAT64 usage logs
- Identify IPv4-only external services
- Work with vendors for IPv6 support
- Consider proxy solutions for legacy

## Cost Issues

### 10. NAT64 Costs Higher Than Expected

**Symptom:** NAT64 data processing costs high.

**Resolution:**
- Review NAT64 traffic patterns
- Identify high-volume IPv4 dependencies
- Prioritize IPv6 migration for those services
- Consider direct IPv4 connectivity for exceptions

> For architecture details, see the project README.
