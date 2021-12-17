resource "aws_route_table" "rt_terraform_pub" {
  vpc_id = aws_vpc.main.id

  route = [
    {
      carrier_gateway_id         = ""
      cidr_block                 = "0.0.0.0/0"
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      gateway_id                 = aws_internet_gateway.gw.id
      instance_id                = ""
      ipv6_cidr_block            = ""
      local_gateway_id           = ""
      nat_gateway_id             = ""
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    }
  ]

  tags = {
    Name = "rt-turma3-talyson-tf"
  }
}

resource "aws_route_table" "rt_terraform_priv" {
  vpc_id = aws_vpc.main.id
  count             = length(keys(var.azs_priv))
  route = [
      {
        carrier_gateway_id         = ""
        cidr_block                 = "0.0.0.0/0"
        destination_prefix_list_id = ""
        egress_only_gateway_id     = ""
        gateway_id                 = ""
        instance_id                = ""
        ipv6_cidr_block            = ""
        local_gateway_id           = ""
        nat_gateway_id             = aws_nat_gateway.turma3_grupo6[count.index].id
        network_interface_id       = ""
        transit_gateway_id         = ""
        vpc_endpoint_id            = ""
        vpc_peering_connection_id  = ""
      }
  ]
  tags = {
    Name = "rt-turma3-grupo6-${var.azs_priv[keys(var.azs_priv)[count.index]]}-tf"
  }
}

resource "aws_route_table_association" "a" {
  count          = length(keys(var.azs))
  subnet_id      = aws_subnet.my_subnets[count.index].id
  route_table_id = aws_route_table.rt_terraform_pub.id
}


resource "aws_route_table_association" "b" {
  count          = length(keys(var.azs_priv))
  subnet_id      = aws_subnet.subnets_priv[count.index].id
  route_table_id = aws_route_table.rt_terraform_priv[count.index].id
}