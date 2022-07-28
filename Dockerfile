FROM centos:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum install -y httpd zip unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page280/spa-center.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip spa-center.zip
RUN cp -rvf spa-html-template/* .
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80

