# Use the base PHP Apache image
FROM yiisoftware/yii2-php:7.4-apache

# Install PHP extensions needed by Yii2
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libzip-dev \
    zip unzip git \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd pdo pdo_mysql zip

# Enable Apache mod_rewrite for Yii2
RUN a2enmod rewrite

# Set the working directory in the container
WORKDIR /app

# Set permissions for the runtime and assets directories
RUN chown -R www-data:www-data /app/runtime /app/web/assets

# Install Composer dependencies
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN composer install --prefer-dist --no-dev --optimize-autoloader

# Expose port 80 for the web server
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2-foreground"]
