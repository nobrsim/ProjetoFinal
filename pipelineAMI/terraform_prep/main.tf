provider "aws" {
  region = "sa-east-1"
}

data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["vpc-turma3-grupo6-tf"]
  }
}

data "aws_subnet_ids" "selected" {
  vpc_id = data.aws_vpc.selected.id
}

data "aws_subnet" "selected" {
  for_each = data.aws_subnet_ids.selected.ids
  id       = each.value
}

output "output_subnetes" {
  value = [
    for item in data.aws_subnet.selected :
    "${item.id} - ${item.cidr_block} - ${item.tags.Name}"
  ]
}