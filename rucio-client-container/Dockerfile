FROM rucio/rucio-clients:latest

USER root
RUN yum -y install wget

# ESCAPE VOMS setup
RUN mkdir -p /etc/vomses \
    && wget https://indigo-iam.github.io/escape-docs/voms-config/voms-escape.cloud.cnaf.infn.it.vomses -O /etc/vomses/voms-escape.cloud.cnaf.infn.it.vomses
RUN mkdir -p /etc/grid-security/vomsdir/escape \
    && wget https://indigo-iam.github.io/escape-docs/voms-config/voms-escape.cloud.cnaf.infn.it.lsc -O /etc/grid-security/vomsdir/escape/voms-escape.cloud.cnaf.infn.it.lsc

# ESCAPE Rucio setup
ADD --chown=user:user etc/rucio/rucio.cfg.escape.j2 /opt/user/rucio.cfg.j2

# can't auth with most recent version of rucio-clients? rollback to last working version (for now)
RUN pip install --pre rucio-clients==1.22.6.post1

USER user

ENTRYPOINT ["/bin/bash"]

