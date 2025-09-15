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
  default = "10.100.0.0/16"
}
