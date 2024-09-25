resource "aws_instance" "instancia_trf" {
  ami = "ami-04a81a99f5ec58529"
  instance_type = "t2.micro"
  key_name = "key_Windows_Personal"
  associate_public_ip_address = true
  subnet_id = aws_subnet.subnet_app_glpi.id
  vpc_security_group_ids = [aws_security_group.sg_app.id]
  tags = {
    Name = var.name_app
  }
}