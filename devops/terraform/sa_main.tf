module "service_accounts" {
  source        = "terraform-google-modules/service-accounts/google"
  version       = "~> 3.0"
  project_id    = var.project_id
  #prefix        = "test-sa-tf"
  display_name = "create services account for terraform"
  names         = ["account-1", "account-2", "account-3", "account-4"]
#   project_roles = [
#     "project-foo=>roles/viewer",
#     "project-spam=>roles/storage.objectViewer",
#   ]
}


#pas create sa apakah IAM ke create secara manual