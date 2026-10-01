# Scaffold Terraform

## Purpose

Generate a complete Terraform infrastructure scaffold for the current project.

## Instructions

When the user runs `/scaffold-terraform`, inspect the current workspace and create or update the `terraform/` directory with a complete Terraform infrastructure setup.

Before creating files:

1. Inspect the current project structure.
2. Do not modify or delete unrelated project files.
3. Do not overwrite existing Terraform files unless necessary.
4. Keep the generated infrastructure organized and reusable.
5. Do not include hard-coded AWS credentials, access keys, passwords, or secrets.

## Required Directory

Create:

terraform/

## Required Files

The `terraform/` directory must contain:

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `providers.tf`
- `versions.tf`
- `terraform.tfvars.example`
- `README.md`
- `.gitignore`

## File Requirements

### providers.tf

Configure the AWS provider and use a variable for the AWS region.

### versions.tf

Define the required Terraform version and AWS provider version.

### variables.tf

Define reusable variables for:

- AWS region
- project name
- environment

Each variable should have a description and sensible default where appropriate.

### main.tf

Create a basic AWS infrastructure scaffold using Terraform resources.

Use variables instead of hard-coded configuration values wherever practical.

Do not include credentials or secrets.

### outputs.tf

Expose useful infrastructure outputs such as:

- project name
- AWS region
- created resource identifiers where applicable

### terraform.tfvars.example

Provide example values for the Terraform variables.

Do not include secrets.

### .gitignore

Ignore:

- `.terraform/`
- `.terraform.lock.hcl`
- `*.tfstate`
- `*.tfstate.*`
- `*.tfvars`

Do not ignore:

- `terraform.tfvars.example`

### README.md

Document:

1. Purpose of the Terraform scaffold
2. Directory structure
3. Prerequisites
4. AWS authentication
5. `terraform init`
6. `terraform validate`
7. `terraform plan`
8. `terraform apply`
9. `terraform destroy`
10. Security considerations

## Validation

After creating the files:

1. Verify that the `terraform/` directory exists.
2. Verify that all required files exist.
3. Run `terraform fmt` on the Terraform files.
4. If Terraform is available, run:

terraform init -backend=false

5. If initialization succeeds, run:

terraform validate

6. Do not automatically run `terraform apply`.
7. Do not automatically run `terraform destroy`.

## Final Response

After completing the task, provide:

1. Confirmation that the Terraform scaffold was created.
2. The location of the `terraform/` directory.
3. A complete list of generated files.
4. Validation status.
5. Any warnings or manual actions required.

Do not claim validation succeeded unless it was actually performed.
