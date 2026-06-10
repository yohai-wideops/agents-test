## [2026-06-10]
- **[Created]** `.cursor/environment.json`: Cloud agent env config (Dockerfile + install hook).
- **[Created]** `.cursor/Dockerfile`: Ubuntu image with Terraform and tflint.
- **[Created]** `.cursor/install.sh`: Idempotent init/validate for module and example.
- **[Created]** `AGENTS.md`: Cloud agent ops guide for Composer Terraform repo.
- **[Modified]** `examples/basic/main.tf`: Fixed module source path to `../../cloud-composer`.
- **[Created]** `.gitignore`: Ignore Terraform state and cache dirs.
- **[Created]** `cloud-composer/.terraform.lock.hcl`: Provider lock from validate.
- **[Created]** `examples/basic/.terraform.lock.hcl`: Provider lock from validate.
