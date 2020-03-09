terraform {
  backend "s3" {
    bucket = "terraformstatebackuppallab"
    key    = "terraformstatebackup/demo"
  }
}