#!/bin/sh
echo "Usage: custom_ls.sh <username> <password> <host>"
echo "Username: $1"
echo "Password: <REDACTED>"
echo "ES Host: $3"
sudo sed 's/your_elasticsearch_user/$1/g'
sudo sed 's/your_elasticsearch_password/"$2"/g'
sudo sed 's/your_elasticsearch_host/"$3"/g'
