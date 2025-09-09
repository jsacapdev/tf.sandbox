# Terraform Sandbox

Current Status

|Workflow Name|Status|
|-|-|
|Deployment|[![Infrastructure as Code](https://github.com/jsacapdev/tf.sandbox/actions/workflows/iac-deploy.yml/badge.svg)](https://github.com/jsacapdev/tf.sandbox/actions/workflows/iac-deploy.yml)|
|Evergreen|[![Dependabot Updates](https://github.com/jsacapdev/tf.sandbox/actions/workflows/dependabot/dependabot-updates/badge.svg)](https://github.com/jsacapdev/tf.sandbox/actions/workflows/dependabot/dependabot-updates)|

Useful started commands:

``` bash
az login --use-device-code

$env:ARM_SUBSCRIPTION_ID=""; `
$env:ARM_USE_OIDC="true"; `
$env:ARM_USE_AZUREAD="true"; `
$env:ARM_TENANT_ID="";

terraform init `
-backend-config="storage_account_name=" `
-backend-config="container_name=tfstate" `
-backend-config="key=dev.api.tfstate";

tf validate

tf plan -var-file="env/dev.tfvars"

tf apply -var-file="env/dev.tfvars" -auto-approve

tf destroy -var-file="env/dev.tfvars" -auto-approve
```
