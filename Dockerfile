FROM ubuntu:16.04
MAINTAINER srzyhead <srzyhead@yeah.net>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y pptpd

COPY ./etc/pptpd.conf /etc/pptpd.conf
COPY ./etc/ppp/pptpd-options /etc/ppp/pptpd-options
COPY ./etc/chap-secrets /etc/ppp/chap-secrets

EXPOSE 1723

CMD ["pptpd", "--fg"]
