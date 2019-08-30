#!/bin/bash
set -Ceu

# waiting mysql started
sleep 30

# mogdbsetup
mogdbsetup --yes --dbhost=172.20.0.2 --dbname=mogilefs --dbrootpass='rootpass' --dbuser=mogile --dbpassword='mogilepass'

# mogilefsd
useradd -g nogroup -s /bin/false mogile
sudo -u mogile mogilefsd -c /usr/src/myapp/mogilefsd.conf

# mogstored
mogstored -d -c /usr/src/myapp/mogstored.conf

# mogadm
mogadm host add nodeone --ip=127.0.0.1 --port=7500
mkdir -p /var/mogdata/dev1
mogadm device add nodeone 1
mogadm host mark nodeone alive
mogadm domain add foo
mogadm class add foo foo-default --mindevcount=1
mogadm check

# tail
tail -f /dev/null
