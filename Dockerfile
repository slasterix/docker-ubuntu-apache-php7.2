FROM slasterix/docker-ubuntu-apache:latest

ARG DEBIAN_FRONTEND=noninteractive
RUN \
    apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:ondrej/php && \
    apt-get update && \
    apt-get install -y imagemagick graphicsmagick && \
    apt-get install -y libapache2-mod-php7.2 php7.2-bcmath php7.2-bz2 php7.2-cli php7.2-common php7.2-curl php7.2-dba php7.2-gd php7.2-gmp php7.2-imap php7.2-intl php7.2-ldap php7.2-mbstring php7.2-mysql php7.2-odbc php7.2-pgsql php7.2-recode php7.2-snmp php7.2-soap php7.2-sqlite php7.2-tidy php7.2-xml php7.2-xmlrpc php7.2-xsl php7.2-zip php7.2-ssh2 php7.2-pear && \
    apt-get install -y php-gnupg php-imagick php-mongodb php-fxsl && \
    mkdir /tmp/composer/ && \
    cd /tmp/composer && \
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    chmod a+x /usr/local/bin/composer && \
    cd / && \
    rm -rf /tmp/composer && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* && \
    apache2ctl -t && \
    mkdir -p /run /var/lib/apache2 /var/lib/php
