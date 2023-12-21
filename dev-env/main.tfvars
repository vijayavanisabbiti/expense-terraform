vpc_cidr_block = "10.10.0.0/16"
env = "dev"
tags = {
  company = "XYZ Co"
  bu_unit = "Finance"
  project_name = "expense"
}

public_subnets = ["10.10.0.0/24", "10.10.1.0/24"]
web_subnets = ["10.10.2.0/24", "10.10.3.0/24"]
app_subnets = ["10.10.4.0/24", "10.10.5.0/24"]
db_subnets = ["10.10.6.0/24", "10.10.7.0/24"]

azs = ["us-east-1a", "us-east-1b"]
account_id = "469562195624"
default_vpc_id = "vpc-03e4df30d67f115f2"
default_route_table_id = "rtb-07bd0eccb9edc93e1"
default_vpc_cidr = "172.31.0.0/16"

rds_allocated_storage = 20
rds_engine = "mysql"
rds_engine_version = "5.7.44"
rds_instance_class = "db.t3.micro"

backend = {
  app_port       = 8080
  instance_count = 1
  instance_type  = "t3.micro"
}

frontend = {
  app_port       = 80
  instance_count = 1
  instance_type  = "t3.micro"
}

bastion_cidrs = ["172.31.33.145/32"]

public_alb = {
  internal   = false
  lb_port    = 80
  type       = "public"
  component  = "frontend"
  enable_https = true
}

backend_alb = {
  internal = true
  lb_port = 80
  type = "backend"
  component = "backend"
  enable_https = false
}

route53_zone_id = "Z01843807JDTGXSQ26S6"
kms = "arn:aws:kms:us-east-1:469562195624:key/018d9caf-8bbf-49cd-8a57-c0020efdf61b"
certificate_arn = "arn:aws:acm:us-east-1:469562195624:certificate/1c0fb678-0dd6-4710-8a9b-fb4718a7daeb"
