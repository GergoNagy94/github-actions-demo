locals {
    global_vars = read_terragrunt_config(find_in_parent_folders("globals.hcl"))

    project     = local.global_vars.locals.project
    region      = local.global_vars.locals.region
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
    region                               = "eu-west-2"
    availability_zone                    = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]

    # Tags
    tags = {
        Name            = "${local.env}-${local.project}"
        Environment     = "${local.env}"
        Project         = "${local.project}"
        ManagedBy       = "Terragrunt"
    }
}