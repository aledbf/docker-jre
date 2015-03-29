FROM progrium/busybox
MAINTAINER pjpires@gmail.com

# Add stuff
RUN opkg-install curl grep ca-certificates

# Get and install JRE 8 Updated 40
RUN \
  (curl -Lskj -b "oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u40-b26/jre-8u40-linux-x64.tar.gz | \
  gunzip -c - | tar xf - ) && \
  mv jre1.8.0_40 /opt/ && \
  rm -rf $(find /opt/ | grep -E "/jre1.8.0_40/lib/(desktop|locale|fonts|plugin)/")

# Link Java into use
RUN ln -s /opt/jre1.8.0_40/bin/java /usr/bin/java
