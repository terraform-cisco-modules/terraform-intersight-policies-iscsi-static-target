<!-- BEGIN_TF_DOCS -->
# Terraform Intersight Policies - iSCSI Static Target
Manages Intersight iSCSI Static Target Policies

Location in GUI:
`Policies` » `Create Policy` » `iSCSI Static Target`

## Example

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

### versions.tf
```hcl
terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">=1.0.32"
    }
  }
}

provider "intersight" {
  apikey    = var.apikey
  endpoint  = var.endpoint
  secretkey = var.secretkey
}
```

## Environment Variables

### Terraform Cloud/Enterprise - Workspace Variables
- Add variable apikey with value of [your-api-key]
- Add variable secretkey with value of [your-secret-file-content]

### Linux
```bash
export TF_VAR_apikey="<your-api-key>"
export TF_VAR_secretkey=`cat <secret-key-file-location>`
```

### Windows
```bash
$env:TF_VAR_apikey="<your-api-key>"
$env:TF_VAR_secretkey="<secret-key-file-location>""
```
<!-- END_TF_DOCS -->