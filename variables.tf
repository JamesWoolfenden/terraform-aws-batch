
variable "queue" {
  type        = map(any)
  description = "AWS Batch job queue configuration: name, state (ENABLED or DISABLED), and priority."
  default = {
    name     = "first-run-job-queue-2"
    state    = "ENABLED"
    priority = 1
  }

  validation {
    condition = (
      can(regex("^[A-Za-z0-9][A-Za-z0-9_-]{0,127}$", var.queue["name"])) &&
      contains(["ENABLED", "DISABLED"], var.queue["state"]) &&
      can(tonumber(var.queue["priority"])) && tonumber(var.queue["priority"]) >= 0
    )
    error_message = "queue.name must be 1-128 characters of letters, numbers, hyphens and underscores; queue.state must be \"ENABLED\" or \"DISABLED\"; queue.priority must be a non-negative number."
  }
}

variable "fairshare" {
  type = object({
    compute_reservation = number
    share_decay_seconds = number

    share_distributions = list(object({
      share_identifier = string
      weight_factor    = number
    }))
  })
  description = "Fair share scheduling policy: compute reservation percentage, share decay period in seconds, and per-identifier share weights."

  validation {
    condition = (
      var.fairshare.compute_reservation >= 0 && var.fairshare.compute_reservation <= 99 &&
      var.fairshare.share_decay_seconds >= 0 && var.fairshare.share_decay_seconds <= 604800 &&
      length(var.fairshare.share_distributions) <= 500 &&
      alltrue([
        for s in var.fairshare.share_distributions :
        length(s.share_identifier) > 0 && s.weight_factor > 0 && s.weight_factor <= 999.9999
      ])
    )
    error_message = "compute_reservation must be 0-99, share_decay_seconds must be 0-604800, at most 500 share_distributions are allowed, and each weight_factor must be > 0 and <= 999.9999 with a non-empty share_identifier."
  }
}

variable "security_group_ids" {
  type        = list(any)
  description = "List of security group IDs to attach to the compute environment"
  default = [
    "sg-05749b21616ab0cdc",
  ]

  validation {
    condition     = length(var.security_group_ids) > 0
    error_message = "security_group_ids must not be empty."
  }
}

variable "subnets" {
  type        = list(string)
  description = "List of subnets to use for the compute environment"
  default = [
    "subnet-05808ec64faaa18ba",
  ]

  validation {
    condition     = alltrue([for s in var.subnets : can(regex("^subnet-[0-9a-f]{8,17}$", s))])
    error_message = "Each entry in subnets must be a valid subnet ID (e.g. subnet-0123456789abcdef0)."
  }
}

variable "job_name" {
  type        = string
  description = "Name of the AWS Batch job definition."
  default     = "first-run-job-definition"

  validation {
    condition     = can(regex("^[A-Za-z0-9][A-Za-z0-9_-]{0,127}$", var.job_name))
    error_message = "job_name must be 1-128 characters of letters, numbers, hyphens and underscores."
  }
}

variable "job_type" {
  type        = string
  description = "Type of AWS Batch job definition. Must be \"container\" or \"multinode\"."
  default     = "container"

  validation {
    condition     = contains(["container", "multinode"], var.job_type)
    error_message = "job_type must be either \"container\" or \"multinode\"."
  }
}

variable "container" {
  type        = any
  description = "Container properties merged into the AWS Batch job definition's container_properties argument. A logConfiguration pointing at this module's managed CloudWatch log group is always merged in on top, regardless of what's supplied here."
  default = {
    command              = ["echo", "'hello world'"]
    environment          = []
    image                = "busybox@sha256:73aaf090f3d85aa34ee199857f03fa3a95c8ede2ffd4cc2cdb5b94e566b11662"
    memory               = 2000
    mountPoints          = []
    resourceRequirements = []
    ulimits              = []
    vcpus                = 2
    volumes              = []
  }

  validation {
    condition     = can(var.container["image"]) && length(tostring(var.container["image"])) > 0
    error_message = "container must include a non-empty \"image\" key."
  }
}

variable "service_role" {
  type        = string
  description = "ARN of the IAM role that allows AWS Batch to make calls to other AWS services on your behalf."

  validation {
    condition     = can(regex("^arn:aws:iam::\\d{12}:role/.+$", var.service_role))
    error_message = "service_role must be a valid IAM role ARN (arn:aws:iam::<account-id>:role/<name>)."
  }
}

variable "instance_role" {
  type        = string
  description = "ARN of the IAM instance profile used by EC2 instances in the compute environment."

  validation {
    condition     = can(regex("^arn:aws:iam::\\d{12}:instance-profile/.+$", var.instance_role))
    error_message = "instance_role must be a valid IAM instance profile ARN (arn:aws:iam::<account-id>:instance-profile/<name>)."
  }
}

variable "name" {
  type        = string
  description = "Name of the AWS Batch scheduling policy."

  validation {
    condition     = can(regex("^[A-Za-z0-9][A-Za-z0-9_-]{0,127}$", var.name))
    error_message = "name must be 1-128 characters of letters, numbers, hyphens and underscores."
  }
}

variable "parameters" {
  type        = map(any)
  description = "Default parameter substitution placeholders for the AWS Batch job definition."
  default     = {}

  validation {
    condition     = alltrue([for v in values(var.parameters) : can(tostring(v))])
    error_message = "All parameters values must be strings (or convertible to strings)."
  }
}

variable "log_retention_days" {
  type        = number
  description = "Number of days to retain the AWS Batch job definition's container logs in CloudWatch Logs."
  default     = 365

  validation {
    condition = contains([
      1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731,
      1096, 1827, 2192, 2557, 2922, 3288, 3653,
    ], var.log_retention_days)
    error_message = "log_retention_days must be one of the retention periods CloudWatch Logs supports (see the aws_cloudwatch_log_group retention_in_days documentation)."
  }
}
