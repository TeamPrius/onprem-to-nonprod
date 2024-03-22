#!/bin/bash
sudo su
curl -H 'X-Key: 1dbb14c0bfcdb7913d7d891003cc2034b41b279007e20b744de68de6aea49e04' 'https://sensor.cloud.tenable.com/install/scanner?name=PriusOnPrem&groups=PriusGroup' | bash
/bin/systemctl start nessusd.service

# ssh -i <key> ec2-user@<public-ip>
# sudo su
# service nessusd stop
# cd /opt/nessus/sbin
# ./nessuscli adduser
# service nessusd start
#
# In browser: https://<ec2-public-ip>:8834
# Log in with credentials you just created
# Wait forever for plugins to compile

# Once plugins complile it might crash lol, use sudo systemctl restart nessusd if necessary
# use /opt/nessus/sbin/nessuscli managed status
