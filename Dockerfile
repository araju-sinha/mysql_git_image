FROM ubuntu

MAINTAINER Aarju Sinha<aarju.sinha024@gmail.com>

RUN apt-get update \

&& apt-get install -y mysql-server 

RUN apt-get update \

&& apt-get install -y git

RUN git --version

RUN git clone https://github.com/OCTO01032020-araju/mysql_git_image.git

VOLUME ["/etc/mysql", "var/lib/mysql"]

WORKDIR /data

CMD ["Hello Mysql User"]

Expose 3360