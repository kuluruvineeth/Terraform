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
- Inputs Variables
- Variable Definition Files(.tfvars)
- Variables via Environment Variables(TF_VAR_<name>)
- Loading Input Variables
    - terraform.tfvars(autoloaded)
    - my_variables.tfvars(not autoloaded)
    - my_variables.auto.tfvars(autoloaded)
    - (-var-file filename) via Command Line
