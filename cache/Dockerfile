FROM centos:7

ARG DOCKER_HOST


RUN yum install -y epel-release

RUN curl -sL -o /etc/yum.repos.d/hnakamur-nginx.repo https://copr.fedoraproject.org/coprs/hnakamur/nginx/repo/epel-7/hnakamur-nginx-epel-7.repo \
 && yum install -y nginx

RUN curl -sL -o /etc/yum.repos.d/hnakamur-apache-traffic-server-6.repo https://copr.fedoraproject.org/coprs/hnakamur/apache-traffic-server-6/repo/epel-7/hnakamur-apache-traffic-server-6-epel-7.repo \
 && yum install -y trafficserver

RUN curl -sL https://bootstrap.pypa.io/get-pip.py | python \
 && pip install supervisor

RUN yum install -y less

RUN cp -pr /etc/trafficserver /etc/trafficserver-first \
 && mkdir /var/cache/trafficserver-first /var/log/trafficserver-first /var/run/trafficserver-first \
 && chown ats:ats /var/cache/trafficserver-first /var/log/trafficserver-first /var/run/trafficserver-first \
 && mkdir -p /opt/trafficserver-first/var \
 && ln -s /etc/trafficserver-first /opt/trafficserver-first/etc \
 && ln -s /opt/trafficserver/bin /opt/trafficserver-first/bin \
 && ln -s /opt/trafficserver/lib64 /opt/trafficserver-first/lib64 \
 && ln -s /var/cache/trafficserver-first /opt/trafficserver-first/var/cache \
 && ln -s /var/log/trafficserver-first /opt/trafficserver-first/var/logs \
 && ln -s /var/run/trafficserver-first /opt/trafficserver-first/var/run

RUN cp -pr /etc/trafficserver /etc/trafficserver-second \
 && mkdir /var/cache/trafficserver-second /var/log/trafficserver-second /var/run/trafficserver-second \
 && chown ats:ats /var/cache/trafficserver-second /var/log/trafficserver-second /var/run/trafficserver-second \
 && mkdir -p /opt/trafficserver-second/var \
 && ln -s /etc/trafficserver-second /opt/trafficserver-second/etc \
 && ln -s /opt/trafficserver/bin /opt/trafficserver-second/bin \
 && ln -s /opt/trafficserver/lib64 /opt/trafficserver-second/lib64 \
 && ln -s /var/cache/trafficserver-second /opt/trafficserver-second/var/cache \
 && ln -s /var/log/trafficserver-second /opt/trafficserver-second/var/logs \
 && ln -s /var/run/trafficserver-second /opt/trafficserver-second/var/run
 
ADD nginx/ /etc/nginx/
ADD trafficserver-first/ /etc/trafficserver-first/
ADD trafficserver-second/ /etc/trafficserver-second/
ADD supervisor/supervisord.conf /etc/
ADD supervisor/nginx.conf /etc/supervisor.d/
ADD supervisor/trafficserver-first.conf /etc/supervisor.d/
ADD supervisor/trafficserver-second.conf /etc/supervisor.d/
ADD startup.sh /usr/local/sbin/
RUN chmod +x /usr/local/sbin/startup.sh

RUN host_ip=$DOCKER_HOST \
 && host_ip=${host_ip#tcp://} \
 && host_ip=${host_ip%%:*} \
 && echo host_ip=$host_ip \
 && sed 's/\${host_ip}/'$host_ip'/' /etc/trafficserver-first/remap.config.tmpl > /etc/trafficserver-first/remap.config \
 && sed 's/\${host_ip}/'$host_ip'/' /etc/trafficserver-first/parent.config.tmpl > /etc/trafficserver-first/parent.config \
 && sed 's/\${host_ip}/'$host_ip'/' /etc/trafficserver-second/remap.config.tmpl > /etc/trafficserver-second/remap.config

CMD ["/usr/local/sbin/startup.sh"]
