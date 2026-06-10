provider "google" {
  project = var.project_id
  region  = var.region
}

module "composer" {
  source = "../../cloud-composer"

  name                       = var.environment_name
  region                     = var.region
  project_id                 = var.project_id
  image_version              = var.image_version
  environment_size           = var.environment_size
  labels                     = var.labels
  network                    = var.network
  subnetwork                 = var.subnetwork
  service_account            = var.service_account
  enable_private_environment = var.enable_private_environment
  airflow_config_overrides   = var.airflow_config_overrides
  pypi_packages              = var.pypi_packages
  scheduler_count            = var.scheduler_count
  scheduler_cpu              = var.scheduler_cpu
  scheduler_memory_gb        = var.scheduler_memory_gb
  scheduler_storage_gb       = var.scheduler_storage_gb
  web_server_cpu             = var.web_server_cpu
  web_server_memory_gb       = var.web_server_memory_gb
  web_server_storage_gb      = var.web_server_storage_gb
  worker_min_count           = var.worker_min_count
  worker_max_count           = var.worker_max_count
  worker_cpu                 = var.worker_cpu
  worker_memory_gb           = var.worker_memory_gb
  worker_storage_gb          = var.worker_storage_gb
}

output "airflow_uri" {
  value = module.composer.airflow_uri
}

output "dag_gcs_prefix" {
  value = module.composer.dag_gcs_prefix
}
