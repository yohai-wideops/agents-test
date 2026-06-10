project_id       = "my-gcp-project"
region           = "us-central1"
environment_name = "airflow-composer"

image_version    = "composer-2-airflow-2.13.8"
environment_size = "ENVIRONMENT_SIZE_SMALL"

labels = {}

network         = null
subnetwork      = null
service_account = null

enable_private_environment = false

airflow_config_overrides = {}
pypi_packages            = {}

scheduler_count      = 1
scheduler_cpu        = 0.5
scheduler_memory_gb  = 1.875
scheduler_storage_gb = 1

web_server_cpu        = 0.5
web_server_memory_gb  = 1.875
web_server_storage_gb = 1

worker_min_count  = 1
worker_max_count  = 3
worker_cpu        = 0.5
worker_memory_gb  = 1.875
worker_storage_gb = 1
