FROM astoupin/wf10-base

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8


COPY --chown=jboss ./docker/jcp-2.0.39014.zip /tmp
COPY --chown=jboss ./docker/jce_policy-8.zip  /tmp

#copy keys
COPY --chown=jboss ./docker/keys/.  /var/opt/cprocsp/keys/jboss
#Override default standalone.conf with -Dhttps.protocols=TLSv1,TLSv1.1,TLSv1.2
COPY --chown=jboss ./docker/standalone.conf /opt/jboss/wildfly/bin

COPY --chown=jboss ./docker/customization/. /opt/jboss/wildfly/customization


USER root

RUN unzip /tmp/jcp-2.0.39014.zip -d /tmp/cryptopro && \
    cd /tmp/cryptopro/jcp-2.0.39014 && \
    /bin/bash -c './setup_console.sh /usr/java/default/jre -force -ru -install -jcp -cpssl -jcryptop XXXXX-XXXXX-XXXXX-XXXXX-XXXXX' && \
    unzip /tmp/jce_policy-8.zip -d /tmp/policy && \
    cp -r /tmp/policy/UnlimitedJCEPolicyJDK8/. /usr/java/default/jre/lib/security



#Override CryptoPro default settings and set license (taken from Dergachev's cryptoPro install procedure)
#COPY --chown=jboss ./docker/CryptoProPrefs/ru/. /etc/.java/.systemPrefs/ru
#COPY --chown=jboss ./docker/CryptoProPrefs/bcprov-jdk15on-159.jar  /usr/java/default/jre/lib/ext
#COPY --chown=jboss ./docker/CryptoProPrefs/bcpkix-jdk15on-159.jar  /usr/java/default/jre/lib/ext
#COPY --chown=jboss ./docker/CryptoProPrefs/java.security  /usr/java/default/jre/lib/security    

USER jboss

# pack custumizations into the image
# use this template for packaging in extension layers
RUN /bin/bash /opt/jboss/wildfly/customization/build.sh && \
    rm -r /opt/jboss/wildfly/standalone/configuration/standalone_xml_history

