# ============================================================================
# Compute Module - EC2 Instances with Dual-Stack Support
# ============================================================================

# Data source for latest Amazon Linux 2023 AMI
data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# EC2 Instances in private subnets
resource "aws_instance" "main" {
  count                  = var.instance_count
  ami                    = data.aws_ami.amazon_linux_2023.id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_ids[count.index % length(var.private_subnet_ids)]
  vpc_security_group_ids = [var.security_group_id]
  ipv6_address_count     = var.enable_ipv6 ? 1 : 0

  user_data = base64encode(<<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              
              # Display IPv4 and IPv6 addresses
              echo "<h1>Dual-Stack Instance</h1>" > /var/www/html/index.html
              echo "<p>IPv4: $(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)</p>" >> /var/www/html/index.html
              echo "<p>IPv6: $(curl -s http://169.254.169.254/latest/meta-data/ipv6)</p>" >> /var/www/html/index.html
              EOF
  )

  tags = {
    Name = "${var.project_name}-${var.environment}-instance-${count.index + 1}"
  }
}
