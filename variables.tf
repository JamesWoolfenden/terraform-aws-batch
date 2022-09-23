variable "common_tags" {
  description = "This is to help you add tags to your cloud objects"
  type        = map(any)
}

variable "queue" {
  type = map(any)
  default = {
    name     = "first-run-job-queue-2"
    state    = "ENABLED"
    priority = 1
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

}

variable "security_group_ids" {
  type = list(any)
  default = [
    "sg-05749b21616ab0cdc",
  ]
}

variable "subnets" {
  type = list(any)
  default = [
    "subnet-05808ec64faaa18ba",
  ]

}

variable "job_name" {
  type    = string
  default = "first-run-job-definition"
}


variable "job_type" {
  type    = string
  default = "container"
}


variable "container" {
  default = <<CONTAINER_PROPERTIES
{
  "command":["echo","'hello world'"],
  "environment": [],
  "image": "busybox",
  "memory": 2000,
  "mountPoints": [] ,
  "resourceRequirements" : [],
  "ulimits": [] ,
  "vcpus": 2 ,
  "volumes": []
}
CONTAINER_PROPERTIES
}


variable "service_role" {
  type = string
}

variable "instance_role" {
  type = string
}

variable "name" {
  type        = string
  description = "(optional) describe your variable"
}

variable "parameters" {
  type    = map(any)
  default = {}
}
