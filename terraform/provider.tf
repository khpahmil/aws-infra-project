
provider "aws" {
  region = "ap-southeast-1" # sesuaikan
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
