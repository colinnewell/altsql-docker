FROM quay.io/colin.newell/altsql-shell-core

RUN groupadd developer && useradd --uid 1000 -d /home/developer -g developer developer
USER developer
WORKDIR /home/developer
VOLUME /home/developer
