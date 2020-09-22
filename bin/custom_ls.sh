#!/bin/sh
echo "Usage: custom_ls.sh <username> <host> "
echo "Username: $1"
echo "ES Host: $2"

export cfg="/opt/tpot/etc/custom-ls/logstash.conf"
echo "Configuration directory: $cfg"

if $USER="root"
then
  read -s -p "Type or paste in the password for $1 and hit ENTER: " password
  sed 's/your_elasticsearch_password/"$password"/g' $cfg
  unset password
  sed 's/your_elasticsearch_user/$1/g' $cfg
  sed 's/your_elasticsearch_host/"$2"/g' $cfg
  chown tpot:tpot $cfg
  echo "Success: Configuration updated. To restart Logstash, try:"
  echo "sudo docker restart logstash"
  echo "IMPORTANT: Be sure to check container log output to make sure the new configuration does not produce any errors."
else
  echo "Permission Error: It looks like you are not root. Please try running this command again with sudo."
  echo "                  You just tried to run this script as: $(whoami)"
  
