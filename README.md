# gitlab-terraform-az
Gitlab terraform base image with az cli installed for managing Azure infrastructure from gitlab ci

## Usage
This image can be used instead of the default gitlab terraform image on terraform CIs
```
image: rafasiqueira/gitlab-terraform-az:latest
variables:
  TF_ROOT: ${CI_PROJECT_DIR}
  TF_ADDRESS: ${CI_API_V4_URL}/projects/${CI_PROJECT_ID}/terraform/state/${CI_PROJECT_NAME}

cache:
  key: example-production
  paths:
    - ${TF_ROOT}/.terraform

before_script:
  - cd ${TF_ROOT}

stages:
  - prepare
  - validate
  - build
  - deploy
(...)
```

## az cli authentication
Authentication can use [certificates](https://docs.microsoft.com/en-us/cli/azure/create-an-azure-service-principal-azure-cli#certificate-based-authentication) or [passwords](https://docs.microsoft.com/en-us/cli/azure/create-an-azure-service-principal-azure-cli#password-based-authentication).

## Azurerm provider configuration
Azurerm provider accepts authentication using service principals with [certificates](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_certificate) or [client secrets](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret)
