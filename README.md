# Using Ansible and Terraform to install Gitea on GCP
With the provided scripts in this Repo you will be able to install Gitea on a Google Cloud Compute Engine (VM).

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