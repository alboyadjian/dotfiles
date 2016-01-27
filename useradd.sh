#!/bin/bash

userName=$1
teamGroup=$2
pubKey=$3

if [ -z "$userName" ]; then
  echo "Username required"
  exit 1;
fi

if [ -z "$teamGroup" ]; then
  echo "teamGroup is required"
  exit 1;
else
  if [ -z $(grep $teamGroup /etc/group) ]; then
    echo "creating group $teamGroup"
    groupadd $teamGroup
  fi
fi

if [ -z "$pubKey" ]; then
  echo "Public key required - Enclose argument in quotes!"
  exit 1;
fi

useradd -d /home/$userName -s /bin/bash -m $userName -g $teamGroup
su - -c "mkdir -p .ssh" $userName
su - -c "chmod 700 .ssh" $userName
su - -c "echo $pubKey > .ssh/authorized_keys" $userName
su - -c "chmod 600 .ssh/authorized_keys" $userName
echo "$userName ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$userName
ls -al /home | grep $userName
