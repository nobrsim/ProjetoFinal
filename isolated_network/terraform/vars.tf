variable "azs" {
  default = {
    a = "aza-pub",
    b = "azb-pub",
    c = "azc-pub"
  }
}

variable "azs_priv" {
  default = {
    a = "aza-priv",
    b = "azb-priv",
    c = "azc-priv"
  }
}

# Variáveis necessárias para a criação de EC2. Nessa etapa criamos apenas a rede.

# variable "nome" {
#   type = string
#   description = "Digite o nome da instancia"
# }

# variable "tipo" {
#   type = string
#   description = "Digite o tipo da instancia"
# }
