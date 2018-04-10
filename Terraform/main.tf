### Deploy a resource of type "aws_instance"" with the logical name "Web".
### We use the data value of the ami id found in inputs.tf, and the subnet_id defined in inputs.tf

resource "aws_instance" "web" {

  ami           = "${data.aws_ami.amazonlinux.id}"
  instance_type = "t2.micro"
  subnet_id     = "${var.SUBNET}"
  key_name      = "mykey"
  associate_public_ip_address = "true"
  vpc_security_group_ids = ["${var.SECURITYGROUP}"]

  tags {
    Name = "HelloWorld"
  }

  lifecycle {
    create_before_destroy = "true"
  }

}
