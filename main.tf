
module "vpc-module" {
  source                  = "./module-vpc"
  project_name            = "netflix-infra"
  environment             = "dev"
  vpc_cidr                = "10.0.0.0/16"
  public_subnet_az1_cidr  = "10.0.2.0/24"
  private_subnet_az1_cidr = "10.0.30.0/24"
}