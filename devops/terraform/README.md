## TobaTeachTech

`run terraform`


1. terraform init
2. terraform plan -target=module.vm -out logs/tfplan_vm -var 'path_creds=./services_account/service-account.json' -var 'project=<your-project>' -var 'project_id=<id_project>'
3. terraform apply logs/tfplan_vm


## DESC

- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure
- `target` --> A Resource Address to target and can you use module. for example module.vm && google_sql_database_instance.vm
- `out` --> this command used to output your plan
- `var` --> this command used location services account & project & project_id

## Inputs

| Name                      | Description                   | Type      | Default | Required |
|---------------------------|-------------------------------|-----------|---------|:--------:|
| network\_name             | The name of the network being created | `any` | n/a | yes |
| project\_id               | The ID of the project where this VPC will be created | `any` | n/a | yes |
| routes                    | List of routes being created in this VPC | `list(map(string))` | `[]` | no |
| subnets                   | The list of subnets being created | `list(map(string))` | n/a | yes |






## SOURCE MODULU
- [SOURCE-MODULE](https://github.com/terraform-google-modules) 



