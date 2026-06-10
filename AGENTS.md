# AGENTS.md

Terraform module repo for **Google Cloud Composer** (managed Airflow).

## Repository layout

| Path | Purpose |
|------|---------|
| `cloud-composer/` | Reusable Terraform module (`google_composer_environment`) |
| `examples/basic/` | Example root module consuming `cloud-composer` |

Module source in examples: `../../cloud-composer` (not `modules/`).

## Commands

Run from repo root unless noted.

```bash
# Module only
terraform -chdir=cloud-composer init -backend=false
terraform -chdir=cloud-composer validate
terraform -chdir=cloud-composer fmt -check -recursive

# Example stack
terraform -chdir=examples/basic init -backend=false
terraform -chdir=examples/basic validate
terraform -chdir=examples/basic fmt -check -recursive

# Optional lint (installed in cloud VM)
tflint --chdir=cloud-composer
tflint --chdir=examples/basic
```

Full install + validate (same as cloud agent boot):

```bash
bash .cursor/install.sh
```

## Guardrails

- Terraform `>= 1.5.0`, provider `hashicorp/google` `>= 5.0.0`.
- Do not run `terraform apply` unless the user explicitly asks and GCP credentials are configured.
- Prefer `validate` and `fmt -check` for verification; `plan` only with real project creds.
- Keep module interface stable: changes to `variables.tf` / `outputs.tf` need matching updates in `examples/basic/`.
- Composer creates billable GCP resources; never apply against production without confirmation.

## Cursor Cloud specific instructions

Cloud agents run on Ubuntu with Terraform and tflint preinstalled via `.cursor/Dockerfile`. Boot runs `.cursor/install.sh` (init + validate both roots).

### GCP credentials (secrets)

No local gcloud auth in the VM by default. For `plan` / `apply`:

1. Add secrets in [Cursor Dashboard → Cloud Agents → Secrets](https://cursor.com/dashboard?tab=cloud-agents):
   - `GOOGLE_APPLICATION_CREDENTIALS_JSON` — service account key JSON (full contents), **or**
   - Configure Application Default Credentials per your org standard.
2. Before Terraform GCP calls, write creds if using JSON secret:

```bash
mkdir -p /tmp/gcp
echo "$GOOGLE_APPLICATION_CREDENTIALS_JSON" > /tmp/gcp/sa.json
export GOOGLE_APPLICATION_CREDENTIALS=/tmp/gcp/sa.json
```

3. Set `TF_VAR_project_id` (or edit `examples/basic/terraform.tfvars`) to a sandbox project.

For validate-only work, **no GCP secrets are required**.

### Testing changes

1. Edit module under `cloud-composer/` and/or example under `examples/basic/`.
2. Run `bash .cursor/install.sh` or the validate commands above.
3. Run `terraform -chdir=cloud-composer fmt` and `terraform -chdir=examples/basic fmt` before committing.

### Common tasks

| Task | Approach |
|------|----------|
| New module variable | Add to `cloud-composer/variables.tf`, wire in `main.tf`, pass through `examples/basic/` |
| Composer sizing | Tune `workloads_config` vars (scheduler / web_server / worker) |
| Private cluster | Set `enable_private_environment`, `network`, `subnetwork` |
| New example | Copy `examples/basic/`, point `source` at `../../cloud-composer` |

### MCP (optional)

If Terraform MCP is enabled for the agent, use it for `google_composer_environment` schema checks instead of guessing HCL.
