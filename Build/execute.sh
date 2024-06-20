#!/bin/bash
export PATH="$PATH:/usr/local/bin"
export USERID=$(id -u)
export GROUPID=$(id -g)

#Navigate to the script directory
cd $(dirname $0)

#Set environment variables
CONTAINER_NAME="vijay-$(echo ${JOB_NAME} | tr '/ ' '._').${BRANCH_NAME}"
[ -n "$CHANGE_ID" ] && CONTAINER_NAME="${CONTAINER_NAME}-PR${CHANGE_ID}"
CONTAINER_NAME="${CONTAINER_NAME}-${BUILD_ID}"

#Initialize Packer to install required plugins
docker-compose -f execute.yml run \
      --rm -w "$WORKSPACE" \
      --name "${CONTAINER_NAME}" \
      packer init jenkins-packer-ami.pkr.hcl

#Run the Packer build
docker-compose -f execute.yml run \
      --rm -w "$WORKSPACE" \
      --name "${CONTAINER_NAME}" \
      packer build -var "region=${REGION}" \
      -var "ami-name=${AMI_NAME}" \
      -var "description=${DESCRIPTION}" jenkins-packer-ami.pkr.hcl
