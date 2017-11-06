#!/usr/bin/env bash

sudo yum install -y firewalld curl policycoreutils-python openssh-server
sudo systemctl enable sshd
sudo systemctl start sshd
sudo firewall-cmd --permanent --add-service=http
sudo systemctl reload firewalld

# sudo yum install postfix
# sudo systemctl enable postfix
# sudo systemctl start postfix

curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.rpm.sh | sudo bash

if [ "$1" ]; then
    # EXTERNAL_URL="http://gitlab.example.com"
    sudo EXTERNAL_URL="$1" yum install -y gitlab-ee
else
    echo "[ERROR] EXTERNAL_URL cannot be empty!"
    exit 1
fi
