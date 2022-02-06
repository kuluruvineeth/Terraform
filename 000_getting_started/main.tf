terraform {
  # Using a single workspace:
  cloud {
    organization = "kuluru"

    workspaces {
      name = "getting-started"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.74.0"
    }
  }
}

# local variables
locals {
  project_name = "kuluru"
}


