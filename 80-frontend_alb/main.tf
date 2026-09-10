resource "aws_lb" "ingress_alb" {
  name               = "${local.common_name}-ingress-alb"
  internal           = false #It tells AWS whether the Load Balancer should be public or private.
  load_balancer_type = "application"
  security_groups    = [local.ingress_alb]
  subnets            = [local.public_subnet_id][0]

  enable_deletion_protection = false

  
  tags = merge (
    local.common_tags,
    {
        Name= "${local.common_name}-ingress-alb"
    }
    
  )
}

# Ingress ALB Listening on port 443 
resource "aws_lb_listener" "ingress_listener" {
  load_balancer_arn = aws_lb.ingress_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-3-2021-06"
  certificate_arn   = local.ssl_certificate_arn
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1>Hi i am from ingress-alb  https</h1>"
      status_code  = "200"
    }
  }
}

# Route53 record for ingress-alb
resource "aws_route53_record" "ingress_alb" {
  zone_id = var.zone_id 
  name    = "*.${var.domain_name}" #*.mahidevops.fun
  type    = "A"
  alias {
    name                   = aws_lb.ingress_alb.dns_name
    zone_id                = aws_lb.ingress_alb.zone_id
    evaluate_target_health = true
  }
}
