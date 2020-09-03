# Dockerfile to create a container with the UMD UI service
#
# Built the container by:
# docker build -t docker-ui .
#
# Run it by:
# docker run -it <id> startui


FROM centos:7
MAINTAINER Ron Trompert <ron.trompert@surfsara.nl>
LABEL version="0.1"
LABEL description="Container image to run the UMD UI service."
USER root
WORKDIR /root
RUN rm -f /etc/yum.repos.d/UMD-* /etc/yum.repos.d/epel-*
RUN  rpm --import http://repository.egi.eu/sw/production/umd/UMD-RPM-PGP-KEY
RUN yum install -y http://repository.egi.eu/sw/production/umd/4/centos7/x86_64/updates/umd-release-4.1.3-1.el7.centos.noarch.rpm
RUN yum install -y epel-release wget
RUN wget http://repository.egi.eu/sw/production/cas/1/current/repo-files/egi-trustanchors.repo -O /etc/yum.repos.d/egi-trustanchors.repo
RUN yum install -y ui
RUN yum update -y

#Install Rucio clients
RUN yum install -y python-pip
RUN wget https://raw.githubusercontent.com/rucio/rucio/master/etc/pip-requires-client --no-check-certificate
RUN pip install -r pip-requires-client
RUN pip install rucio-clients
RUN mkdir -p /opt/rucio/etc
COPY rucio.cfg /opt/rucio/etc/rucio.cfg
RUN cd /etc/grid-security/certificates; for i in `ls -1 *.pem`; do cat $i >>certs.pem; done; cd -


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

#Mess around with certificates and keys
RUN mkdir .globus
COPY ./userkey.pem /root/.globus/userkey.pem
RUN chmod 600 /root/.globus/userkey.pem
COPY ./usercert.pem /root/.globus/usercert.pem
RUN chmod 644 /root/.globus/usercert.pem

# Replace myvo.eu with your VO name
#------------8<-------------

RUN mkdir /etc/grid-security/vomsdir/escape

# You can look up the necessary information on your VO at:
# https://operations-portal.egi.eu/vo/search#VOV_section

COPY voms-escape.cloud.cnaf.infn.it.lsc /etc/grid-security/vomsdir/escape/voms-escape.cloud.cnaf.infn.it.lsc

RUN mkdir /etc/vomses

COPY escape-voms.escape.cloud.cnaf.infn.it /etc/vomses/escape-voms.escape.cloud.cnaf.infn.it
#------------8<-------------

# Make sure that your firewall lets the port range below through. If this is 
# not the case, then use passive gridftp.
EXPOSE 20000-25000
ENV GLOBUS_TCP_PORT_RANGE 20000,25000

COPY ./startui.sh /root
ENTRYPOINT ["/root/startui.sh"]
CMD ["startui"]
