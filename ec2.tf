resource "aws_instance" "instancia_trf" {
  ami = var.I_EC2["ami"]
  instance_type = var.I_EC2["instance_type"]
  key_name = var.I_EC2["key_name"]
  associate_public_ip_address = true
  subnet_id = aws_subnet.subnet_app_glpi.id
  vpc_security_group_ids = [aws_security_group.sg_app.id]
  tags = {
    Name = var.name_app
  }
}