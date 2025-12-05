output "instance_ids" {
  description = "EC2 instance IDs"
  value       = aws_instance.main[*].id
}

output "instance_private_ips" {
  description = "Private IPv4 addresses"
  value       = aws_instance.main[*].private_ip
}

output "instance_ipv6_addresses" {
  description = "IPv6 addresses"
  value       = aws_instance.main[*].ipv6_addresses
}
