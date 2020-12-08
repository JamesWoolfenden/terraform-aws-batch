variable "common_tags" {
  description = "This is to help you add tags to your cloud objects"
  type        = map(any)
}

variable "service_role" {
  type = string
}

variable "instance_role" {
  type = string
}

variable "security_group_ids" {
  type = list(any)
}

variable "subnets" {
  type = list(any)
}
