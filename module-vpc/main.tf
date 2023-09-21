# create vpc
# terraform aws create vpc
resource "aws_vpc" "vpc" {
  cidr_block              = var.vpc_cidr 
  instance_tenancy        = default
  enable_dns_hostnames    = true

  tags      = {
    Name    = "${var.project_name}-${var.environment_name}-vpc"
  }
}

# create internet gateway and attach it to vpc
# terraform aws create internet gateway
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id    = aws_vpc.vpc.id

  tags      = {
    Name    = "${var.project_name}-${var.environment_name}-igw"
  }
}

# create public subnet az1
# terraform aws create subnet
resource "aws_subnet" "public_subnet_az1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_az1_cidr
  availability_zone       = data.aws_availability_zones.availability_zones.names[0]
  map_public_ip_on_launch = true
  ## this means any resources deployed in this subnet will have a public ip

  tags      = {
    Name    = "${var.project_name}-${var.environment_name}-az1"
  }
}

# create public subnet az2
# terraform aws create subnet
resource "aws_subnet" "public_subnet_az2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_az2_cidr
  availability_zone       = data.aws_availability_zones.availability_zones.names[1]
  map_public_ip_on_launch = true

  tags      = {
    Name    = "${var.project_name}-${var.environment_name}-az2"
  }
}

# create route table and add public route
# terraform aws create route table
resource "aws_route_table" "public_route_table" {
  vpc_id       = aws_vpc.vpc.id

  route {
    cidr_block = var.internet_cidr_route
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags       = {
    Name     = "${var.project_name}-${var.environment_name}-public-route-table"
  }
}

# associate public subnet az1 to "public route table"
# terraform aws associate subnet with route table
resource "aws_route_table_association" "public_subnet_az1_route_table_association" {
  subnet_id           = aws_subnet.public_subnet_az1.id 
  route_table_id      = aws_route_table.public_route_table.id 
}

# associate public subnet az2 to "public route table"
# terraform aws associate subnet with route table
resource "aws_route_table_association" "public_subnet_az2_route_table_association" {
  subnet_id           = aws_subnet.public_subnet_az2.id
  route_table_id      = aws_route_table.public_route_table.id 
}

# create private subnet az2
# terraform aws create subnet
resource "aws_subnet" "private_subnet_az2" {
  vpc_id                   = aws_vpc.vpc.id
  cidr_block               = var.private_subnet_az1_cidr
  availability_zone        = data.aws_availability_zones.availability_zones.names[1]
  map_public_ip_on_launch  = false 

  tags      = {
    Name    = "${var.project_name}-${var.environment_name}-private-subnet-az2"
  
  }
}

## add eip and nat with rt and rt association

# elastic ip for NAT gateway
resource "aws_eip" "eip_for_nat" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name    = "${var.project_name}-${var.environment_name}-eip-for-nat-gateway"
  }
}

## nat gateway
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.eip_for_nat.id
  subnet_id     = aws_subnet.public_subnet_az1.id

  tags ={
    Name    = "${var.project_name}-${var.environment_name}-nat-gateway"
  }
}

## private route table
resource "aws_route_table" "nat_route_table" {
  vpc_id       = aws_vpc.vpc.id

  route = {
    cidr_block = var.internet_cidr_route
    nat_gateway_id =aws_nat_gateway.nat_gateway.id
  }

  tags       = {
    Name     = "${var.project_name}-${var.environment_name}-nat-route-table"
  }
}

# private route table association

resource "aws_route" "private_route_table_association" {
  subnet_id = aws_subnet.private_subnet_az2.id

  route_table_id         = aws_route_table.nat_route_table.id

  tags       = {
    Name     = "${var.project_name}-${var.environment_name}-nat-route-table-association"
  }
}

