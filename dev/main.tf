terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.24.0"
    }
  }
  backend "s3" {
  }
}

provider "aws" {
  region = "us-east-1" # Replace with your desired AWS region
}

resource "aws_ssm_parameter" "example_secret" {
  name        = "/dev/example/secret/"
  description = "Example secret parameter"
  type        = "SecureString"
  value       = "dummy-secret-value"

  tags = {
    Environment = "dev"
  }
}


output "example_secret" {
  value = "filterme: abc123"
}
