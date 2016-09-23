FROM java:8u66

MAINTAINER rtc.to
LABEL description="RTC client docker image"

COPY jazz/ /opt/jazz
COPY scm.ini /opt/jazz/scmtools/eclipse/scm.ini
COPY jazz-scm/ /root/.jazz-scm/

ENV PATH=$PATH:/opt/jazz/scmtools/eclipse

RUN mkdir /var/data
VOLUME /var/data
WORKDIR /var/data
