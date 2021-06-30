# rucio-client-container

Rucio client enabled for the ESCAPE VO.

Please refer to https://github.com/rucio/containers/tree/master/clients for more information.

## Build image

```bash
$ make latest
```

or, for the python3 client:

```bash
$ make py3
```

## Run with X.509 authentication

### Using environment variables

```bash
$ docker run -e RUCIO_CFG_ACCOUNT=<myrucioaccount> -v /path/to/client.crt:/opt/rucio/etc/client.crt -v /path/to/client.key:/opt/rucio/etc/client.key -it --name=rucio-client rucio-client
```

### Using environment variables and a X.509 proxy

```bash
$ voms-proxy-init
$ docker run -e RUCIO_CFG_ACCOUNT=<myrucioaccount> -e RUCIO_CFG_AUTH_TYPE=x509_proxy -e RUCIO_CFG_CLIENT_X509_PROXY=/opt/proxy/x509up_uNNNN -v /tmp:/opt/proxy -it --name=rucio-client rucio-client
```

### Using a bespoke rucio.cfg

```bash 
$ docker run -e RUCIO_CFG_ACCOUNT=<myrucioaccount> -v /path/to/rucio.cfg:/opt/rucio/etc/rucio.cfg -v /path/to/client.crt:/opt/rucio/etc/client.crt -v /path/to/client.key:/opt/rucio/etc/client.key -it --name=rucio-client rucio-client
```

## Run with userpass authentication

```bash
$ docker run -e RUCIO_CFG_ACCOUNT=<myrucioaccount> -e RUCIO_CFG_AUTH_TYPE=userpass -e RUCIO_CFG_USERNAME=<myrucioname> -e RUCIO_CFG_PASSWORD=<myruciopassword> -it --name=rucio-client rucio-client
```

## Run in Singularity
First create a local Singularity image:
```
singularity build rucio-cli.simg docker://projectescape/rucio-client:latest
```

and then execute it from there:
```
mkdir -p ${HOME}/.rucio
export RUCIO_CFG_ACCOUNT=<my_account>
singularity run -B ${HOME}/.rucio/:/opt/rucio/etc -B ${HOME}/.globus/client.crt:/opt/rucio/etc/client.crt -B ${HOME}/.globus/client.key:/opt/rucio/etc/client.key rucio-cli.simg
```
If for any reason, you need to initialise with a clean configuration file, you can delete ${HOME}/.rucio/rucio.cfg. 
