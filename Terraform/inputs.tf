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
  default     = "yoursubnet"
}
