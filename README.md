# terraform-aws-batch

[![Build Status](https://github.com/JamesWoolfenden/terraform-aws-batch/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-aws-batch)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-batch.svg)](https://github.com/JamesWoolfenden/terraform-aws-batch/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-aws-apigateway.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-aws-apigateway/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/JamesWoolfenden/terraform-aws-apigateway/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-apigateway&benchmark=CIS+AWS+V1.2)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-aws-apigateway/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-apigateway&benchmark=INFRASTRUCTURE+SECURITY)

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
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_batch_compute_environment.batch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/batch_compute_environment) | resource |
| [aws_batch_job_definition.batch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/batch_job_definition) | resource |
| [aws_batch_job_queue.batch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/batch_job_queue) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | This is to help you add tags to your cloud objects | `map(any)` | n/a | yes |
| <a name="input_container"></a> [container](#input\_container) | n/a | `string` | `"{
  \"command\":[\"echo\",\"'hello world'\"],
  \"environment\": [],
  \"image\": \"busybox\",
  \"memory\": 2000,
  \"mountPoints\": [] ,
  \"resourceRequirements\" : [],
  \"ulimits\": [] ,
  \"vcpus\": 2 ,
  \"volumes\": []
}
"` | no |
| <a name="input_instance_role"></a> [instance\_role](#input\_instance\_role) | n/a | `string` | `"arn:aws:iam::680235478471:instance-profile/ecsInstanceRole"` | no |
| <a name="input_job_name"></a> [job\_name](#input\_job\_name) | n/a | `string` | `"first-run-job-definition"` | no |
| <a name="input_job_type"></a> [job\_type](#input\_job\_type) | n/a | `string` | `"container"` | no |
| <a name="input_queue"></a> [queue](#input\_queue) | n/a | `map(any)` | <pre>{<br>  "name": "first-run-job-queue-2",<br>  "priority": 1,<br>  "state": "ENABLED"<br>}</pre> | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | n/a | `list(any)` | <pre>[<br>  "sg-05749b21616ab0cdc"<br>]</pre> | no |
| <a name="input_service_role"></a> [service\_role](#input\_service\_role) | n/a | `string` | `"arn:aws:iam::680235478471:role/service-role/AWSBatchServiceRole"` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | n/a | `list(any)` | <pre>[<br>  "subnet-05808ec64faaa18ba"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_definition"></a> [definition](#output\_definition) | n/a |
| <a name="output_environment"></a> [environment](#output\_environment) | n/a |
| <a name="output_queue"></a> [queue](#output\_queue) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

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

Copyright © 2019-2021 James Woolfenden

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
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/in/jameswoolfenden/
[twitter]: https://twitter.com/JimWoolfenden
[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-batch&url=https://github.com/JamesWoolfenden/terraform-aws-batch
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-batch&url=https://github.com/JamesWoolfenden/terraform-aws-batch
[share_reddit]: https://reddit.com/submit/?url=https://github.com/JamesWoolfenden/terraform-aws-batch
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/JamesWoolfenden/terraform-aws-batch
[share_email]: mailto:?subject=terraform-aws-batch&body=https://github.com/JamesWoolfenden/terraform-aws-batch
