resource "aws_batch_job_queue" "batch" {
  name                  = var.queue["name"]
  state                 = var.queue["state"]
  priority              = var.queue["priority"]
  scheduling_policy_arn = aws_batch_scheduling_policy.pike.arn
  tags                  = var.common_tags
}
