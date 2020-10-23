#!/bin/bash
# Run this script with arguments = path to your p12 grid certificate and Rucio account name
# If cert, key files and rucio.cfg has already been generated, this script will just update your x509 proxy

# Generate cert and key files (2 password prompts)
if [ ! -f /opt/rucio/etc/client.crt ] || [ ! -f /opt/rucio/etc/client.key ]; then
    openssl pkcs12 -in $1 -clcerts -nokeys -out /opt/rucio/etc/client.crt
    openssl pkcs12 -in $1 -nocerts -nodes -out /opt/rucio/etc/client.key
    chmod 0400 /opt/rucio/etc/client.crt
    chmod 0400 /opt/rucio/etc/client.key
fi
# Generate short-lived x509 proxy (required for performing uploads to the data lake)
voms-proxy-init --cert /opt/rucio/etc/client.crt --key /opt/rucio/etc/client.key --voms escape

# Set up Rucio config to point to the ESCAPE data lake with your account
export RUCIO_CFG_ACCOUNT=$2
if [ ! -f /opt/rucio/etc/rucio.cfg ]; then
    echo "Generating rucio.cfg"
    j2 /rucio.cfg.j2 > /opt/rucio/etc/rucio.cfg
fi
