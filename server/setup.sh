#!/bin/sh

if [ ! -f ./credential/id_rsa ] || [ ! -f ./credential/id_rsa.pub ]; then
  ssh-keygen -t rsa -b 4096 -f ./credential/id_rsa -m PEM -N "" -C ""
fi

if [ ! -f ./http/httpd/html/100M.dummy ]; then
  dd if=/dev/zero of=./http/httpd/html/100M.dummy bs=1M count=100
fi

if [ ! -f ./ftp/file/100M.dummy ]; then
  dd if=/dev/zero of=./ftp/file/100M.dummy bs=1M count=100
fi

CSR_Country_Name='JP'
CSR_State_or_Province_Name='Tokyo'
CSR_Locality_Name='Chiyoda-ku'
CSR_Organization_Name='Curl Command Lab.'
CSR_Organizational_Unit_Name='Development Division'
CSR_Common_Name='curl.test'

if [ ! -f ./http/httpd/dist/server.key ] || [ ! -f ./http/httpd/dist/server.crt ]; then
  openssl req -x509 -nodes -new -keyout ./http/httpd/dist/server.key -out ./http/httpd/dist/server.crt -days 365 \
  -subj "/C=${CSR_Country_Name}/ST=${CSR_State_or_Province_Name}/L=${CSR_Locality_Name}/O=${CSR_Organization_Name}/OU=${CSR_Organizational_Unit_Name}/CN=${CSR_Common_Name}"
fi

if [ ! -f ./http/nginx/dist/server.key ] || [ ! -f ./http/nginx/dist/server.crt ]; then
  openssl req -x509 -nodes -new -keyout ./http/nginx/dist/server.key -out ./http/nginx/dist/server.crt -days 365 \
  -subj "/C=${CSR_Country_Name}/ST=${CSR_State_or_Province_Name}/L=${CSR_Locality_Name}/O=${CSR_Organization_Name}/OU=${CSR_Organizational_Unit_Name}/CN=${CSR_Common_Name}"
fi

if [ ! -f ./ftp/sftp/dist/ssh_host_ed25519_key ] || [ ! -f ./ftp/sftp/dist/ssh_host_ed25519_key.pub ]; then
  ssh-keygen -t ed25519 -f ./ftp/sftp/dist/ssh_host_ed25519_key -N "" -C ""
fi

if [ ! -f ./ftp/sftp/dist/ssh_host_rsa_key ] || [ ! -f ./ftp/sftp/dist/ssh_host_rsa_key.pub ]; then
  ssh-keygen -t rsa -b 4096 -f ./ftp/sftp/dist/ssh_host_rsa_key -m PEM -N "" -C ""
fi

if [ ! -f ./ftp/sftp/dist/id_rsa.pub ]; then
  cp -p ./credential/id_rsa.pub ./ftp/sftp/dist/id_rsa.pub
fi
