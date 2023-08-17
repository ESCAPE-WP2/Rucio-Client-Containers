# Dockerfile to create a container with the UMD UI service
#
# Built the container by:
# docker build -t docker-ui .
#
# Run it by:
# docker run -it <id> startui


FROM projectescape/rucio-client:latest 
MAINTAINER Ron Trompert <ron.trompert@surfsara.nl>
LABEL version="0.2"
LABEL description="Container image to run DIRAC and Rucio together."
USER root

#Install Dirac client
RUN wget -np -O dirac-install https://github.com/DIRACGrid/DIRAC/raw/integration/Core/scripts/dirac-install.py --no-check-certificate
RUN chmod +x dirac-install
RUN ./dirac-install -r v7r0p16 -g v14r2
COPY install.cfg /root/install.cfg

#Add macaroon stuff
RUN yum install wget -y
RUN yum install html2text python-setuptools jq rclone python-pip -y
RUN pip install pymacaroons
RUN wget https://raw.githubusercontent.com/sara-nl/GridScripts/master/get-macaroon -O /usr/local/bin/get-macaroon --no-check-certificate
RUN wget https://raw.githubusercontent.com/sara-nl/GridScripts/master/view-macaroon -O /usr/local/bin/view-macaroon --no-check-certificate
RUN chmod 755 /usr/local/bin/get-macaroon
RUN chmod 755 /usr/local/bin/view-macaroon


# Make sure that your firewall lets the port range below through. If this is 
# not the case, then use passive gridftp.
EXPOSE 20000-25000
ENV GLOBUS_TCP_PORT_RANGE 20000,25000

USER user

