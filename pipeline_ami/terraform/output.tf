# output "subnet" {
#   value       = [
#     for item in data.aws_subnet_ids.selected.ids:
#     <<EOF
#     subnet: ${item}
#     EOF
#   ]
# }

# output "subnet_cidr_blocks" {
#   value = [for s in data.aws_subnet.selected : s.cidr_block]
# }

output "subnet_id" {
  value = [for s in data.aws_subnet.selected : 
  <<EOF
  ${s.availability_zone} ; ${s.id}
  EOF
  ]
}

# output "subnets" {
#   value = [
#     for item in aws_subnet.my_subnets :
#     <<EOF
#     vpc_name: ${item.tags.Name}
#     cidr_block: ${item.cidr_block}
#     EOF
#   ]
# }

# output ec2 {
#   value       = [
#     for item in aws_instance.ec2:
#     <<EOF
  
#     public_ip: ${item.public_ip}
#     private_ip: ${item.private_ip}
#     name: ${item.tags.Name}
#     ssh -i ./id_rsa ubuntu@${item.private_dns}
#     ssh -i ./id_rsa ubuntu@${item.public_ip}
#     sg: ${aws_security_group.allow_ssh.id}
#     key_name:${item.key_name}
#     subnet_id: ${item.subnet_id}
#     vpc_id: ${aws_vpc.main.id}
#     EOF
#   ]
# }

# output "ami" {
#   value = [
#     "AMI: ${aws_ami_from_instance.ami.id}"
#   ]
# }

output "ec2" {
  value = [
    "resource_id: ${aws_instance.ec2.id}",
    "public_ip: ${aws_instance.ec2.public_ip}",
    "public_dns: ${aws_instance.ec2.public_dns}",
    "ssh -i /home/ubuntu/ ~/ProjetoFinal/authentication/id_rsa ubuntu@${aws_instance.ec2.public_dns}"
  ]
}