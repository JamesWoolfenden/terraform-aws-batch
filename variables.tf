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


variable "service_role" {
  type    = string
  default = "arn:aws:iam::680235478471:role/service-role/AWSBatchServiceRole"
}

variable "instance_role" {
  type    = string
  default = "arn:aws:iam::680235478471:instance-profile/ecsInstanceRole"
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
