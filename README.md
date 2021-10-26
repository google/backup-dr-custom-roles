# Custom role permissions
This repo contains code to create custom roles to use with Actifio GO.  After running the script detailed below, it will create three custom roles:

* Actifio GO OnVault.    Use this for adding a Google Cloud Storage bucket to Actifio GO
* Actifio GO System Recovery.   Use this when adding a Credential to either create and use and delete GCP Instance snapshots and System Recovery jobs.
* Actifio GO Compute Engine VM Instance Snapshots.  Use this when adding a Credential to either create and use and delete GCP Instance snapshots and you don't want the Service Account to be able to delete Google Cloud Instances and Disks.

In your Google Console Cloud shell, run these three commands:

```
curl -o installActifioRoles.sh https://raw.githubusercontent.com/Actifio/rolepermissions/main/installActifioRoles.sh
chmod +x installActifioRoles.sh
./installActifioRoles.sh
```
You will now see three new roles in IAM --> Roles
Assign these to the relevant Service Accounts as required.
