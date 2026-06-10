#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

echo "==> terraform version"
terraform version

echo "==> validate module: cloud-composer/"
terraform -chdir=cloud-composer init -backend=false -input=false
terraform -chdir=cloud-composer validate

echo "==> validate example: examples/basic/"
terraform -chdir=examples/basic init -backend=false -input=false
terraform -chdir=examples/basic validate

echo "==> install complete"
