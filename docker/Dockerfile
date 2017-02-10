FROM php:5.6-apache

MAINTAINER Visay Keo <visay.keo@typo3.org>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    # Install PHP tools
    libxml2-dev libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng12-dev \
    zlib1g-dev \
    # 3rd party packages
    imagemagick \
    git \
    mysql-client \
    locales \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set LOCALE to UTF8
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    dpkg-reconfigure locales && \
    /usr/sbin/update-locale LANG=en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Configure PHP
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install -j$(nproc) mysqli soap gd zip
RUN echo 'always_populate_raw_post_data = -1\nmax_execution_time = 240\nmax_input_vars = 1500\nupload_max_filesize = 32M\npost_max_size = 32M' > /usr/local/etc/php/conf.d/typo3.ini

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Enable apache modules as needed and disable default vhost
RUN a2enmod rewrite && a2dissite 000-default.conf

# Clone t3kit repositories
RUN mkdir -p /var/www/shared/site /tmp/typo3temp
RUN git clone https://github.com/t3kit/t3kit_composer.git /var/www/shared/site && \
    composer install -d /var/www/shared/site && \
    cd /var/www/shared/site/typo3conf/ext/theme_t3kit && sed -i -e "s~git@github.com:~git://github.com/~g" .gitmodules && git submodule update --init --recursive && \
    cd /var/www/shared/site/typo3conf/ext/theme_t3kit_bluemountain && sed -i -e "s~git@github.com:~git://github.com/~g" .gitmodules && git submodule update --init --recursive && \
    git clone https://github.com/t3kit/t3kit_db.git /var/www/shared/db

RUN ln -s /tmp/typo3temp /var/www/shared/site/ && \
    chown -R www-data:www-data /var/www/shared/site /tmp/typo3temp

# Add server configuration
ADD config /

# Configure volumes
WORKDIR /var/www/shared/site

ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 80 443
CMD ["apache2-foreground"]
