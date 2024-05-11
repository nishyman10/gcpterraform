provider "google" {
  project = "fleet-garage-421904"
  region  = "us-central1"
  zone    = "us-central1-a"
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}



resource "google_storage_bucket" "dynamic_bucket" {
  name          = "my-bucket-${random_id.bucket_suffix.hex}"
  location      = "US"
  uniform_bucket_level_access = true
  force_destroy = true

  versioning {
    enabled = true
  }
}

