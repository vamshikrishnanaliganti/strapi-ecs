# Log Group for Strapi App
resource "aws_cloudwatch_log_group" "strapi" {
  name              = "/ecs/${var.app_name}"
  retention_in_days = 7

  tags = { Name = "${var.app_name}-logs" }
}

# CPU Utilization Alarm
resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name          = "${var.app_name}-cpu-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = 60
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "Alert when CPU exceeds 80%"

  dimensions = {
    ClusterName = aws_ecs_cluster.main.name
    ServiceName = aws_ecs_service.strapi.name
  }
}

# Memory Utilization Alarm
resource "aws_cloudwatch_metric_alarm" "memory_high" {
  alarm_name          = "${var.app_name}-memory-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  period              = 60
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "Alert when Memory exceeds 80%"

  dimensions = {
    ClusterName = aws_ecs_cluster.main.name
    ServiceName = aws_ecs_service.strapi.name
  }
}

# ALB 5XX Errors Alarm
resource "aws_cloudwatch_metric_alarm" "alb_5xx" {
  alarm_name          = "${var.app_name}-alb-5xx"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "HTTPCode_ELB_5XX_Count"
  namespace           = "AWS/ApplicationELB"
  period              = 60
  statistic           = "Sum"
  threshold           = 10
  alarm_description   = "Alert when ALB 5XX errors exceed 10"

  dimensions = {
    LoadBalancer = aws_lb.main.arn_suffix
  }
}
