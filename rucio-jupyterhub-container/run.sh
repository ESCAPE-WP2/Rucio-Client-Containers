#!/bin/bash

docker run --env-file env --rm -p 8888:8888 -e RUCIO_CFG_ACCOUNT=robbarnsley -v /home/eng/.globus/client.crt:/home/jovyan/client.crt -v /home/eng/.globus/client.key:/home/jovyan/client.key --name=rucio-client-jhub rucio-client-jhub:latest
