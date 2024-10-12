resource "yandex_compute_instance" "pub-vm" {

  name = "pub-vm" 
  hostname = "pub-vm" 

  allow_stopping_for_update = true
  platform_id               = "standard-v1"
  zone                      = "ru-central1-a"

  network_interface {
    subnet_id = "${yandex_vpc_subnet.public.id}" 
    ip_address = "192.168.10.10"
    nat       = "true"
  }

  resources {
    core_fraction = 20 
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd82nvvtllmimo92uoul"   # ubuntu 22.04
      size = "16"
    }
  }



  scheduling_policy {
    preemptible = "true"
   }

 metadata = {
    user-data = "${file("./meta.yaml")}" 
  }
}