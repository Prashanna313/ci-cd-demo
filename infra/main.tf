resource "aws_ecs_cluster" "web_app_cluster" {
  name = "web-app-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_task_definition" "backend_service_task_definition" {
  family = "backend-service"
  container_definitions = jsonencode([
    {
      name      = "backend-service"
      image     = ""
      cpu       = 10
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 5001
          hostPort      = 80
        }
      ]
    }
  ])

  volume {
    name      = "backend-service-storage"
    host_path = "/ecs/backend-storage"
  }

}

resource "aws_ecs_service" "backend_service" {
  name            = "backend_service"
  cluster         = aws_ecs_cluster.web_app_cluster.id
  task_definition = aws_ecs_task_definition.backend_service_task_definition.arn
  desired_count   = 3
  iam_role        = data.aws_iam_role.backend_service_role.arn

  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }

  load_balancer {
    target_group_arn = data.aws_lb_target_group.backend_service_lb_target_group.arn
    container_name   = "backend-service"
    container_port   = 5001
  }

  lifecycle {
    ignore_changes = [desired_count]
  }
}