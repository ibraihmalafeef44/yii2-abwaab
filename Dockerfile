FROM yiisoftware/yii2-php:7.1-apache
RUN a2enmod rewrite
RUN sed -i -e 's|/app/web|/app/api/web|g' /etc/apache2/sites-available/000-default.conf


RUN \
  apt-get update && apt-get install -y redis-server

RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
RUN apt-get install wget


RUN apt-get install -y xvfb
RUN apt-get install -y wkhtmltopdf


# Install composer:
RUN rm -f /usr/local/bin/composer
RUN curl -s https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

ADD composer.lock composer.json /app/
RUN composer install --prefer-dist --optimize-autoloader --no-dev && \
    composer clear-cache

RUN composer install






