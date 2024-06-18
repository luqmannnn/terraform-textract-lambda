
# DNS record using Route53.
data "aws_route53_zone" "my_domain" {
  name         = "sctp-sandbox.com"
  private_zone = false
}

resource "aws_route53_record" "custom_domain_record" {
  name = "luqman-api" # The subdomain (sctp-sandbox.com)
  type = "CNAME"
  ttl  = "300" # TTL in seconds

  records = ["${aws_api_gateway_rest_api.my_api.id}.execute-api.us-east-1.amazonaws.com"]

  zone_id = data.aws_route53_zone.my_domain.zone_id
}
