resource "google_composer_environment" "this" {
  name    = var.name
  region  = var.region
  project = var.project_id
  labels  = var.labels

  config {
    environment_size = var.environment_size

    software_config {
      image_version            = var.image_version
      airflow_config_overrides = length(var.airflow_config_overrides) > 0 ? var.airflow_config_overrides : null
      pypi_packages            = length(var.pypi_packages) > 0 ? var.pypi_packages : null
    }

    workloads_config {
      scheduler {
        cpu        = var.scheduler_cpu
        memory_gb  = var.scheduler_memory_gb
        storage_gb = var.scheduler_storage_gb
        count      = var.scheduler_count
      }

      web_server {
        cpu        = var.web_server_cpu
        memory_gb  = var.web_server_memory_gb
        storage_gb = var.web_server_storage_gb
      }

      worker {
        cpu        = var.worker_cpu
        memory_gb  = var.worker_memory_gb
        storage_gb = var.worker_storage_gb
        min_count  = var.worker_min_count
        max_count  = var.worker_max_count
      }
    }

    dynamic "node_config" {
      for_each = var.network != null || var.subnetwork != null || var.service_account != null ? [1] : []
      content {
        network         = var.network
        subnetwork      = var.subnetwork
        service_account = var.service_account
      }
    }

    dynamic "private_environment_config" {
      for_each = var.enable_private_environment ? [1] : []
      content {
        enable_private_endpoint = true
      }
    }
  }
}
