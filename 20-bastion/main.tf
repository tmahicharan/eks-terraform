resource "aws_instance" "instance"{
    ami= local.ami_id
    instance_type = "t3.micro"
    vpc_security_group_ids=[local.sg_id]
    subnet_id=local.public_subnet_ids[0]
    root_block_device {
        volume_size = 50
        volume_type = "gp3" # or "gp2", depending on your preference
    }
    associate_public_ip_address = true  
    user_data = file("bastion.sh")
    tags = merge (
    var.bastion_tags,
    local.common_tags,
    {
        Name= "${local.common_name}-bastion"
    }
  )
}

# resource "aws_iam_instance_profile" "BastionTerraformAdmin" {
#   name = "bastion"
#   role = "BastionTerraformAdmin"
# }