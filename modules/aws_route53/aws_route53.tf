# Create Domain name using Route 53
resource "aws_route53_zone" "PACWAADT2_zone" {
  name          = var.Domain_name
  force_destroy = true
}
resource "aws_route53_record" "PACWAADT2_www" {
  zone_id = aws_route53_zone.PACWAADT2_zone.zone_id
  name    = var.Domain_name
#   type    = "CNAME"
#   ttl     = "60"
#   records = [var.PACWAADT2_docker_elb_dns_name]

    type    = "A"
     alias {
      name                   = var.target_dns_name
      zone_id                = var.target_zone_id
      evaluate_target_health = var.evaluate_target_health
    }
}