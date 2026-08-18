output "queue" {
  description = "The queue output from batch module"
  value       = module.batch
}

output "definition" {
  description = "The definition output from batch module"
  value       = module.batch.definition
}

output "environment" {
  description = "The environment output from batch module"
  value       = module.batch.environment
}
