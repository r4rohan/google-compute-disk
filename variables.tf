# ----------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# ----------------------------------------------------------------------------------------------------------------------

variable "name_suffix" {
  description = "An arbitrary suffix that will be added to the end of the resource name(s). For example: an environment name, a business-case name, a numeric id, etc."
  type        = string
  validation {
    condition     = length(var.name_suffix) <= 14
    error_message = "A max of 14 character(s) are allowed."
  }
}

variable "disk_name" {
  description = "Name of the Google Cloud Compute Disk that is being created."
  type        = string
}

# ----------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# ----------------------------------------------------------------------------------------------------------------------

variable "zone" {
  description = "The GCloud zone-letter to launch the compute disk in. Options are \"a\" or \"b\" or \"c\" or \"d\". Defaults to \"a\" zone of the Google provider's region if nothing is specified here. See https://cloud.google.com/compute/docs/regions-zones."
  type        = string
  default     = "a"
}

variable "compute_disk_type" {
  description = "The GCE disk type. May be set to \"pd-standard\", \"pd-balanced\" or \"pd-ssd\"."
  type        = string
  default     = "pd-standard"
}

variable "compute_disk_size" {
  description = "The size of disk in GigaBytes. Must be at least the size of the boot disk image."
  type        = number
  default     = 500
}

variable "compute_disk_image" {
  description = "The image from which to initialize this disk. Check this for more: https://www.terraform.io/docs/providers/google/r/compute_disk.html#image"
  type        = string
  default     = ""
}

variable "instance_id" {
  description = "Id of GCloud VM Instance fetched from instance module"
  type        = string
}

variable "instance_name" {
  description = "Instance Name which disk would be attached to"
  type        = string
}

