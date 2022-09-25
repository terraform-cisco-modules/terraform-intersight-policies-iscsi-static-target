<!-- BEGIN_TF_DOCS -->
# iSCSI Static Target Policy Example

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example will create resources. Resources can be destroyed with `terraform destroy`.

### main.tf
```hcl
module "iscsi_static_target" {
  source  = "terraform-cisco-modules/policies-iscsi-static-target/intersight"
  version = ">= 1.0.1"

  description  = "default iSCSI Static Target Policy."
  name         = "default"
  organization = "default"
  ip_address   = "198.18.0.1"
  port         = 3260
  target_name  = "iqn.1992-08.com.ci:sn.e461ee9f190611ebb06300a0985b4a87:vs.3"
  lun = [
    {
      bootable = true
      lun_id   = 0
    }
  ]
}
```

### provider.tf
```hcl
terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">=1.0.32"
    }
  }
  required_version = ">=1.3.0"
}
```

### variables.tf
```hcl
variable "apikey" {
  description = "Intersight API Key."
  sensitive   = true
  type        = string
}

variable "endpoint" {
  default     = "https://intersight.com"
  description = "Intersight URL."
  type        = string
}

variable "secretkey" {
  description = "Intersight Secret Key."
  sensitive   = true
  type        = string
}
```
<!-- END_TF_DOCS -->