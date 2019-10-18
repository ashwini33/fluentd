#!/bin/bash
DEBIAN_FRONTEND=noninteractive apt-get update -y
DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
apt-get install ruby ruby-dev -y
apt-get install build-essential -y
gem install fluentd --no-ri --no-rdoc 
/usr/local/bin/fluentd --setup /etc/fluent
gem install fluent-plugin-s3
cp ./fluentd.sh /usr/bin/
chmod +x /usr/bin/fluentd.sh

cp ./fluentd.service /etc/systemd/system/
chmod 644 /etc/systemd/system/fluentd.service
systemctl daemon-reload
systemctl restart fluentd.service
systemctl enable fluentd.service
systemctl status fluentd.service






