output "subnets" {
  value = [
    for item in aws_subnet.my_subnets :
    <<EOF
    vpc_name: ${item.tags.Name}
    cidr_block: ${item.cidr_block}
    EOF
  ]
}


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
