variable key_pair_name {
  type        = string
  # default     = "key_pair_ec2_dev"
}

# variable subnet-az-a {
#   type        = string
#   # default     = "subnet-0a3d1bbbe18b0aaef"
# }

# retirei do tfvars: subnet-az-a = "subnet-0a3d1bbbe18b0aaef"

# variable vpc_id {
#   type        = string
#   # default     = "vpc-turma3-simone"
#   description = "description"
# }

#retirei do tfvars: vpc_id = "vpc-turma3-simone"

variable meu_nome {
  type        = string
  # default     = "turma3-grupo6"
  description = "Adicionar seu nome"
}

variable subnet_id {
  type        = string
}
