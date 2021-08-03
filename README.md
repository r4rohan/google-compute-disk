# Google Compute Disk
Terraform Module for Google Compute Disk and Attachment with GCE VM

```
resource "random_string" "launch_id" {
  length  = 4
  special = false
  upper   = false
}

locals {
  name_suffix = format("%s-%s", var.tf_env, random_string.launch_id.result)
}

module "gce_disk" {
  source             = "git::https://github.com/r4rohan/google-compute-disk.git"
  name_suffix        = local.name_suffix
  instance_name      = module.gce_vm_instance.instance_name
  instance_id        = module.gce_vm_instance.id
  disk_name          = "gce-add-disk"
  compute_disk_size  = 300
  compute_disk_image = "debian-9-stretch-v20200805"
}
```
