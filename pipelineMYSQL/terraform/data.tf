# data "aws_subnet" "selected" {
#  # filter {
#  #   name   = "tag:Name"
#  #   values = ["sn-turma3-grupo6-azc-priv-tf"]
#  # }
#  id = "subnet-0a3d1bbbe18b0aaef"
# }

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # ou ["099720109477"] ID master com permissão para busca

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"] # exemplo de como listar um nome de AMI - 'aws ec2 describe-images --region us-east-1 --image-ids ami-09e67e426f25ce0d7' https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-images.html
  }
}

# data "aws_vpc" "selected" {
#  # filter {
#  #   name   = "tag:Name"
#  #   values = ["vpc-turma3-grupo6-tf"]
#  # }
#   id = "vpc-07c54ab430280a876"
# }

data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["vpc-turma3-grupo6-tf"]
  }
}