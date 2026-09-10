data "aws_ssm_parameter" "vpc_id" {
  name =  "/${var.project}/${var.environment}-vpc_id" #/roboshop/dev-vpc_id
}

data "aws_ssm_parameter" "ingress_alb_sg_id" {
  name =  "/${var.project}/${var.environment}/ingress_alb-sg-id" #/roboshop/dev/ingress_alb-sg-id
}


data "aws_ssm_parameter" "public_subnet_id" {
  name =  "/${var.project}/${var.environment}-public-subnet-id"
}

data "aws_ssm_parameter" "ssl_certificate_arn" {
  name =  "/${var.project}/${var.environment}/ingress_alb_certificate_arn"
}