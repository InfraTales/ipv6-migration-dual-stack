# ============================================================================
# Security Module - Security Groups for Dual-Stack VPC
# ============================================================================

# Security Group for EC2 Instances
resource "aws_security_group" "instance" {
  name        = "${var.project_name}-${var.environment}-instance-sg"
  description = "Security group for EC2 instances in dual-stack VPC"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.project_name}-${var.environment}-instance-sg"
  }
}

# Ingress - SSH (IPv4)
resource "aws_vpc_security_group_ingress_rule" "ssh_ipv4" {
  security_group_id = aws_security_group.instance.id
  description       = "SSH from anywhere (IPv4)"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"

  tags = {
    Name = "ssh-ipv4"
  }
}

# Ingress - SSH (IPv6)
resource "aws_vpc_security_group_ingress_rule" "ssh_ipv6" {
  count             = var.vpc_ipv6_cidr != null ? 1 : 0
  security_group_id = aws_security_group.instance.id
  description       = "SSH from anywhere (IPv6)"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  cidr_ipv6         = "::/0"

  tags = {
    Name = "ssh-ipv6"
  }
}

# Ingress - HTTP (IPv4)
resource "aws_vpc_security_group_ingress_rule" "http_ipv4" {
  security_group_id = aws_security_group.instance.id
  description       = "HTTP from anywhere (IPv4)"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"

  tags = {
    Name = "http-ipv4"
  }
}

# Ingress - HTTP (IPv6)
resource "aws_vpc_security_group_ingress_rule" "http_ipv6" {
  count             = var.vpc_ipv6_cidr != null ? 1 : 0
  security_group_id = aws_security_group.instance.id
  description       = "HTTP from anywhere (IPv6)"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
  cidr_ipv6         = "::/0"

  tags = {
    Name = "http-ipv6"
  }
}

# Ingress - HTTPS (IPv4)
resource "aws_vpc_security_group_ingress_rule" "https_ipv4" {
  security_group_id = aws_security_group.instance.id
  description       = "HTTPS from anywhere (IPv4)"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"

  tags = {
    Name = "https-ipv4"
  }
}

# Ingress - HTTPS (IPv6)
resource "aws_vpc_security_group_ingress_rule" "https_ipv6" {
  count             = var.vpc_ipv6_cidr != null ? 1 : 0
  security_group_id = aws_security_group.instance.id
  description       = "HTTPS from anywhere (IPv6)"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
  cidr_ipv6         = "::/0"

  tags = {
    Name = "https-ipv6"
  }
}

# Egress - All traffic (IPv4)
resource "aws_vpc_security_group_egress_rule" "all_ipv4" {
  security_group_id = aws_security_group.instance.id
  description       = "Allow all outbound traffic (IPv4)"
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"

  tags = {
    Name = "all-ipv4"
  }
}

# Egress - All traffic (IPv6)
resource "aws_vpc_security_group_egress_rule" "all_ipv6" {
  count             = var.vpc_ipv6_cidr != null ? 1 : 0
  security_group_id = aws_security_group.instance.id
  description       = "Allow all outbound traffic (IPv6)"
  ip_protocol       = "-1"
  cidr_ipv6         = "::/0"

  tags = {
    Name = "all-ipv6"
  }
}
