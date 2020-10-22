#!/bin/bash
mkdir -p ~/.globus
openssl pkcs12 -in $1 -clcerts -nokeys -out ~/.globus/client.crt
openssl pkcs12 -in $1 -nocerts -nodes -out ~/.globus/client.key
chmod 0400 ~/.globus/client.crt
chmod 0400 ~/.globus/client.key
voms-proxy-init --cert ~/.globus/client.crt --key ~/.globus/client.key --voms escape
