FROM ubuntu:15.10

ENV JRE=jre1.8.0_66 \
    JAVA_HOME=/opt/jre

RUN apt-get update && apt-get -y dist-upgrade && apt-get install -y curl wget && \
    cd /tmp && \
    mkdir -p /opt && cd /opt && \
    (curl -Lskj -b "oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u66-b17/server-jre-8u66-linux-x64.tar.gz | \
    gunzip -c - | tar xf - ) && \
    ln -s /opt/jdk1.8.0_66 /opt/jre && \
    ln -s /opt/jre/bin/java /usr/bin/java && \
    apt-get clean && \
    rm -rf /tmp/*

CMD ["java", "-version"]
