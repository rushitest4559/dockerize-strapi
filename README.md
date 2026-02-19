# Strapi App - Infra + Pipelines

**Fork → Update GitHub Secrets → Done!** No clone needed.

**Auto-pipelines:**
- `app/` changes → `ci.yml` → Build & push ECR image
- `infra/` changes → `infra-create.yml` → `terraform apply`

**Manual:** `cd.yml` (deploy), `infra-destroy.yml` (cleanup)

**Folders:** `app/` (Strapi), `infra/` (Terraform modules), `.github/workflows/` (4 pipelines)
