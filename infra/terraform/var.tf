
variable "project_name" {
  default = "rushikesh-strapi"
}

variable "aws_account_id" {
  type = string
}

variable "ecr_image_url" {
  default = "${var.aws_account_id}.dkr.ecr.us-east-1.amazonaws.com/rushikesh-strapi:latest"
}

variable "db_password" {
  description = "The password for the RDS instance"
  type        = string
  default     = "strapi_secure_password"
}

variable "strapi_env_vars" {
  default = [
    { name = "DATABASE_CLIENT", value = "postgres" },
    { name = "DATABASE_HOST", value = "REPLACE_WITH_RDS_ENDPOINT" },
    { name = "DATABASE_PORT", value = "5432" },
    { name = "DATABASE_NAME", value = "strapi" },
    { name = "DATABASE_USERNAME", value = "strapi" },
    { name = "DATABASE_PASSWORD", value = "strapi_secure_password" },
    { name = "DATABASE_SSL", value = "true" },
    { name = "DATABASE_SSL_REJECT_UNAUTHORIZED", value = "false" },
    { name = "NODE_ENV", value = "production" },
    { name = "APP_KEYS", value = "testKey1,testKey2" },
    { name = "API_TOKEN_SALT", value = "testSalt" },
    { name = "ADMIN_JWT_SECRET", value = "testSecret" },
    { name = "TRANSFER_TOKEN_SALT", value = "testTransfer" },
    { name = "JWT_SECRET", value = "anotherTestSecret" }
  ]
}

variable "ecs_execution_role_arn" {

}
