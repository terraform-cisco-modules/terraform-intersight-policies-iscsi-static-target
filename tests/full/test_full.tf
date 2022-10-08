module "main" {
  source      = "../.."
  description = "${var.name} iSCSI Static Target Policy."
  ip_address  = "198.18.32.60"
  lun = [
    {
      bootable = true
      lun_id   = 0
    }
  ]
  name         = var.name
  organization = "terratest"
  port         = 3260
  target_name  = "iqn.1992-08.com.ci:sn.e461ee9f190611ebb06300a0985b4a87:vs.3"
}
