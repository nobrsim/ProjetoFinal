# resource "aws_ami_from_instance" "ami" {
#   name               = "ami-turma3-grupo6-${var.versao}"
#   source_instance_id = aws_instance.ec2.id
# }