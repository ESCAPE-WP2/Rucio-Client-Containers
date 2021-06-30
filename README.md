# Rucio-Client-Containers

A few things have been modified compared the master branch:

1_ The Docker file of the rucio-jupyterhub-container was modified to activate the RUCIO autocompletion CLI. Also, the createProxyFromP12.sh file is executable inside the container.

2_ The path of the .crt and .key file were changed to /home/jovyan/ in the the createProxyFromP12.sh and the rucio.cfg.j2.
