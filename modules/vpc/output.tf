output "vpc_id" {
  value= aws_vpc.PACWAADT2_VPC.id
}
output "PACWAADT2_PvtSN1_id" {
  value= aws_subnet.PACWAADT2_PvtSN1.id
}
output "PACWAADT2_PvtSN2_id" {
  value= aws_subnet.PACWAADT2_PvtSN2.id
}
output "PACWAADT2_PvtSN3_id" {
  value= aws_subnet.PACWAADT2_PvtSN3.id
}
output "PACWAADT2_PvtSN4_id" {
  value= aws_subnet.PACWAADT2_PvtSN4.id
}
output "PACWAADT2_PubSN1_id" {
  value= aws_subnet.PACWAADT2_PubSN1.id
}
output "PACWAADT2_PubSN2_id" {
  value= aws_subnet.PACWAADT2_PubSN2.id
}
output "PACWAADT2_IGW_id" {
  value= aws_internet_gateway.PACWAADT2_IGW.id
}
output "PACWAADT2_NAT-GW_id" {
  value= aws_nat_gateway.PACWAADT2_NAT-GW.id
}
output "aws_key_pair_pap2key" {
  value = aws_key_pair.pap2key.id
  }