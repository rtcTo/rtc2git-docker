FROM java:8u66

MAINTAINER rtc.to
LABEL description="Docker image for RTC to GIT migration"

RUN \
 curl http://ca-toronto-dl02.jazz.net/mirror/downloads/rational-team-concert/5.0.1/5.0.1/RTC-scmTools-Linux64-5.0.1.zip?tjazz=X938SJ2h3U306X7391wRD9091IT201 > /tmp/rtc-scm-tools.zip

RUN \
 unzip -d /opt /tmp/rtc-scm-tools.zip

RUN \
 rm -f /tmp/rtc-scm-tools.zip

ENV PATH=$PATH:/opt/jazz/scmtools/eclipse

ADD scm.ini /opt/jazz/scmtools/eclipse/scm.ini
ADD jazz-scm/ /root/.jazz-scm/

RUN \
 mkdir /var/data
 
VOLUME /var/data