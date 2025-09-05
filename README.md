# Terraform Sandbox

Useful started commands:

``` bash
az login --use-device-code

tf init

tf plan -var-file="environments/dev.tfvars"

tf apply -var-file="environments/dev.tfvars" -auto-approve

tf destroy -var-file="environments/dev.tfvars" -auto-approve
```

