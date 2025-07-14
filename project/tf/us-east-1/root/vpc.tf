module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.2"

  name = "main-vpc"
  cidr = "11.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  public_subnets  = ["11.0.1.0/24", "11.0.2.0/24"]
  enable_dns_hostnames = true

  map_public_ip_on_launch = true
}
