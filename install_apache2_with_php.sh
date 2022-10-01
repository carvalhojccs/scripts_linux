#!/bin/bash

# Instalação do servidor apache2 com PHP no GNU/Linux UBUNTU 22.04 LTS

# Comandos utilizados
apt_get=`which apt-get`;
clear=`which clear`;
nmap=`which nmap`;
hostname=`which hostname`;
# Pacotes
pcts="libapache2-mod-php8.1  php8.1-curl php8.1-xml "

$clear;

echo "##############################################################"
echo "# SSCRIPT DE INSTALAÇÃO DO SERVIDOR APACHE COM SUPORTE A PHP #"
echo "##############################################################"

echo "Verificando atualização de pacotes..."
sleep 3s;

$apt_get update && $apt_get upgrade -y;

echo "Sistema atualizado"

sleep 2s;

echo "Iniciando a instalação do apache com PHP..."

sleep 2s

for pct in $pcts
do
        $apt_get install $pct -y;
done

sleep 2s;

http=`nmap localhost | grep  80/tcp`;

if [ -z "$http" ]
then
        echo "Não foi possível verificar o status do servidor!";
else
        echo "Servidor rodando:" $http;
        echo "Acesse seu servidor no endereço http://"`$hostname -I`
fi
