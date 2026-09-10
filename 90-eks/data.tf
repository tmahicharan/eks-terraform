data "aws_ssm_parameter" "vpc_id" {
  name =  "/${var.project}/${var.environment}-vpc_id" #/roboshop/dev-vpc_id
}


data "aws_ssm_parameter" "private_subnet_id" {
  name =  "/${var.project}/${var.environment}-private-subnet-id"
}

data "aws_ssm_parameter" "eks_control_plane_sg_id" {
  name =  "/${var.project}/${var.environment}/eks_control_plane-sg-id"
}

data "aws_ssm_parameter" "eks_node_sg_id" {
  name =  "/${var.project}/${var.environment}/eks_node-sg-id"
}