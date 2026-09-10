data "aws_ssm_parameter" "bastion_sg_id" {
  name =  "/${var.project}/${var.environment}/bastion-sg-id"
}

data "aws_ssm_parameter" "public_subnet_id" {
  name =  "/${var.project}/${var.environment}-public-subnet-id"
}

data "aws_ssm_parameter" "ingress_alb_sg_id" {
  name =  "/${var.project}/${var.environment}/ingress_alb-sg-id" # /roboshop/dev/ingress_alb-sg-id
}

data "aws_ssm_parameter" "mongodb_sg_id" {
  name =  "/${var.project}/${var.environment}/mongodb-sg-id" # /roboshop/dev/mongodb-sg-id  
}

data "aws_ssm_parameter" "redis_sg_id" {
  name =  "/${var.project}/${var.environment}/redis-sg-id" # /roboshop/dev/redis-sg-id  
}

data "aws_ssm_parameter" "rabbitmq_sg_id" {
  name =  "/${var.project}/${var.environment}/rabbitmq-sg-id" # /roboshop/dev/rabbitmq-sg-id  
}

data "aws_ssm_parameter" "mysql_sg_id" {
  name =  "/${var.project}/${var.environment}/mysql-sg-id" # /roboshop/dev/mysql-sg-id  
}

data "aws_ssm_parameter" "openvpn_sg_id" {
  name =  "/${var.project}/${var.environment}/openvpn-sg-id" 
}

data "aws_ssm_parameter" "eks_control_plane_sg_id" {
  name =  "/${var.project}/${var.environment}/eks_control_plane-sg-id" 
}

data "aws_ssm_parameter" "eks_node_sg_id" {
  name =  "/${var.project}/${var.environment}/eks_node-sg-id" #   
}



