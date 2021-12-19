resource "aws_eip" "nat_gateway" {
  count = 3
  vpc = true
}

resource "aws_nat_gateway" "turma3_grupo6" {
  count             = length(keys(var.azs_priv))
  allocation_id = aws_eip.nat_gateway[count.index].id
  subnet_id     = aws_subnet.subnets_priv[count.index].id 
  tags = {
    Name = "ng-turma3-grupo6-${var.azs_priv[keys(var.azs_priv)[count.index]]}-tf"
  }
}
