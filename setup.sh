#!/bin/bash
HOST=localhost
PORT=9091
PREFIX=glances
LABELS=src:glances

groupadd --system glances
useradd -s /sbin/nologin -r -g glances glances
mkdir -p /home/glances
chown -R glances:glances /home/glances
cp glances.service /etc/systemd/system/glances.service
cp glances.conf /home/glances/.config/glances/glances.conf
echo 'host='$HOST >> /home/glances/.config/glances/glances.conf
echo 'port='$PORT >> /home/glances/.config/glances/glances.conf
echo 'prefix='$PREFIX >> /home/glances/.config/glances/glances.conf
echo 'labels='$LABELS >> /home/glances/.config/glances/glances.conf


systemctl start glances
systemctl enable glances