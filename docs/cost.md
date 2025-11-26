# Cost Analysis (₹)

This document provides cost estimates for the **IPv6 Migration Dual-Stack** architecture in **Indian Rupees (₹)**.

## Production Environment

At production scale, the architecture typically costs:

| Service | Monthly Cost (₹) | Notes |
|---------|------------------|-------|
| **NAT64 Gateway** | ₹25,000–40,000 | Translation service |
| **DNS64 Resolver** | ₹5,000–10,000 | Route 53 Resolver |
| **VPC (dual-stack)** | ₹0 | No additional cost |
| **Load Balancers** | ₹15,000–25,000 | Dual-stack ALB/NLB |
| **CloudWatch** | ₹5,000–10,000 | Monitoring |
| **Transit Gateway** | ₹10,000–20,000 | Cross-VPC routing |
| **Total** | **₹60,000–105,000** | ~$750–1,310/month |

## Cost Savings from IPv6

IPv6 migration can reduce costs:

| Savings Area | Monthly Savings (₹) | Notes |
|-------------|---------------------|-------|
| **NAT Gateway elimination** | ₹30,000–60,000 | IPv6-only workloads |
| **Public IPv4 addresses** | ₹3,000–8,000 | Per elastic IP saved |
| **Data transfer** | ₹5,000–15,000 | IPv6 egress is cheaper |

## Migration Phases

| Phase | Duration | Est. Cost (₹) |
|-------|----------|---------------|
| Assessment | 2 weeks | ₹50,000 |
| Dual-stack setup | 4 weeks | ₹200,000 |
| Application migration | 8 weeks | ₹400,000 |
| IPv6-only transition | 4 weeks | ₹150,000 |

## Cost Optimization Strategies

- **Prioritize high-traffic workloads** – Maximize IPv6 data transfer savings
- **Eliminate NAT where possible** – IPv6-only reduces NAT costs
- **Use IPv6-only subnets** – For internal workloads
- **Monitor IPv4 usage** – Identify remaining dependencies

## Related Documentation

See `ARCHITECTURE.md` for service details and `DEPLOYMENT.md` for migration guide.
