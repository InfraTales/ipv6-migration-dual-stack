#!/bin/bash
# Deploy script for IPv6 Dual-Stack VPC

set -e

ENVIRONMENT=${1:-dev}
REGION=${2:-us-east-1}

echo "================================================"
echo "Deploying IPv6 Dual-Stack VPC"
echo "Environment: $ENVIRONMENT"
echo "Region: $REGION"
echo "================================================"

# Initialize Terraform
echo "Initializing Terraform..."
terraform init

# Validate configuration
echo "Validating Terraform configuration..."
terraform validate

# Plan deployment
echo "Planning deployment..."
terraform plan \
  -var="environment=$ENVIRONMENT" \
  -var="region=$REGION" \
  -out=tfplan

# Apply deployment
echo "Applying deployment..."
terraform apply tfplan

# Clean up plan file
rm -f tfplan

echo "================================================"
echo "Deployment complete!"
echo "================================================"
terraform output
