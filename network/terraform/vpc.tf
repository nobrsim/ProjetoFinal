resource "aws_vpc" "main" {
  cidr_block       = "10.60.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "vpc-turma3-grupo6-tf"
  }
}