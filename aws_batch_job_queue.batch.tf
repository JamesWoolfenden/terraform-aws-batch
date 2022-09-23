resource "aws_batch_job_queue" "batch" {
  name                  = var.queue["name"]
  state                 = var.queue["state"]
  priority              = var.queue["priority"]
  compute_environments  = [aws_batch_compute_environment.batch.arn]
  scheduling_policy_arn = aws_batch_scheduling_policy.pike.arn
  tags                  = var.common_tags
}
