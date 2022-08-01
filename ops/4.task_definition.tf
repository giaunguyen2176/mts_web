resource "aws_ecs_task_definition" task_definition {
  family = "${var.cluster}-${var.service}"
  requires_compatibilities  = ["FARGATE"]
  cpu                       = tonumber(var.task_definition.cpu)
  memory                    = tonumber(var.task_definition.memory)
  execution_role_arn        = data.aws_iam_role.ecs_task_execution_role.arn
  network_mode              = "awsvpc"

  container_definitions = jsonencode([
    {
      name      = var.containers["app"].name
      image     = var.containers["app"].image
      cpu       = tonumber(var.containers["app"].cpu)
      memory    = tonumber(var.containers["app"].memory)
      essential = true
      portMappings = [
        {
          containerPort = tonumber(var.containers["app"].container_port)
          hostPort      = tonumber(var.containers["app"].host_port)
        }
      ]
      logConfiguration = {
        logDriver = "awslogs",
        options = {
          awslogs-group = "frontend",
          awslogs-region = "ap-southeast-1",
          awslogs-create-group = "true",
          awslogs-stream-prefix = var.service
        }
      },
      command = [
        "http-server"
      ]
    }
  ])
}
