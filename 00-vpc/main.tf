module "vpc"{
    source="git::https://github.com/tmahicharan/terraform-aws-vpc.git"
    cidr_block=var.cidr_block
    project=var.project
    environment=var.environment
    public_subnet=var.public_subnet
    private_subnet=var.private_subnet
    database_subnet=var.database_subnet
}