variable "name_app" {
    description = "Name instance EC2"
    type = string
    default = "glpi"
}

resource "aws_vpc" "vpc_app" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "VPC_GLPI"
  }
}

resource "aws_subnet" "subnet_app_glpi" {
  # Asociar la vpc creada annteriormente
  vpc_id = aws_vpc.vpc_app.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1c"
  tags = {
    Name = format("Subnet_public_%s",var.name_app)
  }
}

resource "aws_internet_gateway" "gw_app" {
  vpc_id = aws_vpc.vpc_app.id
  tags = {
    Name = "Gw_app"
  }
}

# tablas de enrutamiento
resource "aws_route_table" "rt_default_app" {
  vpc_id = aws_vpc.vpc_app.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw_app.id
  }
  tags = {
    Name = "rt_default_app"
  }
}

resource "aws_route_table_association" "a_rt_default_app_subnet_app_glpi" {
  subnet_id = aws_subnet.subnet_app_glpi.id
  route_table_id = aws_route_table.rt_default_app.id
}