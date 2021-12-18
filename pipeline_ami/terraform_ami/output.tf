output "ami" {
  value = [
    "AMI: ${aws_ami_from_instance.ami.id}"
  ]
}