ARG BASEIMAGE=rucio/rucio-clients:release-1.23.6
FROM $BASEIMAGE

USER root

# EGI trust anchors
RUN curl -o /etc/yum.repos.d/EGI-trustanchors.repo http://repository.egi.eu/sw/production/cas/1/current/repo-files/EGI-trustanchors.repo \
    && yum -y update

RUN yum -y install wget
RUN yum -y install ca-certificates ca-policy-egi-core

RUN yum -y install cmake gcc gcc-c++
RUN yum -y install boost boost-devel boost-python36 boost-python36-devel
RUN yum -y install gfal2 gfal2-devel
RUN yum -y install python-devel python3-devel 
RUN pip install gfal2-python

# ESCAPE VOMS setup
RUN mkdir -p /etc/vomses \
    && wget https://indigo-iam.github.io/escape-docs/voms-config/voms-escape.cloud.cnaf.infn.it.vomses -O /etc/vomses/voms-escape.cloud.cnaf.infn.it.vomses
RUN mkdir -p /etc/grid-security/vomsdir/escape \
    && wget https://indigo-iam.github.io/escape-docs/voms-config/voms-escape.cloud.cnaf.infn.it.lsc -O /etc/grid-security/vomsdir/escape/voms-escape.cloud.cnaf.infn.it.lsc

# ESCAPE Rucio setup
ADD --chown=user:user etc/rucio/rucio.cfg.escape.j2 /opt/user/rucio.cfg.j2

USER user
WORKDIR /home/user

ENTRYPOINT ["/bin/bash"]

