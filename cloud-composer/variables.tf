variable "name" {
  description = "Name of the Cloud Composer environment."
  type        = string
}

variable "region" {
  description = "GCP region for the Cloud Composer environment."
  type        = string
}

variable "project_id" {
  description = "GCP project ID."
  type        = string
}

variable "image_version" {
  description = "Composer image version."
  type        = string
}

variable "environment_size" {
  description = "Composer environment size."
  type        = string

  validation {
    condition = contains(
      ["ENVIRONMENT_SIZE_SMALL", "ENVIRONMENT_SIZE_MEDIUM", "ENVIRONMENT_SIZE_LARGE"],
      var.environment_size,
    )
    error_message = "environment_size must be ENVIRONMENT_SIZE_SMALL, ENVIRONMENT_SIZE_MEDIUM, or ENVIRONMENT_SIZE_LARGE."
  }
}

variable "labels" {
  description = "Labels to apply to the Cloud Composer environment."
  type        = map(string)
}

variable "network" {
  description = "VPC network for the Composer GKE cluster. Set to null to use the project default network."
  type        = string
  nullable    = true
}

variable "subnetwork" {
  description = "VPC subnetwork for the Composer GKE cluster. Required when network is set."
  type        = string
  nullable    = true
}

variable "service_account" {
  description = "Service account email for Composer workers. Set to null to use the default Compute Engine service account."
  type        = string
  nullable    = true
}

variable "enable_private_environment" {
  description = "Enable a private Cloud Composer environment."
  type        = bool
}

variable "airflow_config_overrides" {
  description = "Airflow configuration overrides."
  type        = map(string)
}

variable "pypi_packages" {
  description = "Custom PyPI packages to install in the environment."
  type        = map(string)
}

variable "scheduler_count" {
  description = "Number of Airflow schedulers."
  type        = number
}

variable "scheduler_cpu" {
  description = "CPU allocation for each Airflow scheduler."
  type        = number
}

variable "scheduler_memory_gb" {
  description = "Memory allocation in GB for each Airflow scheduler."
  type        = number
}

variable "scheduler_storage_gb" {
  description = "Storage allocation in GB for each Airflow scheduler."
  type        = number
}

variable "web_server_cpu" {
  description = "CPU allocation for the Airflow web server."
  type        = number
}

variable "web_server_memory_gb" {
  description = "Memory allocation in GB for the Airflow web server."
  type        = number
}

variable "web_server_storage_gb" {
  description = "Storage allocation in GB for the Airflow web server."
  type        = number
}

variable "worker_min_count" {
  description = "Minimum number of Airflow workers."
  type        = number
}

variable "worker_max_count" {
  description = "Maximum number of Airflow workers."
  type        = number
}

variable "worker_cpu" {
  description = "CPU allocation for each Airflow worker."
  type        = number
}

variable "worker_memory_gb" {
  description = "Memory allocation in GB for each Airflow worker."
  type        = number
}

variable "worker_storage_gb" {
  description = "Storage allocation in GB for each Airflow worker."
  type        = number
}
