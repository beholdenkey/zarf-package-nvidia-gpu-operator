#!/bin/bash

# Define the path to your local mirror
LOCAL_MIRROR_PATH="/opt/mirror"

# Define the path to the repository configuration file
REPO_FILE="/etc/yum.repos.d/local.repo"

# Determine the OS
OS=$(cat /etc/os-release | grep "^ID=" | cut -d'=' -f2 | tr -d '"')

# Check if the repository configuration file already exists
if [ ! -f $REPO_FILE ]; then
  # Create the repository configuration file
  echo "[baseos]" >$REPO_FILE
  echo "name=$OS \$releasever - BaseOS" >>$REPO_FILE
  echo "baseurl=file://$LOCAL_MIRROR_PATH/$OS/baseos" >>$REPO_FILE
  echo "enabled=1" >>$REPO_FILE
  echo "gpgcheck=0" >>$REPO_FILE

  echo "[appstream]" >>$REPO_FILE
  echo "name=$OS \$releasever - AppStream" >>$REPO_FILE
  echo "baseurl=file://$LOCAL_MIRROR_PATH/$OS/appstream" >>$REPO_FILE
  echo "enabled=1" >>$REPO_FILE
  echo "gpgcheck=0" >>$REPO_FILE

  echo "[extras]" >>$REPO_FILE
  echo "name=$OS \$releasever - Extras" >>$REPO_FILE
  echo "baseurl=file://$LOCAL_MIRROR_PATH/$OS/extras" >>$REPO_FILE
  echo "enabled=1" >>$REPO_FILE
  echo "gpgcheck=0" >>$REPO_FILE
fi

# Clean the YUM cache
yum clean all

# Rebuild the YUM cache
yum makecache

# Check if the "Development Tools" group of packages is already installed
if ! yum group list "Development Tools" | grep -q Installed; then
  # Install the "Development Tools" group of packages
  yum install --disablerepo=* --enablerepo=baseos,appstream,extras 'Development Tools' -y
fi
