provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0ad21ae1d0696ad58"  # Update with a valid AMI ID
  instance_type = "t2.micro"

  tags = {
    Name = "FeatureIaC"
  }
}

