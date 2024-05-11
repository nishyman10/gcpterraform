provider "google" {
  project = "fleet-garage-421904"
  region  = "us-central1"
  zone    = "us-central1-a"
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "google_storage_bucket_iam_binding" "allow_public_read" {
  bucket  = google_storage_bucket.dynamic_bucket.name
  members = ["allUsers"]
  role    = "roles/storage.objectViewer"
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

resource "google_project_iam_member" "service_account_bindings" {
  project = "fleet-garage-421904"

  # Add bindings for the specified service accounts
  role    = "roles/storage.buckets.getIamPolicy"
  members = [
    "serviceAccount:419014910717@cloudbuild.gserviceaccount.com",
    "serviceAccount:manikndn369@fleet-garage-421904.iam.gserviceaccount.com"
  ]
}
