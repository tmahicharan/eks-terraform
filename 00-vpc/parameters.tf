#vpc id
resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.project}/${var.environment}-vpc_id"
  type  = "String"
  value = module.vpc.vpcid
}

#public subnet
resource "aws_ssm_parameter" "public_sunet" {
  name  = "/${var.project}/${var.environment}-public-subnet-id"
  type  = "StringList"
  value = join("," , module.vpc.public_subnet_ids)
}

#private subnet
resource "aws_ssm_parameter" "private_sunet" {
  name  = "/${var.project}/${var.environment}-private-subnet-id"
  type  = "StringList"
  value = join("," , module.vpc.private_subnet_ids)
}

#database subnet
resource "aws_ssm_parameter" "database_sunet" {
  name  = "/${var.project}/${var.environment}-database-subnet-id"
  type  = "StringList"
  value = join("," , module.vpc.database_subnet_ids)
}