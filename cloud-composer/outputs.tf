output "id" {
  description = "Composer environment ID."
  value       = google_composer_environment.this.id
}

output "name" {
  description = "Composer environment name."
  value       = google_composer_environment.this.name
}

output "airflow_uri" {
  description = "URI of the Airflow web UI."
  value       = google_composer_environment.this.config[0].airflow_uri
}

output "dag_gcs_prefix" {
  description = "Cloud Storage prefix for DAG files."
  value       = google_composer_environment.this.config[0].dag_gcs_prefix
}

output "gke_cluster" {
  description = "GKE cluster backing the Composer environment."
  value       = google_composer_environment.this.config[0].gke_cluster
}
