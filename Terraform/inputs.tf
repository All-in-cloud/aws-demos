provider "aws" {
  region = "eu-central-1"
}

### Find an AMI to use for the deployment
data "aws_ami" "amazonlinux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"] # Amazon
}

### The Subnet to deploy within.
variable "SUBNET" {
  type        = "string"
  description = "(Mandatory) Subnet to deploy within."
  default     = "subnet-4dabca00"
}

variable "SECURITYGROUP" {
  type        = "string"
  description = "Open ports on the instance."
  default     = "sg-0cab3313a2666f81a"
}

## User Data for kickstart the app on ec2

data "template_file" "user_data" {
  template = "${file("advanced.txt")}"
  # vars {
  #   name = "${var.name}"
  # }
}
