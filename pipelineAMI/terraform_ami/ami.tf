resource "aws_ami_from_instance" "ami" {
  name               = "ami-turma3-grupo6-${var.versao}"
  source_instance_id = var.resource_id
}