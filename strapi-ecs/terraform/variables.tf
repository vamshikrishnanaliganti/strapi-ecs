variable "aws_region" {
  default = "us-east-1"
}

variable "app_name" {
  default = "strapi-ecs"
}

variable "ecr_repo_name" {
  default = "strapi-ecs"
}

variable "ecs_cluster_name" {
  default = "strapi-cluster"
}

variable "ecs_service_name" {
  default = "strapi-service"
}

variable "container_port" {
  default = 1337
}

variable "cpu" {
  default = "512"
}

variable "memory" {
  default = "1024"
}

variable "db_name" {
  default = "strapidb"
}

variable "db_username" {
  default = "strapi"
}

variable "db_password" {
  description = "RDS password"
  sensitive   = true
  default     = "Strapi_1234#"
}
