FROM httpd:2.4
RUN htpasswd -b -c /password root calvin
RUN apt update && apt install -y wget
RUN wget http://distro.ibiblio.org/archlinux/iso/2020.08.01/archlinux-2020.08.01-x86_64.iso
COPY ./public-html/ /usr/local/apache2/htdocs/
COPY ./my-httpd.conf /usr/local/apache2/conf/httpd.conf
RUN mv archlinux* /usr/local/apache2/htdocs/publicfiles
COPY /usr/local/apache2/htdocs/publicfiles /usr/local/apache2/htdocs/privatefiles
ENV APACHE_LOG_DIR /var/log/apache2
