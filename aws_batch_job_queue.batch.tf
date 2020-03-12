resource "aws_batch_job_queue" "batch" {
  name                 = var.queue["name"]
  state                = var.queue["state"]
  priority             = var.queue["priority"]
  compute_environments = [aws_batch_compute_environment.batch.arn]
}
