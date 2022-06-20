# Custom role permissions
This repository contains a script and YAML files to create or update custom roles to use with Actifio GO or Google Cloud Backup and DR.

## Actifio GO

To add these roles, in your Google Console Cloud shell, run these three commands:

```
curl -o installActifioRoles.sh https://raw.githubusercontent.com/Actifio/rolepermissions/main/installActifioRoles.sh
chmod +x installActifioRoles.sh
./installActifioRoles.sh
```
Close your Cloud Shell and refresh your browser window.

You will now see the new roles in IAM --> Roles.   Assign these to the relevant Service Accounts as required.

**If you don't see the new roles, refresh your browser window.**

### New custom roles for Actifio GO

After running the script detailed below, you will have the  custom roles as follows:

* **Actifio GO Full**: Use this for when you want to use a single Service Account for Actifio GO.  It has all the permissions of the other three roles.
* **Actifio GO OnVault**: Use this for adding a Google Cloud Storage bucket to Actifio GO
* **Actifio GO System Recovery**: Use this when adding a Credential to either create, expire, mount and delete GCP Instance snapshots and also System Recovery jobs.
* **Actifio GO Compute Engine VM Instance Snapshots**: Use this when adding a Credential to either create and use and delete GCP Instance snapshots.  It cannot be used for System Recovery jobs.  

## Google Cloud Backup and DR

To add these roles, in your Google Console Cloud shell, run these three commands:

```
curl -o installCloudGoogleBDRRoles.sh https://raw.githubusercontent.com/Actifio/rolepermissions/main/installGoogleCloudBDRRoles.sh
chmod +x installGoogleCloudBDRRoles.sh
./installGoogleCloudBDRRoles.sh
```
Close your Cloud Shell and refresh your browser window.

You will now see the new roles in IAM --> Roles.   Assign these to the relevant Service Accounts as required.

**If you don't see the new roles, refresh your browser window.**

### New custom roles for Google Cloud Backup and DR

After running the script detailed below, you will have the  custom roles as follows:

* **Backup and DR OnVault**: Use this for adding a Google Cloud Storage bucket to Google Cloud Backup and DR
* **Backup and DR GCE Instance Backupss**: Use this when adding a Credential to either create and use and delete GCP Instance snapshots. 

## Contributing

Have a patch that will benefit this project? Awesome! Follow these steps to have
it accepted.

1.  Please sign our [Contributor License Agreement](CONTRIB.md).
1.  Fork this Git repository and make your changes.
1.  Create a Pull Request.
1.  Incorporate review feedback to your changes.
1.  Accepted!

## License

All files in this repository are under the
[Apache License, Version 2.0](LICENSE) unless noted otherwise.
