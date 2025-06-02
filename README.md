# Terragrunt AWS Infrastructure

## Repo Structure

- `infrastructure/` – Infrastructure as Code with Terragrunt/Terraform
- `config/` – Linting, release, and other project config files
- `docs/` – Study documentation
- `.github/workflows/` – GitHub Actions for CI/CD

## Requirements

- Terraform 1.9.8
- Terragrunt 0.55.19
- Node.js 20

## CI/CD Overview

- **Semantic Release** for automated versioning & changelogs
- **Commitlint** for conventional commit rules
- **Terragrunt Plan/Validate** on PRs and pushes to `main`

## Secrets

- `AWS_ACCOUNT_ID`, `AWS_ROLE_NAME` set in GitHub Actions Secrets