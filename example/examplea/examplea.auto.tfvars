common_tags = {
  "createdby" = "Terraform"
module = "terraform-aws-batch" }
service_role  = "arn:aws:iam::680235478471:role/service-role/AWSBatchServiceRole"
instance_role = "arn:aws:iam::680235478471:instance-profile/ecsInstanceRole"
security_group_ids = [
  "sg-05749b21616ab0cdc",
]
subnets = [
  "subnet-05808ec64faaa18ba",
]
