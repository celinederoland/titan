FROM php:7.2-rc-apache
RUN docker-php-ext-install pdo pdo_mysql
RUN docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd
COPY virtualhost.conf /etc/apache2/sites-available/000-default.conf
COPY apache2.conf /etc/apache2/apache2.conf
RUN touch /usr/local/etc/php/conf.d/reporting.ini
RUN touch /usr/local/etc/php/conf.d/xdebug.ini
WORKDIR /var/www/html/public
RUN a2enmod rewrite
RUN service apache2 restart

