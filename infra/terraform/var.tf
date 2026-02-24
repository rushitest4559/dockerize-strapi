
variable "project_name" {
  default = "rushikesh-strapi"
}

variable "aws_account_id" {
  type = string
}

variable "db_vars" {
  type = map(string)
  default = {
    "db_name"     = "strapi",
    "db_username" = "strapi",
    "db_password" = "strapi_secure_password",
    "single_az"   = "us-east-1e"
  }
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
