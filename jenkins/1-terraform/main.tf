provider "aws" {
  region = "sa-east-1"
}

variable "subnet_id" {
  type = string
  # description = "Qual versão da imagem?"
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

# data "aws_subnet_ids" "selected" {
#   vpc_id = data.aws_vpc.selected.id
# }

# data "aws_subnet" "selected" {
#   for_each = data.aws_subnet_ids.selected.ids
#   id       = each.value
# }

# output "output_subnetes" {
#   value = [
#     for item in data.aws_subnet.selected :
#     "${item.id} - ${item.cidr_block} - ${item.tags.Name}"
#   ]
# }


resource "aws_instance" "jenkins" {
  subnet_id                   = var.subnet_id
  ami                         = "ami-0e66f5495b4efdd0f"
  instance_type               = "t2.large"
  key_name                    = "kp-turma3-talyson-1"
  associate_public_ip_address = true
  tags = {
    Name = "ec2-talyson-jenkins-tf"
  }
  vpc_security_group_ids = ["${aws_security_group.jenkins.id}"]
  root_block_device {
    encrypted   = true
    volume_size = 32
  }
}

resource "aws_security_group" "jenkins" {
  name        = "acessos_jenkins-talyson-tf"
  description = "acessos_jenkins inbound traffic"
  vpc_id      = data.aws_vpc.selected.id

  ingress = [
    {
      description      = "SSH from VPC"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = null,
      security_groups : null,
      self : null
    },
    {
      description      = "SSH from VPC"
      from_port        = 8080
      to_port          = 8080
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = null,
      security_groups : null,
      self : null
    },
  ]

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"],
      prefix_list_ids  = null,
      security_groups : null,
      self : null,
      description : "Libera dados da rede interna"
    }
  ]

  tags = {
    Name = "jenkins-lab-talyson-tf"
  }
}

# terraform refresh para mostrar o ssh
output "jenkins" {
  value = [
    "jenkins",
    "id: ${aws_instance.jenkins.id}",
    "private: ${aws_instance.jenkins.private_ip}",
    "public: ${aws_instance.jenkins.public_ip}",
    "public_dns: ${aws_instance.jenkins.public_dns}",
    "ssh -i ~/.ssh/kp-turma3-talyson-1.pem ubuntu@${aws_instance.jenkins.public_ip}"
  ]
}

# output "jenkins_completo" {
#   value = aws_instance.jenkins
# }
