resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  tags = merge(var.tags, { Name = var.env })
}

resource "aws_subnet" "public" {
  count = length(var.public_subnets)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnets[count.index]
  tags = merge(var.tags, { Name = "public_subnet" })
  availability_zone = var.azs[count.index]
}

resource "aws_subnet" "web" {
  count = length(var.web_subnets)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.web_subnets[count.index]
  tags = merge(var.tags, { Name = "web_subnet" })
  availability_zone = var.azs[count.index]
}

resource "aws_subnet" "app" {
  count = length(var.app_subnets)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.app_subnets[count.index]
  tags = merge(var.tags, { Name = "app_subnet" })
  availability_zone = var.azs[count.index]
}

resource "aws_subnet" "db" {
  count = length(var.db_subnets)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.db_subnets[count.index]
  tags = merge(var.tags, { Name = "db_subnet" })
  availability_zone = var.azs[count.index]
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags = merge(var.tags, { Name = "public" })
}

resource "aws_route_table" "web" {
  vpc_id = aws_vpc.main.id
  tags = merge(var.tags, { Name = "web" })
}

resource "aws_route_table" "app" {
  vpc_id = aws_vpc.main.id
  tags = merge(var.tags, { Name = "app" })
}

resource "aws_route_table" "db" {
  vpc_id = aws_vpc.main.id
  tags = merge(var.tags, { Name = "db" })
}

resource "aws_route_table_association" "public" {
  count = length(aws_subnet.public)
  subnet_id      = aws_subnet.public.*.id[count.index]
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "web" {
  count = length(aws_subnet.web)
  subnet_id      = aws_subnet.web.*.id[count.index]
  route_table_id = aws_route_table.web.id
}

resource "aws_route_table_association" "app" {
  count = length(aws_subnet.app)
  subnet_id      = aws_subnet.app.*.id[count.index]
  route_table_id = aws_route_table.app.id
}

resource "aws_route_table_association" "db" {
  count = length(aws_subnet.db)
  subnet_id      = aws_subnet.db.*.id[count.index]
  route_table_id = aws_route_table.db.id
}
