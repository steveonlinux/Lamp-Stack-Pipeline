# Use an official PHP image with Apache
FROM php:7.4-apache

# Install any additional extensions and dependencies
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli pdo pdo_mysql

# Copy the HTML and other web content to the DocumentRoot
COPY src/html/* /var/www/html/
RUN chown -R www-data:www-data /var/www/html

# Optionally expose port 80 if you plan to run the container directly without a compose or orchestration tool that manages ports
EXPOSE 80

# The default command will start Apache in the foreground
CMD ["apache2-foreground"]

