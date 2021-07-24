terraform {
  required_version = "~> 1.0.0"
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 2.20.0"
    }
  }
}


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.28.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.0.0"
    }
  }

  required_version = ">= 0.14.0"
}
~    
