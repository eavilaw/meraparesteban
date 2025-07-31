#1. Public Load Balancer (ALB)
resource "aws_lb" "alb" {
  name               = "${var.project_name}-alb"
  load_balancer_type = "application"
    subnets            = ["subnet-05df1c7aba7212190", # Subnet A
                          "subnet-080e0cc50f342d890"  # Subnet B
                        ]
  security_groups    = [aws_security_group.fastapi_sg.id]
  internal           = false

  tags = {
    Name = "${var.project_name}-alb"
  }
}

#2. Target Group for ECS
resource "aws_lb_target_group" "fastapi_tg" {
  name        = "${var.project_name}-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "${var.project_name}-tg"
  }
}

# 3. Listener HTTP (port 80)
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.fastapi_tg.arn
  }
}