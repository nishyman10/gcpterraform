variable "environment" {
  description = "The environment for the Google Cloud Storage bucket"
  default     = "dev"  # You can change the default value or make it mandatory by removing the default value
  type        = string
}

variable "location" {
  description = "The location for the Google Cloud Storage bucket"
  default     = "us-central1"  # Changed to a region
  type        = string
}

resource "google_storage_bucket" "terragoat_website" {
  name          = "terragot-${var.environment}"
  location      = var.location
  force_destroy = true
}

resource "google_storage_bucket_iam_binding" "allow_public_read" {
  bucket  = google_storage_bucket.terragoat_website.name  # Use 'name' instead of 'id'
  members = ["allUsers"]
  role    = "roles/storage.objectViewer"
}
