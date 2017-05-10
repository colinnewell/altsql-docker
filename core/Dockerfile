FROM debian:jessie

RUN apt-get update && apt-get install -y cpanminus build-essential libmysqlclient-dev
RUN cpanm --installdeps App::AltSQL
RUN cpanm --installdeps DateTime Term::ReadLine::Perl Term::ReadKey
