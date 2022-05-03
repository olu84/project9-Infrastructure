output "PACWAADT2_Jenkins_LB" {
  value = aws_elb.PACWAADT2_Jenkins_LB.dns_name
}
output "PACWAADT2_Docker_LB" {
  value = aws_elb.PACWAADT2_Docker_LB.dns_name
}
output "PACWAADT2_Docker_LB_id" {
  value = aws_elb.PACWAADT2_Docker_LB.zone_id
}