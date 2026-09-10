resource "aws_ssm_parameter" "sg_id" {
  count= length(var.sg_names)
  name  = "/${var.project}/${var.environment}/${var.sg_names[count.index]}-sg-id"
  type  = "String"
  value = module.sg[count.index].sg_id
  overwrite = true
}
