terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}



module "vpc-module" {
    source = "./module_vpc"
    environment_name = ""
    vpc_cidr = ""
    public_subnet_az1_cidr = ""
    public_subnet_az2_cidr =""
    private_subnet_az1_cidr = ""
  
}
module "vpc-module" {
    source = "./module_vpc"
    environment_name = ""
    vpc_cidr = ""
    public_subnet_az1_cidr = ""
    public_subnet_az2_cidr =""
    private_subnet_az1_cidr = ""
  
}