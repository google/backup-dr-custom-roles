# Custom role permissions
This repository contains a script and YAML files to create or update custom roles to use with Actifio GO. After running the script detailed below, you will have three custom roles as follows:

* **Actifio GO OnVault**: Use this for adding a Google Cloud Storage bucket to Actifio GO
* **Actifio GO System Recovery**: Use this when adding a Credential to either create, expire, mount and delete GCP Instance snapshots and also System Recovery jobs.
* **Actifio GO Compute Engine VM Instance Snapshots**: Use this when adding a Credential to either create and use and delete GCP Instance snapshots and you don't want the Service Account to be able to delete Google Cloud Instances and Disks.  It cannot be used for System Recovery jobs.

To add these roles, in your Google Console Cloud shell, run these three commands:

```
curl -o installActifioRoles.sh https://raw.githubusercontent.com/Actifio/rolepermissions/main/installActifioRoles.sh
chmod +x installActifioRoles.sh
./installActifioRoles.sh
```
You will now see three new roles in IAM --> Roles.   Assign these to the relevant Service Accounts as required.
