FROM debian:jessie
RUN echo 'deb http://deb.debian.org/debian jessie-backports main' > /etc/apt/sources.list.d/backports.list


RUN apt-get update -y; apt-get upgrade -y

RUN echo "mysql-server mysql-server/root_password password root" | debconf-set-selections
RUN echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections

RUN \
    apt-get install -y \
    nginx \
    openssl \
    mysql-server \
    wget \
    tar

COPY wordpress.nginx /etc/ngins/sites-available/wordpress.nginx

RUN \
    rm /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default;\
    ln -s /etc/nginx/sites-available/wordpress.nginx /etc/nginx/sites-enabled/.;\
    cd /var/www && rm -rf *;\
    wget https://sv.wordpress.org/wordpress-4.9.7-sv_SE.tar.gz;\
    tar xzf *wordpress*

EXPOSE 80 443 500

VOLUME ["/data"]
