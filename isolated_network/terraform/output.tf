output "subnets_pub" {
  value = [
    for item in aws_subnet.my_subnets :
    <<EOF
    vpc_name: ${item.tags.Name}
    cidr_block: ${item.cidr_block}
    EOF
  ]
}

output "subnets_priv" {
  value = [
    for item in aws_subnet.subnets_priv :
    <<EOF
    vpc_name: ${item.tags.Name}
    cidr_block: ${item.cidr_block}
    EOF
  ]
}

output "rt-priv" {
  value       = [
    for item in aws_route_table.rt_terraform_priv:
    <<EOF
    rt: ${item.id}
    EOF
  ]
}

# output "ng" {
#   value       = [
#     for item in aws_nat_gateway.turma3_grupo:
#     <<EOF
#     ng: ${item.id}
#     EOF
#   ]
# }


output "summary" {
  value       = [
    <<EOF
    ig: ${aws_internet_gateway.gw.id}
    vpc: ${aws_vpc.main.id}
    rt_pub: ${aws_route_table.rt_terraform_pub.id}
    EOF

  ]
}
