output "output-mysql-dev" {
  value = [
    "mysql_instance_dev ubuntu@${aws_instance.mysql_instance-dev.private_ip}"
  ]
}

output "output-mysql-stag" {
  value = [
    "mysql_instance_stag ubuntu@${aws_instance.mysql_instance-stag.private_ip}"
  ]
}

output "output-mysql-prod" {
  value = ["mysql_instance_prod ubuntu@${aws_instance.mysql_instance-prod.private_ip}"]
}