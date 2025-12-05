#!/bin/bash
# Destroy script for IPv6 Dual-Stack VPC

set -e

ENVIRONMENT=${1:-dev}
REGION=${2:-us-east-1}

echo "================================================"
echo "Destroying IPv6 Dual-Stack VPC"
echo "Environment: $ENVIRONMENT"
echo "Region: $REGION"
echo "================================================"

# Confirm destruction
read -p "Are you sure you want to destroy all resources? (yes/no): " CONFIRM

if [ "$CONFIRM" != "yes" ]; then
  echo "Destruction cancelled."
  exit 0
fi

# Destroy infrastructure
echo "Destroying infrastructure..."
terraform destroy \
  -var="environment=$ENVIRONMENT" \
  -var="region=$REGION" \
  -auto-approve

echo "================================================"
echo "Destruction complete!"
echo "================================================"
