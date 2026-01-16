# --- VPC ---
resource "aws_vpc" "eks_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_internet_gateway" "eks_igw" {
  vpc_id = aws_vpc.eks_vpc.id
  tags = {
    Name = "IGW-${var.vpc_name}"
  }
}
resource "aws_subnet" "eks_subnet_public" {
  count = 1
  vpc_id            = aws_vpc.eks_vpc.id
  map_public_ip_on_launch = true
  cidr_block        = cidrsubnet(aws_vpc.main.cidr_block, 8, count.index)
  availability_zone = var.availability_zone[count.index % length(var.availability_zone)]
  tags = {
    Name = "Subnet-${count.index}"
  }
}

resource "aws_subnet" "eks_subnet_private" {
  count = 5
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = cidrsubnet(aws_vpc.main.cidr_block, 8, count.index)
  availability_zone = var.availability_zone[count.index % length(var.availability_zone)]
  tags = {
    Name = "Subnet-${count.index}"
  }
}
resource "aws_route_table" "k8s-acc" {
  vpc_id = aws_vpc.k8s-acc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.k8s-acc.id
  }
}

resource "aws_route_table_association" "k8s-acc" {
  count = 2

  subnet_id      = aws_subnet.k8s-acc[count.index].id
  route_table_id = aws_route_table.k8s-acc.id
}