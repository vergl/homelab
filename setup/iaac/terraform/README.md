# Usage

0. Install [Terraform](https://developer.hashicorp.com/terraform/downloads)
1. Create a file with an extension *.auto.tfvars* with variable values. Example data is stored in the file *example-credentials.tfvars*
2. Initialize terraform with `terraform init`
3. Plan terraform template with `terraform plan`
4. Create VMs with `terraform apply --auto-approve`
5. Destroy VMs with `terraform destroy --auto-approve`