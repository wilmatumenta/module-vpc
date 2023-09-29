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
  region = "us-west-2"
}



module "vpc-module" {
  source                  = "./module-vpc"
  project_name            = "inventory"
  environment_name        = "dev"
  vpc_cidr                = "10.0.0.0/16"
  public_subnet_az1_cidr  = "10.0.2.0/24"
  public_subnet_az2_cidr  = "10.0.20.0/24"
  private_subnet_az1_cidr = "10.0.30.0/24"
}

##https://serverfault.com/questions/931609/##terraform-how-to-reference-the-subnet-created-in-the-vpc-module