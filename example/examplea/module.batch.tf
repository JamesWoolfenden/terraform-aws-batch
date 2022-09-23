module "batch" {
  source             = "../../"
  common_tags        = var.common_tags
  service_role       = var.service_role
  instance_role      = var.instance_role
  security_group_ids = var.security_group_ids
  subnets            = var.subnets
  name               = "pike"
  fairshare = {
    compute_reservation = 1
    share_decay_seconds = 3600

    share_distributions = [{
      share_identifier = "A1*"
      weight_factor    = 0.1
      }, {
      share_identifier = "A2"
      weight_factor    = 0.2
    }]
  }
}
