data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["vpc-turma3-grupo6-tf"]
  }
}

# data "aws_subnet_ids" "selected" {
#   vpc_id = data.aws_vpc.selected.id
# }

# data "aws_subnet" "selected" {
#   for_each = data.aws_subnet_ids.selected.ids
#   id       = each.value
# }