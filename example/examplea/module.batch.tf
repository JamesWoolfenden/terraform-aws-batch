module "batch" {
  source             = "../../"
  common_tags        = var.common_tags
  service_role       = var.service_role
  instance_role      = var.instance_role
  security_group_ids = var.security_group_ids
  subnets            = var.subnets
}
