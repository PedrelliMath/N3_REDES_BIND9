#!/bin/bash

echo "Parando container: "
sudo docker kill bind9-container

echo "Destruindo container: "
sudo docker rm bind9-container

echo "Reiniciando systemd-resolved"
systemctl start systemd-resolved
