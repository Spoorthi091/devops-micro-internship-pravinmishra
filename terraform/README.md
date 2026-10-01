# Terraform Infrastructure Scaffold

## Purpose

This directory contains a reusable Terraform scaffold for the project. It creates a private, versioned, server-side encrypted Amazon S3 bucket for project artifacts.

## Directory structure

```text
terraform/
|-- main.tf
|-- variables.tf
|-- outputs.tf
|-- providers.tf
|-- versions.tf
|-- terraform.tfvars.example
|-- README.md
`-- .gitignore
```

## Prerequisites

- Terraform >= 1.5.0
- An AWS account with permission to create the resources in `main.tf`
- AWS CLI installed and configured, or another supported AWS authentication method

## AWS authentication

Authenticate Terraform through the AWS CLI configuration, environment variables, an IAM role, or an instance profile. Do not put access keys, passwords, or other secrets in Terraform files or variable files.

## Initialize Terraform

From this directory, run:

```powershell
terraform init
```

## Validate the configuration

```powershell
terraform validate
```

## Review the execution plan

Copy `terraform.tfvars.example` to `terraform.tfvars`, adjust the non-secret values as needed, and run:

```powershell
terraform plan
```

The local `terraform.tfvars` file is ignored by Git.

## Apply the infrastructure

```powershell
terraform apply
```

Review the plan and confirm it before Terraform creates resources.

## Destroy the infrastructure

```powershell
terraform destroy
```

Use this only when the resources are no longer needed. Verify the target account and region first.

## Security considerations

- No AWS credentials or secrets are stored in this directory.
- Public access to the S3 bucket is blocked.
- S3 versioning and server-side encryption are enabled.
- Keep state files private because Terraform state can contain sensitive infrastructure details.
- Use least-privilege IAM permissions and review plans before applying changes.