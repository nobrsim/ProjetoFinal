variable "nome" {
  type = string
  description = "Digite o nome da instancia"
}

variable "tipo" {
  type = string
  description = "Digite o tipo da instancia"
}

# encontrar uma forma de declarar somente, por exemplo, 1a e o código achar o id da subnet.
variable "subnet_id" {
  type = string
  description = "Digite o tipo da instancia"
}
