resource "aws_security_group" "sg_app" {
  name = "SG access app"
  description = "allow access app, desde cualquier lugar"
  vpc_id = aws_vpc.vpc_app.id
  tags = {
    Name = format("SG_access_%s",var.name_app)
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    # permitir direcciones ip
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow access port 22"
  }

  ingress {
    from_port = 2357
    to_port = 2357
    protocol = "tcp"
    # permitir direcciones ip
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow access port 2357"
  }

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    # permitir direcciones ip
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow access port 3306"
  }

  # conexiones de salida
  egress {
    from_port = 0
    to_port = 0
    # -1: permitir cualquier protocolo
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow access any port"
  }

}