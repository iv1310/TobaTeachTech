variable "project_id" {
  description = "The project ID to host the cluster in"
}

variable "project" {
  description = "The project to host the cluster in"
}

variable "path_creds" {
  description = "place the credential service account"
}

variable "region" {
  type        = string
  description = "The region to host the cluster in"
  default     = "asia-southeast2"
}

variable "cluster_name" {
  type        = string
  description = "name cluster"
  default     = "ab-terraform-gke"
}


variable "version_gke" {
  type        = string
  description = "version cluster"
  default     = "1.18.16-gke.500"
}

variable "network" {
  type        = string
  description = "network cluster"
  default     = "default"
}

variable "vpc" {
  type        = string
  description = "name vpc"
  default     = "tumbur-vpc-tf"
}

variable "db_tiar" {
  description = "The tier for the master instance."
  type        = string
  default     = "db-f1-micro"
}

variable "db_name" {
  type        = string
  description = "name postgress"
  default     = "tumbur-tf"
}

variable "disk_size" {
  description = "The disk size for the master instance."
  default     = 10
}

variable "disk_type" {
  description = "The disk type for the master instance."
  type        = string
  default     = "PD_SSD"
}

variable "database_version" {
  description = "The database version to use"
  type        = string
  default     = "POSTGRES_13"
}

variable "cluster_service_account_name" {
  description = "name services account"
  type        = string
  default     = "project-service-account"
}
variable "cluster_service_account_description" {
  description = "A description of the custom service account used for the GKE cluster."
  type        = string
  default     = "Example GKE Cluster Service Account managed by Terraform"
}