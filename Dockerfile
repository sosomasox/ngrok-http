FROM ubuntu:18.04

ENV ARCH=
ENV NGROK_AUTH_TOKEN=

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y wget unzip

EXPOSE 8080
EXPOSE 4040

ADD scripts/entrypoint.sh /usr/bin/

CMD ["/usr/bin/entrypoint.sh"]
