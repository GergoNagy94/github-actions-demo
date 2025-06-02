remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = "gergo-actions-demo-bucket"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "${local.region}"
    encrypt        = true
    dynamodb_table = "gergo-actions-demo-lock"

    s3_bucket_tags = {
      Name        = "gergo-actions-demo-bucket"
      Environment = "shared"
      ManagedBy   = "Terragrunt"
    }

    dynamodb_table_tags = {
      Name        = "gergo-actions-demo-lock"
      Environment = "shared"
      ManagedBy   = "Terragrunt"
    }
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "${local.region}"}
EOF
}