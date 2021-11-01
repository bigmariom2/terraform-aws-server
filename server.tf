
locals {
  service_name = "Automation"
  owner        = "Cloud Team"
  createdby    = "terraform"
}

locals {
  # Common tags to be assigned to all resources
  common_tags = {
    Name        = var.identity
    Environment = var.environment
    createdby = local.createdby
    Service = local.service_name
    Owner   = local.owner
  }
}

resource "aws_instance" "web" {
  ami                    = var.ami
  instance_type          = "t2.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids

  tags = local.common_tags
}

