
resource "random_id" "bucket_suffix" {

byte_length = 4

}


resource "google_storage_bucket" "dynamic_bucket" {

name = "my-bucket-${random_id.bucket_suffix.hex}"

location = "US"

force_destroy = true

uniform_bucket_level_access = true

versioning {

enabled = true

}

public_access_prevention = "enforced"


}
