FROM centos:7

RUN yum -y install httpd

ADD httpd.conf /etc/httpd/conf/
ADD index.html .htaccess /var/www/html/

CMD ["/usr/sbin/httpd", "-DFOREGROUND"]
