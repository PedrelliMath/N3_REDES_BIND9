#!/bin/bash

echo "Criando imagem do container..."
sudo docker build -t bind9-server .

echo "Parando serviço system-resolved..."
systemctl stop systemd-resolved

echo "Servidor DNS iniciado na PORTA 53, DNS padrão desativado não esqueça de reativar"
sudo docker run -d --name bind9-container -p 53:53/udp bind9-server


