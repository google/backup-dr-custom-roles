#!/bin/bash
# Copyright 2022 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# ONVAULT
YAML_FILE='backupdr-onvault-role-template.yaml'
YAML_URL=https://raw.githubusercontent.com/Actifio/rolepermissions/main/backupdr-onvault-role-template.yaml
echo "Downloading template for Google Cloud Backup and DR IAM role creation"
curl ${YAML_URL} -o ${YAML_FILE}

echo
echo "Creating Google Cloud Backup and DR OnVault IAM role, please wait"
sleep 5

# enable the API
gcloud services enable compute.googleapis.com
# Enable the cloud resource manager API for PD snaps
gcloud services enable cloudresourcemanager.googleapis.com

# set the variables to be used
PROJECT_ID=$(gcloud config get-value project)
ROLE_NAME=BackupDROnVault

echo "Checking if Google Cloud Backup and DR IAM role ${ROLE_NAME} already exists in project ${PROJECT_ID}"
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

# GCE Instance Backups
YAML_FILE='backupdr-gce-instance-backup-role-template.yaml'
YAML_URL=https://raw.githubusercontent.com/Actifio/rolepermissions/main/backupdr-gce-instance-backup-role-template.yaml
echo "Downloading template for Google Cloud Backup and DR IAM role creation"
curl ${YAML_URL} -o ${YAML_FILE}

echo
echo "Creating Google Cloud Backup and DR GCE Instance backup IAM role, please wait"
sleep 5

# set the variables to be used
ROLE_NAME=BackupDRGCEInstanceBackup

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

# SA API 
YAML_FILE='backupdr-sa-api-role-template.yaml'
YAML_URL=https://raw.githubusercontent.com/Actifio/rolepermissions/main/backupdr-sa-api-role-template.yaml
echo "Downloading template for Google Cloud Backup and DR IAM role creation"
curl ${YAML_URL} -o ${YAML_FILE}

echo
echo "Creating Google Cloud Backup and Service Account API IAM role, please wait"
sleep 5

# set the variables to be used
ROLE_NAME=BackupDRServiceAccountRole

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
echo "Role installed for use with an SA to perform Backup and DR APIs in Google Cloud"
echo 
echo "Please close the Cloud Shell and then refresh your browser"





