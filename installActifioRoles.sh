#!/bin/bash

# ONVAULT

YAML_FILE='actifiogo-onvault-role-template.yaml'
YAML_URL=https://raw.githubusercontent.com/Actifio/rolepermissions/main/actifiogo-onvault-role-template.yaml
echo "Downloading template for ActifioGO IAM role creation"
curl ${YAML_URL} -o ${YAML_FILE}

echo
echo "Creating ActifioGO OnVault IAM role, please wait"
sleep 5

# enable the API
gcloud services enable compute.googleapis.com
# Enable the cloud resource manager API for PD snaps
gcloud services enable cloudresourcemanager.googleapis.com

# set the variables to be used
PROJECT_ID=$(gcloud config get-value project)
ROLE_NAME=ActifioGOOnVault

echo "Checking if ActifioGO IAM role ${ROLE_NAME} already exists in project ${PROJECT_ID}"
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

YAML_FILE='actifiogo-pd-snaps-role-template.yaml'
YAML_URL=https://raw.githubusercontent.com/Actifio/rolepermissions/main/actifiogo-pd-snaps-role-template.yaml
echo "Downloading template for ActifioGO IAM role creation"
curl ${YAML_URL} -o ${YAML_FILE}

echo
echo "Creating ActifioGO Google Cloud VM Instance Snapshots IAM role, please wait"
sleep 5

# set the variables to be used
ROLE_NAME=ActifioGOPDSnaps

echo "Checking if ActifioGO IAM role ${ROLE_NAME} already exists in project ${PROJECT_ID}"
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


# SYSTEM RECOVERY

YAML_FILE='actifiogo-system-recover-role-template.yaml'
YAML_URL=https://raw.githubusercontent.com/Actifio/rolepermissions/main/actifiogo-system-recover-role-template.yaml

echo "Downloading template for ActifioGO IAM role creation"
curl ${YAML_URL} -o ${YAML_FILE}

echo
echo "Creating ActifioGO System Recovery IAM role, please wait"
sleep 5

# set the variables to be used
ROLE_NAME=ActifioGOSystemRecovery

echo "Checking if ActifioGO IAM role ${ROLE_NAME} already exists in project ${PROJECT_ID}"
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
echo "System Recovery Role installed for use with an SA to perform System Recovery in Google Cloud"



# Full Role

YAML_FILE='actifiogo-full-role-template.yaml'
YAML_URL=https://raw.githubusercontent.com/Actifio/rolepermissions/main/actifiogo-full-role-template.yaml

echo "Downloading template for ActifioGO IAM role creation"
curl ${YAML_URL} -o ${YAML_FILE}

echo
echo "Creating ActifioGO Full IAM role, please wait"
sleep 5

# set the variables to be used
ROLE_NAME=ActifioGOFullRole

echo "Checking if ActifioGO IAM role ${ROLE_NAME} already exists in project ${PROJECT_ID}"
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
echo "Actifio GO Full Role installed for use with an SA to perform all Actifio tasks in Google Cloud"
