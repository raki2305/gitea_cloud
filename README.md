# Using Ansible and Terraform to install Gitea on GCP
With the provided scripts in this Repo you will be able to install Gitea on a Google Cloud Compute Engine (VM).

### Set up automatic authentication of local GCP developments
It is assumed that the Google Cloud SDK is already installed.

1. Open your cmd.
1. Switch to the current project with _gcloud_: `gcloud config set project your-project-name`
1. With _gcloud_ allow local developments and generate a token: `gcloud auth application-default login`
1. A window pops up. Confirm everything. _gcloud_ now generates a key file in json format with which our 
   applications are automatically authenticates itself against the GCP. So **no** credentials need to be specified in 
   the code!

### Edit and run the scripts

To use the scripts successfully, please adjust the variables.tf and gitea-playbook.yml files accordingly. 

The following variables must be adjusted:
- `variables.tf`: user, sshpath, zone, region
- `gitea_playbook.yml`: remote_user

To start terraform just type the following commands:
```
terraform init
terraform apply
``` 

...and with `terraform destroy` you can delete your resources.

Enjoy :blush: !

Best
Raki :wave:	