### Deploy a resource of type "aws_instance"" with the logical name "Web".
### We use the data value of the ami id found in inputs.tf, and the subnet_id defined in inputs.tf

resource "aws_instance" "web" {
  create_before_destroy = "true"
  ami           = "${data.aws_ami.amazonlinux.id}"
  instance_type = "t2.micro"
  subnet_id     = "${var.SUBNET}"
  key_name      = "zu697-frankfurt"
  associate_public_ip_address = "true"
  vpc_security_group_ids = ["sg-0fcb64bc759982301"]

  tags {
    Name = "HelloWorld"
  }
}
