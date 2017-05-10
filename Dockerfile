FROM debian:jessie

RUN apt-get update && apt-get install -y cpanminus build-essential libmysqlclient-dev
RUN cpanm --installdeps App::AltSQL
RUN groupadd developer && useradd --uid 1000 -d /home/developer -g developer developer
USER developer
WORKDIR /home/developer
VOLUME /home/developer
