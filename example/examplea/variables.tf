
variable "service_role" {
  description = "The IAM role for the ECS service"
  type        = string

  validation {
    condition     = can(regex("^arn:aws:iam::\\d{12}:role/.+$", var.service_role))
    error_message = "service_role must be a valid IAM role ARN (arn:aws:iam::<account-id>:role/<name>)."
  }
}

variable "instance_role" {
  description = "The IAM role for the EC2 instances"
  type        = string

  validation {
    condition     = can(regex("^arn:aws:iam::\\d{12}:instance-profile/.+$", var.instance_role))
    error_message = "instance_role must be a valid IAM instance profile ARN (arn:aws:iam::<account-id>:instance-profile/<name>)."
  }
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(any)

  validation {
    condition     = alltrue([for s in var.security_group_ids : can(regex("^sg-[0-9a-f]{8,17}$", tostring(s)))])
    error_message = "Each entry in security_group_ids must be a valid security group ID (e.g. sg-0123456789abcdef0)."
  }
}

variable "subnets" {
  description = "List of subnets"
  type        = list(any)

  validation {
    condition     = alltrue([for s in var.subnets : can(regex("^subnet-[0-9a-f]{8,17}$", tostring(s)))])
    error_message = "Each entry in subnets must be a valid subnet ID (e.g. subnet-0123456789abcdef0)."
  }
}
