# Terraform
Repo for all terraform related works

## 1. Basics of Terraform:
- Creating main.tf
- Add AWS Provider
- Generate and configure AWS credentials
- Configure an AWS Virtual Machine
- Initialize terraform project
- Terraform fmt
- Terraform validate
- Terraform plan
- Terraform apply
- Terraform appply (updating)
- Create Input Variables
- Set Locals
- Create Outputs
- Use a Terraform Module
- Divide project into mutiple files
- Terraform destroy
- Create a Terraform Cloud workspace
- Migrate local to remote workspace
- Move AWS Credentials to Env Vars

## 2. Terraform Provisioning:
- user_data
- self
- null resources
- local-exec
- remote-exec
- connection
- file

## 3. Terraform Providers:
- AWS
- Azure
- GCP
- Kubernetes
- Oracle Cloud Infrastructure
- Alibaba Cloud

## 4. Terraform Language
- Hashicorp Configuration files(Terraform files)
- Terraform Settings
- Hashicorp Configuration Language
    - Terraform Language(.tf)
    - Packer Template(.pkr.hcl)
    - Vault Policies
    - Boundary Controllers and Workers(.hcl)
    - Consul Configuration(.hcl)
    - Waypoint Application Configuration(.hcl)
    - Nomad Job Specifications(.nomad)
    - Shipyard Blueprint(.hcl)

## 5. Variables and Outputs
- Variables
    - Inputs Variables
    - Variable Definition Files(.tfvars)
    - Variables via Environment Variables(TF_VAR_<name>)
    - Loading Input Variables
        - terraform.tfvars(autoloaded)
        - my_variables.tfvars(not autoloaded)
        - my_variables.auto.tfvars(autoloaded)
        - (-var-file filename) via Command Line
        - (-var single_variable) via Command Line
    - Env > terraform.tfvars > *.auto.tfvars > -var and -var-file
- Outputs
    - terraform output
- Local Values(local.<NAME>)
- Data Sources (data)
- References to Named Values
    - Resources - **Resource Type**.*Name*
    - Input variables - var.*Name*
    - Local values - local.*Name*
    - Child module outputs - module.*Name*
    - Data sources - data.**Data Type**.*Name*
    - Filesystem and Workspace - path.module, path.root, path.cwd, terraform.workspace
    - Block-local values - count.index, each.key/value, self.*attribute*
- Outputs Chaining

## 6. Resource Meta-Arguments
- depends_on
- count
- for_each
- provider
- lifecycle
- provisioner
- alias

## 7. Expressions
- Types and Values
- Strings and Templates
- References to Values
- Operators
- Function Calls
- Conditional Expressions
- For Expressions
- Splat Expressions
- Dynamic Blocks
- Type Constraints

# 8. Terraform State
- terraform state list
- terraform state mv
- terraform state pull
- terraform state push
- terraform state replace-provider
- terraform state rm
- terraform state show
- Terraform state backups

## 9. Terraform Init and Get
- terraform init -upgrade
- terraform init -get-plugins-false
- terraform init -plugin-dir=PATH
- terraform get

## 10. Modifying Commands
- terraform fmt
- terraform validate
- terraform console
- terraform plan
- terraform apply

## 11. Infrastructure Drift
- Replacing Resources - terraform taint(terraform apply -replace="resource_name")
- Resource Addressing - modules and resources
- terraform import **RESOURCE_ADDRESS** *ID*
- terraform refresh(modifies only terrform state file) - replaced by terraform apply -refresh-only -auto-approve

## 12. Terraform Troubleshooting
- Language errors - terraform fmt,validate,version
- State errors - terraform refresh,apply,--replace flag
- Core errors - TF_LOG, Open Github Issue
- Provider errors - TF_LOG, Open Github Issue

## 13. Terraform Modules
- Public Modules and Private Modules(hostname/namespace/provider/name)
- Publishing Modules - terraform-**PROVIDER**-**NAME**
- Verified Modules
- Publishing Modules

## 14. Team Workflows
- Write,Plan,Apply.
- Individual Terraform Workflow
- Team Terraform Workflow