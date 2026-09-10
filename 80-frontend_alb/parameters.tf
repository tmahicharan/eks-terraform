resource "aws_ssm_parameter" "aws_lb_listener_ingress_listener" {
  name  = "/${var.project}/${var.environment}/ingress_alb_listener_arn"
  type  = "String"
  value = aws_lb_listener.ingress_listener.arn
}