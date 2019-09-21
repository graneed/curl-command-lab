#!/bin/sh
rm ./http/httpd/html/100M.dummy
rm ./http/httpd/dist/server.crt
rm ./http/httpd/dist/server.key
rm ./http/nginx/dist/server.crt
rm ./http/nginx/dist/server.key
rm -rf ./http/httpd/html/file/*

rm ./ftp/file/100M.dummy
rm ./ftp/sftp/dist/ssh_host_ed25519_key
rm ./ftp/sftp/dist/ssh_host_ed25519_key.pub
rm ./ftp/sftp/dist/ssh_host_rsa_key
rm ./ftp/sftp/dist/ssh_host_rsa_key.pub
rm ./ftp/sftp/dist/id_rsa.pub
rm -rf ./ftp/file/aaa/

rm -rf ./mail/mail/*
rm -rf ./mail/mail-state/*
