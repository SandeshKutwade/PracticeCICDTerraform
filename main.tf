resource "aws_instance" "CITerraform" {
  ami           = "ami-0ad21ae1d0696ad58"  # Update with a valid AMI ID
  instance_type = "t2.micro"

  tags = {
    Name = "InstaceServer"
  }
}

resource "aws_s3_bucket" "StateBucket" {
  bucket = "terraformstateitsminne"
  tags = {
    Name = "StateBucket"
  }
}
resource "aws_dynamodb_table" "StateDynamoTable" {
  name         = "statefile_table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }

}

terraform {
  backend "s3" {
    bucket = "terraformstateitsminne"
    key = "terraform/state"
    region = "ap-south-1"
    encrypt = false
    dynamodb_table = "statefile_table"
  }
}

