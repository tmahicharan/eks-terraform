variable "project" {
  default ="roboshop"
}

variable "environment" {
  default ="dev"
}

variable "sg_names" {
  default =[
    #database
    "mongodb","redis","rabbitmq","mysql",
    #backend
    #"catalogue","user","cart","shipping","payment",
    #frontend
    #"frontend",
    #bastion
    "bastion",
    #frontend load balancer 
    "ingress_alb",
    #backend
    #"backend_lb",
    #vpn
    "openvpn",
    "eks_control_plane",
    "eks_node"
  ]
}