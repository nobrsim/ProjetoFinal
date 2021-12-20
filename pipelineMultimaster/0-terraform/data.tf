# data "aws_ami" "ami-ubuntu" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
#   }
#   owners = ["099720109477"]
# }

# data "aws_vpc" "selected" {
#   filter {
#     name   = "tag:Name"
#     values = [var.vpc_id]
#   }
# }

data "aws_ami" "ami-ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ami-turma3-grupo6-*"]
  }
  owners = ["850077084180"]
}

data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["vpc-turma3-grupo6-tf"]
  }
}
