#!/bin/bash

yum install ansible -y | tee -a /opt/userdata.log
# shellcheck disable=SC2154
ansible-pull -i localhost, -U https://github.com/vijayavanisabbiti/expense-ansible expense.yml -e role_name="${role_name}" -e env="${env}" | tee -a /opt/userdata.log