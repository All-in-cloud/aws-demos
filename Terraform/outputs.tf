### When the infrastructure deployment is completed, output the value of private DNS
output "ip_address" {
  value = "${aws_instance.web.public_ip}"
}
