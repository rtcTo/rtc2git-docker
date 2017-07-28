FROM docker.io/rtcto/rtc:6.0.4

MAINTAINER rtc.to
LABEL description="Docker image for RTC to GIT migration"

COPY plugins/ /opt/jazz/scmtools/eclipse/plugins/

ENV PATH=$PATH:/opt/jazz/scmtools/eclipse
