variable "user" {
  default = "SSH_USER_NAME"
}

variable "sshpath" {
  default = "LOCATION_OF_YOUR_SSH_KEY" # Example: "../.ssh/id_rsa.pub"
}

variable "gitea_playbook" {
  default = "./ansible_scripts/gitea-playbook.yml"
}

variable "project" {
  default = "YOUR_GCP_PROJECT_NAME"
}

variable "zone" {
  default = "GCP_REGION_TO_BE_USED" # Example: "europe-west2-b"
}

variable "zone" {
  default = "GCP_ZONE_TO_BE_USED"  #Example: "europe-west2"
}
