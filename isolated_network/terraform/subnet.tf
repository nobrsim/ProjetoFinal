resource "aws_subnet" "my_subnets" {
  count             = length(keys(var.azs))
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.60.${count.index + 1}0.0/24"
  availability_zone = "sa-east-1${keys(var.azs)[count.index]}"

  tags = {
    Name = "sn-turma3-grupo6-${var.azs[keys(var.azs)[count.index]]}-tf"
  }
}

resource "aws_subnet" "subnets_priv" {
  count             = length(keys(var.azs_priv))
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.60.${count.index + 4}0.0/24"
  availability_zone = "sa-east-1${keys(var.azs_priv)[count.index]}"

  tags = {
    Name = "sn-turma3-grupo6-${var.azs_priv[keys(var.azs_priv)[count.index]]}-tf"
  }
}
