terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.44.1"
    }
  }
}

provider "google" {
  # Configuration options
  project = "terraform-gcp-370212"
  region = "EUROPE-WEST2"
  credentials = "keys3.json"
}
