terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Use latest version if possible
      version = "~> 5.0"
    }
  }


  backend "s3" { # Enable server-side encryption (optional but recommended)

    bucket  = "jenkins-891377135193"                # ← your existing bucket
    key     = "jenkins/new-jenkins-s3-test.tfstate" # ← keep or change this (e.g., "path/to/my/state.tfstate")
    region  = "us-east-1"                           # ← must match your bucket's region
    encrypt = true                                  # recommended: enables server-side encryption
    # Optional but highly recommended for locking (prevents concurrent applies):
    # dynamodb_table = "your-terraform-lock-table"  # create a DynamoDB table if you don't have one
  }
}
provider "aws" {
  region = "us-east-1"
}
