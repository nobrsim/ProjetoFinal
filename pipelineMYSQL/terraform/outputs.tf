output "output-mysql-dev" {
  value = [
    "mysql_instance_dev ${aws_instance.mysql_instance-dev.private_ip}"
  ]
}

output "output-mysql-stag" {
  value = [
    "mysql_instance_stag ${aws_instance.mysql_instance-stag.private_ip}"
  ]
}

output "output-mysql-prod" {
  value = ["mysql_instance_prod ${aws_instance.mysql_instance-prod.private_ip}"]
}