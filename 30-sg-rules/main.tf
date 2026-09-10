# DATABASES

# mongodb
# mongodb to bastion
resource "aws_security_group_rule" "mongodb-bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id= local.bastion
  security_group_id = local.mongodb
}


# redis
# redis to bastion
resource "aws_security_group_rule" "redis-bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id= local.bastion
  security_group_id = local.redis
}


# mysql
# mysql to bastion
resource "aws_security_group_rule" "mysql-bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id= local.bastion
  security_group_id = local.mysql
}



# rabbitmq
# rabbitmq to bastion
resource "aws_security_group_rule" "rabbitmq-bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id= local.bastion
  security_group_id = local.rabbitmq
}


# public 

# bastion to laptop
resource "aws_security_group_rule" "bastion-laptop" {
  security_group_id = local.bastion
  cidr_blocks = ["0.0.0.0/0"]
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
}


# frontend_alb to laptop
resource "aws_security_group_rule" "ingress_alb-laptop" {
  security_group_id = local.ingress_alb
  cidr_blocks = ["0.0.0.0/0"]
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
}

# open vpn to public
resource "aws_security_group_rule" "openvpn-public" {
  security_group_id = local.openvpn
  cidr_blocks = ["0.0.0.0/0"]
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
}

# openvpc_443
resource "aws_security_group_rule" "openvpn-443" {
  security_group_id = local.openvpn
  cidr_blocks = ["0.0.0.0/0"]
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
}

# openvpc_943
resource "aws_security_group_rule" "openvpn-943" {
  security_group_id = local.openvpn
  cidr_blocks = ["0.0.0.0/0"]
  type              = "ingress"
  from_port         = 943
  to_port           = 943
  protocol          = "tcp"
}


# openvpc_1194
resource "aws_security_group_rule" "openvpn-1194" {
  security_group_id = local.openvpn
  cidr_blocks = ["0.0.0.0/0"]
  type              = "ingress"
  from_port         = 1194
  to_port           = 1194
  protocol          = "tcp"
}


# openvpc to components
resource "aws_security_group_rule" "openvpn-components" {
  for_each = local.vpn_ingress_rules
  security_group_id = each.value.sg_id
  source_security_group_id = local.openvpn
  type              = "ingress"
  from_port         = each.value.port
  to_port           = each.value.port
  protocol          = "tcp"
}

#bastion to eks_control_plane
resource "aws_security_group_rule" "bastion-eks_control_plane" {
  security_group_id = local.eks_control_plane
  source_security_group_id = local.bastion
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
}

#bastion to eks_node
resource "aws_security_group_rule" "bastion-eks_node" {
  security_group_id = local.eks_node
  source_security_group_id = local.bastion
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
}

#eks_control_plane to eks_node
resource "aws_security_group_rule" "eks_control_plane-eks_node" {
  security_group_id = local.eks_node
  source_security_group_id = local.eks_control_plane
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
} 

#eks_node to eks_control_plane
resource "aws_security_group_rule" "eks_node-eks_control_plane" {
  security_group_id = local.eks_control_plane
  source_security_group_id = local.eks_node
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
}

resource "aws_security_group_rule" "eks_node-vpc" {
  security_group_id = local.eks_node
  cidr_blocks = ["10.0.0.0/16"]
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
}



