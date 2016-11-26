FROM ubuntu:16.04
MAINTAINER Akkz

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y pptpd

COPY ./etc/pptpd.conf /etc/pptpd.conf
COPY ./etc/ppp/pptpd-options /etc/ppp/pptpd-options
COPY ./etc/chap-secrets /etc/chap-secrets

EXPOSE 1723

CMD ["pptpd", "--fg"]
