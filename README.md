# terraform boilerplate

![Forks](https://img.shields.io/github/forks/tobiasbjelk/terraform_boilerplate)
![Stars](https://img.shields.io/github/stars/tobiasbjelk/terraform_boilerplate)

Welcome to this Terraform Boilerplate repository! This repository contains boilerplate code for setting up infrastructure using Terraform based on Microsoft Azure tho it can easily be altered to fit any cloud or backend. This boilerplate is designed to save you time and effort, providing you with a pre defined structure to start your project.

## Features

- Consistent file and folder naming conventions
- Detailed comments for easy understanding
- Sample configurations for different environments (dev, test)
- Pre-configured for use with Azure backend.

provider version is locking version under next major release to avoid breaking changes.

## Prerequisites

- AzureCLI
  - `winget install -e --id Microsoft.AzureCLI`
- terraform
  - `winget install -e --id Hashicorp.Terraform`


## Getting Started

1. **Clone the repository** - Clone this repository to your local machine.

```powershell
git clone https://github.com/tobiasbjelk/terraform_boilerplate.git
```

2. edit line 16 in `.gitignore` so exclude tfvars files from your source control. these files are only here now for boilerplate reasons.

3. delete content in `main.tf` as the code their is only for example purposes. And add your own code. **OR** leave it there to test your backend configuration and access to your cloud environment.

4. Initialize Terraform - Navigate to the terraform/ directory and initialize Terraform.

```powershell
terraform init -backend-config=./env/env.backend.tfvars
```
