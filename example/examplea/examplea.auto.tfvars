common_tags = {
  "createdby" = "Terraform"
module = "terraform-aws-batch" }
service_role  = "arn:aws:iam::680235478471:role/aws-service-role/batch.amazonaws.com/AWSServiceRoleForBatch"
instance_role = "arn:aws:iam::680235478471:instance-profile/ecsInstanceRole"
security_group_ids = [
  "sg-05b27cb61c9c46bd2",
]

subnets = [
  "subnet-03fdfb13a135366a7",
]
