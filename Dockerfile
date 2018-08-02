FROM debian:jessie


RUN apt-get update -y; apt-get upgrade -y

RUN echo "mysql-server mysql-server/root_password password root" | debconf-set-selections
RUN echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections

RUN \
    apt-get install -y \
    nginx \
    openssl \
    mysql-server \
    wget \
    tar \
    php5 \
    php5-fpm \
    php5-mysql

ADD wordpress.nginx /tmp/
COPY wordpress.nginx /tmp/

ADD wp-config.php /tmp/
COPY wp-config.php /tmp/

RUN \
    rm /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default;\
    cp /tmp/wordpress.nginx /etc/nginx/sites-available/.\
    ln -s /etc/nginx/sites-available/wordpress.nginx /etc/nginx/sites-enabled/.;\
    cd /var/www && rm -rf *;\
    wget https://sv.wordpress.org/wordpress-4.9.7-sv_SE.tar.gz;\
    tar xzf *wordpress*;\
    mv /tmp/wp-config.php *wordpress*/.

RUN find /var/lib/mysql/mysql -exec touch -c -a {} + && \
    service mysql start && \
    mysql -uroot -proot -e "CREATE DATABASE wordpress;" && \
    mysql -uroot -proot -e "CREATE USER 'wordpress'@'localhost' IDENTIFIED BY 'wordpress';" && \
    mysql -uroot -proot -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost' IDENTIFIED BY 'wordpress';"

EXPOSE 80 443

VOLUME ["/data", "/var/lib/mysql"]
CMD bash `service mysql start; service nginx restart; service php5-fpm restart; tail -f /dev/null`
