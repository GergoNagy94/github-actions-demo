locals {
    global_vars = read_terragrunt_config(find_in_parent_folders("globals.hcl"))

    project     = local.global_vars.locals.project
    account_id  = local.global_vars.locals.development_account_id
    env         = "development"

    # Modules set true are ignored during Terraform run
    skip_module = {
        vpc                         = false
    }

    # VPC variables
    vpc_cidr                             = "10.0.0.0/16"
    vpc_nat_gateway                      = true
    vpc_single_nat_gateway               = true
    vpc_create_egress_only_igw           = true
    vpc_enable_dns_hostnames             = true
    vpc_enable_dns_support               = true
    region                               = "eu-central-1"
    availability_zone                    = ["eu-central-1a", "eu-central-1b"]

    # Tags
    tags = {
        Name            = "${local.env}-${local.project}"
        Environment     = "${local.env}"
        Project         = "${local.project}"
        ManagedBy       = "Terragrunt"
    }
}