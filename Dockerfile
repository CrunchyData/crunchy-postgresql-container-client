FROM docker.io/centos:centos7
MAINTAINER crunchy

RUN rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
RUN yum install -y procps-ng nginx which hostname && yum clean all -y

EXPOSE 13001
EXPOSE 13002

RUN mkdir -p /var/cpm/bin
RUN mkdir -p /var/cpm/conf
ADD bin /var/cpm/bin
ADD conf /var/cpm/conf
ADD www /www

#VOLUME ["/www"]
RUN chown -R daemon:daemon /www

RUN chown -R daemon:daemon /var/cpm

USER daemon

CMD ["/var/cpm/bin/startnginx.sh"]


