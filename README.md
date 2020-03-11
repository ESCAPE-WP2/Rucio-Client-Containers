# rucio-client
Rucio client enabled for ESCAPE VO/SKA VO

Start the container by either pointing to a rucio.cfg, use the rucio.cfg in this repo, or provide runtime parameters in the form of environment variables.

(Assuming x509 authentication)
To connect to the RAL SKA instance
`docker run -e RUCIO_ACCOUNT=myrucioname -v /tmp/usercert.pem:/opt/rucio/etc/usercert.pem --key /tmp/userkey.pem:/opt/rucio/etc/userkey.pem -it -d --name=rucio-client rohinijoshi/rucio-client-escape`
You can attach to it using 
`docker exec -it rucio-client-escape /bin/bash
cp /rucio.cfg /opt/rucio/etc/
rucio ping`

Run the container by pointing to your own rucio.cfg by mounting it
`docker run -e RUCIO_ACCOUNT=myrucioname -v /tmp/rucio.cfg:/opt/rucio/etc/rucio.cfg -v /tmp/usercert.pem:/opt/rucio/etc/usercert.pem --key /tmp/userkey.pem:/opt/rucio/etc/userkey.pem -it -d --name=rucio-client rohinijoshi/rucio-client-escape`

The environment variable for Rucio account name needed is slightly different to connect to the ESCAPE instance possibly due to Rucio version differences
To connect to the ESCAPE instance with x509 auth
`docker run -e RUCIO_CFG_ACCOUNT=myrucioname -v /tmp/usercert.pem:/opt/rucio/etc/usercert.pem --key /tmp/userkey.pem:/opt/rucio/etc/userkey.pem -it -d --name=rucio-client rohinijoshi/rucio-client-escape`
To connect to the ESCAPE instance with userpass auth
`docker run -e RUCIO_CFG_ACCOUNT=myrucioname -e RUCIO_CFG_AUTH_TYPE=userpass -e RUCIO_CFG_USERNAME=myrucioname -e RUCIO_CFG_PASSWORD=guest -it -d --name=rucio-client rohinijoshi/rucio-client-escape`

Build with
`docker build -t <name>:<tag> .`
