locals {
  container_properties = jsonencode(merge(
    var.container,
    {
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group  = aws_cloudwatch_log_group.batch.name
          awslogs-region = data.aws_region.current.region
        }
      }
    }
  ))
}
