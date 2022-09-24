module "iscsi_static_target" {
  source  = "terraform-cisco-modules/policies-iscsi-static-target/intersight"
  version = ">= 1.0.1"

  description      = "default iSCSI Static Target Policy."
  name         = "default"
  organization = "default"
  ip_address  = "198.18.0.1"
  port        = 3260
  target_name = "iqn.1992-08.com.ci:sn.e461ee9f190611ebb06300a0985b4a87:vs.3"
  lun = [
    {
      bootable = true
      lun_id   = 0
    }
  ]
}
