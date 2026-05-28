FROM docker.io/alpine:3.23.4
RUN apk add --update --no-cache apache2 apache2-http2
COPY httpd.conf /etc/apache2/httpd.conf
RUN httpd -t
RUN dd if=/dev/zero of=/var/www/localhost/htdocs/big bs=1M count=1000
CMD ["/usr/sbin/httpd", "-DFOREGROUND"]
EXPOSE 80
