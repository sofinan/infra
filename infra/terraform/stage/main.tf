provider "google" {
  project = "${var.project}"
  region  = "${var.region}"
}

module "app" {
    source = "../modules/app"
    app_disk_image = "${var.app_disk_image}"
}

module "db" {
    source = "../modules/db"
    db_disk_image = "${var.db_disk_image}"
}

module "vpc" {
    source = "../modules/vpc"
    source_ranges = ["0.0.0.0/0"]
}

