terraform {
  required_version = ">= 1.5.0"

  backend "s3" {
    bucket       = "paynest-terraform-state-505610408493-us-east-1"
    key          = "paynest/dev/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
