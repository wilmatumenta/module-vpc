# environment variable
variable "region"{
    type = string
    description = ""
    default = "us-west-2"
 }
variable "project_name"{
    type = string
    description = ""
    default = ""
 }
variable "environment_name"{ 
    type = string
    description = ""
    default = ""
}

#vpc variables
variable "vpc_cidr"{
    type = string
    description = ""
    default = ""
 }

variable "public_subnet_az1_cidr"{
    type = string
    description = ""
    default = ""
 }
variable "public_subnet_az2_cidr"{ 
    type = string
    description = ""
    default = ""
}

variable "internet_cidr_route" {
  description = "route table open to the internet"
  default = "0.0.0.0/0"
}

variable "private_subnet_az1_cidr"{ 
    type = string
    description = ""
    default = ""
}

