#!/bin/bash

# ONVAULT

YAML_FILE='gbdr-onvault-role-template.yaml'
YAML_URL=https://raw.githubusercontent.com/Actifio/rolepermissions/main/gbdr-onvault-role-template.yaml
echo "Downloading template for Google Backup and DR IAM role creation"
curl ${YAML_URL} -o ${YAML_FILE}

echo
echo "Creating Google Backup and DR OnVault IAM role, please wait"
sleep 5

# enable the API
gcloud services enable compute.googleapis.com
# Enable the cloud resource manager API for PD snaps
gcloud services enable cloudresourcemanager.googleapis.com

# set the variables to be used
PROJECT_ID=$(gcloud config get-value project)
ROLE_NAME=GoogleBDROnVault

echo "Checking if Google Backup and DR IAM role ${ROLE_NAME} already exists in project ${PROJECT_ID}"
# check if role already exists else create new
if gcloud iam roles describe ${ROLE_NAME} --project=${PROJECT_ID} --quiet
then
    echo "IAM Role found, running update"
        gcloud iam roles update ${ROLE_NAME} --project=${PROJECT_ID} --file=${YAML_FILE} --quiet
else
    echo "IAM Role not found, creating new"
        gcloud iam roles create ${ROLE_NAME} --project=${PROJECT_ID} --file=${YAML_FILE} --quiet
fi
echo
echo "OnVault Role installed for use with an SA to create OnVault images in Google Cloud Storage"
echo

# Persistent Disk Snapshots

YAML_FILE='gbdr-gce-instance-backup-role-template.yaml'
YAML_URL=https://raw.githubusercontent.com/Actifio/rolepermissions/main/gbdr-gce-instance-backup-role-template.yaml
echo "Downloading template for Google Backup and DR IAM role creation"
curl ${YAML_URL} -o ${YAML_FILE}

echo
echo "Creating Google Backup and DR GCE Instance backup IAM role, please wait"
sleep 5

# set the variables to be used
ROLE_NAME=GoogleBDRGCEInstanceBackup

echo "Checking if Google Backup and DR  IAM role ${ROLE_NAME} already exists in project ${PROJECT_ID}"
# check if role already exists else create new
if gcloud iam roles describe ${ROLE_NAME} --project=${PROJECT_ID} --quiet
then
    echo "IAM Role found, running update"
        gcloud iam roles update ${ROLE_NAME} --project=${PROJECT_ID} --file=${YAML_FILE} --quiet
else
    echo "IAM Role not found, creating new"
        gcloud iam roles create ${ROLE_NAME} --project=${PROJECT_ID} --file=${YAML_FILE} --quiet
fi
echo
echo "Persistent Disk Role installed for use with an SA to perform Google Cloud VM Instance Snapshots in Google Cloud"
echo




