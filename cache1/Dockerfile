FROM centos:7

ARG DOCKER_HOST

RUN curl -sL -o /etc/yum.repos.d/hnakamur-apache-traffic-server-6.repo https://copr.fedoraproject.org/coprs/hnakamur/apache-traffic-server-6/repo/epel-7/hnakamur-apache-traffic-server-6-epel-7.repo \
 && yum install -y trafficserver

ADD records.config remap.config.tmpl parent.config.tmpl /etc/trafficserver/

RUN host_ip=$DOCKER_HOST \
 && host_ip=${host_ip#tcp://} \
 && host_ip=${host_ip%%:*} \
 && echo host_ip=$host_ip \
 && sed 's/\${host_ip}/'$host_ip'/' /etc/trafficserver/remap.config.tmpl > /etc/trafficserver/remap.config \
 && sed 's/\${host_ip}/'$host_ip'/' /etc/trafficserver/parent.config.tmpl > /etc/trafficserver/parent.config

CMD ["/opt/trafficserver/bin/traffic_server"]
