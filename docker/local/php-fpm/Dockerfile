FROM php:7.2.2-fpm

WORKDIR "/application"

RUN apt-get update && \
    apt-get install -y unzip && \
	apt-get install -y supervisor && \
	apt-get install -y libzip-dev && \
	apt-get install -y libpng-dev && \
	apt-get install -y libjpeg-dev && \
	apt-get install -y libxml2-dev && \
	apt-get install -y libfreetype6-dev && \
	pecl install xdebug-2.6.0 && \
    docker-php-ext-enable xdebug && \
    docker-php-ext-install pdo pdo_mysql zip && \
    apt-get -y install git && \
    apt-get -y install cron

RUN docker-php-ext-configure gd \
        --enable-gd-native-ttf \
        --with-jpeg-dir=/usr/lib \
        --with-freetype-dir=/usr/include/freetype2 && \
    docker-php-ext-install gd

RUN apt-get -y install libmagickwand-dev imagemagick && \
	pecl install imagick && \
	echo "extension=imagick.so" > /usr/local/etc/php/conf.d/docker-php-ext-imagick.ini

RUN apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

COPY ./ /application

RUN (crontab -l ; echo "* * * * * /usr/local/bin/php /application/artisan schedule:run >>/dev/null 2>&1") | crontab

CMD php-fpm