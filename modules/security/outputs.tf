output "instance_security_group_id" {
  description = "Security group ID for EC2 instances"
  value       = aws_security_group.instance.id
}
