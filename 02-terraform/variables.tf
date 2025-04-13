variable "project" {
  description="project"
  default= "superb-system-451221-c4"

}
variable "region" {
  description="Region"
  default= "us-central1"

}
variable "location" {
  description="project Location"
  default= "US"

}


variable "bq_dataset_name" {
  description="My BigQuery Dataset Name"
  default= "demo-dataset"

}

variable "gcs_bucket_name" {
  description="My Storage Bucket Name"
  default="superb-system-451221-c4-terra-bucket"
}

variable "gcs_storage_class" {
  description="Bucket Storage Class"
  default="STANDARD"
}
