output "ec2" {
  value = [
    "resource_id: ${aws_instance.ec2.id}",
    "public_ip: ${aws_instance.ec2.public_ip}",
    "public_dns: ${aws_instance.ec2.public_dns}",
    "ssh -i /home/ubuntu/ ~/ProjetoFinal/authentication/id_rsa ubuntu@${aws_instance.ec2.public_dns}"
  ]
}

