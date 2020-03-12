[![Slalom][logo]](https://slalom.com)

# terraform-aws-batch

[![Build Status](https://github.com/JamesWoolfenden/terraform-aws-batch/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-aws-batch)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-batch.svg)](https://github.com/JamesWoolfenden/terraform-aws-batch/releases/latest)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![pre-commit](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)

Terraform module -

---

It's 100% Open Source and licensed under the [APACHE2](LICENSE).

## Usage

Include this repository as a module in your existing Terraform code:

```hcl
module "batch" {
  source      = "JamesWoolfenden/batch/aws"
  version     = "0.0.1"
  common_tags = var.common_tags
}
```

The example in the **examplea** folder shows how to pass your own policy in when creating your key.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| common\_tags | This is to help you add tags to your cloud objects | `map` | n/a | yes |
| container | n/a | `string` | `"{
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
| instance\_role | n/a | `string` | `"arn:aws:iam::680235478471:instance-profile/ecsInstanceRole"` | no |
| job\_name | n/a | `string` | `"first-run-job-definition"` | no |
| job\_type | n/a | `string` | `"container"` | no |
| queue | n/a | `map` | <pre>{<br>  "name": "first-run-job-queue-2",<br>  "priority": 1,<br>  "state": "ENABLED"<br>}<br></pre> | no |
| security\_group\_ids | n/a | `list` | <pre>[<br>  "sg-05749b21616ab0cdc"<br>]<br></pre> | no |
| service\_role | n/a | `string` | `"arn:aws:iam::680235478471:role/service-role/AWSBatchServiceRole"` | no |
| subnets | n/a | `list` | <pre>[<br>  "subnet-05808ec64faaa18ba"<br>]<br></pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| definition | n/a |
| environment | n/a |

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

Copyright � 2019-2020 [Slalom, LLC](https://slalom.com)

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
[logo]: https://gist.githubusercontent.com/JamesWoolfenden/5c457434351e9fe732ca22b78fdd7d5e/raw/15933294ae2b00f5dba6557d2be88f4b4da21201/slalom-logo.png
[website]: https://slalom.com
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/company/slalom-consulting/
[twitter]: https://twitter.com/Slalom

[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-batch&url=https://github.com/JamesWoolfenden/terraform-aws-batch
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-batch&url=https://github.com/JamesWoolfenden/terraform-aws-batch
[share_reddit]: https://reddit.com/submit/?url=https://github.com/JamesWoolfenden/terraform-aws-batch
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/JamesWoolfenden/terraform-aws-batch
[share_email]: mailto:?subject=terraform-aws-batch&body=https://github.com/JamesWoolfenden/terraform-aws-batch
