locals {
  common_name= "${var.project}-${var.environment}"
  bastion=data.aws_ssm_parameter.bastion_sg_id.value
  public_subnet_id=split("," , data.aws_ssm_parameter.public_subnet_id.value)
  ingress_alb=data.aws_ssm_parameter.ingress_alb_sg_id.value
  mongodb=data.aws_ssm_parameter.mongodb_sg_id.value
  redis=data.aws_ssm_parameter.redis_sg_id.value
  rabbitmq=data.aws_ssm_parameter.rabbitmq_sg_id.value
  mysql=data.aws_ssm_parameter.mysql_sg_id.value
  openvpn=data.aws_ssm_parameter.openvpn_sg_id.value
  eks_control_plane=data.aws_ssm_parameter.eks_control_plane_sg_id.value
  eks_node=data.aws_ssm_parameter.eks_node_sg_id.value
  vpn_ingress_rules={
    mysql={
      sg_id= local.mysql
      port=22
    }
    redis={
      sg_id= local.redis
      port=22
    }
    rabbitmq={
      sg_id= local.rabbitmq
      port=22
    }
    mongodb={
      sg_id= local.mongodb
      port=22
    }
    
  }
}