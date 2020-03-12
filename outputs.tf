outputs "queue" {
  value = aws_batch_job_queue.batch
}

output "definition" {
  value = aws_batch_job_definition.batch
}

output "environment" {
  value = aws_batch_compute_environment.batch
}
