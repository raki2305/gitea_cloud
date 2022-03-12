provider "google" {
  project = "${var.project}"
  region = "${var.region}"
  zone = "${var.zone}"
}


resource "google_compute_firewall" "sshrule" {
  name    = "default-allow-ingress-ssh"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
  direction = "INGRESS"
}

resource "google_compute_firewall" "http" {
  name    = "default-allow-ingress-http"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["80", "8080"]
  }
  source_ranges = ["0.0.0.0/0"]
  direction = "INGRESS"
}

resource "google_compute_firewall" "https" {
  name    = "default-allow-ingress-https"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
  source_ranges = ["0.0.0.0/0"]
  direction = "INGRESS"
}


resource "google_compute_instance" "gitea_instance" {
  depends_on = [google_compute_firewall.sshrule]
  name  = "gitea"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
    access_config {
        
    }
    
  }

  # Upload ssh-Keys
  metadata = {
      ssh-keys = "${var.user}:${file(var.sshpath)}"
  }
  
  # Start Ansible to install Gitea
  provisioner "local-exec" {
        command = "ansible-playbook -i ${self.network_interface.0.access_config.0.nat_ip}, ${var.gitea_playbook}"
    }
}

resource "google_compute_firewall" "gitea" {
  depends_on = [google_compute_instance.gitea_instance]
  name    = "default-allow-ingress-gitea"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["3000"]
  }
  source_ranges = ["0.0.0.0/0"]
  direction = "INGRESS"
}










