resource "aws_alb" "dashboard_alb" {
  name = lookup(
    var.lb_name,
    terraform.workspace,
    lookup(var.lb_name, "default", ""),
  )
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_http.id]
  subnets            = data.aws_subnets.selected.ids

  tags = {
    Environment = "lb-demo"
  }
}

resource "aws_alb_target_group" "dashboard_target_group" {
  name = lookup(
    var.tg_name,
    terraform.workspace,
    lookup(var.tg_name, "default", ""),
  )
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.selected.id
}

resource "aws_alb_listener" "front_end" {
  load_balancer_arn = aws_alb.dashboard_alb.arn
  port              = "80"
  protocol          = "HTTP"


  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.dashboard_target_group.arn
  }
}