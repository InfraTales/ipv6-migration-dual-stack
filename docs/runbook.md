# Runbook

Operational guide for deploying and managing the **IPv6 Migration Dual-Stack** architecture.

## 1. Deployment

### Prerequisites

- AWS CLI configured with appropriate credentials
- Node.js 18+ and npm installed
- AWS CDK CLI installed

### Deploy Steps

```bash
# Install dependencies
npm install

# Bootstrap CDK
cdk bootstrap

# Deploy dual-stack infrastructure
cdk deploy --context environment=prod
```

## 2. Migration Phases

### Phase 1: Enable Dual-Stack VPC

```bash
# Add IPv6 CIDR to existing VPC
aws ec2 associate-vpc-cidr-block \
  --vpc-id vpc-xxx \
  --amazon-provided-ipv6-cidr-block
```

### Phase 2: Update Subnets

```bash
# Assign IPv6 CIDR to subnet
aws ec2 associate-subnet-cidr-block \
  --subnet-id subnet-xxx \
  --ipv6-cidr-block 2600:1f18:xxx::/64
```

### Phase 3: Configure NAT64/DNS64

1. Create NAT64 prefix in VPC
2. Configure Route 53 Resolver for DNS64
3. Update route tables for NAT64 traffic

### Phase 4: Application Migration

1. Update security groups for IPv6
2. Enable IPv6 on load balancers
3. Update application configurations
4. Test connectivity

## 3. Monitoring

### Key Metrics to Watch

- **IPv6 traffic percentage**: Migration progress
- **NAT64 usage**: Legacy IPv4 dependencies
- **DNS64 queries**: Translation volume
- **Connectivity errors**: Protocol-specific issues

### Dashboards

Pre-configured dashboards for:

- Protocol distribution
- NAT64/DNS64 metrics
- Migration progress
- Cost comparison

## 4. Validation

### Test IPv6 Connectivity

```bash
# Test from EC2 instance
curl -6 https://ipv6.google.com

# Test DNS64 resolution
dig AAAA ipv4only.arpa
```

### Verify Dual-Stack

```bash
# Check instance addresses
aws ec2 describe-instances --instance-ids i-xxx \
  --query 'Reservations[].Instances[].NetworkInterfaces[].Ipv6Addresses'
```

## 5. Maintenance

### Regular Tasks

- Monitor IPv4 dependency reduction
- Review NAT64 usage patterns
- Update security groups as needed
- Plan IPv6-only subnet migrations

### Rollback

```bash
# Remove IPv6 from subnet (if needed)
aws ec2 disassociate-subnet-cidr-block \
  --association-id subnet-cidr-assoc-xxx
```

> For troubleshooting common issues, see `docs/troubleshooting.md`.
