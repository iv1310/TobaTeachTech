# google_client_config and kubernetes provider must be explicitly specified like the following.
data "google_client_config" "default" {}

# provider "google" {
#   version = "=3.40.0"
#   project = var.project_id
#   region = var.region
#   zone = ["asia-southeast2-a", "asia-southeast2-b", "asia-southeast2-c"]
# }

provider "kubernetes" {
  load_config_file       = false
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}



module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google"
  project_id                 = var.project_id
  name                       = var.cluster_name
  region                     = var.region
  zones                      = ["asia-southeast2-a", "asia-southeast2-b", "asia-southeast2-c"]
  network                    = var.network
  subnetwork                 = "asia-southeast2"
  ip_range_pods              = "asia-southeast2-01-gke-01-pods"
  ip_range_services          = "asia-southeast2-01-gke-01-services"
  http_load_balancing        = false
  horizontal_pod_autoscaling = true
  network_policy             = false
  default_max_pods_per_node  = 100
  kubernetes_version         = "1.17.15-gke.800"


  node_pools = [
    {
      name               = "development-pool"
      machine_type       = "e2-medium"
      node_locations     = "asia-southeast2-a,asia-southeast2-b,asia-southeast2-c"
      min_count          = 1
      max_count          = 32
      local_ssd_count    = 0
      disk_size_gb       = 30
      disk_type          = "pd-standard"
      image_type         = "COS_CONTAINERD"
      enable_autoscaling = true
      auto_repair        = false
      auto_upgrade       = false
      service_account    = "project-service-account@devops-project-253405.iam.gserviceaccount.com"
      preemptible        = true
      initial_node_count = 64
      # cluster_autoscaling= true
      # max_surge       = 5
      # max_unavailable = 1
    },
  ]

  node_pools_oauth_scopes = {
    all = []

    default-node-pool = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  node_pools_labels = {
    all = {}

    default-node-pool = {
      default-node-pool = true
    }
  }

  node_pools_metadata = {
    all = {}

    default-node-pool = {
      node-pool-metadata-custom-value = "my-node-pool"
    }
  }

  node_pools_taints = {
    all = []

    default-node-pool = [
      {
        key    = "default-node-pool"
        value  = true
        effect = "PREFER_NO_SCHEDULE"
      },
    ]
  }

  node_pools_tags = {
    all = []

    default-node-pool = [
      "default-node-pool",
    ]
  }
}


# module "gke_service_account" {
#   source = "../services_account"
#   name = var.cluster_service_account_name
#   project_id = var.project_id
#   description = var.cluster_service_account_description
# }

