module "net_firewall" {
  source                  = "terraform-google-modules/network/google//modules/fabric-net-firewall"
  project_id              = var.project_id
  network                 = var.vpc
  internal_ranges_enabled = true
  internal_ranges         = ["0.0.0.0/0"]
  custom_rules = {
    ingress-sample = {
      description          = "Dummy sample ingress rule, tag-based."
      direction            = "INGRESS"
      action               = "allow"
      ranges               = ["192.168.1.0"]
      sources              = ["spam-tag"]
      targets              = ["psql"]
      use_service_accounts = false
      rules = [
        {
          protocol = "tcp"
          ports    = ["5432"]
        }
      ]
      extra_attributes = {}
    }
    ingress-sample-2 = {
      description          = "Dummy sample ingress rule, tag-based."
      direction            = "INGRESS"
      action               = "allow"
      ranges               = ["192.168.3.0"]
      sources              = ["spam-tag-2"]
      targets              = ["mysql"]
      use_service_accounts = false
      rules = [
        {
          protocol = "tcp"
          ports    = ["3433"]
        }
      ]
      extra_attributes = {}
    }
    ingress-sample-vpn = {
      description          = "Dummy sample ingress rule, tag-based."
      direction            = "INGRESS"
      action               = "allow"
      ranges               = ["192.168.5.0"]
      sources              = ["spam-tag-4"]
      targets              = ["vpn"]
      use_service_accounts = false
      rules = [
        {
          protocol = "tcp"
          ports    = ["12354"]
        }
      ]
      extra_attributes = {}
    }
    ingress-sample-http-2 = {
      description          = "Dummy sample ingress rule, tag-based."
      direction            = "INGRESS"
      action               = "allow"
      ranges               = ["192.168.5.0"]
      sources              = ["spam-tag-5"]
      targets              = ["coba-vpn"]
      use_service_accounts = false
      rules = [
        {
          protocol = "tcp"
          ports    = ["80,443"]
        }
      ]
      extra_attributes = {}
    }
  }
}
