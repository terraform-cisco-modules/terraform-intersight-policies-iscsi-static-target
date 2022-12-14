#____________________________________________________________
#
# Intersight Organization Data Source
# GUI Location: Settings > Settings > Organizations > {Name}
#____________________________________________________________

data "intersight_organization_organization" "org_moid" {
  for_each = {
    for v in [var.organization] : v => v if length(
      regexall("[[:xdigit:]]{24}", var.organization)
    ) == 0
  }
  name = each.value
}

#__________________________________________________________________
#
# Intersight iSCSI Static Target Policy
# GUI Location: Policies > Create Policy > iSCSI Static Target
#__________________________________________________________________

resource "intersight_vnic_iscsi_static_target_policy" "iscsi_static_target" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  description = var.description != "" ? var.description : "${var.name} iSCSI Static Target Policy."
  ip_address  = var.ip_address
  name        = var.name
  port        = var.port
  target_name = var.target_name
  organization {
    moid = length(
      regexall("[[:xdigit:]]{24}", var.organization)
      ) > 0 ? var.organization : data.intersight_organization_organization.org_moid[
      var.organization].results[0
    ].moid
    object_type = "organization.Organization"
  }
  dynamic "lun" {
    for_each = var.lun
    content {
      additional_properties = ""
      bootable              = lun.value.bootable
      lun_id                = lun.value.lun_id
      object_type           = "vnic.Lun"
    }
  }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}
