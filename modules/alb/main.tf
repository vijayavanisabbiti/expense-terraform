resource "aws_security_group" "main" {
  name        = "${var.env}-${var.type}.alb"
  description = "${var.env}-${var.type}.alb"
  vpc_id      = var.vpc_id

  ingress {
    description = "APP"
    from_port   = var.lb_port
    to_port     = var.lb_port
    protocol    = "tcp"
    cidr_blocks = var.sg_cidrs
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(var.tags, { Name = "${var.env}-${var.type}.alb" })
}


resource "aws_security_group_rule" "https" {
  from_port         = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.main.id
  to_port           = 443
  type              = "ingress"
  cidr_blocks       = var.sg_cidrs
}


resource "aws_lb" "main" {
  name               = "${var.env}-${var.type}"
  internal           = var.internal
  load_balancer_type = "application"
  security_groups    = [aws_security_group.main.id]
  subnets            = var.subnets
  tags = merge(var.tags, { Name = "${var.env}-${var.type}.alb" })
}



