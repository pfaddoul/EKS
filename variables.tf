variable "cluster_name" {
  type = string
  default = "tf-eks-argocd-cluste"
}

variable "node_count" {
  type = number
  default = 6
}

variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "node_instance_type" {
  type = string
  default = "t2.medium"
}

variable "vpc_name" {
  type = string
  default = "eks_vpc"  
}

variable "aws_subnet" {
  type = string
}

variable "availability_zone"{
  type = string
  default = "us-east-1"
}