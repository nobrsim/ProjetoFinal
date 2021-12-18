resource "aws_instance" "mysql_instance-dev" {
  subnet_id = data.aws_subnet.selected.id
  ami = data.aws_ami.ubuntu.id
  associate_public_ip_address = true
  instance_type = "t2.large"
  key_name = "key_pair_ec2_dev"
  root_block_device {
    encrypted = true
    volume_size = 20
  }
  tags = {
    Name = "ec2-turma3-grupo6-mysql-dev"
  }
  vpc_security_group_ids = [aws_security_group.projetofinal-mysql.id]
}

resource "aws_instance" "mysql_instance-stag" {
  subnet_id = data.aws_subnet.selected.id
  ami = data.aws_ami.ubuntu.id
  associate_public_ip_address = true
  instance_type = "t2.large"
  key_name = "key_pair_ec2_dev"
  root_block_device {
    encrypted = true
    volume_size = 20
  }
  tags = {
    Name = "ec2-turma3-grupo6-mysql-stag"
  }
  vpc_security_group_ids = [aws_security_group.projetofinal-mysql.id]
}

resource "aws_instance" "mysql_instance-prod" {
  subnet_id = data.aws_subnet.selected.id
  ami = data.aws_ami.ubuntu.id
  associate_public_ip_address = true
  instance_type = "t2.large"
  key_name = "key_pair_ec2_dev"
  root_block_device {
    encrypted = true
    volume_size = 20
  }
  tags = {
    Name = "ec2-turma3-grupo6-mysql-prod"
  }
  vpc_security_group_ids = [aws_security_group.projetofinal-mysql.id]
}
