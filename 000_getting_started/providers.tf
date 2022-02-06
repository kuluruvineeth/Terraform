# configuring cloud provider
provider "aws" {
  region = "us-east-1"
  access_key = "IAM user's access key"
  secret_key = "IAM user's secret key"
}

provider "aws" {
  region = "eu-west-1"
  alias  = "eu"
  access_key = "IAM user's access key"
  secret_key = "IAM user's secret key"
}