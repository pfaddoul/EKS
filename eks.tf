resource "aws_eks_cluster" "eks_dev" {
  name = "eks_dev"
  role_arn = aws_iam_role.eks_master_role.arn
}