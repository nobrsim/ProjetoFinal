resource "aws_instance" "ec2" {
  subnet_id     = var.subnet_id
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.tipo
  # key_name                    = aws_key_pair.public_key.id
  # key_name                    = "kp-turma-victor-dev"
  key_name                    = "kp-turma3-talyson-1"
  # key_name                    = "key_pair_ec2_dev"
  associate_public_ip_address = true
  vpc_security_group_ids      = ["${aws_security_group.allow_ssh.id}"]
  root_block_device {
    encrypted   = true
    volume_size = 8
  }
  tags = {
    Name = "${var.nome}"
  }

}

# resource "aws_key_pair" "public_key" {
#   key_name   = "public_key_grupo6_tf"
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDWYm8/MDXxexUeYPY6ovt/x+6C3hpjPs03BZ5Dl9vopinBxaDh4E0jNowiojimpvyZTedBaCnbZ0i5ddTwEfUid+m4hxCPuIbHq7NdIbG6c/X/alx9okSl9R72/DWXNT9J+M59bPtMm4DcEQsYVOY527iP//0vXXLn5gJrWD/+jncarEymgPHRZNPc3UhF0MpNZuaFzkH68mcWrXCvNfR6LP7R9ELEzFdBhL3ue/xlNH70D4RI37NOOOXfbTHyb4bBi37K0P8Ii6A4j0wsvYBvRIrPmEXQ88sKa0sLqW8FFJbdD9dLIAoIFpyALXcwhjq/12n83OKB+0pZlyKDhpwCdBSzE6FuYbuxAK7qnzHrvbO2dhnonv+MYDRA3KDWNnP2gqJvio630YY3fcd9Gc9xLbCDu+ZS6EAy1qCTdAgmG4KblWUfGx9GbfZ77q1HJMSulmxp9es9gMB650lSCDf6ZSQh8Lm8gXffP64z7mX8FxQPkyYX5/eejXXyRdZil7U= ubuntu@turma3-talyson-dev" 

# }