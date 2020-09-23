FROM rucio/rucio-clients:release-1.22.8

USER root

# EGI trust anchors
RUN curl -s -o /etc/yum.repos.d/EGI-trustanchors.repo http://repository.egi.eu/sw/production/cas/1/current/repo-files/EGI-trustanchors.repo

RUN yum -y install wget
RUN yum -y install ca-certificates ca-policy-egi-core

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

