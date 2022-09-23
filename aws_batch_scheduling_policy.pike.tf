resource "aws_batch_scheduling_policy" "pike" {
  name = var.name

  fair_share_policy {
    compute_reservation = var.fairshare.compute_reservation
    share_decay_seconds = var.fairshare.share_decay_seconds


    dynamic "share_distribution" {
      for_each = var.fairshare.share_distributions
      content {
        share_identifier = share_distribution.value["share_identifier"]
        weight_factor    = share_distribution.value["weight_factor"]
      }
    }
  }

  tags = var.common_tags
}
