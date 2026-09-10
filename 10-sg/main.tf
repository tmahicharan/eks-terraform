# module "catalogue" {
#   source = "terraform-aws-modules/security-group/aws"
#   name        = "${local.common_name}-catalogue"
#   use_name_prefix = false
#   description = "Security group for catalogue "
#   vpc_id      = data.aws_ssm_parameter.vpc_id.value
#   tags = {
#     Name = "${local.common_name}-catalogue"
#   }
# }   

module "sg"{
    count = length(var.sg_names)
    source= "git::https://github.com/tmahicharan/terraform-aws-sg.git"
    vpcid=local.vpc_id
    project= var.project
    environment= var.environment
    sg_names=var.sg_names[count.index]
}

# resource "aws_security_group_rule" "frontend" {
#   type              = "ingress"
#   from_port         = 80
#   to_port           = 80
#   protocol          = "tcp"
#   source_security_group_id= module.sg[11].sg_id
#   security_group_id = module.sg[9].sg_id
# }