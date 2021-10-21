#### MADATORY VARIABLES to be provided by consumer projects

variable "vpc_id" {
    description = "VPC ID"
    type = string
    default = "vpc-0e2df1f3189a6efce"
}
variable "private_subnet_id"{
    type = list(string)
    default = [ "subnet-0bfd59d172cdc382e", "subnet-01ecf141c34682238" ]

}

variable "access_key" {}

  
variable "secret_key" {}


variable "token" {}
  



#### OPTIONAL VARIABLES with DEFAULT VALUES

variable "cluster_name" {
  default = "terraformtest"
  type    = string
}

variable "cluster_name_role" {
  default = "terraformtest_role"
  type    = string
}

variable "eks_version" {
  description = "EKS Version"
  default     = "1.20"
  type        = string
}

#data "aws_iam_role" "cluster-role" {
  #name = "apiuser"
#}