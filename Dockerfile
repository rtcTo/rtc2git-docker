FROM java:8u66

MAINTAINER rtc.to
LABEL description="Docker image for RTC to GIT migration"

ARG VERSION=6.0.2

ADD RTC-scmTools-Linux64-$VERSION.zip /tmp/rtc-scm-tools.zip
RUN unzip -d /opt /tmp/rtc-scm-tools.zip
RUN rm -f /tmp/rtc-scm-tools.zip
RUN mkdir /var/data

ADD scm.ini /opt/jazz/scmtools/eclipse/scm.ini
ADD plugins/ /opt/jazz/scmtools/eclipse/plugins/
ADD jazz-scm/ /root/.jazz-scm/

ENV PATH=$PATH:/opt/jazz/scmtools/eclipse

VOLUME /var/data

WORKDIR /var/data
