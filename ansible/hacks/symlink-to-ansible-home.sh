#!/bin/bash

if [ ${EUID:-$(id -u)} -ne 0 ]; then
  echo "User is not root. Please run script as sudo in order to symlink files into /etc/ansible"
  exit 1
fi

if [ -d ansible/roles ]; then
  echo "Ansible roles found"
  ln -nsfv ansible/roles/* /etc/ansible/roles
else
  echo "Ansible roles not found"
fi

if [ -d ansible/playbooks ]; then
  echo "Ansible playbooks found"
  ln -nsfv ansible/playbooks/* /etc/ansible/playbooks
else
  echo "Ansible playbooks not found in ansible/playbooks"
fi
