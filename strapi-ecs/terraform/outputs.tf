output "ecr_repo_url" {
  description = "ECR Repository URL"
  value       = aws_ecr_repository.strapi.repository_url
}

output "alb_url" {
  description = "Application Load Balancer URL"
  value       = "http://${aws_lb.main.dns_name}"
}

output "ecs_cluster_name" {
  description = "ECS Cluster Name"
  value       = aws_ecs_cluster.main.name
}

output "ecs_service_name" {
  description = "ECS Service Name"
  value       = aws_ecs_service.strapi.name
}
