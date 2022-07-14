# Custom role permissions
This repository contains a script and YAML files to create or update custom roles to use with Google Cloud Backup and DR.

## Required Permissions

To get the permissions that you need to create IAM roles, ask your administrator to grant you a role that contains at least the following permission on the project:
* iam.roles.create

Example roles that have this permission include: Owner, Editor or Service Usage Admin 

## Google Cloud Backup and DR

To add these roles, in your Google Console Cloud shell, run these three commands with a user that has the **[required permissions](#required-permissions)**<br>

```
curl -o installGoogleCloudBDRRoles.sh https://raw.githubusercontent.com/google/backup-dr-custom-roles/main/installGoogleCloudBDRRoles.sh
chmod +x installGoogleCloudBDRRoles.sh
./installGoogleCloudBDRRoles.sh
```
Once the commands have run, close your Cloud Shell and refresh your browser window.

### New custom roles for Google Cloud Backup and DR

After running the script detailed below, you will have the  custom roles as follows.  Assign these to the relevant Service Accounts as required.

* **Backup and DR OnVault**: Use this for adding a Google Cloud Storage bucket to Google Cloud Backup and DR
* **Backup and DR Compute Engine Instance Backups**: Use this when adding a Credential to either create and use and delete GCP Instance snapshots. 

**If you don't see the new roles, refresh your browser window.**

## Deleting Custom Roles

If you delete a custom role then it does not automatically disappear and the Role Name cannot be reused for 30 days.   This means if you delete one of the custom roles and then run the script to reinstall it within that 30 day period, the install will fail because the role exists, but cannot be updated.   You will see an error like this:   
```
You can't update a role (projects/projectname/roles/BackupDRGCEInstanceBackup) which is in a deleted state.
```
At this point either find the deleted custom role in the IAM panel and un-delete it, or wait till the 30 day period is over.  

More details can be found here:

https://cloud.google.com/iam/docs/creating-custom-roles#deleting-custom-role

## Maximum number of custom roles

There is a limit of 300 custom roles per Organization and/or Project.

## Contributing

Have a patch that will benefit this project? Awesome! Follow these steps to have
it accepted.

1.  Please sign our [Contributor License Agreement](CONTRIB.md).
1.  Fork this Git repository and make your changes.
1.  Create a Pull Request.
1.  Incorporate review feedback to your changes.
1.  Accepted!

## Disclaimer
This is not an official Google product.
