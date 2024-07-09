data "aws_iam_role" "backend_service_role" {
  name = "backend-service-role-${var.environment}"
}

data "aws_lb_target_group" "backend_service_lb_target_group" {
  name = "backend-service-tg-${var.environment}"
}