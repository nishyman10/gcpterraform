provider "google" {
  project = "fleet-garage-421904"  # Replace this with your actual Google Cloud project ID
  region  = "us-central1"          # Specify your desired region
  zone    = "us-central1-a"        # Specify your desired zone
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "google_storage_bucket" "dynamic_bucket" {
  name          = "my-bucket-${random_id.bucket_suffix.hex}"
  location      = "US"
  force_destroy = true
  uniform_bucket_level_access = true
  force_destroy = true

  versioning {
    enabled = true
  }

  public_access_prevention = "enforced"
}
