# resource "aws_s3_bucket" "Backendbucket" {
#   bucket = "terraform-state-lock-bucket-its-mine"

# #   versioning {
# #     enabled = true
# #   }
# #   server_side_encryption_configuration {
# #     rule {
# #       apply_server_side_encryption_by_default {
# #         sse_algorithm = "AES256"
# #       }
# #     }
# #   }

#   tags = {
#     Name = "terraform-tate-lock-bucket"
#     Env  = "dev"
#   }
# }

# resource "aws_dynamodb_table" "terraform_lock" {
#   depends_on   = [aws_s3_bucket.Backendbucket]
#   name         = "terrafrm-lock-table"
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key     = "LockID"
#   attribute {
#     name = "LockID"
#     type = "S"
#   }

# }

terraform {
  backend "s3" {
    bucket = "terraform-state-lock-bucket-its-mine"
    key = "State/Secure/TerraformState"
    region = "ap-south-1"
    encrypt = false
    dynamodb_table = "terrafrm-lock-table"

  }
}




