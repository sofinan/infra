variable project {
  description = "infra-279806"
}

variable region {
  description = "Region"
  default     = "europe-west1"
}

variable public_key_path {
  description = "path to the public key used for ssh"
}

variable disk_image {
  description = "Disk image"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default = "reddit-app-base"
}

variable db_disk_image {
  description = "Disk image for reddit db"
  default = "reddit-db-base" 
}


