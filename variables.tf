#____________________________________________________________
#
# iSCSI Static Target Policy Variables Section.
#____________________________________________________________

variable "description" {
  default     = ""
  description = "Description for the Policy."
  type        = string
}

variable "ip_address" {
  default     = ""
  description = "The IPv4 address assigned to the iSCSI target."
  type        = string
}

variable "name" {
  default     = "default"
  description = "Name for the Policy."
  type        = string
}

variable "lun" {
  description = <<-EOT
  The LUN parameters associated with an iSCSI target. This complex property has following sub-properties:
  * bootable - Specifies LUN is bootable. true or false.
  * lun_id - The Identifier of the LUN.
  EOT
  type = list(object(
    {
      bootable = optional(bool, true)
      lun_id   = optional(number, 0)
    }
  ))
}

variable "port" {
  description = "The port associated with the iSCSI target."
  type        = number
}

variable "organization" {
  default     = "default"
  description = "Intersight Organization Name to Apply Policy to.  https://intersight.com/an/settings/organizations/."
  type        = string
}

variable "tags" {
  default     = []
  description = "List of Tag Attributes to Assign to the Policy."
  type        = list(map(string))
}

variable "target_name" {
  default     = ""
  description = "Qualified Name (IQN) or Extended Unique Identifier (EUI) name of the iSCSI target."
  type        = string
}

