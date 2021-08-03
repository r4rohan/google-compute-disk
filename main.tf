terraform {
  required_version = ">= 0.13.1" # see https://releases.hashicorp.com/terraform/
}

data "google_client_config" "google_client" {}

locals {
  zone              = "${data.google_client_config.google_client.region}-${var.zone}"
  compute_disk_name = format("%s-%s", var.disk_name, var.name_suffix)
}

resource "google_compute_disk" "compute_disk" {
  name  = local.compute_disk_name
  zone  = local.zone
  type  = var.compute_disk_type
  size  = var.compute_disk_size
  image = var.compute_disk_image
}

resource "google_compute_attached_disk" "attached_disk" {
  disk     = google_compute_disk.compute_disk.id
  instance = var.instance_id
}
