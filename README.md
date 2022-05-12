# Custom role permissions
This repository contains a script and YAML files to create or update custom roles to use with Actifio GO. After running the script detailed below, you will have the  custom roles as follows:

* **Actifio GO Full**: Use this for when you want to use a single Service Account for Actifio GO.  It has all the permissions of the other three roles.
* **Actifio GO OnVault**: Use this for adding a Google Cloud Storage bucket to Actifio GO
* **Actifio GO System Recovery**: Use this when adding a Credential to either create, expire, mount and delete GCP Instance snapshots and also System Recovery jobs.
* **Actifio GO Compute Engine VM Instance Snapshots**: Use this when adding a Credential to either create and use and delete GCP Instance snapshots.  It cannot be used for System Recovery jobs.  

## Actifio GO

To add these roles, in your Google Console Cloud shell, run these three commands:

```
curl -o installActifioRoles.sh https://raw.githubusercontent.com/Actifio/rolepermissions/main/installActifioRoles.sh
chmod +x installActifioRoles.sh
./installActifioRoles.sh
```
Close your Cloud Shell and refresh your browser window.

You will now see the new roles in IAM --> Roles.   Assign these to the relevant Service Accounts as required.

## Google Backup and DR

To add these roles, in your Google Console Cloud shell, run these three commands:

```
curl -o installGoogleBDRRoles.sh https://raw.githubusercontent.com/Actifio/rolepermissions/main/installGoogleBDRRoles.sh
chmod +x installGoogleBDRRoles.sh
./installGoogleBDRRoles.sh
```
Close your Cloud Shell and refresh your browser window.

You will now see the new roles in IAM --> Roles.   Assign these to the relevant Service Accounts as required.

