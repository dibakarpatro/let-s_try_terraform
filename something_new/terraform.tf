terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.25.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.5.1"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.4"
    }

    time = {
      source  = "hashicorp/time"
      version = "~> 0.10.0"
    }

    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.3.2"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.22.0"  # Adjust this as needed
    }
  }

  backend "s3" {
    bucket = "heeeymybucketishere"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }

  required_version = "~> 1.9.5"
}
