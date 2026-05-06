resource "aws_batch_compute_environment" "batch" {
  service_role = var.service_role
  type         = "MANAGED"

  compute_resources {
    bid_percentage = 0
    desired_vcpus  = 2
    instance_role  = var.instance_role
    instance_type = [
      "optimal",
    ]
    max_vcpus          = 256
    min_vcpus          = 0
    security_group_ids = var.security_group_ids

    subnets = var.subnets
    tags    = var.common_tags
    type    = "EC2"
  }

  tags = var.common_tags
}
