resource "aws_batch_job_definition" "batch" {
  name                 = var.job_name
  type                 = var.job_type
  container_properties = var.container
  parameters           = var.parameters

  tags = var.common_tags
}
