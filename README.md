# terraform-aws-batch

[![Build Status](https://github.com/JamesWoolfenden/terraform-aws-batch/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-aws-batch)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-batch.svg)](https://github.com/JamesWoolfenden/terraform-aws-batch/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-aws-apigateway.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-aws-apigateway/releases/latest)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)


Terraform module -

---

It's 100% Open Source and licensed under the [APACHE2](LICENSE).

## Usage

Include this repository as a module in your existing Terraform code:

```hcl
module "batch" {
  source      = "JamesWoolfenden/batch/aws"
  version     = "0.0.2"
  common_tags = var.common_tags
}
```

The example in the **examplea** folder shows how to pass your own policy in when creating your key.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [aws_batch_compute_environment.batch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/batch_compute_environment) | resource |
| [aws_batch_job_definition.batch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/batch_job_definition) | resource |
| [aws_batch_job_queue.batch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/batch_job_queue) | resource |
| [aws_batch_scheduling_policy.pike](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/batch_scheduling_policy) | resource |
| [aws_cloudwatch_log_group.batch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_kms_alias.batch_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.batch_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_container"></a> [container](#input\_container) | Container properties merged into the AWS Batch job definition's container\_properties argument. A logConfiguration pointing at this module's managed CloudWatch log group is always merged in on top, regardless of what's supplied here. | `any` | <pre>{<br/>  "command": [<br/>    "echo",<br/>    "'hello world'"<br/>  ],<br/>  "environment": [],<br/>  "image": "busybox@sha256:73aaf090f3d85aa34ee199857f03fa3a95c8ede2ffd4cc2cdb5b94e566b11662",<br/>  "memory": 2000,<br/>  "mountPoints": [],<br/>  "resourceRequirements": [],<br/>  "ulimits": [],<br/>  "vcpus": 2,<br/>  "volumes": []<br/>}</pre> | no |
| <a name="input_fairshare"></a> [fairshare](#input\_fairshare) | Fair share scheduling policy: compute reservation percentage, share decay period in seconds, and per-identifier share weights. | <pre>object({<br/>    compute_reservation = number<br/>    share_decay_seconds = number<br/><br/>    share_distributions = list(object({<br/>      share_identifier = string<br/>      weight_factor    = number<br/>    }))<br/>  })</pre> | n/a | yes |
| <a name="input_instance_role"></a> [instance\_role](#input\_instance\_role) | ARN of the IAM instance profile used by EC2 instances in the compute environment. | `string` | n/a | yes |
| <a name="input_job_name"></a> [job\_name](#input\_job\_name) | Name of the AWS Batch job definition. | `string` | `"first-run-job-definition"` | no |
| <a name="input_job_type"></a> [job\_type](#input\_job\_type) | Type of AWS Batch job definition. Must be "container" or "multinode". | `string` | `"container"` | no |
| <a name="input_log_retention_days"></a> [log\_retention\_days](#input\_log\_retention\_days) | Number of days to retain the AWS Batch job definition's container logs in CloudWatch Logs. | `number` | `365` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the AWS Batch scheduling policy. | `string` | n/a | yes |
| <a name="input_parameters"></a> [parameters](#input\_parameters) | Default parameter substitution placeholders for the AWS Batch job definition. | `map(any)` | `{}` | no |
| <a name="input_queue"></a> [queue](#input\_queue) | AWS Batch job queue configuration: name, state (ENABLED or DISABLED), and priority. | `map(any)` | <pre>{<br/>  "name": "first-run-job-queue-2",<br/>  "priority": 1,<br/>  "state": "ENABLED"<br/>}</pre> | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | List of security group IDs to attach to the compute environment | `list(any)` | <pre>[<br/>  "sg-05749b21616ab0cdc"<br/>]</pre> | no |
| <a name="input_service_role"></a> [service\_role](#input\_service\_role) | ARN of the IAM role that allows AWS Batch to make calls to other AWS services on your behalf. | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | List of subnets to use for the compute environment | `list(string)` | <pre>[<br/>  "subnet-05808ec64faaa18ba"<br/>]</pre> | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_definition"></a> [definition](#output\_definition) | The AWS Batch job definition resource. |
| <a name="output_environment"></a> [environment](#output\_environment) | The AWS Batch compute environment resource. |
| <a name="output_queue"></a> [queue](#output\_queue) | The AWS Batch job queue resource. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Policy

<!-- BEGINNING OF PRE-COMMIT-PIKE DOCS HOOK -->
The Terraform resource required is:

```golang
# apply role — full permissions for terraform apply
resource "aws_iam_policy" "terraform_pike" {
  name_prefix = "terraform_pike"
  path        = "/"
  description = "Pike Autogenerated policy from IAC"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "Batch:DescribeSchedulingPolicies"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "Iam:PassRole"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor2",
            "Effect": "Allow",
            "Action": [
                "batch:CreateComputeEnvironment",
                "batch:CreateJobQueue",
                "batch:CreateSchedulingPolicy",
                "batch:DeleteComputeEnvironment",
                "batch:DeleteJobQueue",
                "batch:DeleteSchedulingPolicy",
                "batch:DeregisterJobDefinition",
                "batch:DescribeComputeEnvironments",
                "batch:DescribeJobDefinitions",
                "batch:DescribeJobQueues",
                "batch:DescribeSchedulingPolicies",
                "batch:RegisterJobDefinition",
                "batch:UpdateComputeEnvironment",
                "batch:UpdateJobQueue",
                "batch:UpdateSchedulingPolicy"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor3",
            "Effect": "Allow",
            "Action": [
                "ec2:DescribeAccountAttributes",
                "ec2:DescribeImages",
                "ec2:DescribeKeyPairs",
                "ec2:DescribeLaunchTemplateVersions",
                "ec2:DescribeLaunchTemplates",
                "ec2:DescribeSecurityGroups",
                "ec2:DescribeSubnets",
                "ec2:DescribeVpcs"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor4",
            "Effect": "Allow",
            "Action": [
                "ecs:Describe*",
                "ecs:DescribeClusters",
                "ecs:List*"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor5",
            "Effect": "Allow",
            "Action": [
                "iam:CreateServiceLinkedRole",
                "iam:PassRole"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor6",
            "Effect": "Allow",
            "Action": [
                "kms:CreateAlias",
                "kms:CreateKey",
                "kms:DeleteAlias",
                "kms:DescribeKey",
                "kms:EnableKeyRotation",
                "kms:GetKeyPolicy",
                "kms:GetKeyRotationStatus",
                "kms:ListAliases",
                "kms:ListResourceTags",
                "kms:PutKeyPolicy",
                "kms:ScheduleKeyDeletion",
                "kms:UpdateAlias",
                "kms:UpdateKeyDescription"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor7",
            "Effect": "Allow",
            "Action": [
                "logs:AssociateKmsKey",
                "logs:CreateLogGroup",
                "logs:DeleteLogGroup",
                "logs:DeleteRetentionPolicy",
                "logs:DescribeLogGroups",
                "logs:DisassociateKmsKey",
                "logs:ListTagsForResource",
                "logs:ListTagsLogGroup",
                "logs:PutRetentionPolicy"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
})
}

# plan role — read-only permissions for terraform plan
resource "aws_iam_policy" "terraform_pike_plan" {
  name_prefix = "terraform_pike_plan"
  path        = "/"
  description = "Pike Autogenerated policy from IAC"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "Batch:DescribeSchedulingPolicies"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "kms:DescribeKey",
                "kms:GetKeyPolicy",
                "kms:GetKeyRotationStatus",
                "kms:ListResourceTags"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
})
}


```
<!-- END OF PRE-COMMIT-PIKE DOCS HOOK -->

## Related Projects

Check out these related projects.

- [terraform-aws-s3](https://github.com/jameswoolfenden/terraform-aws-s3) - S3 buckets

## Help

**Got a question?**

File a GitHub [issue](https://github.com/JamesWoolfenden/terraform-aws-batch/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/JamesWoolfenden/terraform-aws-batch/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2019-2026 James Woolfenden

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file
distributed with this work for additional information
regarding copyright ownership. The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied. See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
