FROM ubuntu:bionic

ENV TZ=Europe/Minsk
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get upgrade && apt-get -y install apache2 ntp openjdk-8-jdk


WORKDIR /var/www/site

EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]



