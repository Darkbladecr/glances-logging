#!/bin/bash
$USER=darkbladecr
$HOST=localhost
$PORT=9091
$PREFIX=glances
$LABELS=src:glances
# sudo su
groupadd --system glances
useradd -s /sbin/nologin -r -g glances glances
cp glances.service /etc/systemd/system/glances.service
cp glances.conf /home/$USER/.config/glances/glances.conf
echo 'host='$HOST >> /home/$USER/.config/glances/glances.conf
echo 'port='$PORT >> /home/$USER/.config/glances/glances.conf
echo 'prefix='$PREFIX >> /home/$USER/.config/glances/glances.conf
echo 'labels='$LABELS >> /home/$USER/.config/glances/glances.conf


systemctl start glances
systemctl enable glances