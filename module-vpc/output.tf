#export the region
output "region" {
    value = var.region
}
# export the project name
output "project_name" {
    value =var.project-name
}
# export the environment
output "environment" {
    value =var.environment
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
#public subnet az2 id
output "public_subnet_az2_id" {
    value =aws_subnet.public_subnet_az2.id
}

#private subnet in az2 id
output "public_subnet_id" {
    value =aws_subnet.private_subnet_az2.id
}

#export availability zone 1
output "availability_zone_1" {
    value = data.aws_availability_zones.availability_zones.names[0]
}

#export availability zone 1
output "availability_zone_2" {
    value = data.aws_availability_zones.availability_zones.names[1]
}
