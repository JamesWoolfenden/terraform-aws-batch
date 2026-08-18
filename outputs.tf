output "queue" {
  description = "The AWS Batch job queue resource."
  value       = aws_batch_job_queue.batch
}

output "definition" {
  description = "The AWS Batch job definition resource."
  value       = aws_batch_job_definition.batch
}

output "environment" {
  description = "The AWS Batch compute environment resource."
  value       = aws_batch_compute_environment.batch
}
