resource "google_compute_instance" "vm-from-tf"{
  name = "vm-from-tf"

  zone = "europe-west2-a"            #lesson for kings : always provide the specific zone not just region
  machine_type = "n2-standard-2"     #Ask uncle Femi : does the vm on gcp stop the start again/reboot if you change machine type?

  allow_stopping_for_update = true

  network_interface {
    network = "custom-vpc-fr-tf"
    subnetwork = "lon-sub"
  }
  boot_disk {
    initialize_params {
      image = "debian-10-buster-v20221206"
      size = "20"
  } 
}
service_account {
  email = "terraform-gcp@terraform-gcp-370212.iam.gserviceaccount.com" #Lesson kings: for service ac to be attack you dont need reboot on vm
  scopes = ["cloud-platform"]
}

lifecycle {
  ignore_changes = [attached_disk]
}

}
resource "google_compute_disk" "disk-11"{
name = "disk-11"
size = 15
zone = "europe-west2-a"
type = "pd-ssd"
}

resource "google_compute_attached_disk" "adisk-11" {
  disk = google_compute_disk.disk-11.id
  instance = google_compute_instance.vm-from-tf.id
  
}