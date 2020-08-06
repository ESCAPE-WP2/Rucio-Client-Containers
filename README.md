# ESCAPE Docker UI
## Introduction
This Dockerfile will build an UMD UI and also installs the Rucio clients and the Dirac client
##Installation
1. Go into the directory called "dockerui_escape"
2. Copy your certificate (usercert.pem) and your private key (userkey.pem) into this directory
3. Run
	docker build -t docker-ui
After a while you will see:
>Successfully built <id>
>Successfully tagged docker-ui:latest
4. Run the UI by:
	docker- run -it <id> startui

## Configuration
### Rucio 
In the file "rucio.cfg" you should fill in your [iam-escape.cloud.cnaf.infn.it](https://iam-escape.cloud.cnaf.infn.it) account at "account =".

[More information](https://rucio.readthedocs.io/en/latest/man/rucio.html) 
### DIRAC
**THIS HAS NOT BEEN TESTED YET**
1. Put the appropriate dirac server in **install.cfg**
2. Run 
	source bashrc
3. Run 
	dirac-proxy-init
4. Run
	dirac-configure install.cfg

[More information](https://dirac.readthedocs.io/en/latest/UserGuide/GettingStarted/InstallingClient/index.html) 

