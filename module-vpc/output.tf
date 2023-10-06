# export the project name
output "project_name" {
    value =var.project_name
}
# export the environment
output "environment" {
    value =var.environment_name
}
# export the vpc id
output "vpc_id" {
    value =aws_vpc.vpc.id
}
# export the internet gateway
output "internet_gateway" {
    value =aws_internet_gateway.internet_gateway
}
# public subnet az1 id
output "public_subnet_az1_id" {
    value = aws_subnet.public_subnet_az1.id
}

#private subnet in az2 id
output "public_subnet_id" {
    value =aws_subnet.private_subnet_az2.id
}

