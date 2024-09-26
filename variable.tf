variable "name_app" {
    description = "Name app in EC2"
    type = string
    default = "glpi"
}

variable "I_EC2" {
    description = "detalles de instancia EC2"
    type = map
    default = {
        "ami" = "ami-04a81a99f5ec58529"
        "instance_type" = "t2.micro"
        "key_name" = "key_Windows_Personal"
    }
}