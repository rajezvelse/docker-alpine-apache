FROM alpine:latest

MAINTAINER rajezvelse@gmail.com

# Install apache and basic utils
RUN apk --update --no-cache add apache2 apache2-utils

# Set configurations
RUN mkdir -p /var/run && \
chown -R apache /var/www && \
chown -R apache /var/log/apache2 && \
sed -n 'w /etc/apache2/httpd.conf.default' /etc/apache2/httpd.conf && \
sed -i '$ a Pidfile \/var\/run\/httpd.pid' /etc/apache2/httpd.conf && \
sed '' /etc/apache2/httpd.conf

# Pipe apache logs into container logs
RUN ln -sf /dev/stdout /var/log/apache2/access.log && \
    ln -sf /dev/stderr /var/log/apache2/error.log

# Starting script
RUN echo -e "#!/bin/sh \n\
sleep 1s \n\
/usr/sbin/httpd -D FOREGROUND \n\
" > /start.sh && \
chmod a+x /start.sh

WORKDIR /var/www/localhost

# expose ports
EXPOSE 80 443

# Startup command
ENTRYPOINT ["/start.sh"]
