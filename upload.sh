#!/bin/bash

mkdir -p /var/log/backup
touch /var/log/backup/sicss-jupyter.log

echo ">> Backup starts at $(date)" >> /var/log/backup/sicss-jupyter.log
(cd /notebooks && git reset -q && git add . && git commit -m "update at $(date)" && git push github HEAD) 2>&1 | tee -a /var/log/backup/sicss-jupyter.log
echo "<< Backup ends at $(date)" >> /var/log/backup/sicss-jupyter.log
