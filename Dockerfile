FROM astoupin/wf10-base

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8


COPY --chown=jboss ./jcp-2.0.39014.zip /tmp
COPY --chown=jboss ./jce_policy-8.zip  /tmp

#copy keys
COPY --chown=jboss ./docker/keys/.  /var/opt/cprocsp/keys/jboss


COPY --chown=jboss ./docker/customization/. /opt/jboss/wildfly/customization


USER root

RUN unzip /tmp/jcp-2.0.39014.zip -d /tmp/cryptopro && \
    cd /tmp/cryptopro/jcp-2.0.39014 && \
    /bin/bash -c './setup_console.sh /usr/java/default/jre -force -ru -install XXXXX-XXXXX-XXXXX-XXXXX-XXXXX' && \
    unzip /tmp/jce_policy-8.zip -d /tmp/policy && \
    cp -r /tmp/policy/UnlimitedJCEPolicyJDK8/. /usr/java/default/jre/lib/security

USER jboss

# pack custumizations into the image
# use this template for packaging in extension layers
RUN /bin/bash /opt/jboss/wildfly/customization/build.sh && \
    rm -r /opt/jboss/wildfly/standalone/configuration/standalone_xml_history



#CMD ["/bin/bash", "/opt/jboss/wildfly/customization/execute.sh"]





