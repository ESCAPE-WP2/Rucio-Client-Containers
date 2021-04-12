#!/bin/bash
# Run this script with arguments = path to your p12 grid certificate and Rucio account name
# If cert, key files and rucio.cfg has already been generated, this script will just update your x509 proxy

# Generate cert and key files (2 password prompts)
if [[ ! -f /home/jovyan/client.crt ||  ! -f /home/jovyan/client.key ]]; then
    openssl pkcs12 -in $1 -clcerts -nokeys -out /home/jovyan/client.crt
    openssl pkcs12 -in $1 -nocerts -nodes -out /home/jovyan/client.key
    chmod 0400 /home/jovyan/client.crt
    chmod 0400 /home/jovyan/client.key
fi
# Generate short-lived x509 proxy (required for performing uploads to the data lake)
echo "Initializing the ESCAPE voms for your certificate"
voms-proxy-init --cert /home/jovyan/client.crt --key /home/jovyan/client.key --voms escape

# Set up Rucio config to point to the ESCAPE data lake with your account
export RUCIO_CFG_ACCOUNT=$2
if [ ! -f /opt/rucio/etc/rucio.cfg ]; then
    echo "Generating rucio.cfg"
    j2 /rucio.cfg.j2 > /opt/rucio/etc/rucio.cfg
fi
