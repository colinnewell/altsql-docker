FROM debian:jessie

RUN apt-get update && apt-get install -y cpanminus build-essential libmysqlclient-dev less
RUN cpanm --installdeps App::AltSQL
RUN cpanm DateTime Term::ReadLine::Perl Term::ReadKey
