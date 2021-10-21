#
# EKS Cluster Resources
#  IAM Role to allow EKS service to manage other AWS services
#  EC2 Security Group to allow networking traffic with EKS cluster
#  EKS Cluster
#


resource "aws_eks_cluster" "tf-eks-cluster" {
  name     = var.cluster_name
  version  = var.eks_version
  role_arn = aws_iam_role.tf-eks-cluster.arn


  vpc_config {
    
    subnet_ids = flatten([var.private_subnet_id]) 

  }
  depends_on = [
    aws_iam_role_policy_attachment.cluster_AmazonEKSClusterPolicy
  ]

}
resource "aws_iam_role" "tf-eks-cluster" {
  name = "var.cluster_name_role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "cluster_AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.tf-eks-cluster.name
}

  # worker node Security group dependency added as it cause an error when destroying
#  depends_on = [
#    "${data.aws_iam_role_policy_attachment.cluster-policy-attachment}"
#  ]
#}