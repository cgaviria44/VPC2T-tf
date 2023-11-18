# https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.project_name}-${var.environment}"
  cidr = "10.0.0.0/16"

  azs              = ["${var.region}a", "${var.region}b"]
  private_subnets  = ["10.0.0.0/24", "10.0.1.0/24"]
  public_subnets   = ["10.0.2.0/24", "10.0.3.0/24"]
  database_subnets = ["10.0.4.0/24", "10.0.5.0/24"]

  enable_nat_gateway   = false
  #single_nat_gateway   = true
  enable_dns_hostnames = true
  enable_ipv6          = true

  private_subnet_ipv6_prefixes  = [0, 1]
  public_subnet_ipv6_prefixes   = [2, 3]
  database_subnet_ipv6_prefixes = [4, 5]

  tags = {
    terraform    = true
    environment  = var.environment
    project_name = var.project_name
  }
}