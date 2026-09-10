data "aws_ssm_parameter" "vpc_id" {
  name =  "/${var.project}/${var.environment}-vpc_id" #/roboshop/dev-vpc_id
}


data "aws_ssm_parameter" "private_subnet_id" {
  name =  "/${var.project}/${var.environment}-private-subnet-id"
}