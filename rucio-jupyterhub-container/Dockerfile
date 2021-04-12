FROM rucio/jupyterlab

USER root

RUN apt-get update -y && apt-get install -y wget curl gnupg vim

# EGI trust anchors
RUN wget -q -O - \
    https://dist.eugridpma.info/distribution/igtf/current/GPG-KEY-EUGridPMA-RPM-3 \
    | apt-key add -

RUN echo "deb http://repository.egi.eu/sw/production/cas/1/current egi-igtf core" >> /etc/apt/sources.list

RUN apt-get update -y && apt-get install -y ca-certificates ca-policy-egi-core && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

# ESCAPE VOMS setup
RUN mkdir -p /etc/vomses \
    && wget https://indigo-iam.github.io/escape-docs/voms-config/voms-escape.cloud.cnaf.infn.it.vomses -O /etc/vomses/voms-escape.cloud.cnaf.infn.it.vomses
RUN mkdir -p /etc/grid-security/vomsdir/escape \
    && wget https://indigo-iam.github.io/escape-docs/voms-config/voms-escape.cloud.cnaf.infn.it.lsc -O /etc/grid-security/vomsdir/escape/voms-escape.cloud.cnaf.infn.it.lsc

RUN conda install j2cli && \
    conda clean --all -f -y

RUN mkdir -p /opt/rucio/etc/ && \
    fix-permissions /opt/rucio/etc/

ADD etc/* /

RUN chmod o+x /init.sh && \
    chmod o+x /createProxyFromP12.sh

RUN echo 'eval "$(register-python-argcomplete rucio)"' >> ~/.bashrc
RUN echo 'eval "$(register-python-argcomplete rucio-admin)"' >> ~/.bashrc

USER $NB_UID
CMD /init.sh
