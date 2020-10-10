FROM ubuntu:bionic

ENV TZ=Europe/Minsk
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && $TZ > /etx/timezone

RUN apt-get update && apt-get upgrade && apr-get -y install apache2 ntp openjdk-8-jdk

WORKDIR var/www/site

EXPOSE 80

CMD ["service apache2 start"] 