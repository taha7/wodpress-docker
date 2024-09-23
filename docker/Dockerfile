FROM wordpress:php8.2-apache

# Install packages under Debian
RUN apt-get update && apt-get install -y \
    git \
    curl \
    nano \
    rsync \
    sendmail \
    sendmail-cf \
    m4 \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev\
    zip \
    zlib1g-dev \
    unzip \
    vim

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copy php config files to /usr/local/etc/php/conf.d/
# COPY docker/config/php/xdebug.ini /usr/local/etc/php/conf.d/
# COPY docker/config/php/uploads.ini /usr/local/etc/php/conf.d/

# Since this Dockerfile extends the official Docker image `wordpress`,
# and since `wordpress`, in turn, extends the official Docker image `php`,
# the helper script docker-php-ext-enable (defined for image `php`)
# works here, and we can use it to enable x
RUN docker-php-ext-install pdo_mysql zip

RUN chown -R www-data:www-data wp-content
RUN chmod -R 775 wp-content