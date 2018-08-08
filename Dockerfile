FROM debian:jessie

ENV SERVER_PORT 80
ENV FILE_MANAGER_PORT 8080
ENV SERVER_NAME localhost.local

ENV MYSQL_ROOT_PASSWORD bad_password
ENV MYSQL_USER wordpress
ENV MYSQL_DB wordpress
ENV MYSQL_PASSWORD bad_password

RUN apt-get update -y; apt-get upgrade -y

RUN echo "mysql-server mysql-server/root_password password $MYSQL_ROOT_PASSWORD" | debconf-set-selections
RUN echo "mysql-server mysql-server/root_password_again password $MYSQL_ROOT_PASSWORD" | debconf-set-selections

RUN \
    apt-get install -y \
    nginx \
    openssl \
    mysql-server \
    wget \
    curl \
    tar \
    php5 \
    php5-fpm \
    php5-mysql \
    python

ADD wordpress.nginx /tmp/
COPY wordpress.nginx /tmp/

ADD wp-config.php /tmp/
COPY wp-config.php /tmp/

ADD replace-tool.py /tmp/
COPY replace-tool.py /tmp/

RUN \
    rm /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default;\
    cp /tmp/wordpress.nginx /etc/nginx/sites-available/.\
    ln -s /etc/nginx/sites-available/wordpress.nginx /etc/nginx/sites-enabled/.;\
    cd /var/www && rm -rf *;\
    wget https://sv.wordpress.org/wordpress-4.9.7-sv_SE.tar.gz;\
    tar xzf *wordpress*;\
    mv /tmp/wp-config.php *wordpress*/.

RUN find /var/lib/mysql/mysql -exec touch -c -a {} + && \
    service mysql start;

RUN \
    curl -fsSL https://filebrowser.github.io/get.sh | bash

RUN \
    mv /tmp/replace-tool.py /usr/local/bin/.

EXPOSE $SERVER_PORT $FILE_MANAGER_PORT

VOLUME ["/data", "/var/lib/mysql"]
CMD ["sh", "-c", "cd /etc/nginx/sites-enabled && sed -i 's/80/'$SERVER_PORT'/g' wordpress.nginx; cd /var/www/wordpress && sed -i 's/_DB_NAME/'$MYSQL_DB'/g' wp-config.php && replace-tool.py wp-config.php _AUTH \"$(curl https://api.wordpress.org/secret-key/1.1/salt/)\"; service mysql start; service nginx restart; service php5-fpm restart; mysql -uroot -p$MYSQL_ROOT_PASSWORD -e \"CREATE DATABASE $MYSQL_DB;\" && mysql -uroot -p$MYSQL_ROOT_PASSWORD -e \"CREATE USER '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';\" && mysql -uroot -p$MYSQL_ROOT_PASSWORD -e \"GRANT ALL PRIVILEGES ON $MYSQL_DB.* TO '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';\"; filebrowser --port $FILE_MANAGER_PORT --database /etc/fm.db --scope /var/www/wordpress --baseurl /filemanager"]
