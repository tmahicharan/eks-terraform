variable "project" {
  default ="roboshop"
}

variable "environment" {
  default ="dev"
}

variable "zone_id" {
  type = string
  default= "Z0333367NHGBMIBI3F"
}

variable "domain_name" {
  type = string
  default= "mahidevops.fun"
}


variable "eks_version" {

}

variable "eks_nodegroup_blue_version" {

}

variable "eks_nodegroup_green_version" {

}

variable enable_blue {

}

variable enable_green {
    
}